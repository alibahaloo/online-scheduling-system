<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageShifts.aspx.vb" Inherits="Admin_ManageShifts" title="Untitled Page" %>

<%@ Register src="../Controls/AdminManageEvents.ascx" tagname="AdminManageEvents" tagprefix="uc1" %>


<%@ Register src="../Controls/AdminAssignShift.ascx" tagname="AdminAssignShift" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
      <ul>
    <li><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li class="active"><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li><a href="ManageStyles.aspx">Manage Style</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/ManageShifts.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3>
    <span class="style1">With this tool you can create new shifts,assign shifts for the workers,edit or delete an existing shift.</span>
</h3>
<hr />
<div>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
        <asp:ListItem>Shift Management Tool</asp:ListItem>
        <asp:ListItem>Shift Assignment Tool</asp:ListItem>
    </asp:RadioButtonList>
    <hr />
    <uc2:AdminAssignShift ID="AdminAssignShift1" runat="server" Visible="False" />
    <uc1:AdminManageEvents ID="AdminManageEvents1" runat="server" Visible="True" />
    <br />Click On the icon to view the Company's Schedule
    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/images/Schedule.gif" 
        NavigateUrl="~/Worker/CoSchedule.aspx"></asp:HyperLink>
<br />
    
</div>
</asp:Content>

