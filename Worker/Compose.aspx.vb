Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

'@Authors: S. Samad Ghasemi @ handles sending messages through the system.
Partial Class Worker_Compose
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If User.IsInRole("worker") Then
            Me.LinkButton1.Visible = False
        End If
        If User.IsInRole("manager") Then
            Me.LinkButton1.Visible = True
        End If
    End Sub

    '@Authors: S. Samad Ghasemi @ save the messages in the dataBase.
    Protected Sub SendButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SendButton.Click

        '@Authors: S. Samad Ghasemi @ Changes the 'Enter' characters to its equivalant html so the system can keep track of breakLines when retrieving data from the dataBase.
        MessageTextBox.Text = MessageTextBox.Text.Replace(Chr(10), "<br>")
        Dim curName As CurrentName = New CurrentName
        Dim objConn As SqlConnection
        Dim objCmd As SqlCommand

        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            objConn.Open()

            objCmd = New SqlCommand("MessageInsert", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objCmd.Parameters.AddWithValue("@subject", SubjectTextBox.Text)
            objCmd.Parameters.AddWithValue("@sender", curName.getCurrentName(User.Identity.Name))
            objCmd.Parameters.AddWithValue("@reciept", NamesDropDownList.SelectedValue.ToString)
            objCmd.Parameters.AddWithValue("@recieptName", NamesDropDownList.SelectedItem.ToString)
            objCmd.Parameters.AddWithValue("@message", MessageTextBox.Text)
            objCmd.Parameters.AddWithValue("@senderPersNo", User.Identity.Name)

            objCmd.ExecuteNonQuery()
            objConn.Close()

        Catch ex As Exception
            Response.Redirect("../ErrorPage.aspx")
        End Try

        NamesDropDownList.SelectedIndex = 0
        SubjectTextBox.Text = ""
        MessageTextBox.Text = ""
        SentMessage.Visible = True

    End Sub

End Class
