#tag BuildAutomation
			Begin BuildStepList Linux
				Begin IDEScriptBuildStep EnableWebBuildDockerImage , AppliesTo = 0, Architecture = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'Xojo 2018r4 can't compile the Post Build Script (API2) which builds a DockerImage for the Web 2 Project.
					'So make sure it's only being activated when needed:
					'- Only when Building the CRCCalculatorWeb project
					'- Only when Building with Xojo 2021r3 (and newer)
					
					if XojoVersion < 2021.03 then
					if PropertyValue("WebBuildDockerImage.Applies to") <> "3" then
					PropertyValue("WebBuildDockerImage.Applies to") = "3" 'None
					end if
					return
					end if
					
					if (PropertyValue("App.InternalName") <> "CRCCalculatorWeb") then return
					
					
					if PropertyValue("WebBuildDockerImage.Applies to") <> "2" then
					PropertyValue("WebBuildDockerImage.Applies to") = "2" 'Release
					end if
				End
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep WebBuildDockerImage , AppliesTo = 3, Architecture = 1
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					if (PropertyValue("App.InternalName") <> "CRCCalculatorWeb") then return
					
					'Reset, so that saving the project has our desired default setting
					if PropertyValue("WebBuildDockerImage.Applies to") <> "3" then
					PropertyValue("WebBuildDockerImage.Applies to") = "3" 'None
					end if
					
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
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Xojo Cloud
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
