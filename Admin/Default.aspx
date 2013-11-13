<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
   <ul>
    <li><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li><a href="ManageStyles.aspx">Manage Style</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Managertools.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
Dear Manager, you can use the Manager Tools to manage the system.
</h3><br />
<h1>
Select one of the options from the menu on the left hand side
</h1><br /><hr />
<li><a href="CreateNewUser.aspx">Manage Users</a></li>
In this section you can add new users to the system and enable them to work with the OnlineSchedulingSystem. You can also delete an existing user.
<li><a href="ManageShifts.aspx">Manage Shifts</a></li>
This section provides tools to manage worker's shifts. In this section you can create shifts,assign shifts for the workers,edit or delete a shift.
<li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
This section is for creating a new announcement to be displayed in the worker's home page, you can also edit or delete an existing item.
<li><a href="ManageStyles.aspx">Manage Style</a></li>
In this section you can change the style of the calendar components.
<li><a href="ChangePassword.aspx">Change Password</a></li>
In this section you can change your password.
<li><a href="../Worker/Default.aspx">Worker's Area</a></li>
This is the section that belongs to the company's worker, here you can see all options that workers are allowed to make, such as viewing
company's schedule, booking a shift, viewing their own schedule.
</asp:Content>

