#tag Class
Protected Class CRC32Calculator
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
		Sub Constructor(psAlgorithm As String, piPoly As UInt32, piInit As UInt32, pbRefIn As Boolean, pbRefOut As Boolean, piXorOut As UInt32)
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
		  Var generator As UInt32 = Me.Poly
		  
		  For divident As Integer = 0 To 255
		    Var curbyte As UInt32 = Bitwise.ShiftLeft(divident,24)
		    For bit As UInt8 = 0 To 7
		      If (Bitwise.BitAnd(curbyte, &h80000000) <> 0) Then
		        curbyte = Bitwise.ShiftLeft(curbyte,1)
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
		Private Function CRC_CalcResult(psValue As String) As UInt32
		  Var mb As MemoryBlock = psValue
		  
		  Var bTemp As Byte
		  Var crc As UInt32 = Me.Init
		  
		  Var curbyte As UInt8
		  For i As Integer = 0 To mb.Size-1
		    curbyte = mb.UInt8Value(i)
		    If Me.RefIn Then curbyte = Reflect8(curbyte)
		    
		    bTemp = Bitwise.ShiftRight(Bitwise.BitXor(crc,Bitwise.ShiftLeft(curbyte,24)), 24)
		    crc = Bitwise.BitXor(Bitwise.ShiftLeft(crc,8), eaCRCTable(bTemp))
		  Next
		  
		  If Me.RefOut Then crc = Reflect32(crc)
		  
		  Return Bitwise.BitXor(crc, Me.XorOut)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateByType(piType As CRC32Type) As CRC32Calculator
		  Select Case piType
		  Case CRC32Type.CRC32
		    Return New CRC32Calculator("CRC-32", &h04C11DB7, &hFFFFFFFF, True, True, &hFFFFFFFF)
		  Case CRC32Type.BZIP2
		    Return New CRC32Calculator("CRC-32/BZIP2", &h04C11DB7, &hFFFFFFFF, False, False, &hFFFFFFFF)
		  Case CRC32Type.C
		    Return New CRC32Calculator("CRC-32C", &h1EDC6F41, &hFFFFFFFF, True, True, &hFFFFFFFF)
		  Case CRC32Type.D
		    Return New CRC32Calculator("CRC-32D", &hA833982B, &hFFFFFFFF, True, True, &hFFFFFFFF)
		  Case CRC32Type.MPEG_2
		    Return New CRC32Calculator("CRC-32/MPEG-2", &h04C11DB7, &hFFFFFFFF, False, False, &h00000000)
		  Case CRC32Type.POSIX
		    Return New CRC32Calculator("CRC-32/POSIX", &h04C11DB7, &h00000000, False, False, &hFFFFFFFF)
		  Case CRC32Type.Q
		    Return New CRC32Calculator("CRC-32Q", &h814141AB, &h00000000, False, False, &h00000000)
		  Case CRC32Type.JAMCRC
		    Return New CRC32Calculator("CRC-32/JAMCRC", &h04C11DB7, &hFFFFFFFF, True, True, &h00000000)
		  Case CRC32Type.XFER
		    Return New CRC32Calculator("CRC-32/XFER", &h000000AF, &h00000000, False, False, &h00000000)
		    
		  End Select
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init() As UInt32
		  Return eiInit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poly() As UInt32
		  Return eiPoly
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PredefinedCalculators() As CRC32Calculator()
		  Var oCRCCalculators() As CRC32Calculator
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.CRC32))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.BZIP2))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.C))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.D))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.MPEG_2))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.POSIX))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.Q))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.JAMCRC))
		  oCRCCalculators.Add(CRC32Calculator.CreateByType(CRC32Type.XFER))
		  Return oCRCCalculators
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefIn() As Boolean
		  Return ebRefIn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Reflect32(piValue As UInt32) As UInt32
		  Var resVal As UInt32
		  For i As UInt8 = 0 To 31
		    If (Bitwise.BitAnd(piValue, Bitwise.ShiftLeft(1,i)) <> 0) Then
		      resVal = Bitwise.BitOr(resVal, Bitwise.ShiftLeft(1,31-i))
		    End If
		  Next
		  Return resVal
		  
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
		Function Result(psValue As String) As UInt32
		  Return Me.CRC_CalcResult(psValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt32_AsDec(piValue As UInt32) As String
		  Return Format(piValue, "0000000000")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt32_AsHex(piValue As UInt32) As String
		  Const constHexPrefix = "0x"
		  Const constHexFormat = "00000000"
		  
		  Var sVal As String = constHexFormat + Hex(piValue)
		  Return constHexPrefix + sVal.Right(8)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XorOut() As UInt32
		  Return eiXorOut
		End Function
	#tag EndMethod


	#tag Note, Name = Algorithm
		
		http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
	#tag EndNote


	#tag Property, Flags = &h21
		Private eaCRCTable() As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ebRefIn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ebRefOut As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiInit As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiPoly As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiXorOut As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private esAlgorithm As String
	#tag EndProperty


	#tag Enum, Name = CRC32Type, Flags = &h0
		CRC32
		  BZIP2
		  C
		  D
		  MPEG_2
		  POSIX
		  Q
		  JAMCRC
		XFER
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
