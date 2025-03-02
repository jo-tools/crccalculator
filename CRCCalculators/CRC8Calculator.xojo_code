#tag Class
Protected Class CRC8Calculator
	#tag Method, Flags = &h0
		Function Caption() As String
		  Return esAlgorithm
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  //prohibited
		  //use the other Constructor to initialize the Algorithm
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(psAlgorithm As String, piPoly As UInt8, piInit As UInt8, pbRefIn As Boolean, pbRefOut As Boolean, piXorOut As UInt8)
		  esAlgorithm = psAlgorithm
		  eiPoly = piPoly
		  eiInit = piInit
		  ebRefIn = pbRefIn
		  ebRefOut = pbRefOut
		  eiXorOut = piXorOut
		  
		  Me.CRC_BuildTable()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CRC_BuildTable()
		  //http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
		  
		  eaCRCTable.ResizeTo(-1)
		  Var generator As UInt8 = Me.Poly
		  
		  For divident As Integer = 0 To 255
		    Var curbyte As UInt8 = divident
		    For bit As UInt8 = 0 To 7
		      If (Bitwise.BitAnd(curbyte, &h80) <> 0) Then
		        curbyte = Bitwise.ShiftLeft(curbyte, 1)
		        curbyte = Bitwise.BitXor(curbyte, generator)
		      Else
		        curbyte = Bitwise.ShiftLeft(curbyte,1)
		      End If
		    Next
		    eaCRCTable.Add(curbyte)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CRC_CalcResult(psValue As String) As UInt8
		  Var mb As MemoryBlock = psValue
		  
		  Var bTemp As Byte
		  Var crc As UInt8 = Me.Init
		  
		  Var curbyte As UInt8
		  For i As Integer = 0 To mb.Size-1
		    curbyte = mb.UInt8Value(i)
		    If Me.RefIn Then curbyte = Reflect8(curbyte)
		    
		    bTemp = Bitwise.BitXor(curbyte, crc)
		    crc = eaCRCTable(bTemp)
		  Next
		  
		  If Me.RefOut Then crc = Reflect8(crc)
		  
		  Return Bitwise.BitXor(crc, Me.XorOut)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateByType(piType As CRC8Type) As CRC8Calculator
		  Select Case piType
		  Case CRC8Type.CRC8
		    Return New CRC8Calculator("CRC-8", &h07, &h00, False, False, &h00)
		  Case CRC8Type.CDMA2000
		    Return New CRC8Calculator("CRC-8/CDMA2000", &h9b, &hff, False, False, &h00)
		  Case CRC8Type.DARC
		    Return New CRC8Calculator("CRC-8/DARC", &h39, &h00, True, True, &h00)
		  Case CRC8Type.DVB_S2
		    Return New CRC8Calculator("CRC-8/DVB-S2", &hd5, &h00, False, False, &h00)
		  Case CRC8Type.EBU
		    Return New CRC8Calculator("CRC-8/EBU", &h1d, &hff, True, True, &h00)
		  Case CRC8Type.I_CODE
		    Return New CRC8Calculator("CRC-8/I-CODE", &h1d, &hfd, False, False, &h00)
		  Case CRC8Type.ITU
		    Return New CRC8Calculator("CRC-8/ITU", &h07, &h00, False, False, &h55)
		  Case CRC8Type.MAXIM
		    Return New CRC8Calculator("CRC-8/MAXIM", &h31, &h00, True, True, &h00)
		  Case CRC8Type.ROHC
		    Return New CRC8Calculator("CRC-8/ROHC", &h07, &hff, True, True, &h00)
		  Case CRC8Type.WCDMA
		    Return New CRC8Calculator("CRC-8/WCDMA", &h9b, &h00, True, True, &h00)
		  End Select
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init() As UInt8
		  Return eiInit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poly() As UInt8
		  Return eiPoly
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PredefinedCalculators() As CRC8Calculator()
		  Var oCRCCalculators() As CRC8Calculator
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.CRC8))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.CDMA2000))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.DARC))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.DVB_S2))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.EBU))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.I_CODE))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.ITU))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.MAXIM))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.ROHC))
		  oCRCCalculators.Add(CRC8Calculator.CreateByType(CRC8Type.WCDMA))
		  Return oCRCCalculators
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefIn() As Boolean
		  Return ebRefIn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Reflect8(piValue As UInt8) As Uint8
		  Var resVal As UInt8
		  For i As UInt8 = 0 To 7
		    If (Bitwise.BitAnd(piValue, Bitwise.ShiftLeft(1,i)) <> 0) Then
		      resVal = Bitwise.BitOr(resVal, Bitwise.ShiftLeft(1,7-i))
		    End If
		  Next
		  Return resVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefOut() As Boolean
		  Return ebRefOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Result(psValue As String) As UInt8
		  Return Me.CRC_CalcResult(psValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt8_AsDec(piValue As UInt8) As String
		  Return Format(piValue, "000")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt8_AsHex(piValue As UInt8) As String
		  Const constHexPrefix = "0x"
		  Const constHexFormat = "00"
		  
		  Var sVal As String = constHexFormat + Hex(piValue)
		  Return constHexPrefix + sVal.Right(2)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XorOut() As UInt8
		  Return eiXorOut
		End Function
	#tag EndMethod


	#tag Note, Name = Algorithm
		
		http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
	#tag EndNote


	#tag Property, Flags = &h21
		Private eaCRCTable() As UInt8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ebRefIn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ebRefOut As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiInit As UInt8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiPoly As UInt8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiXorOut As UInt8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private esAlgorithm As String
	#tag EndProperty


	#tag Enum, Name = CRC8Type, Type = Integer, Flags = &h0
		CRC8
		  CDMA2000
		  DARC
		  DVB_S2
		  EBU
		  I_CODE
		  ITU
		  MAXIM
		  ROHC
		WCDMA
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
