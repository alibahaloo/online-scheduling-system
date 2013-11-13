'@Author: Ali Bahaloo Hore @this class for changing the styles of the calendar components. all of the actions are handled by a custom
'made control AdminManageStyles.ascx.
Partial Class Admin_ManageStyles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Page.Title = "Online Scheduling System - Manager Tools - Manage Style"
        If Page.IsPostBack = False Then
            Me.RadioButtonList1.SelectedIndex = 0
        End If
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If Me.RadioButtonList1.SelectedIndex = 0 Then
            Me.AdminManageContent1.Visible = True
            Me.AdminManageStyles1.Visible = False
        End If
        If Me.RadioButtonList1.SelectedIndex = 1 Then
            Me.AdminManageContent1.Visible = False
            Me.AdminManageStyles1.Visible = True
        End If
    End Sub
End Class
