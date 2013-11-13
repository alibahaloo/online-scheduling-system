
Partial Class Worker_ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Page.Title = "Online Scheduling System - Change Password"
        If User.IsInRole("worker") Then
            Me.LinkButton1.Visible = False
        End If
        If User.IsInRole("manager") Then
            Me.LinkButton1.Visible = True
        End If
    End Sub
End Class
