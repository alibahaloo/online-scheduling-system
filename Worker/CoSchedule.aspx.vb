Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class CoSchedule
    Inherits System.Web.UI.Page
    Private Sub EventTypePicker_Load()
        Dim objTypes As New clsRecurTypes

        objTypes.Load()
        Session("objTypes") = objTypes

        EventTypePicker.DataSource = objTypes
        EventTypePicker.DataTextField = "Name"
        EventTypePicker.DataValueField = "ID"
        EventTypePicker.DataBind()
    End Sub
    Private Sub CalendarPicker_load()
        Dim objCalenders As New clsCalenders

        objCalenders.LoadAll()
        Session("objCalenders") = objCalenders

        CalendarPicker.DataSource = objCalenders
        CalendarPicker.DataTextField = "Name"
        CalendarPicker.DataValueField = "ID"
        CalendarPicker.DataBind()
    End Sub
    Protected Sub Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Submit.Click
        Dim objEvents As clsRecurEventList = Session("objEvents")
        Dim objTypes As clsRecurTypes = Session("objTypes")
        Dim objEvent As clsRecurEvent = Nothing
        Dim intID As Integer = 0

        Try
            'objEvent = New clsRecurEvent(intID, User.Identity.Name.ToString, Me.Task.Text, _
            '    CDate(DatePicker.Text), IIf(CType(objTypes(Me.EventTypePicker.SelectedIndex), clsRecurType).OccursOnce, _
            '    CDate(Me.DatePicker.Text), Me.EndDatePicker.SelectedDate), Me.StartTimePicker.Text, _
            '    Me.EndTimePicker.Text, Me.EventTypePicker.SelectedValue, Me.EventTypePicker.SelectedItem.Text, CInt(Me.CalendarPicker.SelectedValue))

            '        objEvent = New clsRecurEvent(intID, User.Identity.Name.ToString, Me.ShiftDropDownList.SelectedValue, _
            'CDate(DatePicker.Text), IIf(CType(objTypes(Me.EventTypePicker.SelectedIndex), clsRecurType).OccursOnce, _
            'CDate(Me.DatePicker.Text), Me.EndDatePicker.SelectedDate), Me.StartTimePicker.Text, _
            'Me.EndTimePicker.Text, Me.EventTypePicker.SelectedValue, Me.EventTypePicker.SelectedItem.Text, 5)

            objEvent = New clsRecurEvent(intID, User.Identity.Name.ToString, Me.DescriptioDropDownList.SelectedValue, _
            Me.StartDateDropDownList.SelectedValue, IIf(CType(objTypes(Me.EventTypePicker.SelectedIndex), clsRecurType).OccursOnce, _
             Me.StartDateDropDownList.SelectedValue, Me.EndDateDropDownList.SelectedValue), Me.StartTimeDropDownList.SelectedValue, _
             Me.EndTimeDropDownList.SelectedValue, Me.EventTypePicker.SelectedValue, Me.EventTypePicker.SelectedItem.Text, 11)
     
            objEvent.Save()
            Me.MessageLabel.Visible = True
            Me.MessageLabel.Text = "Shift Booked!"
            Me.MessageLabel.ForeColor = Drawing.Color.Green

        Catch ex As Exception
            Me.MessageLabel.Visible = True
            Me.MessageLabel.Text = ex.Message
            Me.MessageLabel.ForeColor = Drawing.Color.Red
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Page.Title = "Online Scheduling System - Company's Schedule"
        EventTypePicker_Load()
        CalendarPicker_load()
        Me.Page.Title = "Online Scheduling System - Company's Schedule"
        Me.EventTypePicker.SelectedIndex = 4
        Me.CalendarPicker.SelectedIndex = 0
        If Page.IsPostBack = False Then
            Me.FilterRadioList.SelectedIndex = 0

        End If
        If User.IsInRole("worker") Then
            Me.LinkButton1.Visible = False
        End If
        If User.IsInRole("manager") Then
            Me.LinkButton1.Visible = True
        End If
    End Sub

    Protected Sub FilterRadioList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FilterRadioList.SelectedIndexChanged
        If Me.FilterRadioList.SelectedIndex = 0 Then
            Me.FilterLabel.Text = "Available Shifts"
        End If
        If Me.FilterRadioList.SelectedIndex = 1 Then
            Me.FilterLabel.Text = "Company's Schedule"
        End If

        If Me.FilterRadioList.SelectedIndex = 0 Then
            Me.AvailableShiftW.Visible = True
            Me.CompanyScheduleW.Visible = False
        End If
        If Me.FilterRadioList.SelectedIndex = 1 Then
            Me.AvailableShiftW.Visible = False
            Me.CompanyScheduleW.Visible = True
        End If
    
    End Sub
    Protected Sub DatePicker_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DatePicker.SelectionChanged
        Me.Panel1.Visible = True
    End Sub

    Protected Sub ShiftDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ShiftDropDownList.SelectedIndexChanged
        If Me.ShiftDropDownList.SelectedValue = String.Empty Then
            Me.Panel1.Visible = False
        End If
    End Sub
End Class
