Imports System.Data.SqlClient
Imports System.Configuration
Imports Microsoft.VisualBasic
'@Author: Ali Bahaloo Hore @the masterpage class... all of aspx files inhertis the visual components from this class.
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    '@Author: Ali Bahaloo Hore @this method enables the system to show the Full name of the user at the time they log in according to their Personal Number.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            objConn.Open()
            objCmd = New SqlCommand("Select FullName from UserInfo Where Persno= @Persno ", objConn)
            objCmd.CommandType = Data.CommandType.Text
            objCmd.Parameters.AddWithValue("@Persno", HttpContext.Current.User.Identity.Name)
            objReader = objCmd.ExecuteReader()

            Do While objReader.Read
                Me.UserName.Text = objReader.GetString(0)
            Loop
        
        Catch ex As Exception

        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class

