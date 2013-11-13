'@Author: Ali Bahaloo Hore @This class is responsible for Contents of the calendar components.
Partial Class Controls_AdminManageContent
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            LoadText()
        End If
    End Sub
    '@Author: Ali Bahaloo Hore @This method is to load the text of contents.
    Private Sub LoadText()
        Dim objTextList As New clsControlTextList

        Try
            objTextList.LoadAll()

            For I As Integer = objTextList(0).ID To objTextList(objTextList.Count - 1).ID
                If Not objTextList.Item(I) Is Nothing Then
                    CType(Me.FindControl("txt" & I), System.Web.UI.WebControls.TextBox).Text = objTextList.Item(I).Text
                End If
            Next I
        Catch ex As Exception
            Me.lblMessage.Text = ex.Message
            Me.lblMessage.ForeColor = Drawing.Color.Red
        End Try
    End Sub
    '@Author: Ali Bahaloo Hore @This method is to save the new contents into the database.
    Protected Sub butSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butSave.Click
        Dim objTextList As New clsControlTextList

        Try
            objTextList.LoadAll()

            For I As Integer = objTextList(0).ID To objTextList(objTextList.Count - 1).ID
                If Not objTextList.Item(I) Is Nothing Then
                    objTextList.Item(I).Save(CType(Me.FindControl("txt" & I), System.Web.UI.WebControls.TextBox).Text)
                End If
            Next I

            Me.lblMessage.Text = "Save Successful!"
            Me.lblMessage.ForeColor = Drawing.Color.Green
        Catch ex As Exception
            Me.lblMessage.Text = ex.Message
            Me.lblMessage.ForeColor = Drawing.Color.Red
        End Try
    End Sub
End Class
