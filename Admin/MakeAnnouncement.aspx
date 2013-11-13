<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MakeAnnouncement.aspx.vb" Inherits="Admin_MakeAnnouncement" title="Online Scheduling System - Manager Tools - Make Announcement" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
  <ul>
    <li><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li class="active"><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li><a href="ManageStyles.aspx">Manage Style</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Announcements.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
This Tool allows to make a new announcement and display it on the home page of worker's area.
</h3><br />
<h1>
Please fill in the form with information you want.
</h1>
<hr />
<div>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
        <asp:ListItem>Create A New Announcement</asp:ListItem>
        <asp:ListItem>Edit / Delete an announcement</asp:ListItem>
    </asp:RadioButtonList>
    <hr />
</div>
<div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="AnnouncementSqlDataSource" ForeColor="#333333" 
        GridLines="None" Width="706px" Visible="False">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField HeaderText="Operations" ShowDeleteButton="True" 
                ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Announcement" HeaderText="Announcement" 
                SortExpression="Announcement" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" 
                SortExpression="Subject" />
            <asp:BoundField DataField="aDate" HeaderText="Date" SortExpression="aDate" />
        </Columns>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="AnnouncementSqlDataSource" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Announcements] WHERE [ID] = @original_ID AND [Announcement] = @original_Announcement AND [Subject] = @original_Subject AND [Maker] = @original_Maker AND [aDate] = @original_aDate AND [MakerPersNo] = @original_MakerPersNo" 
        InsertCommand="INSERT INTO [Announcements] ([Announcement], [Subject], [Maker], [aDate], [MakerPersNo]) VALUES (@Announcement, @Subject, @Maker, @aDate, @MakerPersNo)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Announcements]" 
        UpdateCommand="UPDATE [Announcements] SET [Announcement] = @Announcement, [Subject] = @Subject, [Maker] = @Maker, [aDate] = @aDate, [MakerPersNo] = @MakerPersNo WHERE [ID] = @original_ID AND [Announcement] = @original_Announcement AND [Subject] = @original_Subject AND [Maker] = @original_Maker AND [aDate] = @original_aDate AND [MakerPersNo] = @original_MakerPersNo">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Announcement" Type="String" />
            <asp:Parameter Name="original_Subject" Type="String" />
            <asp:Parameter Name="original_Maker" Type="String" />
            <asp:Parameter Name="original_aDate" Type="DateTime" />
            <asp:Parameter Name="original_MakerPersNo" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Announcement" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Maker" Type="String" />
            <asp:Parameter Name="aDate" Type="DateTime" />
            <asp:Parameter Name="MakerPersNo" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Announcement" Type="String" />
            <asp:Parameter Name="original_Subject" Type="String" />
            <asp:Parameter Name="original_Maker" Type="String" />
            <asp:Parameter Name="original_aDate" Type="DateTime" />
            <asp:Parameter Name="original_MakerPersNo" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Announcement" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Maker" Type="String" />
            <asp:Parameter Name="aDate" Type="DateTime" />
            <asp:Parameter Name="MakerPersNo" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</div>
<div>
    <asp:Panel ID="newannouncement" runat="server" Height="389px" Width="770px">
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="successLabel" runat="server" Font-Bold="True" Font-Italic="True" 
        ForeColor="#D2D2D2" Text="Your announcement been created successfully." 
        Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Title:&nbsp;
    <asp:TextBox ID="SubjectTextBox" runat="server" Width="362px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="AnnouncementSubjectValidator1" runat="server" 
        ControlToValidate="SubjectTextBox" ErrorMessage="Subject is empty!" 
        Font-Bold="True">*</asp:RequiredFieldValidator>
    <br />
    <br />
    Announcement: 
    <asp:TextBox ID="AnnouncementTextBox" runat="server" Height="108px" 
        TextMode="MultiLine" Width="618px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="AnnouncementValidator1" runat="server" 
        ControlToValidate="AnnouncementTextBox" ErrorMessage="Announcement is empty!">*</asp:RequiredFieldValidator>
    <br />
    <br />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:Button ID="SubmitAnnouncementButton" runat="server" Text="Submit" 
        Width="164px" />
        <cc1:ConfirmButtonExtender ID="SubmitAnnouncementButton_ConfirmButtonExtender" 
            runat="server" ConfirmText="Are you sure you want to save this announcement?" Enabled="True" 
            TargetControlID="SubmitAnnouncementButton">
        </cc1:ConfirmButtonExtender>
    <br />
    <br />
&nbsp;&nbsp;
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        Font-Bold="True" />
         </asp:Panel>
</div>
</asp:Content>

