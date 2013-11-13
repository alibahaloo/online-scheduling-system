Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: S. Samad Ghasemi @ This class handles retrieving the User's full name according to its personal number.
Public Class CurrentName

    Dim CurrentName As String
    '@Author: S. Samad Ghasemi @ This method gets the personal number and returns the user's full name as a String.
    Public Function getCurrentName(ByVal str As String) As String

        Dim objConn As SqlConnection
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader

        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            objConn.Open()

            objCmd = New SqlCommand("nameOfCurrentUser", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objCmd.Parameters.AddWithValue("@personalNumber", str)
            objReader = objCmd.ExecuteReader()
            'Dim i As Integer = 0
            While objReader.Read()
                CurrentName += objReader.GetString(0)
                'i += 1
            End While

            objReader.Close()
            objConn.Close()

        Catch ex As Exception
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        End Try

        Return CurrentName
    End Function

End Class
