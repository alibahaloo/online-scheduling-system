Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
'@Authors: S. Samad Ghasemi @ Handles creation of new announcements
Partial Class Admin_MakeAnnouncement
    Inherits System.Web.UI.Page
    '@Authors: S. Samad Ghasemi @ this method is for creating new announcements.
    Protected Sub SubmitAnnouncement_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitAnnouncementButton.Click

        '@Authors: S. Samad Ghasemi @ Changes the 'Enter' characters to its equivalant html so the system can keep track of breakLines when retrieving data from the dataBase.
        AnnouncementTextBox.Text = AnnouncementTextBox.Text.Replace(Chr(10), "<br>")
        Dim curName As CurrentName = New CurrentName

        Dim objConn As SqlConnection
        Dim objCmd As SqlCommand

        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            objConn.Open()

            objCmd = New SqlCommand("MakeAnnouncement", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objCmd.Parameters.AddWithValue("@Announcement", AnnouncementTextBox.Text)
            objCmd.Parameters.AddWithValue("@Subject", SubjectTextBox.Text)
            objCmd.Parameters.AddWithValue("@Maker", curName.getCurrentName(User.Identity.Name))
            objCmd.Parameters.AddWithValue("@aDate", DateTime.Now)
            objCmd.Parameters.AddWithValue("@MakerPersNo", User.Identity.Name)

            objCmd.ExecuteNonQuery()
            objConn.Close()

        Catch ex As Exception
            Response.Redirect("../ErrorPage.aspx")
        End Try

        SubjectTextBox.Text = ""
        AnnouncementTextBox.Text = ""
        successLabel.Visible = True

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If Me.RadioButtonList1.SelectedIndex = 0 Then
            Me.GridView1.Visible = False
            Me.newannouncement.Visible = True
        End If
        If Me.RadioButtonList1.SelectedIndex = 1 Then
            Me.GridView1.Visible = True
            Me.newannouncement.Visible = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Me.RadioButtonList1.SelectedIndex = 0
        End If
    End Sub
End Class
