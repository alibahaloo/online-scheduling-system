'@Authors: Ibrahim Krvavac & Kuhan Loh @ this class handles the actions for viewing each worker's own schedule (shifts)
Partial Class MySchedule
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Give the page a name
        Me.Page.Title = "Online Scheduling System - My Schedule"

        ' First check if it's the first time the page is loaded
        ' and if so, get todays date, store it in "viewstate"
        ' and call the "weekdays()" method
        If Page.IsPostBack = False Then
            weekDays(System.DateTime.Today)
            Profile.dateOffset = System.DateTime.Today
            Profile.actualDate = System.DateTime.Today
            Profile.userID = User.Identity.Name
        End If
        If User.IsInRole("worker") Then
            Me.LinkButton1.Visible = False
        End If
        If User.IsInRole("manager") Then
            Me.LinkButton1.Visible = True
        End If
    End Sub
    '@Authors: Ibrahim Krvavac & Kuhan Loh 
    Private Sub weekDays(ByVal dateToday As Date)

        ' variable declaration
        Dim weekDay As String = dateToday.DayOfWeek.ToString

        ' assign name to object
        weekNr.Text = "Week " & DatePart(DateInterval.WeekOfYear, dateToday)

        ' the if statements below check what day of the week it is in order to
        ' determine which other dates should be included in this week and
        ' gives those dates as names for the labels under the day-name in the calendar

        If weekDay = "Monday" Then
            dateMon.Text = dateToday.Date.ToString("yyyy-MM-dd")
            dateTue.Text = dateToday.AddDays(1).ToString("yyyy-MM-dd")
            dateWed.Text = dateToday.AddDays(2).ToString("yyyy-MM-dd")
            dateThu.Text = dateToday.AddDays(3).ToString("yyyy-MM-dd")
            dateFri.Text = dateToday.AddDays(4).ToString("yyyy-MM-dd")
            dateSat.Text = dateToday.AddDays(5).ToString("yyyy-MM-dd")
            dateSun.Text = dateToday.AddDays(6).ToString("yyyy-MM-dd")
            If dateToday = Profile.actualDate Then
                dateMon.BackColor = Drawing.Color.MediumSeaGreen
            End If

        End If

        If weekDay = "Tuesday" Then
            dateMon.Text = dateToday.AddDays(-1).ToString("yyyy-MM-dd")
            dateTue.Text = dateToday.Date.ToString("yyyy-MM-dd")
            dateWed.Text = dateToday.AddDays(1).ToString("yyyy-MM-dd")
            dateThu.Text = dateToday.AddDays(2).ToString("yyyy-MM-dd")
            dateFri.Text = dateToday.AddDays(3).ToString("yyyy-MM-dd")
            dateSat.Text = dateToday.AddDays(4).ToString("yyyy-MM-dd")
            dateSun.Text = dateToday.AddDays(5).ToString("yyyy-MM-dd")
            If dateToday = Profile.actualDate Then
                dateTue.BackColor = Drawing.Color.MediumSeaGreen
            End If

        End If
        If weekDay = "Wednesday" Then
            dateMon.Text = dateToday.AddDays(-2).ToString("yyyy-MM-dd")
            dateTue.Text = dateToday.AddDays(-1).ToString("yyyy-MM-dd")
            dateWed.Text = dateToday.Date.ToString("yyyy-MM-dd")
            dateThu.Text = dateToday.AddDays(1).ToString("yyyy-MM-dd")
            dateFri.Text = dateToday.AddDays(2).ToString("yyyy-MM-dd")
            dateSat.Text = dateToday.AddDays(3).ToString("yyyy-MM-dd")
            dateSun.Text = dateToday.AddDays(4).ToString("yyyy-MM-dd")
            If dateToday = Profile.actualDate Then
                dateWed.BackColor = Drawing.Color.MediumSeaGreen
            End If

        End If

        If weekDay = "Thursday" Then
            dateMon.Text = dateToday.AddDays(-3).ToString("yyyy-MM-dd")
            dateTue.Text = dateToday.AddDays(-2).ToString("yyyy-MM-dd")
            dateWed.Text = dateToday.AddDays(-1).ToString("yyyy-MM-dd")
            dateThu.Text = dateToday.Date.ToString("yyyy-MM-dd")
            dateFri.Text = dateToday.AddDays(1).ToString("yyyy-MM-dd")
            dateSat.Text = dateToday.AddDays(2).ToString("yyyy-MM-dd")
            dateSun.Text = dateToday.AddDays(3).ToString("yyyy-MM-dd")
            If dateToday = Profile.actualDate Then
                dateThu.BackColor = Drawing.Color.MediumSeaGreen
            End If
        End If
        If weekDay = "Friday" Then
            dateMon.Text = dateToday.AddDays(-4).ToString("yyyy-MM-dd")
            dateTue.Text = dateToday.AddDays(-3).ToString("yyyy-MM-dd")
            dateWed.Text = dateToday.AddDays(-2).ToString("yyyy-MM-dd")
            dateThu.Text = dateToday.AddDays(-1).ToString("yyyy-MM-dd")
            dateFri.Text = dateToday.Date.ToString("yyyy-MM-dd")
            dateSat.Text = dateToday.AddDays(1).ToString("yyyy-MM-dd")
            dateSun.Text = dateToday.AddDays(2).ToString("yyyy-MM-dd")
            If dateToday = Profile.actualDate Then
                dateFri.BackColor = Drawing.Color.Orange
            End If

        End If

        If weekDay = "Saturday" Then
            dateMon.Text = dateToday.AddDays(-5).ToString("yyyy-MM-dd")
            dateTue.Text = dateToday.AddDays(-4).ToString("yyyy-MM-dd")
            dateWed.Text = dateToday.AddDays(-3).ToString("yyyy-MM-dd")
            dateThu.Text = dateToday.AddDays(-2).ToString("yyyy-MM-dd")
            dateFri.Text = dateToday.AddDays(-1).ToString("yyyy-MM-dd")
            dateSat.Text = dateToday.Date.ToString("yyyy-MM-dd")
            dateSun.Text = dateToday.AddDays(1).ToString("yyyy-MM-dd")
            If dateToday = Profile.actualDate Then
                dateSat.BackColor = Drawing.Color.MediumSeaGreen
            End If

        End If
        If weekDay = "Sunday" Then
            dateMon.Text = dateToday.AddDays(-6).ToString("yyyy-MM-dd")
            dateTue.Text = dateToday.AddDays(-5).ToString("yyyy-MM-dd")
            dateWed.Text = dateToday.AddDays(-4).ToString("yyyy-MM-dd")
            dateThu.Text = dateToday.AddDays(-3).ToString("yyyy-MM-dd")
            dateFri.Text = dateToday.AddDays(-2).ToString("yyyy-MM-dd")
            dateSat.Text = dateToday.AddDays(-1).ToString("yyyy-MM-dd")
            dateSun.Text = dateToday.Date.ToString("yyyy-MM-dd")
            If dateToday = Profile.actualDate Then
                dateSun.BackColor = Drawing.Color.MediumSeaGreen
            End If

        End If

        variableFill()

    End Sub
    '@Authors: Ibrahim Krvavac & Kuhan Loh @
    'Resets the backgroud color of the day-labels to empty
    Private Sub noneSelected()
        dateMon.BackColor = Drawing.Color.Empty
        dateTue.BackColor = Drawing.Color.Empty
        dateWed.BackColor = Drawing.Color.Empty
        dateThu.BackColor = Drawing.Color.Empty
        dateFri.BackColor = Drawing.Color.Empty
        dateSat.BackColor = Drawing.Color.Empty
        dateSun.BackColor = Drawing.Color.Empty

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        ' Take in the current position in calender (what week is already displayed)
        ' and offset that position by - 7 days and then store the offseted position
        ' in the "Profile" - simply pushes the calendar 7 days backward
        Dim newDate As Date = Profile.dateOffset
        newDate = newDate.AddDays(-7)
        Profile.dateOffset = newDate
        noneSelected()
        weekDays(Profile.dateOffset)
        labelShiftDetail.Visible = False
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        ' Take in the current position in calender (what week is already displayed)
        ' and offset that position by + 7 days and then store the offseted position
        ' in the "Profile" - simply pushes the calendar 7 days forward
        Dim newDate As Date = Profile.dateOffset
        newDate = newDate.AddDays(7)
        Profile.dateOffset = newDate
        noneSelected()
        weekDays(Profile.dateOffset)
        labelShiftDetail.Visible = False
    End Sub

    'Following 7 procedures connect gridviews-objects to detailviews-objects. When one shift is selected
    'in one of the gridviews the corresponding details view is given instructions on what to display
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        hideAway()
        labelShiftDetail.Visible = True
        DetailsView1.PageIndex = GridView1.SelectedIndex
        DetailsView1.Visible = True
    End Sub

    Protected Sub GridView3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.SelectedIndexChanged
        hideAway()
        labelShiftDetail.Visible = True
        DetailsView2.PageIndex = GridView2.SelectedIndex
        DetailsView2.Visible = True
    End Sub

    Protected Sub GridView4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView4.SelectedIndexChanged
        hideAway()
        labelShiftDetail.Visible = True
        DetailsView3.PageIndex = GridView3.SelectedIndex
        DetailsView3.Visible = True
    End Sub

    Protected Sub GridView5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView5.SelectedIndexChanged
        hideAway()
        labelShiftDetail.Visible = True
        DetailsView4.PageIndex = GridView4.SelectedIndex
        DetailsView4.Visible = True
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        hideAway()
        labelShiftDetail.Visible = True
        DetailsView5.PageIndex = GridView5.SelectedIndex
        DetailsView5.Visible = True
    End Sub

    Protected Sub GridView6_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView6.SelectedIndexChanged
        hideAway()
        labelShiftDetail.Visible = True
        DetailsView6.PageIndex = GridView6.SelectedIndex
        DetailsView6.Visible = True
    End Sub

    Protected Sub GridView7_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView7.SelectedIndexChanged
        hideAway()
        labelShiftDetail.Visible = True
        DetailsView7.PageIndex = GridView7.SelectedIndex
        DetailsView7.Visible = True
    End Sub
    '@Authors: Ibrahim Krvavac & Kuhan Loh @
    'This method hides all 7 detailsviews
    Private Sub hideAway()
        DetailsView1.Visible = False
        DetailsView2.Visible = False
        DetailsView3.Visible = False
        DetailsView4.Visible = False
        DetailsView5.Visible = False
        DetailsView6.Visible = False
        DetailsView7.Visible = False
    End Sub
    '@Authors: Ibrahim Krvavac & Kuhan Loh @
    'This method fills out global variables stored in the profile, variables that
    'are compared to values from the database
    Private Sub variableFill()
        Profile.dateMon = dateMon.Text & " 00:00:00"
        Profile.dateTue = dateTue.Text & " 00:00:00"
        Profile.dateWed = dateWed.Text & " 00:00:00"
        Profile.dateThu = dateThu.Text & " 00:00:00"
        Profile.dateFri = dateFri.Text & " 00:00:00"
        Profile.dateSat = dateSat.Text & " 00:00:00"
        Profile.dateSun = dateSun.Text & " 00:00:00"
    End Sub

End Class
