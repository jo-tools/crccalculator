#!/bin/sh
#

# **************************************************************
# How to use Xojo Web App 2 Docker's 'xojo2docker.sh'?
# **************************************************************
# It's all being set up in the Xojo Post Build Script.
# You should not need to modify this Shell Script (unless you're
# going to extend it for more advanced applications of yours).
#
# And that's why you'll find all the infos and hints you need
# in the comments of the Xojo Post Build Script.
# **************************************************************


# get input
echo "Xojo2Docker: reading input variables..."
PROJECT_PATH=$1
BUILD_LOCATION=$2
BUILD_APPNAME=$3
DOCKER_TAG=$4
DOCKER_ARCH=$5
DOCKER_BUILD_MULTIARCH_IMAGE=$6
DOCKER_PUSH_ENABLED=$7

DOCKER_IMAGE_TAG="${DOCKER_TAG}"
DOCKER_FILE="${BUILD_LOCATION}/Dockerfile"
DOCKER_IMAGE_FINAL="${BUILD_LOCATION}/${BUILD_APPNAME}.dockerimage.tgz"
DOCKER_TAG_LATEST="$(cut -d':' -f1 <<<${DOCKER_TAG})"

# check input
echo ""
echo "Xojo2Docker: checking input variables..."
if [ -z "$PROJECT_PATH" ]; then
	echo "Xojo2Docker ERROR: \$PROJECT_PATH is empty."
	exit 8
fi
if [ ! -d "${PROJECT_PATH}" ]; then
	echo "Xojo2Docker ERROR: \${PROJECT_PATH} = ${PROJECT_PATH} directory doesn't exist."
	exit 8
fi
if [ -z "$BUILD_LOCATION" ]; then
	echo "Xojo2Docker ERROR: \$BUILD_LOCATION is empty."
	exit 8
fi
if [ -z "$DOCKER_TAG" ]; then
	echo "Xojo2Docker ERROR: \$DOCKER_TAG is empty."
	exit 8
fi
if [ -z "$DOCKER_ARCH" ]; then
	echo "Xojo2Docker ERROR: \$DOCKER_ARCH is empty."
	exit 8
fi
if [ -z "$DOCKER_PUSH_ENABLED" ]; then
	echo "Xojo2Docker ERROR: \$DOCKER_PUSH_ENABLED is empty."
	exit 8
fi

# set up a couple of things
echo ""
echo "Xojo2Docker: setting up a couple of things..."

if [ ! -z "$DOCKER_BUILD_MULTIARCH_IMAGE" ]; then
	DOCKER_IMAGE_TAG="${DOCKER_TAG}-${DOCKER_ARCH}"
fi


docker version > /dev/null
if [ $? -ne 0 ]; then
	echo "Xojo2Docker ERROR: 'docker version' failed. Is Docker installed?"
	exit 9
fi

if [ ! -f "$DOCKER_FILE" ]; then
	echo "Xojo2Docker ERROR: Dockerfile doesn't exist: \$DOCKER_FILE"
	exit 8
fi


# change to our working directory
echo ""
echo "Xojo2Docker: change to our working directory"
if [ ! -d "${BUILD_LOCATION}" ]; then
	echo "Xojo2Docker ERROR: \${BUILD_LOCATION} = ${BUILD_LOCATION} doesn't exist."
	exit 8
fi
cd "${BUILD_LOCATION}"

echo ""
echo "Xojo2Docker: looking for the built .app"
if [ ! -f "./${BUILD_APPNAME}" ]; then
	echo "Xojo2Docker ERROR: \${BUILD_APPNAME} = ${BUILD_APPNAME} doesn't exist."
	exit 8
fi


# clear out any old data
echo ""
echo "Xojo2Docker: clear out old data"
rm -rf "${DOCKER_IMAGE_FINAL}"

sync

# build docker image
echo ""
echo "Xojo2Docker: Build '$DOCKER_IMAGE_TAG'"

docker image inspect $DOCKER_IMAGE_TAG > /dev/null 2>&1 
if [ $? -eq 0 ]; then
	echo "Xojo2Docker ERROR: Image '$DOCKER_IMAGE_TAG' already exists"
	echo "Xojo2Docker won't overwrite your Image. Remove it first yourself or change the Build's Version."
	#docker image rm $DOCKER_IMAGE_TAG > /dev/null 2>&1 
	exit 10
fi

DOCKER_BUILD_PLATFORM=
if [ "${DOCKER_ARCH}" = "arm64v8" ]; then
	DOCKER_BUILD_PLATFORM="--platform=linux/arm64/v8"
elif [ "${DOCKER_ARCH}" = "amd64" ]; then
	DOCKER_BUILD_PLATFORM="--platform=linux/amd64"
fi

docker build --no-cache $DOCKER_BUILD_PLATFORM -t $DOCKER_IMAGE_TAG --build-arg ARCH=$DOCKER_ARCH .
if [ $? -ne 0 ]; then
	echo "Xojo2Docker ERROR: 'docker build --no-cache $DOCKER_BUILD_PLATFORM -t $DOCKER_IMAGE_TAG --build-arg ARCH=$DOCKER_ARCH .' failed."
	exit 10
fi

echo ""
echo "Xojo2Docker: Save Docker Image '$DOCKER_IMAGE_TAG'"

docker save $DOCKER_IMAGE_TAG | gzip > "${DOCKER_IMAGE_FINAL}"
if [ $? -ne 0 ]; then
	echo "Xojo2Docker ERROR: Saving the Image for '$DOCKER_IMAGE_TAG' failed."
	exit 10
fi

sync
sleep 1
sync

if [ "${DOCKER_PUSH_ENABLED}" = "yes" ]; then
	echo ""
	echo "Xojo2Docker: Push Docker Image '$DOCKER_IMAGE_TAG'"
	docker push $DOCKER_IMAGE_TAG
	if [ $? -ne 0 ]; then
		echo "Xojo2Docker ERROR: 'docker push $DOCKER_IMAGE_TAG' failed."
		exit 10
	fi
fi

if [ ! -z "$DOCKER_BUILD_MULTIARCH_IMAGE" ]; then
	MULTIARCH_ONE=${DOCKER_BUILD_MULTIARCH_IMAGE%-*}
	MULTIARCH_TWO=${DOCKER_BUILD_MULTIARCH_IMAGE#*-}
	echo ""
	echo "Xojo2Docker: Check Multi Arch Image with '$MULTIARCH_ONE' and '${MULTIARCH_TWO}'"
	
	MULTIARCH_ONE_EXISTS=0
	MULTIARCH_TWO_EXISTS=0

	docker image inspect "${DOCKER_TAG}-${MULTIARCH_ONE}" > /dev/null 2>&1 
	if [ $? -eq 0 ]; then
		MULTIARCH_ONE_EXISTS=1
		echo "- ${DOCKER_TAG}-${MULTIARCH_ONE} exists"
	else
		echo "- ${DOCKER_TAG}-${MULTIARCH_ONE} does not exist yet"
	fi

	docker image inspect "${DOCKER_TAG}-${MULTIARCH_TWO}" > /dev/null 2>&1 
	if [ $? -eq 0 ]; then
		MULTIARCH_TWO_EXISTS=1
		echo "- ${DOCKER_TAG}-${MULTIARCH_TWO} exists"
	else
		echo "- ${DOCKER_TAG}-${MULTIARCH_TWO} does not exist yet"
	fi

	if [ "${DOCKER_PUSH_ENABLED}" = "yes" ] && [ $MULTIARCH_ONE_EXISTS -eq 1 ] && [ $MULTIARCH_TWO_EXISTS -eq 1 ]; then
		echo ""
		echo "Xojo2Docker: Create Manifest '${DOCKER_TAG}' for Multi Arch Image"

		docker manifest create $DOCKER_TAG --amend "${DOCKER_TAG}-${MULTIARCH_ONE}" --amend "${DOCKER_TAG}-${MULTIARCH_TWO}"
		if [ $? -ne 0 ]; then
			echo "Xojo2Docker ERROR: 'docker manifest create $DOCKER_TAG --amend ${DOCKER_TAG}-${MULTIARCH_ONE} --amend ${DOCKER_TAG}-${MULTIARCH_TWO}' failed."
			exit 10
		fi

		echo ""
		echo "Xojo2Docker: Push Manifest '${DOCKER_TAG}' for Multi Arch Image"
		docker manifest push $DOCKER_TAG
		if [ $? -ne 0 ]; then
			echo "Xojo2Docker ERROR: 'docker manifest push $DOCKER_TAG' failed."
			exit 10
		fi

		echo ""
		echo "Xojo2Docker: [Info] Tag and Push MultiArch 'latest' by executing this command"
		echo "docker buildx imagetools create -t ${DOCKER_TAG_LATEST} ${DOCKER_TAG}"
	fi
fi

echo ""
echo "Xojo2Docker: It's all done."
exit 0