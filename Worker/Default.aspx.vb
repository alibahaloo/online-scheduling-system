'@Authors: S. Samad Ghasemi @  displays the available announcements in the homePage
Partial Class Worker_Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If User.IsInRole("worker") Then
            Me.LinkButton1.Visible = False
        End If
        If User.IsInRole("manager") Then
            Me.LinkButton1.Visible = True
        End If
    End Sub

    '@Authors: S. Samad Ghasemi @ This method set the page of DetailsView by index of the GridView so when a line in the gridView is selected the information will be shown in the detailsView.
    Protected Sub AnnouncementGridView_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles AnnouncementGridView.SelectedIndexChanging

        If AnnouncementDetailsView.Visible = False Then
            AnnouncementDetailsView.Visible = True
        End If

        AnnouncementDetailsView.PageIndex = AnnouncementGridView.SelectedIndex

    End Sub
End Class
