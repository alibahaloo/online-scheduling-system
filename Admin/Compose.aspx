<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Compose.aspx.vb" Inherits="Worker_Compose" title="Online Scheduling System - Messagin - Compose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
   <ul>
    <li><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li><a href="ManageStyles.aspx">Manage Style</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <li class="active"><a href="../Worker/Messaging.aspx">Messaging</a></li>
    <li><a href="Inbox.aspx">- Inbox</a></li>
    <li class="active"><a href="Compose.aspx">- Compose</a></li>
    <li><a href="Sent.aspx">- Sent</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Compose.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3>
    <span class="style1">Here you can send messages to other users.</span>
</h3>
<br />
<h1>
Use the tool provided below to send a message.
</h1>
<br />
<hr />
    <br />
    <asp:Panel ID="ComposePanel" runat="server" Height="227px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="SentMessage" runat="server" Font-Bold="True" ForeColor="#FFFFCC" 
            Text="Your message has been sent successfully" Visible="False"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="ToLabel" runat="server" Font-Bold="True" ForeColor="#FFFF99" 
            Text="To:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="NamesDropDownList" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="fullName" DataValueField="Persno" 
            Height="22px" Width="138px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [fullName], [Persno] FROM [UserInfo]">
        </asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="NamesDropdownValidator" runat="server" 
            ControlToValidate="NamesDropDownList" ErrorMessage="To must be selected" 
            Font-Bold="True">*</asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;
        <asp:Label ID="SubjectLabel" runat="server" Font-Bold="True" 
            ForeColor="#FFFFCC" Text="Subject:"></asp:Label>
&nbsp;
        <asp:TextBox ID="SubjectTextBox" runat="server" Height="18px" Width="164px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="SubjectValidator" runat="server" 
            ControlToValidate="SubjectTextBox" ErrorMessage="Subject is empty">*</asp:RequiredFieldValidator>
        <br />
        <br />
&nbsp;
        <asp:Label ID="MessageLabel" runat="server" Font-Bold="True" 
            ForeColor="#FFFFCC" Text="Message:"></asp:Label>
        <asp:TextBox ID="MessageTextBox" runat="server" Height="102px" 
            TextMode="MultiLine" Width="495px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="MessageValidator" runat="server" 
            ControlToValidate="MessageTextBox" ErrorMessage="Message is empty">*</asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SendButton" runat="server" Height="26px" Text="Send" 
            Width="70px" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </asp:Panel>
    <br />
    <br />
</asp:Content>

