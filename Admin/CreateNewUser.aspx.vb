Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
'@Authors: S. Samad Ghasemi & Ali Bahaloo Hore @ Handles users managing actions (create, edit & delete users).
Partial Class Admin_CreateNewUser
    Inherits System.Web.UI.Page

    '@Authors: S. Samad Ghasemi & Ali Bahaloo Hore @ Binds the data and put it in the DropDownList at the page load.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Page.Title = "Online Scheduling System - Manager Tools - Create New User"
        
        If Page.IsPostBack = False Then
            Me.RadioButtonList1.SelectedIndex = 0
            UserDropDownList.DataMember = "UserName"
            UserDropDownList.DataSource = Membership.GetAllUsers()
            UserDropDownList.DataBind()
            namesDropDownList.DataBind()
        End If
    End Sub
    '@Authors: S. Samad Ghasemi & Ali Bahaloo Hore @ Handles deleting user from the system, selected from the dropDownList
    Protected Sub DeleteUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteUser.Click

        Membership.DeleteUser(Me.UserDropDownList.SelectedValue)
        Dim objConn As SqlConnection
        Dim objCmd As SqlCommand

        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            objConn.Open()

            objCmd = New SqlCommand("DeleteUser", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objCmd.Parameters.AddWithValue("@Persno", Me.UserDropDownList.SelectedValue)

            objCmd.ExecuteNonQuery()
            objConn.Close()

        Catch ex As Exception
            Response.Redirect("../ErrorPage.aspx")
        End Try
        UserDropDownList.DataMember = "UserName"
        UserDropDownList.DataSource = Membership.GetAllUsers()
        UserDropDownList.DataBind()
        namesDropDownList.DataBind()
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If Me.RadioButtonList1.SelectedIndex = 0 Then
            Me.DeletePanel.Visible = False
            Me.EditUserPanel.Visible = False
            Me.CreateUserWizard1.Visible = True
        End If
        If Me.RadioButtonList1.SelectedIndex = 1 Then
            Me.DeletePanel.Visible = False
            Me.CreateUserWizard1.Visible = False
            Me.EditUserPanel.Visible = True
        End If
        If Me.RadioButtonList1.SelectedIndex = 2 Then
            Me.DeletePanel.Visible = True
            Me.CreateUserWizard1.Visible = False
            Me.EditUserPanel.Visible = False
        End If
    End Sub

    '@Authors: S. Samad Ghasemi & Ali Bahaloo Hore @ Adding a new user to the System.
    Protected Sub CreateUserWizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles CreateUserWizard1.FinishButtonClick
        Dim objConn As SqlConnection
        Dim objCmd As SqlCommand

        Try
            objConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            objConn.Open()

            objCmd = New SqlCommand("CreateUser", objConn)
            objCmd.CommandType = Data.CommandType.StoredProcedure

            objCmd.Parameters.AddWithValue("@Persno", Label1.Text)
            objCmd.Parameters.AddWithValue("@fullName", fullNameTextBox.Text)
            objCmd.Parameters.AddWithValue("@HomePhone", homePhoneTextBox.Text)
            objCmd.Parameters.AddWithValue("@CellPhone", cellPhoneTextBox.Text)
            objCmd.Parameters.AddWithValue("@Address", AddressTextBox.Text)
            objCmd.Parameters.AddWithValue("@ZipCode", ZipCodeTextBox.Text)
            objCmd.Parameters.AddWithValue("@City", CityTextBox.Text)
            objCmd.Parameters.AddWithValue("@Bank", bankNameTextBox.Text)
            objCmd.Parameters.AddWithValue("@AcNo", bankAcNoTextBox.Text)
            objCmd.Parameters.AddWithValue("@EmployeeSince", EmployeeSinceTextBox.Text)

            objCmd.ExecuteNonQuery()
            objConn.Close()
            UserDropDownList.DataMember = "UserName"
            UserDropDownList.DataSource = Membership.GetAllUsers()
            UserDropDownList.DataBind()
            'namesDropDownList.DataMember = "Names"
            'namesDropDownList.DataSource = Membership.GetAllUsers()
            namesDropDownList.DataBind()
        Catch ex As Exception
            Response.Redirect("../ErrorPage.aspx")
        End Try
        Me.RadioButtonList1.SelectedIndex = 0
        UserDropDownList.DataMember = "UserName"
        UserDropDownList.DataSource = Membership.GetAllUsers()
        UserDropDownList.DataBind()
        'namesDropDownList.DataMember = "Names"
        'namesDropDownList.DataSource = Membership.GetAllUsers()
        namesDropDownList.DataBind()
        'Label1.Text = fullNameTextBox.Text
    End Sub

    Protected Sub CreateUserWizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles CreateUserWizard1.NextButtonClick
        Label1.Text = CreateUserWizard1.UserName
    End Sub
End Class
