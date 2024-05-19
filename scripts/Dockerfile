#DOCKER BUILD ARGUMENTS
ARG ARCH=

#BASE IMAGE
FROM ${ARCH}/ubuntu:22.04

#ARGUMENTS IN BUILD STAGE
ARG ARCH
ARG BUILDPLATFORM

#ENVIRONMENT
ENV TZ=Etc/UTC

#INSTALL REQUIRED LIBRARIES
ARG DEBIAN_FRONTEND=noninteractive

# WORKAROUND TO BUILD ON INTEL MAC FOR TARGET ARM64V8 
RUN if [ "${BUILDPLATFORM}" = "linux/amd64" ] && [ "${ARCH}" = "arm64v8" ]; then \
        rm /var/lib/dpkg/info/libc-bin.* && \
        apt-get clean && \
        apt-get update && \
        apt-get install -y libc-bin \
    ; fi
RUN apt-get update
RUN apt-get install -y \
		tzdata \
		libunwind8 \
		libglib2.0 \
		libsoup2.4-1

#ADD APPLICATION TO DOCKER IMAGE
ADD / /app/

#EXPOSE PORT AND RUN APPLICATION
EXPOSE 80
WORKDIR /app
CMD /app/CRCCalculatorWeb