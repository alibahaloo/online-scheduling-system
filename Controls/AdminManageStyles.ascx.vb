'@Author:Ali Bahaloo Hore @This class is for ManageStyles Control. with this control the manager can edit the style of calenda components.
Partial Class Controls_AdminManageStyles
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            LoadStyles()
        End If
    End Sub
    '@Author: Ali Bahaloo Hore @ this method loads all styles that are read from the database and lists them.
    Private Sub LoadStyles()
        Dim objStyles As New clsStyleList

        Try
            objStyles.LoadAll()

            For I As Integer = objStyles(0).ID To objStyles(objStyles.Count - 1).ID
                If Not objStyles.Item(I) Is Nothing And Not Me.FindControl("txt" & I) Is Nothing Then
                    CType(Me.FindControl("txt" & I), System.Web.UI.WebControls.TextBox).Text = objStyles.Item(I).StyleValue
                End If
            Next I
        Catch ex As Exception
            Me.lblMessage.Text = ex.Message
            Me.lblMessage.ForeColor = Drawing.Color.Red
        End Try
    End Sub
    '@Author: Ali Bahaloo Hore @This method is to save new selected styles into the database for the calendar components.
    Protected Sub butSaveChanges_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles butSaveChanges.Click
        Dim objStyles As New clsStyleList

        Try
            objStyles.LoadAll()

            For I As Integer = objStyles(0).ID To objStyles(objStyles.Count - 1).ID
                If Not objStyles.Item(I) Is Nothing And Not Me.FindControl("txt" & I) Is Nothing Then
                    objStyles.Item(I).Save(CType(Me.FindControl("txt" & I), System.Web.UI.WebControls.TextBox).Text)
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
