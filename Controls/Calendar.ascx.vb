'@Author: Ali Bahaloo Hore @This class is responsible for the calendar component.
Partial Class Controls_Calendar
    Inherits System.Web.UI.UserControl

    Private mintCalendar As Integer
    Private mstrStartDate As String
    Private mViewType As ViewTypes

    Public Enum ViewTypes
        Day
        Week
        Month
    End Enum
    '@Author: Ali Bahaloo Hore @Properties for the calendar component.
    Public Property Calender() As Integer
        Get
            Return mintCalendar
        End Get
        Set(ByVal value As Integer)
            mintCalendar = value
        End Set
    End Property
    '@Author: Ali Bahaloo Hore @Properties fort the View types for the calendar component.
    Public Property ViewType() As ViewTypes
        Get
            Return mViewType
        End Get
        Set(ByVal value As ViewTypes)
            mViewType = value
        End Set
    End Property
    '@Author: Ali Bahaloo Hore @Properties for start date column in the database.
    Public WriteOnly Property StartDate() As String
        Set(ByVal value As String)
            mstrStartDate = value
        End Set
    End Property
    '@Author: Ali Bahaloo Hore @Properties for the start date VALUE.
    Public ReadOnly Property StartDateValue() As Date
        Get
            If IsDate(mstrStartDate) Then
                Return CDate(mstrStartDate)
            Else
                Return Date.Now
            End If
        End Get
    End Property

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Page.IsPostBack Then 'preserve the viewstarte, otherwise all hell will break loose.
            Me.Controls.Add(Me.lnkNext)
            Me.Controls.Add(Me.lnkBack)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '@Author:Ali Bahaloo Hore @The main purpose if this is if there is multiple controls on one page
        Select Case ViewType
            Case ViewTypes.Day
                If Request.Params("__EVENTTARGET") Is Nothing Then
                    ChangeDay(0)
                Else
                    If InStr(Request.Params("__EVENTTARGET"), Me.ID) > 0 And InStr(Request.Params("__EVENTTARGET"), "Next") > 0 Then
                        ChangeDay(1)
                    ElseIf InStr(Request.Params("__EVENTTARGET"), Me.ID) > 0 And InStr(Request.Params("__EVENTTARGET"), "Back") > 0 Then
                        ChangeDay(-1)
                    Else
                        ChangeDay(0)
                    End If
                End If

            Case ViewTypes.Week
                If Request.Params("__EVENTTARGET") Is Nothing Then
                    ChangeWeek(0)
                Else
                    If InStr(Request.Params("__EVENTTARGET"), Me.ID) > 0 And InStr(Request.Params("__EVENTTARGET"), "Next") > 0 Then
                        ChangeWeek(1)
                    ElseIf InStr(Request.Params("__EVENTTARGET"), Me.ID) > 0 And InStr(Request.Params("__EVENTTARGET"), "Back") > 0 Then
                        ChangeWeek(-1)
                    Else
                        ChangeWeek(0)
                    End If
                End If

            Case Else
                If Request.Params("__EVENTTARGET") Is Nothing Then
                    ChangeMonth(0)
                Else
                    If InStr(Request.Params("__EVENTTARGET"), Me.ID) > 0 And InStr(Request.Params("__EVENTTARGET"), "Next") > 0 Then
                        ChangeMonth(1)
                    ElseIf InStr(Request.Params("__EVENTTARGET"), Me.ID) > 0 And InStr(Request.Params("__EVENTTARGET"), "Back") > 0 Then
                        ChangeMonth(-1)
                    Else
                        ChangeMonth(0)
                    End If
                End If
        End Select
    End Sub
    '@Author: Ali Bahaloo Hore @this method is for Week View of the calendar component.
    Private Sub LoadWeekCalendar(ByVal pDate As Date)
        'initialaztion of the calendar component such as row, cells, styles and etc.
        Dim objRow As TableRow
        Dim objCell As TableCell
        Dim objStyles As clsStyleList
        Dim objText As clsControlText
        Dim strStyleLiteral As String = ""
        Dim DayTable As Table
        Dim DayRow As TableRow
        Dim DayCell As TableCell
        Dim EventLink As HyperLink
        Dim objDate As Date = pDate
        Dim objDayCellStyles As New clsStyleList
        objDayCellStyles.LoadStylesbyControl("cellDayCell")
        Dim objDayCellWeekendStyles As New clsStyleList
        objDayCellWeekendStyles.LoadStylesbyControl("cellDayCellWeekend")
        Dim objEventStyles As New clsStyleList
        objEventStyles.LoadStylesbyControl("linkEvent")
        Dim objEvents As New clsEventSortedList
        Dim objEvent As clsRecurEvent
        Dim objDayEvents As ArrayList

        Me.tblCalendar.BorderStyle = BorderStyle.Solid
        Do Until Me.tblCalendar.Rows.Count = 0
            Me.tblCalendar.Rows.RemoveAt(0)
        Loop
        'Applying the style to the calendar component
        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("popup")
        For I As Integer = 0 To objStyles.Count - 1
            strStyleLiteral &= CType(objStyles(I), clsStyle).StyleKey & ":" & CType(objStyles(I), clsStyle).StyleValue & "; "
        Next I
        Me.Literal1.Text = "<div id=""navtxt"" style=""" & strStyleLiteral & """>blah</div>"

        Me.tblCalendar.Width = New Unit(100, UnitType.Percentage)
        'Me.tblCalendar.Height = New Unit(100, UnitType.Percentage)
        Me.tblCalendar.CellSpacing = 0
        Me.tblCalendar.CellPadding = 3

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.tblCalendar.ID)
        For I As Integer = 0 To objStyles.Count - 1
            Me.tblCalendar.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        Me.tblCalendar.Style.Add("font-size", "12px")

        objRow = New TableRow

        objCell = New TableCell

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.lnkBack.ID)
        For I As Integer = 0 To objStyles.Count - 1
            lnkBack.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("font-size", "12px")
        'Applying the Control text to the calendar component
        objText = New clsControlText(Me.lnkBack.ID)
        lnkBack.Text = objText.Text
        objCell.Controls.Add(Me.lnkBack)
        objCell.HorizontalAlign = HorizontalAlign.Left
        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("cellTopRow")
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 5px")
        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)
        'Adding cells (days) to che calendar
        objCell = New TableCell
        objCell.Text = "<strong>" & Format(pDate, "D") & " - " & Format(DateAdd(DateInterval.Day, 6, pDate), "D") & "</strong>"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Style.Add("font-size", "12px")

        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)

        objCell = New TableCell

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.lnkNext.ID)
        For I As Integer = 0 To objStyles.Count - 1
            lnkNext.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I

        objText = New clsControlText(Me.lnkNext.ID)
        lnkNext.Text = objText.Text
        objCell.Controls.Add(Me.lnkNext)
        objCell.HorizontalAlign = HorizontalAlign.Right

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("cellTopRow")
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("font-size", "12px")
        objCell.Style.Add("padding", "5px 5px 5px 0px")

        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)

        Me.tblCalendar.Rows.Add(objRow)

        objEvents.LoadbyDateRange(mintCalendar, pDate, DateAdd(DateInterval.Day, 7, pDate))

        Do While DateDiff(DateInterval.Day, objDate, DateAdd(DateInterval.Day, 7, pDate)) > 0

            objRow = New TableRow

            objCell = New TableCell

            DayTable = New Table
            DayTable.BorderWidth = New Unit(0)
            DayTable.Width = New Unit(100, UnitType.Percentage)
            DayTable.CellSpacing = 3

            'Add Events
            objDayEvents = objEvents.EventsbyDay(objDate)
            If objDayEvents.Count > 0 Then
                For I As Integer = 0 To objDayEvents.Count - 1
                    objEvent = objDayEvents(I)
                    DayRow = New TableRow
                    If I = 0 Then
                        DayCell = New TableCell
                        'DayCell.Text = Format(objDate, "M/d/yyyy")
                        DayCell.Text = Format(objDate, "dddd") & "<br>" & Format(objDate, "M/d/yyyy")
                        DayCell.RowSpan = objDayEvents.Count
                        DayCell.Style.Add("padding-right", "10px")
                        DayRow.Cells.Add(DayCell)
                    End If
                    DayCell = New TableCell
                    DayCell.BorderWidth = New Unit(0)
                    DayCell.Width = New Unit(100, UnitType.Percentage)
                    EventLink = New HyperLink
                    EventLink.Text = "<strong>" & Format(objEvent.StartTime, "h:mm tt") & " - " & Format(objEvent.EndTime, "h:mm tt") & "</strong><br>" & objEvent.Title
                    DayCell.Attributes.Add("onmouseover", "writetxt('<strong>" & objEvent.StartTimeStr & " - " & objEvent.EndTimeStr & "<br /><br />" & Replace(objEvent.Title, "'", "\'") & "</strong><br /><br />" & Replace(objEvent.Description, "'", "\'") & "', this)")
                    For J As Integer = 0 To objEventStyles.Count - 1
                        DayCell.Style.Add(CType(objEventStyles(J), clsStyle).StyleKey, CType(objEventStyles(J), clsStyle).StyleValue)
                    Next J
                    DayCell.Controls.Add(EventLink)
                    DayCell.Style.Add("padding", "3px 3px 3px 3px")
                    DayRow.Cells.Add(DayCell)
                    DayTable.Rows.Add(DayRow)
                Next I
            Else
                DayRow = New TableRow
                DayCell = New TableCell
                'DayCell.Text = Format(objDate, "M/d/yyyy")
                DayCell.Text = Format(objDate, "dddd") & "<br>" & Format(objDate, "M/d/yyyy")
                DayRow.Cells.Add(DayCell)
                DayTable.Rows.Add(DayRow)
            End If

            objCell.Controls.Add(DayTable)
            objCell.HorizontalAlign = HorizontalAlign.Left
            objCell.VerticalAlign = VerticalAlign.Middle
            objCell.Width = New Unit(100, UnitType.Percentage)
            'objCell.Height = New Unit(100)
            objCell.ColumnSpan = 3
            If objDate.DayOfWeek = DayOfWeek.Saturday Or objDate.DayOfWeek = DayOfWeek.Sunday Then
                For J As Integer = 0 To objDayCellWeekendStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellWeekendStyles(J), clsStyle).StyleKey, CType(objDayCellWeekendStyles(J), clsStyle).StyleValue)
                Next J
            Else
                For J As Integer = 0 To objDayCellStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellStyles(J), clsStyle).StyleKey, CType(objDayCellStyles(J), clsStyle).StyleValue)
                Next J
            End If
            objRow.Cells.Add(objCell)
            '
            Me.tblCalendar.Rows.Add(objRow)
            objDate = DateAdd(DateInterval.Day, 1, objDate)
        Loop
    End Sub
    '@Author: Ali Bahaloo Hore @the method to load the calendar component in day view.
    Private Sub LoadDayCalendar(ByVal pDate As Date)
        Dim objRow As TableRow
        Dim objCell As TableCell
        Dim objStyles As clsStyleList
        Dim objText As clsControlText
        Dim strStyleLiteral As String = ""
        Dim DayTable As Table
        Dim DayRow As TableRow
        Dim DayCell As TableCell
        Dim EventLink As HyperLink
        Dim objDayCellStyles As New clsStyleList
        objDayCellStyles.LoadStylesbyControl("cellDayCell")
        Dim objDayCellWeekendStyles As New clsStyleList
        objDayCellWeekendStyles.LoadStylesbyControl("cellDayCellWeekend")
        Dim objEventStyles As New clsStyleList
        objEventStyles.LoadStylesbyControl("linkEvent")
        Dim objEvents As New clsEventSortedList
        Dim objEvent As clsRecurEvent
        Dim objDayEvents As ArrayList

        Me.tblCalendar.BorderStyle = BorderStyle.Solid
        Do Until Me.tblCalendar.Rows.Count = 0
            Me.tblCalendar.Rows.RemoveAt(0)
        Loop

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("popup")
        For I As Integer = 0 To objStyles.Count - 1
            strStyleLiteral &= CType(objStyles(I), clsStyle).StyleKey & ":" & CType(objStyles(I), clsStyle).StyleValue & "; "
        Next I
        Me.Literal1.Text = "<div id=""navtxt"" style=""" & strStyleLiteral & """>blah</div>"

        Me.tblCalendar.Width = New Unit(100, UnitType.Percentage)
        Me.tblCalendar.Height = New Unit(100, UnitType.Percentage)
        Me.tblCalendar.CellSpacing = 0
        Me.tblCalendar.CellPadding = 3

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.tblCalendar.ID)
        For I As Integer = 0 To objStyles.Count - 1
            Me.tblCalendar.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        Me.tblCalendar.Style.Add("font-size", "12px")

        objRow = New TableRow

        objCell = New TableCell

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.lnkBack.ID)
        For I As Integer = 0 To objStyles.Count - 1
            lnkBack.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("font-size", "12px")

        objText = New clsControlText(Me.lnkBack.ID)
        lnkBack.Text = objText.Text
        objCell.Controls.Add(Me.lnkBack)
        objCell.HorizontalAlign = HorizontalAlign.Left
        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("cellTopRow")
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 5px")
        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = "<strong>" & Format(pDate, "D") & "</strong>"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Style.Add("font-size", "12px")

        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)

        objCell = New TableCell

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.lnkNext.ID)
        For I As Integer = 0 To objStyles.Count - 1
            lnkNext.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I

        objText = New clsControlText(Me.lnkNext.ID)
        lnkNext.Text = objText.Text
        objCell.Controls.Add(Me.lnkNext)
        objCell.HorizontalAlign = HorizontalAlign.Right

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("cellTopRow")
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("font-size", "12px")
        objCell.Style.Add("padding", "5px 5px 5px 0px")

        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)

        Me.tblCalendar.Rows.Add(objRow)

        objRow = New TableRow

        objEvents.LoadbyDateRange(mintCalendar, pDate.Date, pDate.Date)

        objCell = New TableCell

        DayTable = New Table
        DayTable.BorderWidth = New Unit(0)
        DayTable.Width = New Unit(100, UnitType.Percentage)
        DayTable.CellSpacing = 3

        'Add Events
        objDayEvents = objEvents.EventsbyDay(pDate)
        For I As Integer = 0 To objDayEvents.Count - 1
            objEvent = objDayEvents(I)
            DayRow = New TableRow
            DayCell = New TableCell
            DayCell.BorderWidth = New Unit(1)
            DayCell.Width = New Unit(100, UnitType.Percentage)
            EventLink = New HyperLink
            EventLink.Text = "<strong>" & Format(objEvent.StartTime, "h:mm tt") & " - " & Format(objEvent.EndTime, "h:mm tt") & "</strong><br>" & objEvent.Title
            DayCell.Attributes.Add("onmouseover", "writetxt('<strong>" & objEvent.StartTimeStr & " - " & objEvent.EndTimeStr & "<br /><br />" & Replace(objEvent.Title, "'", "\'") & "</strong><br /><br />" & Replace(objEvent.Description, "'", "\'") & "', this)")
            For J As Integer = 0 To objEventStyles.Count - 1
                DayCell.Style.Add(CType(objEventStyles(J), clsStyle).StyleKey, CType(objEventStyles(J), clsStyle).StyleValue)
            Next J
            DayCell.Controls.Add(EventLink)
            DayCell.Style.Add("padding", "3px 3px 3px 3px")
            DayRow.Cells.Add(DayCell)
            DayTable.Rows.Add(DayRow)
        Next I

        objCell.Controls.Add(DayTable)
        objCell.HorizontalAlign = HorizontalAlign.Left
        objCell.VerticalAlign = VerticalAlign.Top
        objCell.Width = New Unit(100, UnitType.Percentage)
        objCell.Height = New Unit(100)
        objCell.ColumnSpan = 3
        If pDate.DayOfWeek = DayOfWeek.Saturday Or pDate.DayOfWeek = DayOfWeek.Sunday Then
            For J As Integer = 0 To objDayCellWeekendStyles.Count - 1
                objCell.Style.Add(CType(objDayCellWeekendStyles(J), clsStyle).StyleKey, CType(objDayCellWeekendStyles(J), clsStyle).StyleValue)
            Next J
        Else
            For J As Integer = 0 To objDayCellStyles.Count - 1
                objCell.Style.Add(CType(objDayCellStyles(J), clsStyle).StyleKey, CType(objDayCellStyles(J), clsStyle).StyleValue)
            Next J
        End If
        objRow.Cells.Add(objCell)
'
        Me.tblCalendar.Rows.Add(objRow)

    End Sub
    '@Author: Ali Bahaloo Hore @This method is to load the calendar component in Monthly View.
    Private Sub LoadMonthCalendar(ByVal pStartDate As Date)
        Dim objRow As TableRow
        Dim objCell As TableCell
        Dim objStyles As clsStyleList
        Dim objText As clsControlText
        Dim strStyleLiteral As String = ""

        Me.tblCalendar.BorderStyle = BorderStyle.Solid
        Do Until Me.tblCalendar.Rows.Count = 0
            Me.tblCalendar.Rows.RemoveAt(0)
        Loop

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("popup")
        For I As Integer = 0 To objStyles.Count - 1
            strStyleLiteral &= CType(objStyles(I), clsStyle).StyleKey & ":" & CType(objStyles(I), clsStyle).StyleValue & "; "
        Next I
        Me.Literal1.Text = "<div id=""navtxt"" style=""" & strStyleLiteral & """>blah</div>"

        Me.tblCalendar.Width = New Unit(100, UnitType.Percentage)
        Me.tblCalendar.CellSpacing = 0
        Me.tblCalendar.CellPadding = 3
        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.tblCalendar.ID)
        For I As Integer = 0 To objStyles.Count - 1
            Me.tblCalendar.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        Me.tblCalendar.Style.Add("font-size", "12px")

        objRow = New TableRow

        objCell = New TableCell

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.lnkBack.ID)
        For I As Integer = 0 To objStyles.Count - 1
            lnkBack.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("font-size", "16px")

        objText = New clsControlText(Me.lnkBack.ID)
        lnkBack.Text = objText.Text
        objCell.Controls.Add(Me.lnkBack)
        objCell.HorizontalAlign = HorizontalAlign.Left
        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("cellTopRow")
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 5px")
        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = Format(pStartDate, "MMMM yyyy")
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Font.Size = New FontUnit(FontSize.XLarge)
        objCell.ColumnSpan = 5
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl(Me.lnkNext.ID)
        For I As Integer = 0 To objStyles.Count - 1
            lnkNext.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objText = New clsControlText(Me.lnkNext.ID)
        lnkNext.Text = objText.Text
        objCell.Controls.Add(Me.lnkNext)
        objCell.HorizontalAlign = HorizontalAlign.Right

        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("cellTopRow")
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("font-size", "16px")
        objCell.Style.Add("padding", "5px 5px 5px 0px")

        objCell.ColumnSpan = 1
        objRow.Cells.Add(objCell)

        Me.tblCalendar.Rows.Add(objRow)

        objRow = New TableRow

        objCell = New TableCell
        objCell.Text = "Sunday"
        objCell.HorizontalAlign = HorizontalAlign.Center
        objStyles = New clsStyleList
        objStyles.LoadStylesbyControl("cellDayHeader")
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Width = New Unit(14.286, UnitType.Percentage)
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = "Monday"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Width = New Unit(14.286, UnitType.Percentage)
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = "Tuesday"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Width = New Unit(14.286, UnitType.Percentage)
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = "Wednesday"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Width = New Unit(14.286, UnitType.Percentage)
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = "Thursday"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Width = New Unit(14.286, UnitType.Percentage)
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = "Friday"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Width = New Unit(14.286, UnitType.Percentage)
        objRow.Cells.Add(objCell)

        objCell = New TableCell
        objCell.Text = "Saturday"
        objCell.HorizontalAlign = HorizontalAlign.Center
        For I As Integer = 0 To objStyles.Count - 1
            objCell.Style.Add(CType(objStyles(I), clsStyle).StyleKey, CType(objStyles(I), clsStyle).StyleValue)
        Next I
        objCell.Style.Add("padding", "5px 0px 5px 0px")
        objCell.Width = New Unit(14.286, UnitType.Percentage)
        objRow.Cells.Add(objCell)

        Me.tblCalendar.Rows.Add(objRow)

        BuildDays(pStartDate)
    End Sub
    '@Author: Ali Bahaloo Hore @This method is responsible to create day cells in the calendar component according to start date and end date.
    Private Sub BuildDays(ByVal pStartDate As Date)
        Dim objRow As TableRow
        Dim objCell As TableCell
        Dim DayTable As Table
        Dim DayRow As TableRow
        Dim DayCell As TableCell
        Dim EventLink As HyperLink
        Dim objDate As Date = pStartDate
        Dim objEvents As New clsEventSortedList
        Dim objEvent As clsRecurEvent
        Dim objDayEvents As ArrayList
        Dim objDayCellStyles As New clsStyleList
        objDayCellStyles.LoadStylesbyControl("cellDayCell")
        Dim objDayCellWeekendStyles As New clsStyleList
        objDayCellWeekendStyles.LoadStylesbyControl("cellDayCellWeekend")
        Dim objEventStyles As New clsStyleList
        objEventStyles.LoadStylesbyControl("linkEvent")

        objRow = New TableRow

        For I As Integer = 0 To pStartDate.DayOfWeek - 1
            objCell = New TableCell
            objCell.Text = ""
            objCell.Width = New Unit(14.286, UnitType.Percentage)
            If I = DayOfWeek.Saturday Or I = DayOfWeek.Sunday Then
                For J As Integer = 0 To objDayCellWeekendStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellWeekendStyles(J), clsStyle).StyleKey, CType(objDayCellWeekendStyles(J), clsStyle).StyleValue)
                Next J
            Else
                For J As Integer = 0 To objDayCellStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellStyles(J), clsStyle).StyleKey, CType(objDayCellStyles(J), clsStyle).StyleValue)
                Next J
            End If
            objCell.Height = New Unit(100)
            objRow.Cells.Add(objCell)
        Next I

        objEvents.LoadbyDateRange(mintCalendar, pStartDate, DateAdd(DateInterval.Day, -1, DateAdd(DateInterval.Month, 1, pStartDate)))

        Do While DateDiff(DateInterval.Day, objDate, DateAdd(DateInterval.Month, 1, pStartDate)) > 0
            objCell = New TableCell

            DayTable = New Table
            DayTable.BorderWidth = New Unit(0)
            DayTable.Width = New Unit(100, UnitType.Percentage)
            DayTable.CellSpacing = 3
            DayRow = New TableRow
            DayCell = New TableCell
            DayCell.Text = objDate.Day

            DayRow.Cells.Add(DayCell)

            DayTable.Rows.Add(DayRow)

            'Add Events
            objDayEvents = objEvents.EventsbyDay(objDate)
            For I As Integer = 0 To objDayEvents.Count - 1
                objEvent = objDayEvents(I)
                DayRow = New TableRow
                DayCell = New TableCell
                EventLink = New HyperLink
                EventLink.Text = "<strong>" & Format(objEvent.StartTime, "h:mm tt") & " - " & Format(objEvent.EndTime, "h:mm tt") & "</strong><br>" & objEvent.Title
                DayCell.Attributes.Add("onmouseover", "writetxt('<strong>" & objEvent.StartTimeStr & " - " & objEvent.EndTimeStr & "<br /><br />" & Replace(objEvent.Title, "'", "\'") & "</strong><br /><br />" & Replace(objEvent.Description, "'", "\'") & "', this)")
                For J As Integer = 0 To objEventStyles.Count - 1
                    DayCell.Style.Add(CType(objEventStyles(J), clsStyle).StyleKey, CType(objEventStyles(J), clsStyle).StyleValue)
                Next J
                DayCell.Controls.Add(EventLink)
                DayCell.Style.Add("padding", "3px 3px 3px 3px")
                DayRow.Cells.Add(DayCell)
                DayTable.Rows.Add(DayRow)
            Next I

            objCell.Controls.Add(DayTable)
            objCell.HorizontalAlign = HorizontalAlign.Left
            objCell.VerticalAlign = VerticalAlign.Top
            objCell.Width = New Unit(14.286, UnitType.Percentage)
            objCell.Height = New Unit(100)
            If objDate.DayOfWeek = DayOfWeek.Saturday Or objDate.DayOfWeek = DayOfWeek.Sunday Then
                For J As Integer = 0 To objDayCellWeekendStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellWeekendStyles(J), clsStyle).StyleKey, CType(objDayCellWeekendStyles(J), clsStyle).StyleValue)
                Next J
            Else
                For J As Integer = 0 To objDayCellStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellStyles(J), clsStyle).StyleKey, CType(objDayCellStyles(J), clsStyle).StyleValue)
                Next J
            End If
            objRow.Cells.Add(objCell)

            If objDate.DayOfWeek = DayOfWeek.Saturday Then
                Me.tblCalendar.Rows.Add(objRow)
                objRow = New TableRow
            End If

            objDate = DateAdd(DateInterval.Day, 1, objDate)
        Loop

        Do While objRow.Cells.Count < 7
            objCell = New TableCell
            objCell.Width = New Unit(14.286, UnitType.Percentage)
            If objRow.Cells.Count = DayOfWeek.Saturday Or objRow.Cells.Count = DayOfWeek.Sunday Then
                For J As Integer = 0 To objDayCellWeekendStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellWeekendStyles(J), clsStyle).StyleKey, CType(objDayCellWeekendStyles(J), clsStyle).StyleValue)
                Next J
            Else
                For J As Integer = 0 To objDayCellStyles.Count - 1
                    objCell.Style.Add(CType(objDayCellStyles(J), clsStyle).StyleKey, CType(objDayCellStyles(J), clsStyle).StyleValue)
                Next J
            End If
            objCell.Height = New Unit(100)
            objRow.Cells.Add(objCell)
        Loop

        Me.tblCalendar.Rows.Add(objRow)
    End Sub

    Protected Sub lnkNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkNext.Click
        'ChangeMonth(1)
    End Sub

    Protected Sub lnkBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkBack.Click
        'ChangeMonth(-1)
    End Sub
    '@Author: Ali Bahaloo Hore @Method to change the month in calendar component.
    Private Sub ChangeMonth(ByVal pIncrement As Integer)
        Dim ViewDate As Date
        If datCurrentDate.Value <> "" Then
            ViewDate = CDate(datCurrentDate.Value)
        Else
            'ViewDate = CDate(Date.Now.Month & "/1/" & Date.Now.Year)
            ViewDate = CDate(StartDateValue.Month & "/1/" & StartDateValue.Year)
        End If
        ViewDate = DateAdd(DateInterval.Month, pIncrement, ViewDate)
        LoadMonthCalendar(ViewDate)
        datCurrentDate.Value = ViewDate
    End Sub
    '@Author: Ali Bahaloo Hore @Method to change days in the calendar component.
    Private Sub ChangeDay(ByVal pIncrement As Integer)
        Dim ViewDate As Date
        If datCurrentDate.Value <> "" Then
            ViewDate = CDate(datCurrentDate.Value)
        Else
            ViewDate = StartDateValue
        End If
        ViewDate = DateAdd(DateInterval.Day, pIncrement, ViewDate)
        LoadDayCalendar(ViewDate)
        datCurrentDate.Value = ViewDate
    End Sub
    '@Author: Ali Bahaloo Hore @Method to change the weeks in the calendar component.
    Private Sub ChangeWeek(ByVal pIncrement As Integer)
        Dim ViewDate As Date
        If datCurrentDate.Value <> "" Then
            ViewDate = CDate(datCurrentDate.Value)
        Else
            ViewDate = StartDateValue
            Do Until ViewDate.DayOfWeek = DayOfWeek.Sunday
                ViewDate = DateAdd(DateInterval.Day, -1, ViewDate)
            Loop
        End If
        ViewDate = DateAdd(DateInterval.Day, pIncrement * 7, ViewDate)
        LoadWeekCalendar(ViewDate)
        datCurrentDate.Value = ViewDate
    End Sub
End Class
