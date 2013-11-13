<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="Worker_ChangePassword" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF9900;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
    <ul>
    <li><a href="Default.aspx">Home</a></li>
    <li><a href="CoSchedule.aspx">Company's Schedule</a></li>
    <li><a href="MySchedule.aspx">My Schedule</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li class="active"><a href="ChangePassword.aspx">Change Password</a></li>
        <li>
        <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Admin/Default.aspx" Visible="False">Manager Tools</asp:LinkButton>
    </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/ChangePass.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
Here you can change you password.
</h3>
<h1>
Note:The password should be strong, it should contain alphabetic,non-alphabetic and number characters.
</h1>
<div>
    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        CancelDestinationPageUrl="~/Worker/Default.aspx" 
        ContinueDestinationPageUrl="~/Worker/Default.aspx">
    </asp:ChangePassword>
</div>
</asp:Content>

