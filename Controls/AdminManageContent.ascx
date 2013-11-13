<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AdminManageContent.ascx.vb" Inherits="Controls_AdminManageContent" %>
Calendar Component Labels Management Tool<br />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br />
         <table border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td style="padding-left:10px;">Back Button Text</td>
                <td>
                    <asp:TextBox ID="txt1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Next Button Text</td>
                <td>
                    <asp:TextBox ID="txt2" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                 <td style="padding-left: 10px; height: 26px;">
                 </td>
                 <td style="height: 26px">
                     <asp:Button ID="butSave" runat="server" Text="Save Changes" /></td>
             </tr>
          </table>