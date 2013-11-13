Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author:Ali Bahaloo Hore @This Class Handles the differant calenders instances. The ID property is the same ID that is used when setting Calendar property of the Calendar control.
Public Class clsCalenders
    Inherits ArrayList
    '@Author:Ali Bahaloo Hore @this function loads all calendars(Existings ones in the database)
    Public Sub LoadAll()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing
        '@Author:Ali Bahaloo Hore @SQL command to get calendar data from the databse using "CMSDatabase" connection string
        '@all authentications are done in the web.config file in root folder
        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            '@Opens the connection to SQL server
            objConn.Open()
            '@calls the SQL stored procedure ups_calendars_getall by a SQL command line to get retrieve all calendars stored in the database.
            objCmd = New SqlCommand("dbo.usp_Calendars_GetAll", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsCalender(objReader("ID"), objReader("Name").ToString()))
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

Public Class clsCalender
    Private Structure CalenderProps
        Public ID As Integer
        Public Name As String
    End Structure

    Private mudsProps As CalenderProps

    Public Sub New(ByVal pID As Integer, ByVal pName As String)
        mudsProps.ID = pID
        mudsProps.Name = pName
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
    '@Author:Ali Bahaloo Hore @Adding new calendar to the system, this function adds and saves the created calendar into the database
    Public Sub Save(ByVal pValue As String)
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand

        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            'usp_calendars_save Stored Procedure is called by SQL command line to save a new calendar into the database.
            objCmd = New SqlCommand("usp_Calendars_Save", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@pID", ID)
            objCmd.Parameters.AddWithValue("@pName", pValue)

            objCmd.ExecuteNonQuery()

        Catch ex As Exception
            'Throw New Exception("clsCalender.Save - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
    '@Author:Ali Bahaloo Hore @deleting existing calendars from the calendars table in the database.
    Public Sub Delete()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        '
        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            'usp_calendars_delete stored procedure is called by SQL command line to delete existing calendars from the database.
            objCmd = New SqlCommand("usp_Calendars_Delete", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@pID", ID)

            objCmd.ExecuteNonQuery()

        Catch ex As Exception
            'Throw New Exception("clsCalender.Delete - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class
