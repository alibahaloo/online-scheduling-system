'@Authors: S. Samad Ghasemi @ Shows the sent messages of the user.
Partial Class Worker_Default2
    Inherits System.Web.UI.Page

    Protected Sub SentGridView_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles SentGridView.SelectedIndexChanging
        SentDetailsView.PageIndex = SentGridView.SelectedIndex
    End Sub

    '@Authors: S. Samad Ghasemi @ When there is no message to show, system will notify the user.
    Protected Sub SentGridView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles SentGridView.DataBound
        If SentGridView.Rows.Count = 0 Then
            SentPanel.Visible = False
            noMessageLabel.Visible = True
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        InvisNameLabel.Text = User.Identity.Name
    End Sub
End Class