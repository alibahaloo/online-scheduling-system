<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PasswordRecovery.aspx.vb" Inherits="PasswordRecovery" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
<ul>
    <li><a href="Default.aspx">Log In</a></li>
    <li class="active"><a href="PasswordRecovery.aspx">Password Recovery</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/PasswordRecovery.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
Forgot your password? Fill the forms with your information to recover your password
</h3><br />
<hr />
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
        SuccessPageUrl="~/Default.aspx">
    </asp:PasswordRecovery> 
</asp:Content>

