<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
    <ul>
    <li class="active"><a href="Default.aspx">Log In</a></li>
    <li><a href="PasswordRecovery.aspx">Password Recovery</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3>
    <span class="style1">Welcome to Online Scheduling System.</span>
</h3><br />
<h1>
Enter you personal information to log into the system.
</h1><br />
<hr />

    <asp:Login ID="Login1" runat="server" 
        DestinationPageUrl="~/Worker/Redirection.aspx" 
        PasswordRecoveryText="Forgot your password?" 
        PasswordRecoveryUrl="~/PasswordRecovery.aspx">
    </asp:Login><br />
    <b></b> 
</asp:Content>

