Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

'@Authors: S. Samad Ghasemi @ Retrieving messages according the user to ahow in the Inbox.
Partial Class Worker_Inbox
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        InvisNameLabel.Text = User.Identity.Name
        If User.IsInRole("worker") Then
            Me.LinkButton1.Visible = False
        End If
        If User.IsInRole("manager") Then
            Me.LinkButton1.Visible = True
        End If
    End Sub

    Protected Sub InboxGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles InboxGridView.SelectedIndexChanged
        InboxDetailsView.PageIndex = InboxGridView.SelectedIndex
    End Sub

    '@Authors: S. Samad Ghasemi @ When there is no message to show, system will notify the user.
    Protected Sub InboxGridView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles InboxGridView.DataBound
        If InboxGridView.Rows.Count = 0 Then
            InboxPanel.Visible = False
            noMessageLabel.Visible = True
        End If
    End Sub
End Class
