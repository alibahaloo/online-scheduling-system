<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ErrorPage.aspx.vb" Inherits="ErrorPage" title="Error Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
<ul>
    <li class="active"><a href="ErrorPage.aspx">Error Page</a></li>
    <li><a href="../Worker/Default.aspx">Home Page</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Error.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<center>
<h3>
    <span class="style1">Sorry for inconvenience.
There's a problem with the action you tried to do. please try again.<br />
For the moment please simply click on "Back" button in your browser or click on Home Page to redirect to the home page.</span>
</h3>
</center>
</asp:Content>

