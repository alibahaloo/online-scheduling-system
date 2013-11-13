Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Partial Class Controls_AdminShiftCreator
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            LoadEvents()
            LoadRecurTypesDD()

        End If
        'WorkerPersnoDropDownList.DataMember = "UserName"
        'WorkerPersnoDropDownList.DataSource = Membership.GetAllUsers()
        'WorkerPersnoDropDownList.DataBind()
    End Sub
    '@Author:Ali Bahaloo @Method to load the table(Grid View) with events.
    Private Sub LoadEvents()
        Dim objEvents As New clsRecurEventList

        objEvents.LoadAll()
        Session("objEvents") = objEvents

        Me.gvEvents.DataSource = objEvents
        Me.gvEvents.DataBind()
    End Sub
    '@Author:Ali Bahaloo Hore @Method to load the dropDownList With Event Types
    Private Sub LoadRecurTypesDD()
        Dim objTypes As New clsRecurTypes

        objTypes.Load()
        Session("objTypes") = objTypes

        ddlTypes.DataSource = objTypes
        ddlTypes.DataTextField = "Name"
        ddlTypes.DataValueField = "ID"
        ddlTypes.DataBind()
    End Sub
    Protected Sub gvEvents_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvEvents.PageIndexChanging
        gvEvents.PageIndex = e.NewPageIndex
        LoadEvents()
    End Sub

    Protected Sub gvEvents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvEvents.RowDataBound
        Dim lnkbtn As LinkButton
        If e.Row.RowType <> DataControlRowType.Header And e.Row.RowType <> DataControlRowType.Footer And e.Row.RowType <> DataControlRowType.Pager Then
            lnkbtn = CType(e.Row.Cells(5).Controls(0), LinkButton)
            lnkbtn.Attributes.Add("onclick", "return confirm('Are you sure you want to remove event """ & e.Row.Cells(0).Text & """?');")
        End If
    End Sub
    '@Author:Ali Bahaloo Hore @Deleting Events from the GridView
    Protected Sub gvEvents_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvEvents.RowDeleting
        Dim objEvents As clsRecurEventList = Session("objEvents")
        Try
            CType(objEvents(gvEvents.PageIndex * gvEvents.PageSize + e.RowIndex), clsRecurEvent).Delete()
            LoadEvents()
            LoadRecurTypesDD()
        Catch ex As Exception
            Me.lblMessage.Text = ex.Message
            Me.lblMessage.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub gvEvents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvEvents.SelectedIndexChanged
        Dim objEvents As clsRecurEventList = Session("objEvents")
        Dim objEvent As clsRecurEvent = objEvents(gvEvents.PageIndex * gvEvents.PageSize + Me.gvEvents.SelectedIndex)
        Dim objTypes As clsRecurTypes = Session("objTypes")
        Dim objCalenders As clsCalenders = Session("objCalenders")

        Me.lblMessage.Text = ""

        Me.butAdd.Visible = False
        Me.pnlEditEvent.Visible = True
        Me.calStartDate.SelectedDate = objEvent.StartDate
        Me.calStartDate.VisibleDate = objEvent.StartDate
        Me.calEndDate.SelectedDate = objEvent.EndDate
        Me.calEndDate.VisibleDate = objEvent.EndDate
        '        Me.txtTitle.Text = objEvent.Title
        Me.txtDescription.Text = objEvent.Description
        'Me.txtStartTime.Text = objEvent.StartTimeStr
        'Me.txtEndTime.Text = objEvent.EndTimeStr
        For I As Integer = 0 To objTypes.Count - 1
            If objTypes(I).ID = objEvent.RecurType Then
                Me.ddlTypes.SelectedIndex = I
                Me.EndDateCellOne.Visible = Not CType(objTypes(I), clsRecurType).OccursOnce
                Me.EndDateCellTwo.Visible = Not CType(objTypes(I), clsRecurType).OccursOnce
                Me.lblDate.Text = IIf(CType(objTypes(I), clsRecurType).OccursOnce, "Event Date", "Start Date")
                Exit For
            End If
        Next I

        For I As Integer = 0 To objCalenders.Count - 1
            If objCalenders(I).ID = objEvent.Calendar Then
                'Me.ddlCalendar.SelectedIndex = I
                Exit For
            End If
        Next I

    End Sub

    Protected Sub butAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butAdd.Click
        Me.Label1.Visible = True
        Me.RadioButtonList1.Visible = True
        Me.RadioButtonList1.SelectedIndex = 0
        Me.gvEvents.Visible = False
        Me.butAdd.Visible = False
        Me.pnlEditEvent.Visible = True
        Me.calStartDate.SelectedDate = Date.Now.Date
        Me.calStartDate.VisibleDate = Date.Now.Date
        Me.calEndDate.SelectedDate = Date.Now.Date
        Me.calEndDate.VisibleDate = Date.Now.Date
        ' Me.txtTitle.Text = ""
        Me.txtDescription.Text = ""
        ' Me.txtStartTime.Text = ""
        'Me.txtEndTime.Text = ""
        Me.lblMessage.Text = ""
        Me.ddlTypes.SelectedIndex = 0
        'Me.ddlCalendar.SelectedIndex = 0
        Me.EndDateCellOne.Visible = True
        Me.EndDateCellTwo.Visible = True
        Me.lblDate.Text = "Start Date"
    End Sub

    Protected Sub butCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butCancel.Click
        Me.gvEvents.Visible = True
        Me.butAdd.Visible = True
        Me.pnlEditEvent.Visible = False
        Me.Label1.Visible = False
        Me.RadioButtonList1.Visible = False
    End Sub

    Protected Sub ddlTypes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTypes.SelectedIndexChanged
        Dim objTypes As clsRecurTypes = Session("objTypes")
        Me.lblMessage.Text = ""

        Me.EndDateCellOne.Visible = Not CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce
        Me.EndDateCellTwo.Visible = Not CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce
        Me.lblDate.Text = IIf(CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce, "Event Date", "Start Date")
    End Sub
    '@Author: Ali Bahaloo Hore @Method to assign and a create a new shift to user.
    Protected Sub butSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butSave.Click
        Dim objEvents As clsRecurEventList = Session("objEvents")
        Dim objTypes As clsRecurTypes = Session("objTypes")
        Dim objEvent As clsRecurEvent = Nothing
        Dim intID As Integer = 0

        Try
            If Me.gvEvents.Visible Then
                objEvent = objEvents(Me.gvEvents.SelectedIndex)
                intID = objEvent.ID
            End If


            objEvent = New clsRecurEvent(intID, Me.WorkerPersnoDropDownList.SelectedValue, Me.txtDescription.Text, _
                Me.calStartDate.SelectedDate, IIf(CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce, _
                Me.calStartDate.SelectedDate, Me.calEndDate.SelectedDate), Me.HourDropDownList.SelectedValue + ":" + Me.MinDropDownList.SelectedValue + " " + AMPMDropDownList.SelectedValue, _
                Me.HourEndDropDownList.SelectedValue + ":" + Me.MinEndDropDownList.SelectedValue + " " + Me.AMPMEndDropDownList.SelectedValue, Me.ddlTypes.SelectedValue, Me.ddlTypes.SelectedItem.Text, 11)

            objEvent.Save()

            Me.gvEvents.Visible = True
            Me.butAdd.Visible = True
            Me.pnlEditEvent.Visible = False

            Me.lblMessage.Text = "Event Saved!!!"
            Me.lblMessage.ForeColor = Drawing.Color.Green

            LoadEvents()
            LoadRecurTypesDD()
        Catch ex As Exception
            Me.lblMessage.Text = ex.Message
            Me.lblMessage.ForeColor = Drawing.Color.Red
        End Try
    End Sub
    '@Author: Ali Bahaloo Hore @Assign a shift to a user from avaliable shifts.
    Protected Sub AssignAV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AssignAV.Click
        Dim objEvents As clsRecurEventList = Session("objEvents")
        Dim objTypes As clsRecurTypes = Session("objTypes")
        Dim objEvent As clsRecurEvent = Nothing
        Dim intID As Integer = 0
        Try
            objEvent = New clsRecurEvent(intID, Me.DropDownList1.SelectedValue, Me.ShiftDescrDropDownList.SelectedValue, _
               Me.ShiftSDDropDownList.SelectedValue, IIf(CType(objTypes(Me.EventTypeDropDownList.SelectedIndex), clsRecurType).OccursOnce, _
                Me.ShiftSDDropDownList.SelectedValue, Me.ShiftEDDropDownList.SelectedValue), Me.ShiftSTDropDownList.SelectedValue, _
                Me.ShiftETDropDownList.SelectedValue, Me.EventTypeDropDownList.SelectedValue, Me.EventTypeDropDownList.SelectedItem.Text, 11)

            objEvent.Save()
            Me.AVLabel.Visible = True
            Me.AVLabel.Text = "Shift Booked!"
            Me.AVLabel.ForeColor = Drawing.Color.Green
        Catch ex As Exception
            Me.AVLabel.Visible = True
            Me.AVLabel.Text = ex.Message
            Me.AVLabel.ForeColor = Drawing.Color.Red
        End Try
        Try
            Dim objConn As SqlConnection
            Dim objCmd As SqlCommand
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            objConn.Open()
            objCmd = New SqlCommand("dbo.Delete_Selected_Event", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@EID", Me.ShiftDropDownList.SelectedValue)
            objCmd.ExecuteNonQuery()
            objConn.Close()
        Catch ex As Exception
            Response.Redirect("../ErrorPage.aspx")
        End Try

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If Me.RadioButtonList1.SelectedIndex = 0 Then
            Me.AvPanel.Visible = True
            Me.pnlEditEvent.Visible = False
        End If
        If Me.RadioButtonList1.SelectedIndex = 1 Then
            Me.AvPanel.Visible = False
            Me.pnlEditEvent.Visible = True
        End If
    End Sub

    Protected Sub CancelAV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelAV.Click
        Me.Label1.Visible = False
        Me.RadioButtonList1.Visible = False
    End Sub
End Class
