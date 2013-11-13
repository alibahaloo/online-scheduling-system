<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="Admin_ChangePassword" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
   <ul>
    <li><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li><a href="ManageStyles.aspx">Manage Style</a></li>
    <li class="active"><a href="ChangePassword.aspx">Change Password</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ChangePass.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
Here you can change your password.
</h3>
<hr />
<div>

    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        CancelDestinationPageUrl="~/Admin/Default.aspx" 
        ContinueDestinationPageUrl="~/Admin/Default.aspx">
    </asp:ChangePassword>

</div>
</asp:Content>

