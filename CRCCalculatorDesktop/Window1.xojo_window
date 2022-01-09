#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   445
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   653176831
   MenuBarVisible  =   True
   MinHeight       =   445
   MinimizeButton  =   True
   MinWidth        =   540
   Placement       =   0
   Resizeable      =   True
   Title           =   "CRC Calculator"
   Visible         =   True
   Width           =   540
   Begin TextArea edtInput
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   60
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "123456789"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   115
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   500
   End
   Begin Listbox lstResult
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   200
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   210
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   500
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label labCompareLink
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   152
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "https://crccalc.com/"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   410
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   368
   End
   Begin Label labCompareTitle
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Compare Results:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   410
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin Label labOutputType
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   286
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Output Type:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin RadioButton radOutputHex
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   " Hex "
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   60
   End
   Begin RadioButton radOutputDec
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   " Dec "
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   460
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   60
   End
   BeginSegmented SegmentedControl segCRCType
      Enabled         =   True
      Height          =   28
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   2
      Segments        =   "CRC8\n\nFalse\rCRC16\n\nTrue\rCRC32\n\nFalse"
      SelectionType   =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   180
      Transparent     =   False
      Visible         =   True
      Width           =   163
   End
   Begin Canvas cnvAppIcon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   "https://www.jo-tools.ch/xojo/crccalculator/"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   64
   End
   Begin Label labAppName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   "https://www.jo-tools.ch/xojo/crccalculator/"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "CRC Calculator"
      TextAlign       =   1
      TextColor       =   &c0072D800
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label labThanks
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   311
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Would you like to say 'Thank you'?"
      TextAlign       =   2
      TextColor       =   &c66666600
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   209
   End
   Begin Label labAppVersion
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "AppVersion"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label labContact
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   30
      HelpTag         =   "xojo@jo-tools.ch"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   334
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Contact"
      TextAlign       =   1
      TextColor       =   &c0072CE00
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   70
   End
   Begin Canvas cnvPayPal
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   30
      HelpTag         =   "https://paypal.me/jotools"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   414
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   54
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   106
   End
   Begin Separator Separator2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   3
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   100
      Transparent     =   True
      Visible         =   True
      Width           =   540
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  //Predefined Calculators
		  eoCRC8Calculators = CRC8Calculator.PredefinedCalculators()
		  eoCRC16Calculators = CRC16Calculator.PredefinedCalculators()
		  eoCRC32Calculators = CRC32Calculator.PredefinedCalculators()
		  
		  //custom Calculators
		  eoCRC8Calculators.Append(New CRC8Calculator("CRC8/AN-EXAMPLE", &h1e, &h12, false, false, &h02))
		  eoCRC16Calculators.Append(New CRC16Calculator("CRC-16/AN-EXAMPLE", &h12a0, &he0e0, true, true, &h0202))
		  eoCRC32Calculators.Append(New CRC32Calculator("CRC-32/AN-EXAMPLE", &h02d00ba0, &heeddccbb, false, false, &hf0f0f0f0))
		  
		  //Window
		  self.Title = "CRC Calculator"
		  self.Width = 700
		  self.Height = 550
		  self.ShowResults()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CalcValue() As String
		  return ConvertEncoding(edtInput.Text, Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults()
		  select case eiSegmentIndex
		  case 0
		    me.ShowResults_CRC8()
		  case 1
		    me.ShowResults_CRC16()
		  case 2
		    me.ShowResults_CRC32()
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults_CRC16()
		  labCompareLink.HelpTag = "https://crccalc.com/?crc=" + EncodeURLComponent(self.CalcValue) + "&method=crc16&datatype=ascii&outtype=" + If(radOutputHex.Value, "hex", "dec")
		  
		  Dim iRow As Integer = 0
		  for each oCRCCalculator As CRC16Calculator in eoCRC16Calculators
		    if (iRow <= (lstResult.ListCount - 1)) then
		      lstResult.Cell(iRow, 0) = oCRCCalculator.Caption
		    else
		      lstResult.AddRow(oCRCCalculator.Caption)
		    end if
		    
		    if radOutputHex.Value then
		      lstResult.Cell(iRow, 1) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.Result(me.CalcValue))
		      lstResult.Cell(iRow, 2) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.Poly)
		      lstResult.Cell(iRow, 3) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.Init)
		      lstResult.Cell(iRow, 6) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.XorOut)
		    else
		      lstResult.Cell(iRow, 1) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.Result(me.CalcValue))
		      lstResult.Cell(iRow, 2) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.Poly)
		      lstResult.Cell(iRow, 3) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.Init)
		      lstResult.Cell(iRow, 6) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.XorOut)
		    end if
		    lstResult.Cell(iRow, 4) = Str(oCRCCalculator.RefIn)
		    lstResult.Cell(iRow, 5) = Str(oCRCCalculator.RefOut)
		    
		    iRow = iRow + 1
		  next
		  
		  if (iRow < (lstResult.ListCount - 1)) then
		    for iRemoveRow As Integer = lstResult.ListCount - 1 DownTo iRow
		      lstResult.RemoveRow(iRemoveRow)
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults_CRC32()
		  labCompareLink.HelpTag = "https://crccalc.com/?crc=" + EncodeURLComponent(self.CalcValue) + "&method=crc32&datatype=ascii&outtype=" + If(radOutputHex.Value, "hex", "dec")
		  
		  Dim iRow As Integer = 0
		  for each oCRCCalculator As CRC32Calculator in eoCRC32Calculators
		    if (iRow <= (lstResult.ListCount - 1)) then
		      lstResult.Cell(iRow, 0) = oCRCCalculator.Caption
		    else
		      lstResult.AddRow(oCRCCalculator.Caption)
		    end if
		    
		    if radOutputHex.Value then
		      lstResult.Cell(iRow, 1) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.Result(me.CalcValue))
		      lstResult.Cell(iRow, 2) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.Poly)
		      lstResult.Cell(iRow, 3) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.Init)
		      lstResult.Cell(iRow, 6) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.XorOut)
		    else
		      lstResult.Cell(iRow, 1) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.Result(me.CalcValue))
		      lstResult.Cell(iRow, 2) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.Poly)
		      lstResult.Cell(iRow, 3) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.Init)
		      lstResult.Cell(iRow, 6) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.XorOut)
		    end if
		    lstResult.Cell(iRow, 4) = Str(oCRCCalculator.RefIn)
		    lstResult.Cell(iRow, 5) = Str(oCRCCalculator.RefOut)
		    
		    iRow = iRow + 1
		  next
		  
		  if (iRow < (lstResult.ListCount - 1)) then
		    for iRemoveRow As Integer = lstResult.ListCount - 1 DownTo iRow
		      lstResult.RemoveRow(iRemoveRow)
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults_CRC8()
		  labCompareLink.HelpTag = "https://crccalc.com/?crc=" + EncodeURLComponent(self.CalcValue) + "&method=crc8&datatype=ascii&outtype=" + If(radOutputHex.Value, "hex", "dec")
		  
		  Dim iRow As Integer = 0
		  for each oCRCCalculator As CRC8Calculator in eoCRC8Calculators
		    if (iRow <= (lstResult.ListCount - 1)) then
		      lstResult.Cell(iRow, 0) = oCRCCalculator.Caption
		    else
		      lstResult.AddRow(oCRCCalculator.Caption)
		    end if
		    
		    if radOutputHex.Value then
		      lstResult.Cell(iRow, 1) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.Result(me.CalcValue))
		      lstResult.Cell(iRow, 2) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.Poly)
		      lstResult.Cell(iRow, 3) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.Init)
		      lstResult.Cell(iRow, 6) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.XorOut)
		    else
		      lstResult.Cell(iRow, 1) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.Result(me.CalcValue))
		      lstResult.Cell(iRow, 2) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.Poly)
		      lstResult.Cell(iRow, 3) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.Init)
		      lstResult.Cell(iRow, 6) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.XorOut)
		    end if
		    lstResult.Cell(iRow, 4) = Str(oCRCCalculator.RefIn)
		    lstResult.Cell(iRow, 5) = Str(oCRCCalculator.RefOut)
		    
		    iRow = iRow + 1
		  next
		  
		  if (iRow < (lstResult.ListCount - 1)) then
		    for iRemoveRow As Integer = lstResult.ListCount - 1 DownTo iRow
		      lstResult.RemoveRow(iRemoveRow)
		    next
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Algorithm
		Algorithm
		http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
		
		Online CRC Calculator (compare results)
		https://crccalc.com
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private eiSegmentIndex As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eoCRC16Calculators() As CRC16Calculator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eoCRC32Calculators() As CRC32Calculator
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eoCRC8Calculators() As CRC8Calculator
	#tag EndProperty


#tag EndWindowCode

#tag Events edtInput
	#tag Event
		Sub TextChange()
		  self.ShowResults()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstResult
	#tag Event
		Sub Open()
		  me.TextFont = "Courier"
		  
		  me.HasHeading = true
		  me.ColumnCount = 7
		  me.Heading(0) = "Algorithm"
		  me.Heading(1) = "Result"
		  me.Heading(2) = "Poly"
		  me.Heading(3) = "Init"
		  me.Heading(4) = "RefIn"
		  me.Heading(5) = "RefOut"
		  me.Heading(6) = "XorOut"
		  
		  me.ColumnAlignment(1) = Listbox.AlignCenter
		  me.ColumnAlignment(2) = Listbox.AlignCenter
		  me.ColumnAlignment(3) = Listbox.AlignCenter
		  me.ColumnAlignment(4) = Listbox.AlignCenter
		  me.ColumnAlignment(5) = Listbox.AlignCenter
		  me.ColumnAlignment(6) = Listbox.AlignCenter
		  
		  me.ColumnWidths = "22%,14%,14%,14%,11%,11%,14%"
		  me.DefaultRowHeight = 24
		  me.GridLinesHorizontal = Listbox.BorderThinSolid
		  me.GridLinesVertical = Listbox.BorderThinDotted
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #pragma unused column
		  
		  Dim oBGColor As Color
		  
		  if me.Selected(row) then
		    oBGColor = HighlightColor
		  else
		    
		    if (row mod 2 = 0) then
		      oBGColor = RGB(250,250,250)
		    else
		      oBGColor = RGB(230,230,230)
		    end if
		    #if (XojoVersion >= 2018.03) then
		      if IsDarkMode then
		        if (row mod 2 = 0) then
		          oBGColor = &c1D1D1C
		        else
		          oBGColor = &c272728
		        end if
		      end if
		    #endif
		    
		  end if
		  
		  
		  g.ForeColor = oBGColor
		  g.FillRect(0, 0, g.Width, g.Height)
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  #pragma unused row
		  
		  g.Bold = (column <= 1)
		  return false 'let Listbox handle the actual drawing
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events labCompareLink
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x <= me.Width) and (y >= 0) and (y <= me.Height) then
		    ShowURL(me.HelpTag)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.TextColor = RGB(25,130,210)
		  me.Underline = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events radOutputHex
	#tag Event
		Sub Action()
		  self.ShowResults()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events radOutputDec
	#tag Event
		Sub Action()
		  self.ShowResults()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events segCRCType
	#tag Event
		Sub Action(itemIndex as integer)
		  eiSegmentIndex = itemIndex
		  self.ShowResults()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #if TargetMacOS then
		    me.Height = 24
		    me.Top = me.Top + 2
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvAppIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused areas
		  
		  g.DrawPicture(AppIcon_128, 0, 0, 64, 64, 0, 0, AppIcon_128.Width, AppIcon_128.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("https://www.jo-tools.ch/xojo/crccalculator/")
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Open()
		  me.Text = "CRC Calculator"
		  me.TextSize = 18
		  me.Bold = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("https://www.jo-tools.ch/xojo/crccalculator/")
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppVersion
	#tag Event
		Sub Open()
		  if (App.ShortVersion <> "") then
		    me.Text = App.ShortVersion
		    return
		  end if
		  
		  me.Text = Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." + Str(App.BugVersion)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labContact
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("mailto:xojo@jo-tools.ch")
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvPayPal
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused areas
		  
		  g.ForeColor = &cFFFFFF
		  #if (XojoVersion >= 2018.03) then
		    if IsDarkMode then g.ForeColor = &cD0D0D0
		  #endif
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = &c909090
		  g.DrawRect(0, 0, g.Width, g.Height)
		  g.DrawPicture(PayPal, 3, 2, 100, 26, 0, 0, PayPal.Width, PayPal.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if (x >= 0) and (x < me.Width) and (y > 0) and (y < me.Height) then
		    ShowURL("https://paypal.me/jotools")
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="540"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="350"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
