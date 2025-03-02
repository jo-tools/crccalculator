#tag BuildAutomation
			Begin BuildStepList Linux
				Begin IDEScriptBuildStep EnableWebBuildDockerImage , AppliesTo = 0, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'Xojo 2018r4 can't compile the Post Build Script (API2) which builds a DockerImage for the Web 2 Project.
					'So make sure it's only being activated when needed:
					'- Only when Building the CRCCalculatorWeb project
					'- Only when Building with Xojo 2021r3 (and newer)
					
					If XojoVersion < 2021.03 Then
					If PropertyValue("WebBuildDockerImage.Applies to") <> "3" Then
					PropertyValue("WebBuildDockerImage.Applies to") = "3" 'None
					End If
					Return
					End If
					
					If (PropertyValue("App.InternalName") <> "CRCCalculatorWeb") Then Return
					
					
					If PropertyValue("WebBuildDockerImage.Applies to") <> "2" Then
					PropertyValue("WebBuildDockerImage.Applies to") = "2" 'Release
					End If
				End
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep CreateTGZ , AppliesTo = 0, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					If (PropertyValue("App.InternalName") <> "CRCCalculator") Then Return
					
					'****************************
					'Create .tgz for Linux Builds
					'****************************
					
					'Post Build Script is for Builds on macOS
					If (Not TargetMacOS) Then
					Return
					End If
					
					'Check Build
					If DebugBuild Then
					Return
					End If
					
					'Check Stage Code
					Var sStageCodeInfo As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sStageCodeInfo = "-dev"
					Case "1" 'Alpha
					sStageCodeInfo = "-alpha"
					Case "2" 'Beta
					sStageCodeInfo = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Check Build Target
					Var sTGZFilename As String
					Select Case CurrentBuildTarget
					Case 4 'Linux (Intel, 32Bit)
					sTGZFilename = "CRCCalculator" + sStageCodeInfo + "_Linux_Intel_32Bit.tgz"
					Case 17 'Linux (Intel, 64Bit)
					sTGZFilename = "CRCCalculator" + sStageCodeInfo + "_Linux_Intel_64Bit.tgz"
					Case 18 'Linux (ARM, 32Bit)
					sTGZFilename = "CRCCalculator" + sStageCodeInfo + "_Linux_ARM_32Bit.tgz"
					Case 26 'Linux (ARM, 64Bit)
					sTGZFilename = "CRCCalculator" + sStageCodeInfo + "_Linux_ARM_64Bit.tgz"
					Else
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String = Trim(DoShellCommand("echo $PROJECT_PATH", 0))
					If Right(sPROJECT_PATH, 1) = "/" Then
					'no trailing /
					sPROJECT_PATH = Mid(sPROJECT_PATH, 1, Len(sPROJECT_PATH)-1)
					End If
					Var sBUILD_LOCATION As String = ReplaceAll(CurrentBuildLocation, "\", "") 'don't escape Path
					Var sBUILD_APPNAME As String = CurrentBuildAppName
					
					If (sPROJECT_PATH = "") Then
					Print "Xojo PostBuild Script CreateTGZ requires to get the Environment Variable $PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Create .tgz
					Var pathParts() As String = Split(sBUILD_LOCATION, "/")
					Var foldernameApp As String = pathParts(pathParts.Ubound)
					pathParts.Remove(pathParts.Ubound)
					Var baseFolder As String = Join(pathParts, "/")
					
					Call DoShellCommand("cd """ + baseFolder + """ && tar -c -z -v --no-mac-metadata --no-xattrs -f ../" + sTGZFilename + " ./" + foldernameApp, 0)
					
				End
				Begin IDEScriptBuildStep WebBuildDockerImage , AppliesTo = 3, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "CRCCalculatorWeb") Then Return
					
					'Reset, so that saving the project has our desired default setting
					If PropertyValue("WebBuildDockerImage.Applies to") <> "3" Then
					PropertyValue("WebBuildDockerImage.Applies to") = "3" 'None
					End If
					
					'*************************************************************
					'Xojo Web App 2 Docker - How to use with your Xojo-built .app?
					'*************************************************************
					'1. copy the folder 'scripts' to your project folder.
					'2. Edit the file 'Dockerfile' in your favourite Text Editor.
					'   1. Look for the last line: CMD /app/CRCCalculatorWeb
					'      Make sure the App Name is the same as in your Xojo
					'      project in Build Settings -> Linux
					'   2. Look for the line: EXPOSE 80
					'      Make sure the App Name is the same as in your Xojo
					'      project in Build Settings -> Shared: Build (Port)
					'3. Create a PostBuild Copy File Step 'CopyDockerfile'
					'   Copy the file 'resources/Dockerfile' to 'App Parent Folder'
					'4. create a PostBuild Script, place it after the
					'   build step and copy-and-paste this one.
					'5. Add/Modify the Constant App.constDockerTag to fit your
					'   Company/App
					'6. Read the Comments in the PostBuild Script,
					'   modify according to your needs.
					'**************************************************
					
					'**************************************************
					'Setup Xojo Web App 2 Docker - Post Build Script
					'**************************************************
					'1. Read the comments in this PostBuild Script
					'2. Edit the values according to your needs
					'**************************************************
					'3. If it's working for you: Do you like it? Does it help you? Has it saved you time and money?
					'   You're welcome - it's free...
					'   If you want to say thanks I appreciate a message or a small donation.
					'   Contact: xojo@jo-tools.ch
					'   PayPal:  https://paypal.me/jotools
					'**************************************************
					
					
					'**************************************************
					'Requires Docker Installation
					'**************************************************
					'Download, install and run Docker.app:
					'https://docs.docker.com/docker-for-mac/install/
					'**************************************************
					'Note: Error creating MultiArch Images
					'https://github.com/docker/for-win/issues/14011
					'Try re-setting qemu. Execute this in Terminal:
					'docker run --rm --privileged multiarch/qemu-user-Static --reset -p yes -c yes
					'This should effectively pull multiarch/qemu-user-Static, re-setup qemu-user-Static With :latest
					'to be properly installed and configured
					'**************************************************
					
					'Configuration
					'-------------
					'Docker Tag: will be used from App.constDockerTag
					'Docker Push (to Docker Hub):
					Var bDockerPushEnabled As Boolean = False
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					bDockerPushEnabled = False
					Case "1" 'Alpha
					bDockerPushEnabled = False
					Case "2" 'Beta
					bDockerPushEnabled = False
					Case "3" 'Final
					bDockerPushEnabled = True
					End Select
					
					
					'*******************************************
					'Xojo Web App 2 Docker  - Let's go...
					'*******************************************
					'you shouldn't need to modify anything below
					'(but feel free to do so :-)
					'*******************************************
					If (Not TargetMacOS) Then
					Print "The Post Build Script 'Xojo Web App 2 Docker' can only be run on macOS. You need to modify the Shell Commands if you're building on Linux or Windows."
					Return
					End If
					
					
					'Check Build Target
					Var sDOCKER_ARCH As String
					Var sDOCKER_BUILD_MULTIARCH_IMAGE As String = "amd64-arm64v8"
					Select Case CurrentBuildTarget
					Case 17
					'Linux (Intel, 64Bit)
					sDOCKER_ARCH = "amd64"
					Case 26
					'Linux (ARM, 64Bit)
					sDOCKER_ARCH = "arm64v8"
					Else
					Print "The only supported Build Targets for the example 'Dockerfile' are: Linux Intel 64Bit, Linux ARM 64Bit"
					Return
					End Select
					
					'Check Build
					If DebugBuild Then
					Print "The Post Build Script 'Xojo Web App 2 Docker' should not be run for Debug Run's."
					Return
					End If
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String = Trim(DoShellCommand("echo $PROJECT_PATH", 0))
					If Right(sPROJECT_PATH, 1) = "/" Then
					'no trailing /
					sPROJECT_PATH = Mid(sPROJECT_PATH, 1, Len(sPROJECT_PATH)-1)
					End If
					Var sBUILD_LOCATION As String = ReplaceAll(CurrentBuildLocation, "\", "") 'don't escape Path
					Var sBUILD_APPNAME As String = CurrentBuildAppName
					
					If (sPROJECT_PATH = "") Then
					Print "Xojo Web App 2 Docker requires to get the Environment Variable $PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'App Version -> used for Docker Image Tag
					Var sAPP_VERSION As String = PropertyValue("App.MajorVersion") + "." + PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
					Select Case PropertyValue("App.StageCode")
					Case "0"
					sAPP_VERSION = sAPP_VERSION + "-dev"
					Case "1"
					sAPP_VERSION = sAPP_VERSION + "-alpha"
					Case "2"
					sAPP_VERSION = sAPP_VERSION + "-beta"
					End Select
					
					'DockerTag
					Var sDOCKER_TAG As String = ConstantValue("App.constDockerTag")
					If (sDOCKER_TAG = "") Then
					Print "Xojo Web App 2 Docker requires the Constant: App.constDockerTag."
					Return
					End If
					sDOCKER_TAG = sDOCKER_TAG + ":" + sAPP_VERSION
					
					'Add DockerFile
					Call DoShellCommand("cp """ + sPROJECT_PATH + "/scripts/Dockerfile"" """ + sBUILD_LOCATION + "/Dockerfile""", 0)
					
					
					'The Contents of Array will later be passed to
					'the ShellScript 'xojo2docker.sh', which does all the processing
					'
					'The order is important, so don't change anything here without
					'changing the ShellScript, too.
					Var sShellArguments() As String
					
					'Parameters required to create the Docker Image
					sShellArguments.Add(sPROJECT_PATH)
					sShellArguments.Add(sBUILD_LOCATION)
					sShellArguments.Add(sBUILD_APPNAME)
					sShellArguments.Add(sDOCKER_TAG)
					sShellArguments.Add(sDOCKER_ARCH)
					sShellArguments.Add(sDOCKER_BUILD_MULTIARCH_IMAGE)
					sShellArguments.Add(If(bDockerPushEnabled, "yes", "no"))
					
					'Make sure the ShellScript is executable:
					Call DoShellCommand("chmod 755 """ + sPROJECT_PATH + "/scripts/xojo2docker.sh""", 0)
					
					If (Not DebugBuild) Then
					'Automate Terminal:
					'Pass ShellArguments to Script and execute it in Terminal.app
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to activate'", 0)
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to do script ""\""" + sPROJECT_PATH + "/scripts/xojo2docker.sh\"" \""" + Join(sShellArguments, "\"" \""") + "\""""'", 0)
					Return 'see progress and errors in Terminal.app
					End If
					
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":""}
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep CreateZIP , AppliesTo = 0, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					If (PropertyValue("App.InternalName") <> "CRCCalculator") Then Return
					
					'******************************
					'Create .zip for Windows Builds
					'******************************
					
					'Post Build Script is for Builds on macOS
					If (Not TargetMacOS) Then
					Return
					End If
					
					'Check Build
					If DebugBuild Then
					Return
					End If
					
					'Check Stage Code
					Var sStageCodeInfo As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sStageCodeInfo = "-dev"
					Case "1" 'Alpha
					sStageCodeInfo = "-alpha"
					Case "2" 'Beta
					sStageCodeInfo = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Check Build Target
					Var sZIPFilename As String
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					sZIPFilename = "CRCCalculator" + sStageCodeInfo + "_Windows_Intel_32Bit.zip"
					Case 19 'Windows (Intel, 64Bit)
					sZIPFilename = "CRCCalculator" + sStageCodeInfo + "_Windows_Intel_64Bit.zip"
					Case 25 'Windows(ARM, 64Bit)
					sZIPFilename = "CRCCalculator" + sStageCodeInfo + "_Windows_ARM_64Bit.zip"
					Else
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String = Trim(DoShellCommand("echo $PROJECT_PATH", 0))
					If Right(sPROJECT_PATH, 1) = "/" Then
					'no trailing /
					sPROJECT_PATH = Mid(sPROJECT_PATH, 1, Len(sPROJECT_PATH)-1)
					End If
					Var sBUILD_LOCATION As String = ReplaceAll(CurrentBuildLocation, "\", "") 'don't escape Path
					Var sBUILD_APPNAME As String = CurrentBuildAppName
					
					If (sPROJECT_PATH = "") Then
					Print "Xojo PostBuild Script CreateZIP requires to get the Environment Variable $PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Create .zip
					Var pathParts() As String = Split(sBUILD_LOCATION, "/")
					Var foldernameApp As String = pathParts(pathParts.Ubound)
					pathParts.Remove(pathParts.Ubound)
					Var baseFolder As String = Join(pathParts, "/")
					
					Call DoShellCommand("cd """ + baseFolder + """ && zip -r ../" + sZIPFilename + " ./" + foldernameApp, 0)
					
				End
			End
			Begin BuildStepList Xojo Cloud
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
