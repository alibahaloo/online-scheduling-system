'@Author: Ali Bahaloo Hore @this class is designed for Managing shift. note that all shift management events are handled by
'AdminManageEvents.ascx or AdminAssignShift.ascx depending on the manager's choise which are custom made controls.
Partial Class Admin_ManageShifts
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Page.Title = "Online Scheduling System - Manager Tools - Manage Shifts"
        If Me.Page.IsPostBack = False Then
            Me.RadioButtonList1.SelectedIndex = 0
        End If
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If Me.RadioButtonList1.SelectedIndex = 1 Then
            Me.AdminAssignShift1.Visible = True
            Me.AdminManageEvents1.Visible = False
        End If
        If Me.RadioButtonList1.SelectedIndex = 0 Then
            Me.AdminAssignShift1.Visible = False
            Me.AdminManageEvents1.Visible = True
        End If
    End Sub
End Class
