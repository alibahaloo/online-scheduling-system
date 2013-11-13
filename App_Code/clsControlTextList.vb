Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: Ali Bahaloo Hore @this class handles the listing functions of the controls in the admin pages.
Public Class clsControlTextList
    Inherits ArrayList

    Public Overloads ReadOnly Property Item(ByVal pID As Integer) As clsControlText
        Get
            Dim objText As clsControlText = Nothing
            For I As Integer = 0 To Count - 1
                If Me(I).ID = pID Then
                    objText = Me(I)
                    Exit For
                End If
            Next I
            Return objText
        End Get
    End Property
    '@Author: Ali Bahaloo Hore @method to load all control text values of the calendar. Back and forward button.
    Public Sub LoadAll()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            '@Tries to connect to the database using CMSDatabase connection string which is defined in web.config.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@SQL Command Line calls teh usp_controltext_getall stored procedure in order to retrieve all text values of the controls.
            objCmd = New SqlCommand("usp_ControlText_GetAll", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure


            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsControlText(objReader("ID"), objReader("Control").ToString(), objReader("TextValue").ToString()))
            Loop
        Catch ex As Exception
            'Throw New Exception("clsControlTextList.LoadAll - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class
