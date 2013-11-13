
Partial Class Worker_Redirection
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If User.IsInRole("manager") Then
            Response.Redirect("../admin/default.aspx")
        Else
            Response.Redirect("../worker/default.aspx")
        End If
    End Sub
End Class
