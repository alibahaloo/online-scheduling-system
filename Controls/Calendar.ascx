<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Calendar.ascx.vb" Inherits="Controls_Calendar" %>
<script src="../jscripts/alttxt.js" language="javascript" type="text/javascript"></script>
<asp:LinkButton ID="lnkBack" runat="server"><</asp:LinkButton>
<asp:LinkButton ID="lnkNext" runat="server">></asp:LinkButton>
<asp:Table ID="tblCalendar" runat="server">
</asp:Table>
<div id="outerpair1" style="position:absolute; top:0px; left:0px; visibility:hidden; cursor:pointer;">
 <div id="outerpair2">
  <div id="shadowbox">
      <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div></div></div>
<input id="datCurrentDate" type="hidden" runat="server" />
