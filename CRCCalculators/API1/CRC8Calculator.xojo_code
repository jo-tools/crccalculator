#tag Class
Protected Class CRC8Calculator
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
		Sub Constructor(psAlgorithm As String, piPoly As UInt8, piInit As UInt8, pbRefIn As Boolean, pbRefOut As Boolean, piXorOut As UInt8)
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
		  Dim generator As UInt8 = Me.Poly
		  
		  For divident As Integer = 0 To 255
		    Dim curbyte As UInt8 = divident
		    For bit As UInt8 = 0 To 7
		      If (Bitwise.BitAnd(curbyte, &h80) <> 0) Then
		        curbyte = Bitwise.ShiftLeft(curbyte, 1)
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
		Private Function CRC_CalcResult(psValue As String) As UInt8
		  Dim mb As MemoryBlock = psValue
		  
		  Dim bTemp As Byte
		  Dim crc As UInt8 = Me.Init
		  
		  Dim curbyte As UInt8
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
		  select case piType
		  case CRC8Type.CRC8
		    return New CRC8Calculator("CRC-8", &h07, &h00, false, false, &h00)
		  case CRC8Type.CDMA2000
		    return New CRC8Calculator("CRC-8/CDMA2000", &h9b, &hff, false, false, &h00)
		  case CRC8Type.DARC
		    return New CRC8Calculator("CRC-8/DARC", &h39, &h00, true, true, &h00)
		  case CRC8Type.DVB_S2
		    return New CRC8Calculator("CRC-8/DVB-S2", &hd5, &h00, false, false, &h00)
		  case CRC8Type.EBU
		    return New CRC8Calculator("CRC-8/EBU", &h1d, &hff, true, true, &h00)
		  case CRC8Type.I_CODE
		    return New CRC8Calculator("CRC-8/I-CODE", &h1d, &hfd, false, false, &h00)
		  case CRC8Type.ITU
		    return New CRC8Calculator("CRC-8/ITU", &h07, &h00, false, false, &h55)
		  case CRC8Type.MAXIM
		    return New CRC8Calculator("CRC-8/MAXIM", &h31, &h00, true, true, &h00)
		  case CRC8Type.ROHC
		    return New CRC8Calculator("CRC-8/ROHC", &h07, &hff, true, true, &h00)
		  case CRC8Type.WCDMA
		    return New CRC8Calculator("CRC-8/WCDMA", &h9b, &h00, true, true, &h00)
		  end select
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init() As UInt8
		  return eiInit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poly() As UInt8
		  return eiPoly
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function PredefinedCalculators() As CRC8Calculator()
		  Dim oCRCCalculators() As CRC8Calculator
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.CRC8))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.CDMA2000))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.DARC))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.DVB_S2))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.EBU))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.I_CODE))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.ITU))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.MAXIM))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.ROHC))
		  oCRCCalculators.Append(CRC8Calculator.CreateByType(CRC8Type.WCDMA))
		  return oCRCCalculators
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RefIn() As Boolean
		  return ebRefIn
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
		Function Result(psValue As String) As UInt8
		  return me.CRC_CalcResult(psValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt8_AsDec(piValue As UInt8) As String
		  return Format(piValue, "000")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt8_AsHex(piValue As UInt8) As String
		  Const constHexPrefix = "0x"
		  Const constHexFormat = "00"
		  
		  return constHexPrefix + Right(constHexFormat + Hex(piValue), 2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XorOut() As UInt8
		  return eiXorOut
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
