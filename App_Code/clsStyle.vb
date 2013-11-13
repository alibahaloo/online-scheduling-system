Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: Ali Bahaloo Hore @the class holds the information for a specific CSS style that is applied to the calendar. this function is in admin pages.
Public Class clsStyle
    Private Structure StyleProps
        Public ID As Integer
        Public Control As String
        Public StyleKey As String
        Public StyleValue As String
    End Structure

    Private mudsProps As StyleProps

    Public Sub New(ByVal pID As Integer, ByVal pControl As String, ByVal pStyleKey As String, ByVal pStyleValue As String)
        mudsProps.ID = pID
        mudsProps.Control = pControl
        mudsProps.StyleKey = pStyleKey
        mudsProps.StyleValue = pStyleValue
    End Sub

#Region "Properties"
    Public ReadOnly Property ID() As Integer
        Get
            Return mudsProps.ID
        End Get
    End Property

    Public ReadOnly Property Control() As String
        Get
            Return mudsProps.Control
        End Get
    End Property

    Public ReadOnly Property StyleKey() As String
        Get
            Return mudsProps.StyleKey
        End Get
    End Property

    Public ReadOnly Property StyleValue() As String
        Get
            Return mudsProps.StyleValue
        End Get
    End Property
#End Region
    '@Author: Ali Bahaloo Hore @method to save new styles of the calendar control into the database.
    Public Sub Save(ByVal pValue As String)
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand

        Try
            '@tries to connect to database using CMSDatabase connection srting from the web.config file
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@SQL command line to call usp_Styles_Save stored procedure to save new style values.
            objCmd = New SqlCommand("usp_Styles_Save", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@pID", ID)
            objCmd.Parameters.AddWithValue("@pValue", pValue)

            objCmd.ExecuteNonQuery()

        Catch ex As Exception
            'Throw New Exception("clsRecurEvent.Save - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class
