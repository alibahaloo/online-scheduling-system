<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageStyles.aspx.vb" Inherits="Admin_ManageStyles" title="Untitled Page" %>

<%@ Register src="../Controls/AdminManageStyles.ascx" tagname="AdminManageStyles" tagprefix="uc1" %>

<%@ Register src="../Controls/AdminManageContent.ascx" tagname="AdminManageContent" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
      <ul>
    <li><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li class="active"><a href="ManageStyles.aspx">Manage Style</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/ManageStyle.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
Here you can change the style of the calendars.
</h3>
<hr />
<div>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
        <asp:ListItem>Calendar Component Label Management Tool</asp:ListItem>
        <asp:ListItem>Calendar Component Style Management Tool</asp:ListItem>
    </asp:RadioButtonList><br />
    <hr />
    <uc1:AdminManageStyles ID="AdminManageStyles1" runat="server" Visible="False" />
    <uc2:AdminManageContent ID="AdminManageContent1" runat="server" 
        Visible="True" />
    <br />
    

</div>
</asp:Content>

