<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CreateNewUser.aspx.vb" Inherits="Admin_CreateNewUser" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF9900;
        }
        .style2
        {
            width: 94%;
        }
        .style3
        {
            width: 411px;
        }
        .style4
        {
            width: 411px;
            height: 56px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
     <ul>
    <li class="active"><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li><a href="ManageStyles.aspx">Manage Style</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/ManageUsers.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
    <h3 class="style1">You can create new user for the system with the tool provided below:
</h3>
<div>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
        <asp:ListItem>Add New User</asp:ListItem>
        <asp:ListItem>Edit User</asp:ListItem>
        <asp:ListItem>Delete User</asp:ListItem>
    </asp:RadioButtonList>
<hr />
    <asp:Panel ID="Panel2" runat="server" Height="477px">
        <table class="style2">
            <tr>
                <td class="style3">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                        CancelDestinationPageUrl="~/Admin/Default.aspx" 
                        ContinueDestinationPageUrl="~/Admin/Default.aspx" LoginCreatedUser="False" 
                        UserNameLabelText="User's Personal Number" Width="271px" 
                        CreateUserButtonText="Next">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" 
                                Title="Sign Up for a New Account">
                                <ContentTemplate>
                                    <table border="0">
                                        <tr>
                                            <td align="center" colspan="2">
                                                Sign Up for Your New Account</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User&#39;s 
                                                Personal Number</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                                    AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                                    ControlToValidate="ConfirmPassword" 
                                                    ErrorMessage="Confirm Password is required." 
                                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                                    ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                                    ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security 
                                                Question:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                                    ControlToValidate="Question" ErrorMessage="Security question is required." 
                                                    ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security 
                                                Answer:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                                    ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                                    ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                                    Display="Dynamic" 
                                                    ErrorMessage="The Password and Confirmation Password must match." 
                                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:WizardStep ID="WizardStep1" runat="server" Title="User Information">
                                <table class="style2">
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="fullNameLabel0" runat="server" Text="Full Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="fullNameTextBox" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="fullNameValidator2" runat="server" 
                                                ControlToValidate="fullNameTextBox" ErrorMessage="Full Name is empty!">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="homePhoneLabel0" runat="server" Text="Home Phone:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="homePhoneTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="cellPhoneLabel0" runat="server" Text="Cell Phone:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="cellPhoneTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="AddressLabel0" runat="server" Text="Address:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="zipCodeLabel0" runat="server" Text="Zip Code:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ZipCodeTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="CityLabel0" runat="server" Text="City:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="BankLabel0" runat="server" Text="Bank Name:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="bankNameTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="bankAccountLabel0" runat="server" Text="Bank Account Number:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="bankAcNoTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="employeeSinceLabel0" runat="server" Text="Employee Since"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="EmployeeSinceTextBox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:WizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                                <ContentTemplate>
                                    <table border="0" style="font-size:100%;width:271px;">
                                        <tr>
                                            <td align="center" colspan="2">
                                                Complete</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Your account has been successfully created.</td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                                    CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Panel ID="EditUserPanel" runat="server" Visible="False">
                        Select a user:<asp:DropDownList ID="namesDropDownList" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="fullName" DataValueField="Persno">
                        </asp:DropDownList>
                        <h1>Click On "Edit" button on left handside of Personal Number to edit the information</h1><br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Persno], [fullName] FROM [UserInfo]">
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="Persno" DataSourceID="SqlDataSource1" 
                            ForeColor="#333333" GridLines="None" Width="517px">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:CommandField ShowEditButton="True" />
                                <asp:BoundField DataField="Persno" HeaderText="Personal Number" ReadOnly="True" 
                                    SortExpression="Persno" />
                                <asp:BoundField DataField="fullName" HeaderText="Full Name" 
                                    SortExpression="fullName" />
                                <asp:BoundField DataField="HomePhone" HeaderText="Home Phone" 
                                    SortExpression="HomePhone" />
                                <asp:BoundField DataField="CellPhone" HeaderText="Cell Phone" 
                                    SortExpression="CellPhone" />
                                <asp:BoundField DataField="Address" HeaderText="Address" 
                                    SortExpression="Address" />
                                <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" 
                                    SortExpression="ZipCode" />
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                <asp:BoundField DataField="Bank" HeaderText="Bank Name" SortExpression="Bank" />
                                <asp:BoundField DataField="AcNo" HeaderText="Bank Account Number" 
                                    SortExpression="AcNo" />
                                <asp:BoundField DataField="EmployeeSince" HeaderText="Employee Since" 
                                    SortExpression="EmployeeSince" />
                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConflictDetection="CompareAllValues" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            DeleteCommand="DELETE FROM [UserInfo] WHERE [Persno] = @original_Persno AND [fullName] = @original_fullName AND [HomePhone] = @original_HomePhone AND [CellPhone] = @original_CellPhone AND [Address] = @original_Address AND [ZipCode] = @original_ZipCode AND [City] = @original_City AND [Bank] = @original_Bank AND [AcNo] = @original_AcNo AND [EmployeeSince] = @original_EmployeeSince" 
                            InsertCommand="INSERT INTO [UserInfo] ([Persno], [fullName], [HomePhone], [CellPhone], [Address], [ZipCode], [City], [Bank], [AcNo], [EmployeeSince]) VALUES (@Persno, @fullName, @HomePhone, @CellPhone, @Address, @ZipCode, @City, @Bank, @AcNo, @EmployeeSince)" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectCommand="SELECT * FROM [UserInfo] WHERE ([Persno] = @Persno)" 
                            UpdateCommand="UPDATE [UserInfo] SET [fullName] = @fullName, [HomePhone] = @HomePhone, [CellPhone] = @CellPhone, [Address] = @Address, [ZipCode] = @ZipCode, [City] = @City, [Bank] = @Bank, [AcNo] = @AcNo, [EmployeeSince] = @EmployeeSince WHERE [Persno] = @original_Persno AND [fullName] = @original_fullName AND [HomePhone] = @original_HomePhone AND [CellPhone] = @original_CellPhone AND [Address] = @original_Address AND [ZipCode] = @original_ZipCode AND [City] = @original_City AND [Bank] = @original_Bank AND [AcNo] = @original_AcNo AND [EmployeeSince] = @original_EmployeeSince">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="namesDropDownList" Name="Persno" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="original_Persno" Type="String" />
                                <asp:Parameter Name="original_fullName" Type="String" />
                                <asp:Parameter Name="original_HomePhone" Type="String" />
                                <asp:Parameter Name="original_CellPhone" Type="String" />
                                <asp:Parameter Name="original_Address" Type="String" />
                                <asp:Parameter Name="original_ZipCode" Type="String" />
                                <asp:Parameter Name="original_City" Type="String" />
                                <asp:Parameter Name="original_Bank" Type="String" />
                                <asp:Parameter Name="original_AcNo" Type="String" />
                                <asp:Parameter Name="original_EmployeeSince" Type="DateTime" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="fullName" Type="String" />
                                <asp:Parameter Name="HomePhone" Type="String" />
                                <asp:Parameter Name="CellPhone" Type="String" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="ZipCode" Type="String" />
                                <asp:Parameter Name="City" Type="String" />
                                <asp:Parameter Name="Bank" Type="String" />
                                <asp:Parameter Name="AcNo" Type="String" />
                                <asp:Parameter Name="EmployeeSince" Type="DateTime" />
                                <asp:Parameter Name="original_Persno" Type="String" />
                                <asp:Parameter Name="original_fullName" Type="String" />
                                <asp:Parameter Name="original_HomePhone" Type="String" />
                                <asp:Parameter Name="original_CellPhone" Type="String" />
                                <asp:Parameter Name="original_Address" Type="String" />
                                <asp:Parameter Name="original_ZipCode" Type="String" />
                                <asp:Parameter Name="original_City" Type="String" />
                                <asp:Parameter Name="original_Bank" Type="String" />
                                <asp:Parameter Name="original_AcNo" Type="String" />
                                <asp:Parameter Name="original_EmployeeSince" Type="DateTime" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Persno" Type="String" />
                                <asp:Parameter Name="fullName" Type="String" />
                                <asp:Parameter Name="HomePhone" Type="String" />
                                <asp:Parameter Name="CellPhone" Type="String" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="ZipCode" Type="String" />
                                <asp:Parameter Name="City" Type="String" />
                                <asp:Parameter Name="Bank" Type="String" />
                                <asp:Parameter Name="AcNo" Type="String" />
                                <asp:Parameter Name="EmployeeSince" Type="DateTime" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Panel ID="DeletePanel" runat="server" Visible="False" Height="36px">
                        Select a user:
                        <asp:DropDownList ID="UserDropDownList" runat="server" Height="24px" 
                            Width="100px" AutoPostBack="True">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="DeleteUser" runat="server" Text="Delete User" Width="114px" />
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:Panel>
     <hr />
</div>
</asp:Content>

