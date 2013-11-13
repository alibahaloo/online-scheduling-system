'@Author: Ali Bahaloo Hore @This class is responsible for all functionalities that are handled by the AdminManageEvents Control.
'This control is designed for the manager tool to manage shifts.
Partial Class Controls_AdminManageEvents
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            LoadEvents()
            LoadRecurTypesDD()
        End If
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
        Me.txtTitle.Text = objEvent.Title
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
        Try
            For I As Integer = 0 To objCalenders.Count - 1
                If objCalenders(I).ID = objEvent.Calendar Then
                    'Me.ddlCalendar.SelectedIndex = I
                    Exit For
                End If
            Next I
        Catch ex As Exception
            Response.Redirect("../ErrorPage.aspx")
        End Try
    End Sub

    Protected Sub butAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butAdd.Click
        Me.gvEvents.Visible = False
        Me.butAdd.Visible = False
        Me.pnlEditEvent.Visible = True
        Me.calStartDate.SelectedDate = Date.Now.Date
        Me.calStartDate.VisibleDate = Date.Now.Date
        Me.calEndDate.SelectedDate = Date.Now.Date
        Me.calEndDate.VisibleDate = Date.Now.Date
        Me.txtTitle.Text = ""
        Me.txtDescription.Text = ""
        'Me.txtStartTime.Text = ""
        'Me.txtEndTime.Text = ""
        Me.lblMessage.Text = ""
        Me.ddlTypes.SelectedIndex = 0
        ' Me.ddlCalendar.SelectedIndex = 0
        Me.EndDateCellOne.Visible = True
        Me.EndDateCellTwo.Visible = True
        Me.lblDate.Text = "Start Date"
    End Sub

    Protected Sub butCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butCancel.Click
        Me.gvEvents.Visible = True
        Me.butAdd.Visible = True
        Me.pnlEditEvent.Visible = False
    End Sub

    Protected Sub ddlTypes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTypes.SelectedIndexChanged
        Dim objTypes As clsRecurTypes = Session("objTypes")
        Me.lblMessage.Text = ""

        Me.EndDateCellOne.Visible = Not CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce
        Me.EndDateCellTwo.Visible = Not CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce
        Me.lblDate.Text = IIf(CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce, "Event Date", "Start Date")
    End Sub
    '@Author: Ali Bahaloo Hore @Method to save new shifts to the database,
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

            'objEvent = New clsRecurEvent(intID, Me.txtTitle.Text, Me.txtDescription.Text, _
            '    Me.calStartDate.SelectedDate, IIf(CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce, _
            '    Me.calStartDate.SelectedDate, Me.calEndDate.SelectedDate), Me.txtStartTime.Text, _
            '    Me.txtEndTime.Text, Me.ddlTypes.SelectedValue, Me.ddlTypes.SelectedItem.Text, 10)

            objEvent = New clsRecurEvent(intID, Me.txtTitle.Text, Me.txtDescription.Text, _
                Me.calStartDate.SelectedDate, IIf(CType(objTypes(Me.ddlTypes.SelectedIndex), clsRecurType).OccursOnce, _
                Me.calStartDate.SelectedDate, Me.calEndDate.SelectedDate), Me.HourDropDownList.SelectedValue + ":" + Me.MinDropDownList.SelectedValue + " " + AMPMDropDownList.SelectedValue, _
                Me.HourEndDropDownList.SelectedValue + ":" + Me.MinEndDropDownList.SelectedValue + " " + Me.AMPMEndDropDownList.SelectedValue, Me.ddlTypes.SelectedValue, Me.ddlTypes.SelectedItem.Text, 10)


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
End Class
