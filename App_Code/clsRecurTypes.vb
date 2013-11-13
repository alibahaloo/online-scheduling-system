Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: Ali Bahaloo Hore @the class loads the list of recurrence types from the database. Used in the admin controls.
Public Class clsRecurTypes
    Inherits ArrayList
    '@Author: Ali Bahaloo Hore @this method loads saved events.
    Public Sub Load()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            '@tries to connect to the database using the web.config connection string.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@SQL command line to call usp_recurtype_load stored procedure to load saved events from the database.
            objCmd = New SqlCommand("dbo.usp_RecurType_Load", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsRecurType(objReader("ID"), objReader("Name").ToString(), (objReader("OccursOnce").ToString() = "Y")))
            Loop
        Catch ex As Exception
            'Throw New Exception("clsRecurTypes.LoadAll - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class

Public Class clsRecurType
    Private Structure RecurTypeProps
        Public ID As Integer
        Public Name As String
        Public OccursOnce As Boolean
    End Structure

    Private mudsProps As RecurTypeProps

    Public Sub New(ByVal pID As Integer, ByVal pName As String, ByVal pOccursOnce As Boolean)
        mudsProps.ID = pID
        mudsProps.Name = pName
        mudsProps.OccursOnce = pOccursOnce
    End Sub

    Public ReadOnly Property ID() As Integer
        Get
            Return mudsProps.ID
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mudsProps.Name
        End Get
    End Property

    Public ReadOnly Property OccursOnce() As Boolean
        Get
            Return mudsProps.OccursOnce
        End Get
    End Property
End Class
