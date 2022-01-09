#tag Class
Protected Class CRC16Calculator
	#tag Method, Flags = &h0
		Function Caption() As String
		  return esAlgorithm
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
		  
		  me.CRC_BuildTable()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CRC_BuildTable()
		  //http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
		  
		  Redim eaCRCTable(-1)
		  Dim generator As UInt16 = Me.Poly
		  
		  For divident As Integer = 0 To 255
		    Dim curbyte As UInt16 = Bitwise.ShiftLeft(divident,8)
		    For bit As UInt8 = 0 To 7
		      If (Bitwise.BitAnd(curbyte, &h8000) <> 0) Then
		        curbyte = Bitwise.ShiftLeft(curbyte,1)
		        curbyte = Bitwise.BitXor(curbyte, generator)
		      Else
		        curbyte = Bitwise.ShiftLeft(curbyte,1)
		      End If
		    Next
		    eaCRCTable.Append(curbyte)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CRC_CalcResult(psValue As String) As UInt16
		  Dim mb As MemoryBlock = psValue
		  
		  Dim bTemp As Byte
		  Dim crc As UInt16 = me.Init
		  
		  Dim curbyte As UInt8
		  For i As Integer = 0 To mb.Size-1
		    curbyte = mb.UInt8Value(i)
		    If me.RefIn Then curbyte = Reflect8(curbyte)
		    
		    bTemp = Bitwise.BitXor(Bitwise.ShiftRight(crc, 8), curbyte)
		    crc = Bitwise.BitXor(Bitwise.ShiftLeft(crc,8), eaCRCTable(bTemp))
		  Next
		  
		  If me.RefOut Then crc = Reflect16(crc)
		  
		  Return Bitwise.BitXor(crc, me.XorOut)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateByType(piType As CRC16Type) As CRC16Calculator
		  select case piType
		  case CRC16Type.ARC
		    return New CRC16Calculator("CRC-16/ARC", &h8005, &h0000, true, true, &h0000)
		  case CRC16Type.AUG_CCITT
		    return New CRC16Calculator("CRC-16/AUG-CCITT", &h1021, &h1D0F, false, false, &h0000)
		  case CRC16Type.BUYPASS
		    return New CRC16Calculator("CRC-16/BUYPASS", &h8005, &h0000, false, false, &h0000)
		  case CRC16Type.CCITT_FALSE
		    return New CRC16Calculator("CRC-16/CCITT-FALSE", &h1021, &hffff, false, false, &h0000)
		  case CRC16Type.CDMA2000
		    return New CRC16Calculator("CRC-16/CDMA2000", &hC867, &hffff, false, false, &h0000)
		  case CRC16Type.DDS_110
		    return New CRC16Calculator("CRC-16/DDS-110", &h8005, &h800D, false, false, &h0000)
		  case CRC16Type.DECT_R
		    return New CRC16Calculator("CRC-16/DECT-R", &h0589, &h0000, false, false, &h0001)
		  case CRC16Type.DECT_X
		    return New CRC16Calculator("CRC-16/DECT-X", &h0589, &h0000, false, false, &h0000)
		  case CRC16Type.DNP
		    return New CRC16Calculator("CRC-16/DNP", &h3d65, &h0000, true, true, &hffff)
		  case CRC16Type.EN_13757
		    return New CRC16Calculator("CRC-16/EN-13757", &h3d65, &h0000, false, false, &hffff)
		  case CRC16Type.GENIBUS
		    return New CRC16Calculator("CRC-16/GENIBUS", &h1021, &hffff, false, false, &hffff)
		  case CRC16Type.MAXIM
		    return New CRC16Calculator("CRC-16/MAXIM", &h8005, &h0000, true, true, &hffff)
		  case CRC16Type.MCRF4XX
		    return New CRC16Calculator("CRC-16/MCRF4XX", &h1021, &hffff, true, true, &h0000)
		  case CRC16Type.RIELLO
		    return New CRC16Calculator("CRC-16/RIELLO", &h1021, &hb2aa, true, true, &h0000)
		  case CRC16Type.T10_DIF
		    return New CRC16Calculator("CRC-16/T10-DIF", &h8bb7, &h0000, false, false, &h0000)
		  case CRC16Type.TELEDISK
		    return New CRC16Calculator("CRC-16/TELEDISK", &ha097, &h0000, false, false, &h0000)
		  case CRC16Type.TMS37157
		    return New CRC16Calculator("CRC-16/TMS37157", &h1021, &h89ec, true, true, &h0000)
		  case CRC16Type.USB
		    return New CRC16Calculator("CRC-16/USB", &h8005, &hffff, true, true, &hffff)
		  case CRC16Type.A
		    return New CRC16Calculator("CRC-16/A", &h1021, &hc6c6, true, true, &h0000)
		  case CRC16Type.KERMIT
		    return New CRC16Calculator("CRC-16/KERMIT", &h1021, &h0000, true, true, &h0000)
		  case CRC16Type.MODBUS
		    return New CRC16Calculator("CRC-16/MODBUS", &h8005, &hffff, true, true, &h0000)
		  case CRC16Type.X_25
		    return New CRC16Calculator("CRC-16/X-25", &h1021, &hffff, true, true, &hffff)
		  case CRC16Type.XMODEM
		    return New CRC16Calculator("CRC-16/XMODEM", &h1021, &h0000, false, false, &h0000)
		  end select
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init() As UInt16
		  return eiInit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poly() As UInt16
		  return eiPoly
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PredefinedCalculators() As CRC16Calculator()
		  Dim oCRCCalculators() As CRC16Calculator
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.CCITT_FALSE))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.ARC))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.AUG_CCITT))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.BUYPASS))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.CDMA2000))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.DDS_110))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.DECT_R))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.DECT_X))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.DNP))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.EN_13757))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.GENIBUS))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.MAXIM))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.MCRF4XX))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.RIELLO))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.T10_DIF))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.TELEDISK))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.TMS37157))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.USB))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.A))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.KERMIT))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.MODBUS))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.X_25))
		  oCRCCalculators.Append(CRC16Calculator.CreateByType(CRC16Type.XMODEM))
		  return oCRCCalculators
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefIn() As Boolean
		  return ebRefIn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Reflect16(piValue As UInt16) As UInt16
		  Dim resVal As UInt16
		  for i As UInt8 = 0 to 15
		    if (Bitwise.BitAnd(piValue, Bitwise.ShiftLeft(1,i)) <> 0) then
		      resVal = Bitwise.BitOr(resVal, Bitwise.ShiftLeft(1,15-i))
		    end if
		  next
		  return resVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Reflect8(piValue As UInt8) As Uint8
		  Dim resVal As UInt8
		  for i As UInt8 = 0 to 7
		    if (Bitwise.BitAnd(piValue, Bitwise.ShiftLeft(1,i)) <> 0) then
		      resVal = Bitwise.BitOr(resVal, Bitwise.ShiftLeft(1,7-i))
		    end if
		  next
		  return resVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefOut() As Boolean
		  return ebRefOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Result(psValue As String) As UInt16
		  return me.CRC_CalcResult(psValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt16_AsDec(piValue As UInt16) As String
		  return Format(piValue, "00000")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt16_AsHex(piValue As UInt16) As String
		  Const constHexPrefix = "0x"
		  Const constHexFormat = "0000"
		  
		  return constHexPrefix + Right(constHexFormat + Hex(piValue), 4)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XorOut() As UInt16
		  return eiXorOut
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
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
