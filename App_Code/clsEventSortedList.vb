Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: Ali Bahaloo Hore @this class Handles the sorting of events.
Public Class clsEventSortedList

    Private mobjRecurEvents As clsRecurEventList

    Public Sub LoadbyDateRange(ByVal pCalendar As Integer, ByVal pStartDate As Date, ByVal pEndDate As Date)

        Try
            '@Creates a new object of type clsRecuEventList Class
            mobjRecurEvents = New clsRecurEventList
            mobjRecurEvents.LoadbyDateRange(pCalendar, pStartDate, pEndDate)
        Catch ex As Exception
            'Throw New Exception("clsEventList.LoadbyDateRange - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        End Try
    End Sub

    '@Author:Ali Bahaloo Hore @manages events which are created.
    Public Function EventsbyDay(ByVal pDate As Date) As ArrayList
        Dim objList As New ArrayList
        'Dim objEvent As clsEvent
        Dim objRecurEvent As clsRecurEvent
        Dim booInserted As Boolean

        For I As Integer = 0 To mobjRecurEvents.Count - 1 'add recurring events and insert in chronological order(order of time)
            objRecurEvent = CType(mobjRecurEvents(I), clsRecurEvent)
            If objRecurEvent.IsEventDate(pDate) Then
                booInserted = False
                For J As Integer = 0 To objList.Count - 1
                    If CType(objList(J), clsRecurEvent).StartTime.Hour > objRecurEvent.StartTime.Hour Then
                        objList.Insert(J, objRecurEvent)
                        booInserted = True
                        Exit For
                    End If
                Next J
                If Not booInserted Then
                    objList.Add(objRecurEvent)
                End If
            End If
        Next I

        Return objList
    End Function
End Class
