#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Closed()
		  If App.StageCode < 3 Then 'Not a Final Build
		    System.DebugLog("App: Closed")
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening(args() As String)
		  #Pragma unused args
		  
		  If App.StageCode < 3 Then 'Not a Final Build
		    System.DebugLog("App: Opening")
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Stopping(shuttingDown as Boolean)
		  #Pragma unused ShuttingDown
		  
		  If App.StageCode < 3 Then 'Not a Final Build
		    System.DebugLog("App: Stopping")
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  If App.StageCode < 3 Then 'Not a Final Build
		    System.DebugLog("App: UnhandledException - " + Error.Message)
		  End If
		End Function
	#tag EndEvent


	#tag Constant, Name = constDockerTag, Type = String, Dynamic = False, Default = \"jotools/crccalculator", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
