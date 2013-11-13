Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: Ali Bahalo Hore @this class handles a group of events. Used by the calendar to get the specific dates in the given date range. The admin controls use this for getting all the events for manipulation
Public Class clsRecurEventList
    Inherits ArrayList
    '@Author:Ali Bahaloo Hore @lists up the dates in date order. first it retrieves all data ans sorts them.
    Public Sub LoadbyDateRange(ByVal pCalendar As Integer, ByVal pStartDate As Date, ByVal pEndDate As Date)
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            '@Tries to connect to the database using the web.config connection string.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@using the usp_RecurEvents_by_date_range to store in date order.
            objCmd = New SqlCommand("dbo.usp_RecurEvents_by_Date_Range", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@pCalendar", pCalendar)
            objCmd.Parameters.AddWithValue("@pStartDate", pStartDate)
            objCmd.Parameters.AddWithValue("@pEndDate", pEndDate)

            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsRecurEvent(objReader("ID"), objReader("Title").ToString(), objReader("Description").ToString(), objReader("StartDate"), objReader("EndDate"), objReader("StartTime"), objReader("EndTime"), objReader("RecurType"), objReader("RecurType").ToString(), objReader("Calendar")))
            Loop
        Catch ex As Exception
            'Throw New Exception("clsRecurEventList.LoadbyDateRange - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
    '@Author: Ali Bahaloo Hore @this method is to load all events that are saved in the database.
    Public Sub LoadAll()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            '@Tries to connect to the database using the connection string that is defined in the web.config file.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@SQL command line to call usp_RecurEvents_Loadall to load all events that are saved in the database.
            objCmd = New SqlCommand("dbo.usp_RecurEvents_LoadAll", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsRecurEvent(objReader("ID"), objReader("Title").ToString(), objReader("Description").ToString(), objReader("StartDate"), objReader("EndDate"), objReader("StartTime"), objReader("EndTime"), objReader("RecurType"), objReader("RecurTypeStr").ToString(), objReader("Calendar")))
            Loop
        Catch ex As Exception
            'Throw New Exception("clsRecurEventList.LoadAll - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
    Public Sub Load_By_Calendar_ID()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing
        Dim CID As Integer = 10
        Try
            '@Tries to connect to the database using the connection string that is defined in the web.config file.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@SQL command line to call usp_RecurEvents_Loadall to load all events that are saved in the database.
            objCmd = New SqlCommand("dbo.usp_RecurEvents_LoadAll_Cal10", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@CID", CID)

            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsRecurEvent(objReader("ID"), objReader("Title").ToString(), objReader("Description").ToString(), objReader("StartDate"), objReader("EndDate"), objReader("StartTime"), objReader("EndTime"), objReader("RecurType"), objReader("RecurTypeStr").ToString(), objReader("Calendar")))
            Loop
        Catch ex As Exception
            'Throw New Exception("clsRecurEventList.Load_By_Calendar_ID - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class
