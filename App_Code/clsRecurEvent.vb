Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author:Ali Bahaloo Hore @the class handles a specific event on the calendar.
Public Class clsRecurEvent
    Public Enum RecurTypes
        Daily = 1
        Weekly = 2
        BiWeekly = 3
        SemiMonthly = 4
        Monthly = 5
        Quarterly = 6
        Yearly = 7
        DailyWeekDaysOnly = 8
        OneTime = 9
    End Enum

    Private Structure RecurProps
        Public ID As Integer
        Public Title As String
        Public Description As String
        Public StartDate As Date
        Public EndDate As Date
        Public StartTime As Date
        Public EndTime As Date
        Public RecurType As RecurTypes
        Public RecurTypeStr As String
        Public Calendar As Integer
    End Structure

    Private RecurDates As ArrayList

    Private mudsProps As RecurProps
    '@Author: Ali Bahaloo Hore @Constructor for initializatoin of fields.
    Public Sub New(ByVal pID As Integer, ByVal pTitle As String, ByVal pDescription As String, ByVal pStartDate As Date, ByVal pEndDate As Date, ByVal pStartTime As Date, ByVal pEndTime As Date, ByVal pRecurType As RecurTypes, ByVal pRecurTypeStr As String, ByVal pCalendar As Integer)
        mudsProps.ID = pID
        mudsProps.Title = pTitle
        mudsProps.Description = pDescription
        mudsProps.StartDate = pStartDate
        mudsProps.EndDate = pEndDate
        mudsProps.StartTime = pStartTime
        mudsProps.EndTime = pEndTime
        mudsProps.RecurType = pRecurType
        mudsProps.RecurTypeStr = pRecurTypeStr
        mudsProps.Calendar = pCalendar
        RecurDates = New ArrayList
        LoadRecurDates()
    End Sub

#Region " Properties "
    Public ReadOnly Property ID() As Integer
        Get
            Return mudsProps.ID
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            Return mudsProps.Title
        End Get
    End Property

    Public ReadOnly Property Description() As String
        Get
            Return mudsProps.Description
        End Get
    End Property

    Public ReadOnly Property StartDate() As Date
        Get
            Return mudsProps.StartDate
        End Get
    End Property

    Public ReadOnly Property EndDate() As Date
        Get
            Return mudsProps.EndDate
        End Get
    End Property

    Public ReadOnly Property StartTime() As Date
        Get
            Return mudsProps.StartTime
        End Get
    End Property

    Public ReadOnly Property StartTimeStr() As String
        Get
            Return Format(mudsProps.StartTime, "h:mm tt")
        End Get
    End Property

    Public ReadOnly Property EndTime() As Date
        Get
            Return mudsProps.EndTime
        End Get
    End Property

    Public ReadOnly Property EndTimeStr() As String
        Get
            Return Format(mudsProps.EndTime, "h:mm tt")
        End Get
    End Property

    Public ReadOnly Property RecurType() As RecurTypes
        Get
            Return mudsProps.RecurType
        End Get
    End Property

    Public ReadOnly Property RecurTypeStr() As String
        Get
            Return mudsProps.RecurTypeStr
        End Get
    End Property

    Public ReadOnly Property Calendar() As Integer
        Get
            Return mudsProps.Calendar
        End Get
    End Property
#End Region
    '@Author:Ali Bahaloo Hore @loads dates of the events,each event has a date, this method retrieves those dates from the database.
    Private Sub LoadRecurDates()
        Dim tmpDate As Date = StartDate

        RecurDates.Clear()

        If RecurType <> RecurTypes.OneTime Then
            Do Until DateDiff(DateInterval.Day, tmpDate, EndDate) < 0
                If RecurType <> RecurTypes.DailyWeekDaysOnly Or (RecurType = RecurTypes.DailyWeekDaysOnly And tmpDate.DayOfWeek <> DayOfWeek.Saturday And tmpDate.DayOfWeek <> DayOfWeek.Sunday) Then
                    RecurDates.Add(tmpDate)
                End If
                Select Case RecurType
                    Case RecurTypes.Daily
                        tmpDate = DateAdd(DateInterval.Day, 1, tmpDate)
                    Case RecurTypes.Weekly
                        tmpDate = DateAdd(DateInterval.Day, 7, tmpDate)
                    Case RecurTypes.BiWeekly
                        tmpDate = DateAdd(DateInterval.Day, 14, tmpDate)
                    Case RecurTypes.SemiMonthly
                        'tmpDate = DateAdd(DateInterval.Month, 0.5, tmpDate)
                        If tmpDate.Day = StartDate.Day Then
                            tmpDate = DateAdd(DateInterval.Day, 15, tmpDate)
                        Else
                            tmpDate = DateAdd(DateInterval.Month, 1, CDate(tmpDate.Month & "/" & StartDate.Day & "/" & tmpDate.Year))
                        End If
                    Case RecurTypes.Monthly
                        tmpDate = DateAdd(DateInterval.Month, 1, tmpDate)
                    Case RecurTypes.Quarterly
                        tmpDate = DateAdd(DateInterval.Month, 3, tmpDate)
                    Case RecurTypes.Yearly
                        tmpDate = DateAdd(DateInterval.Year, 1, tmpDate)
                    Case RecurTypes.DailyWeekDaysOnly
                        tmpDate = DateAdd(DateInterval.Day, 1, tmpDate)
                        If tmpDate.DayOfWeek = DayOfWeek.Saturday Or tmpDate.DayOfWeek = DayOfWeek.Sunday Then
                            Do Until tmpDate.DayOfWeek = DayOfWeek.Monday
                                tmpDate = DateAdd(DateInterval.Day, 1, tmpDate)
                            Loop
                        End If
                End Select
            Loop
        Else
            RecurDates.Add(tmpDate)
        End If
    End Sub

    Public Function IsEventDate(ByVal pDate As Date) As Boolean
        Dim booIsEventDate As Boolean = False

        For I As Integer = 0 To RecurDates.Count - 1
            If DateDiff(DateInterval.Day, pDate.Date, CDate(RecurDates(I)).Date) = 0 Then
                booIsEventDate = True
                Exit For
            End If
        Next I

        Return booIsEventDate
    End Function
    '@Author:Ali Bahaloo Hore @this method is responsible to save new events into the DB
    Public Sub Save()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand

        Try
            '@tries to connect to the database using the connection string which is coded in the web.config
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            '@opens the connection with "CMSDatabase" Connection string
            objConn.Open()
            '@using the SQL command line to call usp_RecurEvents_Save Stored Procedure to save new events.
            objCmd = New SqlCommand("usp_RecurEvents_Save", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            '@Each event has the following parameters.these are saved into the database.
            objCmd.Parameters.AddWithValue("@pID", ID)
            objCmd.Parameters.AddWithValue("@pTitle", Title)
            objCmd.Parameters.AddWithValue("@pDescription", Description)
            objCmd.Parameters.AddWithValue("@pStartTime", DateAdd(DateInterval.Year, 1800, StartTime))
            objCmd.Parameters.AddWithValue("@pEndTime", DateAdd(DateInterval.Year, 1800, EndTime))
            objCmd.Parameters.AddWithValue("@pStartDate", StartDate)
            objCmd.Parameters.AddWithValue("@pEndDate", EndDate)
            objCmd.Parameters.AddWithValue("@pRecurType", RecurType)
            objCmd.Parameters.AddWithValue("@pCalendar", Calendar)

            objCmd.ExecuteNonQuery()

        Catch ex As Exception
            ' Throw New Exception("clsRecurEvent.Save - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
    '@Author:Ali Bahaloo Hore @this method is to delete existing data from the table.
    Public Sub Delete()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand

        Try
            '@tries to connect to the database using the connection string which is coded in the web.config
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            'SQL command line to call usp_RecurEvents_Delete stored Procedure to delete existing events in the calendar.
            objCmd = New SqlCommand("usp_RecurEvents_Delete", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@pID", ID)

            objCmd.ExecuteNonQuery()

        Catch ex As Exception
            'Throw New Exception("clsRecurEvent.Delete - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class
