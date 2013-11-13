Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
'@Author: Ali Bahaloo Hore @This Class Handles the text for controls on the calendar control,the back button and next button.
Public Class clsControlText
    Private Structure StyleProps
        Public ID As Integer
        Public Control As String
        Public TextValue As String
    End Structure

    Private mudsProps As StyleProps

    Public Sub New(ByVal pControl As String)
        mudsProps.Control = pControl
        LoadText(pControl)
    End Sub

    Public Sub New(ByVal pID As Integer, ByVal pControl As String, ByVal pTextValue As String)
        mudsProps.ID = pID
        mudsProps.Control = pControl
        LoadText(pControl)
        mudsProps.TextValue = pTextValue
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

    Public ReadOnly Property Text() As String
        Get
            Return mudsProps.TextValue
        End Get
    End Property
#End Region
    '@Author:Ali Bahaloo Hore @this method retrieves text properties of the controls in the calendar from the database.
    Private Sub LoadText(ByVal pControl As String)
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand
        Dim objReader As SqlDataReader = Nothing

        Try
            '@tries to connect to the database using CMSDatabase Connection sting which is configured in web.config file.
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@SQL command line calls the usp_text_by_Control stored procedure to retrieve the text of controls in the calendar.
            objCmd = New SqlCommand("usp_Text_by_Control", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure
            objCmd.Parameters.AddWithValue("@pControl", pControl)

            objReader = objCmd.ExecuteReader()

            If objReader.Read Then
                mudsProps.ID = objReader("ID")
                mudsProps.TextValue = objReader("TextValue").ToString()
            End If
        Catch ex As Exception
            'Throw New Exception("clsControlText.LoadText - " & ex.Message)
            HttpContext.Current.Response.Redirect("../ErrorPage.aspx")
        Finally
            If Not objReader Is Nothing Then objReader.Close()
            If Not objConn Is Nothing Then objConn.Close()
        End Try
    End Sub

    Public Sub Save(ByVal pValue As String)
        Dim objConn As SqlConnection = Nothing
        Dim objCmd As SqlCommand

        Try
            '@tries to connect to the database using CMDDatabase connection string
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("CMSDatabase").ConnectionString)
            objConn.Open()
            '@uses usp_controltext_save stored procesure to save new text value for controls.
            objCmd = New SqlCommand("usp_ControlText_Save", objConn)
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
