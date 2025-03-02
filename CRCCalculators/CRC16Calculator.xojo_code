#tag Class
Protected Class CRC16Calculator
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
		Sub Constructor(psAlgorithm As String, piPoly As UInt16, piInit As UInt16, pbRefIn As Boolean, pbRefOut As Boolean, piXorOut As UInt16)
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
		  Var generator As UInt16 = Me.Poly
		  
		  For divident As Integer = 0 To 255
		    Var curbyte As UInt16 = Bitwise.ShiftLeft(divident,8)
		    For bit As UInt8 = 0 To 7
		      If (Bitwise.BitAnd(curbyte, &h8000) <> 0) Then
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
		Private Function CRC_CalcResult(psValue As String) As UInt16
		  Var mb As MemoryBlock = psValue
		  
		  Var bTemp As Byte
		  Var crc As UInt16 = Me.Init
		  
		  Var curbyte As UInt8
		  For i As Integer = 0 To mb.Size-1
		    curbyte = mb.UInt8Value(i)
		    If Me.RefIn Then curbyte = Reflect8(curbyte)
		    
		    bTemp = Bitwise.BitXor(Bitwise.ShiftRight(crc, 8), curbyte)
		    crc = Bitwise.BitXor(Bitwise.ShiftLeft(crc,8), eaCRCTable(bTemp))
		  Next
		  
		  If Me.RefOut Then crc = Reflect16(crc)
		  
		  Return Bitwise.BitXor(crc, Me.XorOut)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateByType(piType As CRC16Type) As CRC16Calculator
		  Select Case piType
		  Case CRC16Type.ARC
		    Return New CRC16Calculator("CRC-16/ARC", &h8005, &h0000, True, True, &h0000)
		  Case CRC16Type.AUG_CCITT
		    Return New CRC16Calculator("CRC-16/AUG-CCITT", &h1021, &h1D0F, False, False, &h0000)
		  Case CRC16Type.BUYPASS
		    Return New CRC16Calculator("CRC-16/BUYPASS", &h8005, &h0000, False, False, &h0000)
		  Case CRC16Type.CCITT_FALSE
		    Return New CRC16Calculator("CRC-16/CCITT-FALSE", &h1021, &hffff, False, False, &h0000)
		  Case CRC16Type.CDMA2000
		    Return New CRC16Calculator("CRC-16/CDMA2000", &hC867, &hffff, False, False, &h0000)
		  Case CRC16Type.DDS_110
		    Return New CRC16Calculator("CRC-16/DDS-110", &h8005, &h800D, False, False, &h0000)
		  Case CRC16Type.DECT_R
		    Return New CRC16Calculator("CRC-16/DECT-R", &h0589, &h0000, False, False, &h0001)
		  Case CRC16Type.DECT_X
		    Return New CRC16Calculator("CRC-16/DECT-X", &h0589, &h0000, False, False, &h0000)
		  Case CRC16Type.DNP
		    Return New CRC16Calculator("CRC-16/DNP", &h3d65, &h0000, True, True, &hffff)
		  Case CRC16Type.EN_13757
		    Return New CRC16Calculator("CRC-16/EN-13757", &h3d65, &h0000, False, False, &hffff)
		  Case CRC16Type.GENIBUS
		    Return New CRC16Calculator("CRC-16/GENIBUS", &h1021, &hffff, False, False, &hffff)
		  Case CRC16Type.MAXIM
		    Return New CRC16Calculator("CRC-16/MAXIM", &h8005, &h0000, True, True, &hffff)
		  Case CRC16Type.MCRF4XX
		    Return New CRC16Calculator("CRC-16/MCRF4XX", &h1021, &hffff, True, True, &h0000)
		  Case CRC16Type.RIELLO
		    Return New CRC16Calculator("CRC-16/RIELLO", &h1021, &hb2aa, True, True, &h0000)
		  Case CRC16Type.T10_DIF
		    Return New CRC16Calculator("CRC-16/T10-DIF", &h8bb7, &h0000, False, False, &h0000)
		  Case CRC16Type.TELEDISK
		    Return New CRC16Calculator("CRC-16/TELEDISK", &ha097, &h0000, False, False, &h0000)
		  Case CRC16Type.TMS37157
		    Return New CRC16Calculator("CRC-16/TMS37157", &h1021, &h89ec, True, True, &h0000)
		  Case CRC16Type.USB
		    Return New CRC16Calculator("CRC-16/USB", &h8005, &hffff, True, True, &hffff)
		  Case CRC16Type.A
		    Return New CRC16Calculator("CRC-16/A", &h1021, &hc6c6, True, True, &h0000)
		  Case CRC16Type.KERMIT
		    Return New CRC16Calculator("CRC-16/KERMIT", &h1021, &h0000, True, True, &h0000)
		  Case CRC16Type.MODBUS
		    Return New CRC16Calculator("CRC-16/MODBUS", &h8005, &hffff, True, True, &h0000)
		  Case CRC16Type.X_25
		    Return New CRC16Calculator("CRC-16/X-25", &h1021, &hffff, True, True, &hffff)
		  Case CRC16Type.XMODEM
		    Return New CRC16Calculator("CRC-16/XMODEM", &h1021, &h0000, False, False, &h0000)
		  End Select
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init() As UInt16
		  Return eiInit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poly() As UInt16
		  Return eiPoly
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PredefinedCalculators() As CRC16Calculator()
		  Var oCRCCalculators() As CRC16Calculator
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.CCITT_FALSE))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.ARC))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.AUG_CCITT))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.BUYPASS))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.CDMA2000))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.DDS_110))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.DECT_R))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.DECT_X))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.DNP))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.EN_13757))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.GENIBUS))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.MAXIM))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.MCRF4XX))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.RIELLO))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.T10_DIF))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.TELEDISK))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.TMS37157))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.USB))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.A))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.KERMIT))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.MODBUS))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.X_25))
		  oCRCCalculators.Add(CRC16Calculator.CreateByType(CRC16Type.XMODEM))
		  Return oCRCCalculators
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefIn() As Boolean
		  Return ebRefIn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Reflect16(piValue As UInt16) As UInt16
		  Var resVal As UInt16
		  For i As UInt8 = 0 To 15
		    If (Bitwise.BitAnd(piValue, Bitwise.ShiftLeft(1,i)) <> 0) Then
		      resVal = Bitwise.BitOr(resVal, Bitwise.ShiftLeft(1,15-i))
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
		Function Result(psValue As String) As UInt16
		  Return Me.CRC_CalcResult(psValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt16_AsDec(piValue As UInt16) As String
		  Return Format(piValue, "00000")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt16_AsHex(piValue As UInt16) As String
		  Const constHexPrefix = "0x"
		  Const constHexFormat = "0000"
		  
		  Var sVal As String = constHexFormat + Hex(piValue)
		  Return constHexPrefix + sVal.Right(4)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XorOut() As UInt16
		  Return eiXorOut
		End Function
	#tag EndMethod


	#tag Note, Name = Algorithm
		
		http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
	#tag EndNote


	#tag Property, Flags = &h21
		Private eaCRCTable() As UInt16
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ebRefIn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ebRefOut As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiInit As UInt16
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiPoly As UInt16
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiXorOut As UInt16
	#tag EndProperty

	#tag Property, Flags = &h21
		Private esAlgorithm As String
	#tag EndProperty


	#tag Enum, Name = CRC16Type, Type = Integer, Flags = &h0
		ARC
		  AUG_CCITT
		  BUYPASS
		  CCITT_FALSE
		  CDMA2000
		  DDS_110
		  DECT_R
		  DECT_X
		  DNP
		  EN_13757
		  GENIBUS
		  MAXIM
		  MCRF4XX
		  RIELLO
		  T10_DIF
		  TELEDISK
		  TMS37157
		  USB
		  A
		  KERMIT
		  MODBUS
		  X_25
		XMODEM
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
