Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: Ali Bahaloo Hore @Loads the list of styles objects (clsStyle.vb) used by the Calendar.
Public Class clsStyleList
    Inherits ArrayList

    Public Overloads ReadOnly Property Item(ByVal pID As Integer) As clsStyle
        Get
            Dim objStyle As clsStyle = Nothing
            For I As Integer = 0 To Count - 1
                If Me(I).ID = pID Then
                    objStyle = Me(I)
                    Exit For
                End If
            Next I
            Return objStyle
        End Get
    End Property
    '@Author: Ali Bahaloo Hore @this method lists up each style according to its control. each control has its own style.
    Public Sub LoadStylesbyControl(ByVal pControl As String)
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            '@tries to connect to the database using "CMSDatabase" connection string.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@SQL Command Line to call usp_Styles_by_Control stored procedure to retrieve each controls style parameters.
            objCmd = New SqlCommand("usp_Styles_by_Control", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@pControl", pControl)

            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsStyle(objReader("ID"), objReader("Control").ToString(), objReader("StyleKey").ToString(), objReader("StyleValue").ToString()))
            Loop
        Catch ex As Exception
            'Throw New Exception("clsStyleList.LoadStylesbyControl - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
    '@Author: Ali Bahaloo Hore @method to retrieve all style parametes regardless of their controls.
    Public Sub LoadAll()
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            '@tries to connect to the database usnig "CMSDatabase" connection string which is defined the web.confing.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@calls usp_styles_getall stored procedure by an SQL command line to retrieve all style values.
            objCmd = New SqlCommand("usp_Styles_GetAll", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure


            objReader = objCmd.ExecuteReader()

            Me.Clear()

            Do While objReader.Read
                Add(New clsStyle(objReader("ID"), objReader("Control").ToString(), objReader("StyleKey").ToString(), objReader("StyleValue").ToString()))
            Loop
        Catch ex As Exception
            'Throw New Exception("clsStyleList.LoadAll - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub
End Class
