<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Messaging.aspx.vb" Inherits="Worker_Messaging" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
 <ul>
    <li><a href="Default.aspx">Home</a></li>
    <li><a href="CoSchedule.aspx">Company's Schedule</a></li>
    <li><a href="MySchedule.aspx">My Schedule</a></li>
    <li class="active"><a href="Messaging.aspx">Messaging</a></li>
        <li><a href="Inbox.aspx">- Inbox</a></li>
    <li><a href="Compose.aspx">- Compose</a></li>
    <li><a href="Sent.aspx">- Sent</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Admin/Default.aspx" Visible="False">Manager Tools</asp:LinkButton>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Messaging.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
Here you can either check your incoming messages or send messages to other users.
</h3>
<br />
<h1>
Please choose your destination:
</h1>
<hr />
<div>
<h1>
Options Desctiption:
</h1><br />
</div>
<li><a href="inbox.aspx">Inbox</a></li><br />
This option will bring a list of your messages that you've recieved from other users.
<li><a href="Compose.aspx">Compose</a></li><br />
This option allows you to send messages to other users.
<li><a href="Compose.aspx">Sent</a></li><br />
This option will bring a list of the messages you've sent.
</asp:Content>

