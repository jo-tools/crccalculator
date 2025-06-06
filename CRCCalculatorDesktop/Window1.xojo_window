#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   True
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   420
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   653176831
   MenuBarVisible  =   True
   MinimumHeight   =   420
   MinimumWidth    =   540
   Resizeable      =   True
   Title           =   "CRC Calculator"
   Type            =   0
   Visible         =   True
   Width           =   540
   Begin DesktopTextArea edtInput
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   60
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Lorem ipsum dolor sit amet."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   115
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   500
   End
   Begin DesktopListBox lstResult
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   4
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   190
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
      RowSelectionType=   0
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   500
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopLabel labOutputType
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
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
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin DesktopRadioButton radOutputHex
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   " Hex "
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
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
      Tooltip         =   ""
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   60
   End
   Begin DesktopRadioButton radOutputDec
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   " Dec "
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
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
      Tooltip         =   ""
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   60
   End
   Begin DesktopCanvas cnvAppIcon
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   64
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
      Tooltip         =   "#kURL_Repository"
      Top             =   20
      Transparent     =   True
      Visible         =   True
      Width           =   64
   End
   Begin DesktopLabel labAppName
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
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
      TextAlignment   =   1
      TextColor       =   &c0072D800
      Tooltip         =   "#kURL_Repository"
      Top             =   20
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   190
   End
   Begin DesktopLabel labThanks
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   300
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
      TextAlignment   =   3
      TextColor       =   &c66666600
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   220
   End
   Begin DesktopLabel labAppVersion
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
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
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   54
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   190
   End
   Begin DesktopLabel labContact
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
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
      TextAlignment   =   1
      TextColor       =   &c0072CE00
      Tooltip         =   "#kEmail_Contact"
      Top             =   54
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   70
   End
   Begin DesktopCanvas cnvPayPal
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   30
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
      Tooltip         =   "#kURL_PayPal"
      Top             =   54
      Transparent     =   True
      Visible         =   True
      Width           =   106
   End
   Begin DesktopSeparator Separator2
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   3
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   100
      Transparent     =   True
      Visible         =   True
      Width           =   540
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   BeginDesktopSegmentedButton DesktopSegmentedButton segCRCType
      Enabled         =   True
      Height          =   28
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   1
      Scope           =   2
      Segments        =   "CRC8\n\nFalse\rCRC16\n\nTrue\rCRC32\n\nFalse"
      SelectionStyle  =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   180
      Transparent     =   False
      Visible         =   True
      Width           =   163
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  //Predefined Calculators
		  eoCRC8Calculators = CRC8Calculator.PredefinedCalculators()
		  eoCRC16Calculators = CRC16Calculator.PredefinedCalculators()
		  eoCRC32Calculators = CRC32Calculator.PredefinedCalculators()
		  
		  //custom Calculators
		  eoCRC8Calculators.Add(New CRC8Calculator("CRC8/AN-EXAMPLE", &h1e, &h12, False, False, &h02))
		  eoCRC16Calculators.Add(New CRC16Calculator("CRC-16/AN-EXAMPLE", &h12a0, &he0e0, True, True, &h0202))
		  eoCRC32Calculators.Add(New CRC32Calculator("CRC-32/AN-EXAMPLE", &h02d00ba0, &heeddccbb, False, False, &hf0f0f0f0))
		  
		  //Window
		  Self.Title = "CRC Calculator"
		  Self.Width = 700
		  Self.Height = 550
		  Self.ShowResults()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CalcValue() As String
		  Return ConvertEncoding(edtInput.Text, Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults()
		  Select Case eiSegmentIndex
		  Case 0
		    Me.ShowResults_CRC8()
		  Case 1
		    Me.ShowResults_CRC16()
		  Case 2
		    Me.ShowResults_CRC32()
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults_CRC16()
		  Var iRow As Integer = 0
		  For Each oCRCCalculator As CRC16Calculator In eoCRC16Calculators
		    If (iRow <= (lstResult.RowCount - 1)) Then
		      lstResult.CellTextAt(iRow, 0) = oCRCCalculator.Caption
		    Else
		      lstResult.AddRow(oCRCCalculator.Caption)
		    End If
		    
		    If radOutputHex.Value Then
		      lstResult.CellTextAt(iRow, 1) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.Result(Me.CalcValue))
		      lstResult.CellTextAt(iRow, 2) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.Poly)
		      lstResult.CellTextAt(iRow, 3) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.Init)
		      lstResult.CellTextAt(iRow, 6) = oCRCCalculator.UInt16_AsHex(oCRCCalculator.XorOut)
		    Else
		      lstResult.CellTextAt(iRow, 1) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.Result(Me.CalcValue))
		      lstResult.CellTextAt(iRow, 2) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.Poly)
		      lstResult.CellTextAt(iRow, 3) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.Init)
		      lstResult.CellTextAt(iRow, 6) = oCRCCalculator.UInt16_AsDec(oCRCCalculator.XorOut)
		    End If
		    lstResult.CellTextAt(iRow, 4) = Str(oCRCCalculator.RefIn)
		    lstResult.CellTextAt(iRow, 5) = Str(oCRCCalculator.RefOut)
		    
		    iRow = iRow + 1
		  Next
		  
		  If (iRow < (lstResult.RowCount - 1)) Then
		    For iRemoveRow As Integer = lstResult.RowCount - 1 DownTo iRow
		      lstResult.RemoveRowAt(iRemoveRow)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults_CRC32()
		  Var iRow As Integer = 0
		  For Each oCRCCalculator As CRC32Calculator In eoCRC32Calculators
		    If (iRow <= (lstResult.RowCount - 1)) Then
		      lstResult.CellTextAt(iRow, 0) = oCRCCalculator.Caption
		    Else
		      lstResult.AddRow(oCRCCalculator.Caption)
		    End If
		    
		    If radOutputHex.Value Then
		      lstResult.CellTextAt(iRow, 1) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.Result(Me.CalcValue))
		      lstResult.CellTextAt(iRow, 2) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.Poly)
		      lstResult.CellTextAt(iRow, 3) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.Init)
		      lstResult.CellTextAt(iRow, 6) = oCRCCalculator.UInt32_AsHex(oCRCCalculator.XorOut)
		    Else
		      lstResult.CellTextAt(iRow, 1) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.Result(Me.CalcValue))
		      lstResult.CellTextAt(iRow, 2) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.Poly)
		      lstResult.CellTextAt(iRow, 3) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.Init)
		      lstResult.CellTextAt(iRow, 6) = oCRCCalculator.UInt32_AsDec(oCRCCalculator.XorOut)
		    End If
		    lstResult.CellTextAt(iRow, 4) = Str(oCRCCalculator.RefIn)
		    lstResult.CellTextAt(iRow, 5) = Str(oCRCCalculator.RefOut)
		    
		    iRow = iRow + 1
		  Next
		  
		  If (iRow < (lstResult.RowCount - 1)) Then
		    For iRemoveRow As Integer = lstResult.RowCount - 1 DownTo iRow
		      lstResult.RemoveRowAt(iRemoveRow)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowResults_CRC8()
		  Var iRow As Integer = 0
		  For Each oCRCCalculator As CRC8Calculator In eoCRC8Calculators
		    If (iRow <= (lstResult.RowCount - 1)) Then
		      lstResult.CellTextAt(iRow, 0) = oCRCCalculator.Caption
		    Else
		      lstResult.AddRow(oCRCCalculator.Caption)
		    End If
		    
		    If radOutputHex.Value Then
		      lstResult.CellTextAt(iRow, 1) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.Result(Me.CalcValue))
		      lstResult.CellTextAt(iRow, 2) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.Poly)
		      lstResult.CellTextAt(iRow, 3) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.Init)
		      lstResult.CellTextAt(iRow, 6) = oCRCCalculator.UInt8_AsHex(oCRCCalculator.XorOut)
		    Else
		      lstResult.CellTextAt(iRow, 1) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.Result(Me.CalcValue))
		      lstResult.CellTextAt(iRow, 2) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.Poly)
		      lstResult.CellTextAt(iRow, 3) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.Init)
		      lstResult.CellTextAt(iRow, 6) = oCRCCalculator.UInt8_AsDec(oCRCCalculator.XorOut)
		    End If
		    lstResult.CellTextAt(iRow, 4) = Str(oCRCCalculator.RefIn)
		    lstResult.CellTextAt(iRow, 5) = Str(oCRCCalculator.RefOut)
		    
		    iRow = iRow + 1
		  Next
		  
		  If (iRow < (lstResult.RowCount - 1)) Then
		    For iRemoveRow As Integer = lstResult.RowCount - 1 DownTo iRow
		      lstResult.RemoveRowAt(iRemoveRow)
		    Next
		  End If
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


	#tag Constant, Name = kEmail_Contact, Type = String, Dynamic = False, Default = \"xojo@jo-tools.ch", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURL_PayPal, Type = String, Dynamic = False, Default = \"https://paypal.me/jotools", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURL_Repository, Type = String, Dynamic = False, Default = \"https://github.com/jo-tools/crccalculator", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events edtInput
	#tag Event
		Sub TextChanged()
		  Self.ShowResults()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstResult
	#tag Event
		Sub Opening()
		  Me.FontName = "Courier"
		  
		  Me.HasHeader = True
		  Me.ColumnCount = 7
		  Me.HeaderAt(0) = "Algorithm"
		  Me.HeaderAt(1) = "Result"
		  Me.HeaderAt(2) = "Poly"
		  Me.HeaderAt(3) = "Init"
		  Me.HeaderAt(4) = "RefIn"
		  Me.HeaderAt(5) = "RefOut"
		  Me.HeaderAt(6) = "XorOut"
		  
		  Me.ColumnAlignmentAt(1) = DesktopListbox.Alignments.Center
		  Me.ColumnAlignmentAt(2) = DesktopListbox.Alignments.Center
		  Me.ColumnAlignmentAt(3) = DesktopListbox.Alignments.Center
		  Me.ColumnAlignmentAt(4) = DesktopListbox.Alignments.Center
		  Me.ColumnAlignmentAt(5) = DesktopListbox.Alignments.Center
		  Me.ColumnAlignmentAt(6) = DesktopListbox.Alignments.Center
		  
		  Me.ColumnWidths = "22%,14%,14%,14%,11%,11%,14%"
		  Me.DefaultRowHeight = 24
		  
		  Me.GridLineStyle = DesktopListBox.GridLineStyles.Both
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma unused column
		  
		  Var oBGColor As Color
		  
		  If Me.RowSelectedAt(row) Then
		    oBGColor = Color.HighlightColor
		  Else
		    
		    If (row Mod 2 = 0) Then
		      oBGColor = Color.RGB(250,250,250)
		    Else
		      oBGColor = Color.RGB(230,230,230)
		    End If
		    If Color.IsDarkMode Then
		      If (row Mod 2 = 0) Then
		        oBGColor = &c1D1D1C
		      Else
		        oBGColor = &c272728
		      End If
		    End If
		    
		  End If
		  
		  
		  g.DrawingColor = oBGColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  #Pragma unused row
		  
		  g.Bold = (column <= 1)
		  Return False 'let Listbox handle the actual drawing
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events radOutputHex
	#tag Event
		Sub ValueChanged()
		  Self.ShowResults()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events radOutputDec
	#tag Event
		Sub ValueChanged()
		  Self.ShowResults()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvAppIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma unused areas
		  
		  g.DrawPicture(AppIcon_128, 0, 0, 64, 64, 0, 0, AppIcon_128.Width, AppIcon_128.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL(kURL_Repository)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppName
	#tag Event
		Sub Opening()
		  Me.Text = "CRC Calculator"
		  Me.FontSize = 18
		  Me.Bold = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL(kURL_Repository)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labThanks
	#tag Event
		Sub Opening()
		  #If TargetLinux Then
		    Me.FontName = "SmallSystem"
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labAppVersion
	#tag Event
		Sub Opening()
		  If (App.Version <> "") Then
		    Me.Text = App.Version
		    Return
		  End If
		  
		  Me.Text = Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." + Str(App.BugVersion)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events labContact
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL("mailto:" + kEmail_Contact)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvPayPal
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma unused areas
		  
		  g.DrawingColor = &cFFFFFF
		  If Color.IsDarkMode Then g.DrawingColor = &cD0D0D0
		  
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  g.DrawingColor = &c909090
		  g.DrawRectangle(0, 0, g.Width, g.Height)
		  g.DrawPicture(PayPal, 3, 2, 100, 26, 0, 0, PayPal.Width, PayPal.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  If (x >= 0) And (x < Me.Width) And (y > 0) And (y < Me.Height) Then
		    System.GotoURL(kURL_PayPal)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #Pragma unused X
		  #Pragma unused Y
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events segCRCType
	#tag Event
		Sub Opening()
		  #If TargetMacOS Then
		    Me.Height = 24
		    Me.Top = Me.Top + 2
		  #EndIf
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(segmentIndex As Integer)
		  eiSegmentIndex = segmentIndex
		  Self.ShowResults()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
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
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="540"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="350"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
