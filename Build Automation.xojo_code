#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep CreateTGZ , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					If (PropertyValue("App.InternalName") <> "CRCCalculator") Then Return
					
					'**************************************************
					' Create .tgz for Linux Builds
					'**************************************************
					' https://github.com/jo-tools
					'**************************************************
					' 1. Read the comments in this PostBuild Script
					' 2. Edit the values according to your needs
					'**************************************************
					' 3. If it's working for you:
					'    Do you like it? Does it help you? Has it saved you time and money?
					'    You're welcome - it's free...
					'    If you want to say thanks I appreciate a message or a small donation.
					'    Contact: xojo@jo-tools.ch
					'    PayPal:  https://paypal.me/jotools
					'**************************************************
					
					If DebugBuild Then Return 'don't create .tgz for DebugRuns
					
					' bSILENT=True : don't show any error messages
					Var bSILENT As Boolean = True
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 4 'Linux (Intel, 32Bit)
					Case 17 'Linux (Intel, 64Bit)
					Case 18 'Linux (ARM, 32Bit)
					Case 26 'Linux (ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "CreateTGZ: Unsupported Build Target"
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					Var sAPP_NAME As String = CurrentBuildAppName
					Var sCHAR_FOLDER_SEPARATOR As String
					If TargetWindows Then 'Xojo IDE is running on Windows
					sPROJECT_PATH = DoShellCommand("echo %PROJECT_PATH%", 0).Trim
					sCHAR_FOLDER_SEPARATOR = "\"
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sPROJECT_PATH = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If sBUILD_LOCATION.Right(1) = "/" Then
					'no trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sCHAR_FOLDER_SEPARATOR = "/"
					End If
					
					If (sPROJECT_PATH = "") Then
					If (Not bSILENT) Then Print "CreateTGZ: Could not get the Environment Variable PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Check Stage Code for TGZ Filename
					Var sSTAGECODE_SUFFIX As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sSTAGECODE_SUFFIX = "-dev"
					Case "1" 'Alpha
					sSTAGECODE_SUFFIX = "-alpha"
					Case "2" 'Beta
					sSTAGECODE_SUFFIX = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Build TGZ Filename
					Var sTGZ_FILENAME As String
					Select Case CurrentBuildTarget
					Case 4 'Linux (Intel, 32Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_Intel_32Bit.tgz"
					Case 17 'Linux (Intel, 64Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_Intel_64Bit.tgz"
					Case 18 'Linux (ARM, 32Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_ARM_32Bit.tgz"
					Case 26 'Linux (ARM, 64Bit)
					sTGZ_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Linux_ARM_64Bit.tgz"
					Else
					Return
					End Select
					
					'Create .tgz
					Var sPATH_PARTS() As String = sBUILD_LOCATION.Split(sCHAR_FOLDER_SEPARATOR)
					Var sAPP_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					If TargetWindows Then sAPP_FOLDERNAME = sAPP_NAME 'on Windows, BuildLocation is short shell path (e.g. APPNAM~1)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sFOLDER_BASE As String = String.FromArray(sPATH_PARTS, sCHAR_FOLDER_SEPARATOR)
					
					Var sTGZ_PARAMS_MACOS As String = If(TargetMacOS, "--no-mac-metadata --no-xattrs", "")
					Var sTGZ_COMMAND As String = "cd """ + sFOLDER_BASE + """ && tar -c -z -v " + sTGZ_PARAMS_MACOS + " -f "".." + sCHAR_FOLDER_SEPARATOR + sTGZ_FILENAME + """ ""." + sCHAR_FOLDER_SEPARATOR + sAPP_FOLDERNAME + """"
					
					Var iTGZ_RESULT As Integer
					Var sTGZ_OUTPUT As String = DoShellCommand(sTGZ_COMMAND, 0, iTGZ_RESULT)
					If (iTGZ_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateTGZ Error" + EndOfLine + EndOfLine + _
					sTGZ_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iTGZ_RESULT.ToString + "]"
					End If
					
				End
				Begin IDEScriptBuildStep WebBuildDockerImage , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					'So make sure this script is only being run when needed:
					If (PropertyValue("App.InternalName") <> "CRCCalculatorWeb") Then Return
					
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
					Var sPROJECT_PATH As String = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length)
					End If
					Var sBUILD_LOCATION As String = CurrentBuildLocation.ReplaceAll("\", "") 'don't escape Path
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
				Begin IDEScriptBuildStep Xojo2DMG , AppliesTo = 0, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					If (PropertyValue("App.InternalName") <> "CRCCalculator") Then Return
					
					'**************************************************
					' Create .dmg | Notarization
					'**************************************************
					' https://github.com/jo-tools/xojo2dmg
					'**************************************************
					' This Post Build Script only runs on a local
					' setup of Xojo2DMG.
					' Have a look at the GitHub Repository to read
					' more about Xojo2DMG.
					'**************************************************
					
					If (Not TargetMacOS) Then Return 'Xojo IDE must be running on macOS
					
					'Check Xojo's Build Target
					Select Case CurrentBuildTarget
					Case 16 'macOS: Intel 64Bit
					Case 24 'macOS: ARM 64Bit
					Case 9 'macOS: Universal (Intel 64Bit, ARM 64Bit)
					Else
					Return
					End Select
					
					' Check if a custom local Build Script is available
					Var sCOMPANYNAME As String = PropertyValue("App.CompanyName")
					If (sCOMPANYNAME = "") Then Return
					
					Var sXOJO2DMG As String = DoShellCommand("[ -f ~/.xojo2dmg/" + sCOMPANYNAME + ".sh ] && echo ~/.xojo2dmg/" + sCOMPANYNAME + ".sh").Trim
					If (sXOJO2DMG = "") Then Return 'local company setup of Xojo2DMG not found
					
					'**************************************************
					' Setup Xojo2DMG
					'**************************************************
					Var sPROJECT_PATH As String = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'No trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If (sPROJECT_PATH = "") Then Return
					
					Var sBUILD_LOCATION As String = CurrentBuildLocation.ReplaceAll("\", "") 'don't escape Path
					If sBUILD_LOCATION.Right(1) = "/" Then
					'No trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					
					'Sanity Check: Unsupported XojoVersion when building Universal (Intel 64Bit, ARM 64Bit)
					If ((CurrentBuildTarget = 24) And (sBUILD_LOCATION.Right(18) = "/_macOS ARM 64 bit")) _
					Or _
					((CurrentBuildTarget = 16) And (sBUILD_LOCATION.Right(14) = "/_macOS 64 bit")) Then
					Return
					End If
					
					Var sBUILD_APPNAME As String = CurrentBuildAppName 'Xojo 2022r1 adds .app
					If (sBUILD_APPNAME.Right(4) = ".app") Then sBUILD_APPNAME = sBUILD_APPNAME.Left(sBUILD_APPNAME.Length-4)
					
					Var sBUILD_APP_VERSION As String = PropertyValue("App.Version")
					If (sBUILD_APP_VERSION = "") Then
					sBUILD_APP_VERSION = PropertyValue("App.MajorVersion") + "." + PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
					End If
					
					Var BUILD_APP_STAGECODE As String = ""
					Select Case PropertyValue("App.StageCode")
					Case "0"
					BUILD_APP_STAGECODE = "Dev"
					Case "1"
					BUILD_APP_STAGECODE = "Alpha"
					Case "2"
					BUILD_APP_STAGECODE = "Beta"
					Case "3"
					BUILD_APP_STAGECODE = "Final"
					End Select
					
					Var sBUILD_TYPE As String = "release"
					If DebugBuild Then sBUILD_TYPE = "debug"
					
					Var sBUILD_TARGET As String = "macOS"
					Select Case CurrentBuildTarget
					Case 16 'macOS: Intel 64Bit
					sBUILD_TARGET = "macOS_Intel_64Bit"
					Case 24 'macOS: ARM 64Bit
					sBUILD_TARGET = "macOS_ARM_64Bit"
					Case 9 'macOS: Universal (Intel 64Bit, ARM 64Bit)
					sBUILD_TARGET = "macOS_Universal"
					End Select
					
					
					'**************************************************
					' Launch Xojo2DMG
					'**************************************************
					Var sShellArguments() As String
					sShellArguments.Add(sPROJECT_PATH)
					sShellArguments.Add(sBUILD_LOCATION)
					sShellArguments.Add(sBUILD_APPNAME)
					sShellArguments.Add(sBUILD_APP_VERSION)
					sShellArguments.Add(BUILD_APP_STAGECODE)
					sShellArguments.Add(sBUILD_TYPE)
					sShellArguments.Add(sBUILD_TARGET)
					
					If (Not DebugBuild) Then
					'Launch Xojo2DMG in Terminal
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to activate'", 0)
					Call DoShellCommand("osascript -e 'tell application ""Terminal"" to do script ""\""" + sXOJO2DMG + "\"" \""" + String.FromArray(sShellArguments, "\"" \""") + "\""""'", 0)
					Return 'see progress and errors in Terminal.app
					End If
					
					Var iShellResult As Integer
					Var sShellResult As String = DoShellCommand("""" + sXOJO2DMG +  """ """ + String.FromArray(sShellArguments, """ """) + """", 0, iShellResult)
					
					'Process and Parse the Output of the ShellScript
					Var sXojo2DMG_Errors() As String
					Var sShellResultLines() As String = sShellResult.ReplaceAll(EndOfLine, "*****").Split("*****")
					For i As Integer = 0 To sShellResultLines.LastIndex
					'get all lines with Xojo2DMG Errors (and not the full output)
					If (sShellResultLines(i).Left(15) = "Xojo2DMG ERROR:") Then
					sXojo2DMG_Errors.Add(sShellResultLines(i))
					End If
					Next
					
					
					Select Case iShellResult
					Case 0
					'Yeah... it's all OK!
					Case 2
					'DebugRun without Codesigning: xojo2dmg.sh will return with 'exit 2'
					'Don't show errors - it's all OK
					Return
					Else
					'Hmm... something went wrong...
					sXojo2DMG_Errors.Add("Xojo2DMG quit with ShellResult: " + iShellResult.ToString)
					End Select
					
					'If there are errors:
					If (sXojo2DMG_Errors.LastIndex >= 0) Then
					'Print just the Errors, and have the full output in Clipboard
					Print String.FromArray(sXojo2DMG_Errors, EndOfLine) + EndOfLine + _
					"Note: Shell Output is in Clipboard"
					Clipboard = sShellResult
					End If
					
					Return
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep CodeSign , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					If (PropertyValue("App.InternalName") <> "CRCCalculator") Then Return
					
					'*********************************************************************************************
					' CodeSign | Azure Trusted Signing | PFX | Docker
					'*********************************************************************************************
					' https://github.com/jo-tools/ats-codesign-innosetup
					'*********************************************************************************************
					' Requirements
					'*********************************************************************************************
					' 1.  Set up Codesigning with one of the following
					' 1.1 Azure Trusted Signing
					'     Requires acs.json and azure.json in ~/.ats-codesign
					'     Strongly recommends ats-codesign-credential.sh in ~/.ats-codesign
					' 1.2 CodeSign Certificate .pfx
					'     Requires pfx.json and certificate.pfx in ~/.pfx-codesign
					'     Strongly recommends pfx-codesign-credential.sh in ~/.pfx-codesign
					' 2.  Have Docker up and running
					' 3.  Read the comments in this Post Build Script
					' 4.  Modify it according to your needs
					'
					'     Especially look out for sDOCKER_EXE
					'     You might need to set the full path to the executable
					'*********************************************************************************************
					' 5.  If it's working for you:
					'     Do you like it? Does it help you? Has it saved you time and money?
					'     You're welcome - it's free...
					'     If you want to say thanks I appreciate a message or a small donation.
					'     Contact: xojo@jo-tools.ch
					'     PayPal:  https://paypal.me/jotools
					'*********************************************************************************************
					
					If DebugBuild Then Return 'don't CodeSign DebugRun's
					
					'bSILENT=True : don't show any messages until checking configuration
					'               once .json required files are found: expect Docker and codesign to work
					'               use this e.g. in Open Source projects so that your builds will be codesigned,
					'               but if others are building the project it won't show messages to them
					Var bSILENT As Boolean = True
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 3  'Windows (Intel, 32Bit)
					Case 19 'Windows (Intel, 64Bit)
					Case 25 'Windows(ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "Codesign: Unsupported Build Target"
					Return
					End Select
					
					'Don't CodeSign Development and Alpha Builds
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					If (Not bSILENT) Then Print "Codesign: Not enabled for Development Builds"
					Return
					Case "1" 'Alpha
					If (Not bSILENT) Then Print "Codesign: Not enabled for Alpha Builds"
					Return
					Case "2" 'Beta
					Case "3" 'Final
					End Select
					
					'Configure what to be CodeSigned
					Var sSIGN_FILES() As String
					
					Select Case PropertyValue("App.StageCode")
					Case "3" 'Final
					' sign all .exe's and all .dll's
					sSIGN_FILES.Add("""./**/*.exe""") 'recursively all .exe's
					sSIGN_FILES.Add("""./**/*.dll""") 'recursively all .dll's
					Else
					' only sign all .exe's for Beta/Alpha/Development builds
					sSIGN_FILES.Add("""./**/*.exe""") 'recursively all .exe's
					End Select
					
					'Note: In your project use jotools/codesign if you are not using the InnoSetup Build Step.
					'      It's a smaller Docker Image...
					'      Should your project use the Post Build Script 'InnoSetup' too, then change here to use jotools/innosetup.
					'      InnoSetup includes codesign, too. So you don't need having two different Docker Images taking up space on your machine.
					Var sDOCKER_IMAGE As String = "jotools/codesign" 'or: "jotools/innosetup"
					
					Var sFILE_ACS_JSON As String = "" 'will be searched in ~/.ats-codesign
					Var sFILE_AZURE_JSON As String = "" 'will be searched in ~/.ats-codesign
					Var sFILE_PFX_JSON As String = "" 'will be searched in ~/.pfx-codesign
					Var sFILE_PFX_CERTIFICATE As String = "" 'will be searched in ~/.pfx-codesign
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					
					'Check Environment
					Var sDOCKER_EXE As String = "docker"
					If TargetWindows Then 'Xojo IDE is running on Windows
					sFILE_ACS_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\acs.json echo %USERPROFILE%\.ats-codesign\acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\azure.json echo %USERPROFILE%\.ats-codesign\azure.json").Trim
					sFILE_PFX_JSON = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\pfx.json echo %USERPROFILE%\.pfx-codesign\pfx.json").Trim
					sFILE_PFX_CERTIFICATE = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\certificate.pfx echo %USERPROFILE%\.pfx-codesign\certificate.pfx").Trim
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sDOCKER_EXE = DoShellCommand("[ -f /usr/local/bin/docker ] && echo /usr/local/bin/docker").Trim
					If (sDOCKER_EXE = "") Then sDOCKER_EXE = DoShellCommand("[ -f /snap/bin/docker ] && echo /snap/bin/docker").Trim
					sFILE_ACS_JSON = DoShellCommand("[ -f ~/.ats-codesign/acs.json ] && echo ~/.ats-codesign/acs.json").Trim
					sFILE_AZURE_JSON = DoShellCommand("[ -f ~/.ats-codesign/azure.json ] && echo ~/.ats-codesign/azure.json").Trim
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sFILE_PFX_JSON = DoShellCommand("[ -f ~/.pfx-codesign/pfx.json ] && echo ~/.pfx-codesign/pfx.json").Trim
					sFILE_PFX_CERTIFICATE = DoShellCommand("[ -f ~/.pfx-codesign/certificate.pfx ] && echo ~/.pfx-codesign/certificate.pfx").Trim
					Else
					If (Not bSILENT) Then Print "Codesign: Xojo IDE running on unknown Target"
					Return
					End If
					
					Var bCODESIGN_ATS As Boolean = (sFILE_ACS_JSON <> "") And (sFILE_AZURE_JSON <> "")
					Var bCODESIGN_PFX As Boolean = (sFILE_PFX_JSON <> "") And (sFILE_PFX_CERTIFICATE <> "")
					
					If (Not bCODESIGN_ATS) And (Not bCODESIGN_PFX) Then
					If (Not bSILENT) Then
					Print "Codesign:" + EndOfLine + _
					"acs.json and azure.json not found in [UserHome]-[.ats-codesign]-[acs|azure.json]" + EndOfLine + _
					"pfx.json and certificate.pfx not found in [UserHome]-[.pfx-codesign]-[pfx.json|certificate.pfx]"
					End If
					Return
					End If
					
					'Check Docker
					Var iCHECK_DOCKER_RESULT As Integer
					Var sCHECK_DOCKER_EXE As String = DoShellCommand(sDOCKER_EXE + " --version", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Or (Not sCHECK_DOCKER_EXE.Contains("Docker")) Or (Not sCHECK_DOCKER_EXE.Contains("version")) Or (Not sCHECK_DOCKER_EXE.Contains("build "))Then
					Print "Codesign: Docker not available"
					Return
					End If
					
					Var sCHECK_DOCKER_PROCESS As String = DoShellCommand(sDOCKER_EXE + " ps", 0, iCHECK_DOCKER_RESULT).Trim
					If (iCHECK_DOCKER_RESULT <> 0) Then
					Print "Codesign: Docker not running"
					Return
					End If
					
					'Get Credential from Secure Storage
					Var bENV_ATS_CREDENTIAL As Boolean
					Var bENV_PFX_CREDENTIAL As Boolean
					
					If bCODESIGN_ATS Or bCODESIGN_PFX Then
					Var SFILE_CREDENTIAL As String
					Var sCREDENTIAL_COMMAND As String
					
					If TargetWindows Then 'Xojo IDE is running on Windows
					If bCODESIGN_ATS Then
					SFILE_CREDENTIAL = DoShellCommand("if exist %USERPROFILE%\.ats-codesign\ats-codesign-credential.ps1 echo %USERPROFILE%\.ats-codesign\ats-codesign-credential.ps1").Trim
					ElseIf bCODESIGN_PFX Then
					SFILE_CREDENTIAL = DoShellCommand("if exist %USERPROFILE%\.pfx-codesign\pfx-codesign-credential.ps1 echo %USERPROFILE%\.pfx-codesign\pfx-codesign-credential.ps1").Trim
					End If
					If (SFILE_CREDENTIAL <> "") Then
					sCREDENTIAL_COMMAND = "powershell """ + SFILE_CREDENTIAL + """"
					End If
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					If bCODESIGN_ATS Then
					SFILE_CREDENTIAL = DoShellCommand("[ -f ~/.ats-codesign/ats-codesign-credential.sh ] && echo ~/.ats-codesign/ats-codesign-credential.sh").Trim
					ElseIf bCODESIGN_PFX Then
					SFILE_CREDENTIAL = DoShellCommand("[ -f ~/.pfx-codesign/pfx-codesign-credential.sh ] && echo ~/.pfx-codesign/pfx-codesign-credential.sh").Trim
					End If
					If (SFILE_CREDENTIAL <> "") Then
					Call DoShellCommand("chmod 755 """ + SFILE_CREDENTIAL + """") 'just to make sure it's executable
					sCREDENTIAL_COMMAND = SFILE_CREDENTIAL
					End If
					End If
					
					If (sCREDENTIAL_COMMAND <> "") Then
					'Once the Credential Helper Script is in place, we expect to get a value from it
					Var iCREDENTIAL_RESULT As Integer
					Var sCREDENTIAL As String = DoShellCommand(sCREDENTIAL_COMMAND, 0, iCREDENTIAL_RESULT).Trim
					If (iCREDENTIAL_RESULT <> 0) Or (sCREDENTIAL = "") Then
					Print  "Codesign: Could not retrieve " + If(bCODESIGN_ATS, "ATS", "PFX") + " Credential"
					Return
					End If
					
					'Use Environment Variable
					If bCODESIGN_ATS Then
					EnvironmentVariable("AZURE_CLIENT_SECRET") = sCREDENTIAL
					bENV_ATS_CREDENTIAL = True
					ElseIf bCODESIGN_PFX Then
					EnvironmentVariable("PFX_PASSWORD") = sCREDENTIAL
					bENV_PFX_CREDENTIAL = True
					End If
					End If
					End If
					
					'CodeSign in Docker Container
					Var sSIGN_COMMAND As String
					Var sSIGN_ENTRYPOINT As String
					If bCODESIGN_ATS Then
					'CodeSign using Azure Trusted Signing
					sSIGN_ENTRYPOINT = "ats-codesign.sh"
					sSIGN_COMMAND = _
					sDOCKER_EXE + " run " + _
					"--rm " + _
					"-v """ + sFILE_ACS_JSON + """:/etc/ats-codesign/acs.json " + _
					"-v """ + sFILE_AZURE_JSON + """:/etc/ats-codesign/azure.json " + _
					If(bENV_ATS_CREDENTIAL, "-e AZURE_CLIENT_SECRET ", "") + _
					"-v """ + sBUILD_LOCATION + """:/data " + _
					"-w /data " + _
					"--entrypoint " + sSIGN_ENTRYPOINT + " " + _
					sDOCKER_IMAGE + " " + _
					String.FromArray(sSIGN_FILES, " ")
					ElseIf bCODESIGN_PFX Then
					'CodeSign using .pfx
					sSIGN_ENTRYPOINT = "pfx-codesign.sh"
					sSIGN_COMMAND = _
					sDOCKER_EXE + " run " + _
					"--rm " + _
					"-v """ + sFILE_PFX_JSON + """:/etc/pfx-codesign/pfx.json " + _
					"-v """ + sFILE_PFX_CERTIFICATE + """:/etc/pfx-codesign/certificate.pfx " + _
					If(bENV_PFX_CREDENTIAL, "-e PFX_PASSWORD ", "") + _
					"-v """ + sBUILD_LOCATION + """:/data " + _
					"-w /data " + _
					"--entrypoint " + sSIGN_ENTRYPOINT + " " + _
					sDOCKER_IMAGE + " " + _
					String.FromArray(sSIGN_FILES, " ")
					End If
					
					Var iSIGN_RESULT As Integer
					Var sSIGN_OUTPUT As String = DoShellCommand(sSIGN_COMMAND, 0, iSIGN_RESULT)
					
					If (iSIGN_RESULT <> 0) Then
					Clipboard = sSIGN_OUTPUT
					Print "Codesign: " + sSIGN_ENTRYPOINT + " Error" + EndOfLine + _
					"[ExitCode: " + iSIGN_RESULT.ToString + "]" + EndOfLine + EndOfLine + _
					"Note: Shell Output is available in Clipboard."
					
					If (iSIGN_RESULT <> 125) Then
					Var iCHECK_DOCKERIMAGE_RESULT As Integer
					Var sCHECK_DOCKERIMAGE_OUTPUT As String = DoShellCommand(sDOCKER_EXE + " image inspect " + sDOCKER_IMAGE, 0, iCHECK_DOCKERIMAGE_RESULT)
					If (iCHECK_DOCKERIMAGE_RESULT <> 0) Then
					Print "Codesign: Docker Image '" + sDOCKER_IMAGE + "' not available"
					End If
					End If
					End If
					
				End
				Begin IDEScriptBuildStep CreateZIP , AppliesTo = 2, Architecture = 0, Target = 0
					'This is a MonoRepo with multiple Projects (which therefore share the Build Automation steps).
					If (PropertyValue("App.InternalName") <> "CRCCalculator") Then Return
					
					'**************************************************
					' Create .zip for Windows Builds
					'**************************************************
					' https://github.com/jo-tools
					'**************************************************
					' 1. Read the comments in this PostBuild Script
					' 2. Edit the values according to your needs
					'**************************************************
					' 3. If it's working for you:
					'    Do you like it? Does it help you? Has it saved you time and money?
					'    You're welcome - it's free...
					'    If you want to say thanks I appreciate a message or a small donation.
					'    Contact: xojo@jo-tools.ch
					'    PayPal:  https://paypal.me/jotools
					'**************************************************
					
					If DebugBuild Then Return 'don't create .zip for DebugRuns
					
					'bSILENT=True : don't show any error messages
					Var bSILENT As Boolean = True
					
					'Check Build Target
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					Case 19 'Windows (Intel, 64Bit)
					Case 25 'Windows(ARM, 64Bit)
					Else
					If (Not bSILENT) Then Print "CreateZIP: Unsupported Build Target"
					Return
					End Select
					
					'Xojo Project Settings
					Var sPROJECT_PATH As String
					Var sBUILD_LOCATION As String = CurrentBuildLocation
					Var sAPP_NAME As String = CurrentBuildAppName
					If (sAPP_NAME.Right(4) = ".exe") Then
					sAPP_NAME = sAPP_NAME.Left(sAPP_NAME.Length - 4)
					End If
					Var sCHAR_FOLDER_SEPARATOR As String
					If TargetWindows Then 'Xojo IDE is running on Windows
					sPROJECT_PATH = DoShellCommand("echo %PROJECT_PATH%", 0).Trim
					sCHAR_FOLDER_SEPARATOR = "\"
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					sPROJECT_PATH = DoShellCommand("echo $PROJECT_PATH", 0).Trim
					If sPROJECT_PATH.Right(1) = "/" Then
					'no trailing /
					sPROJECT_PATH = sPROJECT_PATH.Left(sPROJECT_PATH.Length - 1)
					End If
					If sBUILD_LOCATION.Right(1) = "/" Then
					'no trailing /
					sBUILD_LOCATION = sBUILD_LOCATION.Left(sBUILD_LOCATION.Length - 1)
					End If
					sBUILD_LOCATION = sBUILD_LOCATION.ReplaceAll("\", "") 'don't escape Path
					sCHAR_FOLDER_SEPARATOR = "/"
					End If
					
					If (sPROJECT_PATH = "") Then
					If (Not bSILENT) Then Print "CreateZIP: Could not get the Environment Variable PROJECT_PATH from the Xojo IDE." + EndOfLine + EndOfLine + "Unfortunately, it's empty.... try again after re-launching the Xojo IDE and/or rebooting your machine."
					Return
					End If
					
					'Check Stage Code for ZIP Filename
					Var sSTAGECODE_SUFFIX As String
					Select Case PropertyValue("App.StageCode")
					Case "0" 'Development
					sSTAGECODE_SUFFIX = "-dev"
					Case "1" 'Alpha
					sSTAGECODE_SUFFIX = "-alpha"
					Case "2" 'Beta
					sSTAGECODE_SUFFIX = "-beta"
					Case "3" 'Final
					'not used in filename
					End Select
					
					'Build ZIP Filename
					Var sZIP_FILENAME As String
					Select Case CurrentBuildTarget
					Case 3 'Windows (Intel, 32Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_Intel_32Bit.zip"
					Case 19 'Windows (Intel, 64Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_Intel_64Bit.zip"
					Case 25 'Windows(ARM, 64Bit)
					sZIP_FILENAME = sAPP_NAME.ReplaceAll(" ", "_") + sSTAGECODE_SUFFIX + "_Windows_ARM_64Bit.zip"
					Else
					Return
					End Select
					
					'Create .zip
					Var sPATH_PARTS() As String = sBUILD_LOCATION.Split(sCHAR_FOLDER_SEPARATOR)
					Var sAPP_FOLDERNAME As String = sPATH_PARTS(sPATH_PARTS.LastIndex)
					sPATH_PARTS.RemoveAt(sPATH_PARTS.LastIndex)
					Var sFOLDER_BASE As String = String.FromArray(sPATH_PARTS, sCHAR_FOLDER_SEPARATOR)
					
					If TargetWindows Then 'Xojo IDE is running on Windows
					Var sPOWERSHELL_COMMAND As String = "cd """ + sFOLDER_BASE + """; Compress-Archive -Path .\* -DestinationPath ""..\" + sZIP_FILENAME + """ -Force"
					Var iPOWERSHELL_RESULT As Integer
					Var sPOWERSHELL_OUTPUT As String = DoShellCommand("powershell -command """ + sPOWERSHELL_COMMAND.ReplaceAll("""", "'") + """", 0, iPOWERSHELL_RESULT)
					If (iPOWERSHELL_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateZIP Error" + EndOfLine + EndOfLine + _
					sPOWERSHELL_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iPOWERSHELL_RESULT.ToString + "]"
					End If
					ElseIf TargetMacOS Or TargetLinux Then 'Xojo IDE running on macOS or Linux
					Var iZIP_RESULT As Integer
					Var sZIP_OUTPUT As String = DoShellCommand("cd """ + sFOLDER_BASE + """ && zip -r ""../" + sZIP_FILENAME + """ ""./" + sAPP_FOLDERNAME + """", 0, iZIP_RESULT)
					If (iZIP_RESULT <> 0) Then
					If (Not bSILENT) Then Print "CreateZIP Error" + EndOfLine + EndOfLine + _
					sZIP_OUTPUT.Trim + EndOfLine + _
					"[ExitCode: " + iZIP_RESULT.ToString + "]"
					End If
					End If
					
				End
			End
			Begin BuildStepList Xojo Cloud
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
