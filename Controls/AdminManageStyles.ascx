<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AdminManageStyles.ascx.vb" Inherits="Controls_AdminManageStyles" %>
Calander Components Style Management Tool<br />
        <br />
                    <asp:Label ID="lblMessage" runat="server" Text="" Width="432px"></asp:Label>
        <br />
        <table border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td colspan="2"><strong>Calendar</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Font Family</td>
                <td>
                    <asp:TextBox ID="txt42" runat="server"></asp:TextBox> <em>(example: Arial, Veranda, Times New Roman)</em></td>
            </tr>
           <%-- <tr>
                <td style="padding-left:10px;">Font Size</td>
                <td>
                    <asp:TextBox ID="txt82" runat="server"></asp:TextBox></td>
            </tr>--%>
            <tr>
                <td style="padding-left:10px;">Border Width</td>
                <td>
                    <asp:TextBox ID="txt43" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Color</td>
                <td>
                    <asp:TextBox ID="txt44" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Top Row</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt45" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Text Color</td>
                <td>
                    <asp:TextBox ID="txt46" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Day Header Row</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt47" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Text Color</td>
                <td>
                    <asp:TextBox ID="txt48" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Week Day Cells</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt53" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Text Color</td>
                <td>
                    <asp:TextBox ID="txt52" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Border Width</td>
                <td>
                    <asp:TextBox ID="txt50" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Color</td>
                <td>
                    <asp:TextBox ID="txt49" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Style</td>
                <td>
                    <asp:TextBox ID="txt51" runat="server"></asp:TextBox> <em>(example: solid, dashed, none)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Weekend Cells</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt58" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Text Color</td>
                <td>
                    <asp:TextBox ID="txt57" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Border Width</td>
                <td>
                    <asp:TextBox ID="txt55" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Color</td>
                <td>
                    <asp:TextBox ID="txt54" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Style</td>
                <td>
                    <asp:TextBox ID="txt56" runat="server"></asp:TextBox> <em>(example: solid, dashed, none)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Event</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt60" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Text Color</td>
                <td>
                    <asp:TextBox ID="txt59" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Popup</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt62" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Text Color</td>
                <td>
                    <asp:TextBox ID="txt61" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Font Family</td>
                <td>
                    <asp:TextBox ID="txt63" runat="server"></asp:TextBox> <em>(example: Arial, Veranda, Times New Roman)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Previous Month Button</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt68" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Text Color</td>
                <td>
                    <asp:TextBox ID="txt67" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Border Width</td>
                <td>
                    <asp:TextBox ID="txt70" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Color</td>
                <td>
                    <asp:TextBox ID="txt69" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Style</td>
                <td>
                    <asp:TextBox ID="txt71" runat="server"></asp:TextBox> <em>(example: solid, dashed, none)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Font Family</td>
                <td>
                    <asp:TextBox ID="txt64" runat="server"></asp:TextBox> <em>(example: Arial, Veranda, Times New Roman)</em></td>
            </tr>
            <%--<tr>
                <td style="padding-left: 10px;">
                    Font Size</td>
                <td>
                    <asp:TextBox ID="txt83" runat="server"></asp:TextBox></td>
            </tr>--%>
            <tr>
                <td style="padding-left: 10px">Font Weight</td>
                <td>
                    <asp:TextBox ID="txt65" runat="server"></asp:TextBox> <em>(example: bold, none)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Font Underline</td>
                <td>
                    <asp:TextBox ID="txt66" runat="server"></asp:TextBox>  <em>(example: underline, none)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Text Padding</td>
                <td>
                    <asp:TextBox ID="txt72" runat="server"></asp:TextBox> <em>(padding syntax: top right bottom left)</em></td>
            </tr>
            <tr>
                <td colspan="2"><strong>Next Month Button</strong></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Background Color</td>
                <td>
                    <asp:TextBox ID="txt77" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Text Color</td>
                <td>
                    <asp:TextBox ID="txt76" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left:10px;">Border Width</td>
                <td>
                    <asp:TextBox ID="txt79" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Color</td>
                <td>
                    <asp:TextBox ID="txt78" runat="server"></asp:TextBox> <em>(example: #000000, black)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Border Style</td>
                <td>
                    <asp:TextBox ID="txt80" runat="server"></asp:TextBox> <em>(example: solid, dashed, none)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Font Family</td>
                <td>
                    <asp:TextBox ID="txt73" runat="server"></asp:TextBox> <em>(example: Arial, Veranda, Times New Roman)</em></td>
            </tr>
            <%--<tr>
                <td style="padding-left: 10px">
                    Font Size</td>
                <td>
                    <asp:TextBox ID="txt84" runat="server"></asp:TextBox></td>
            </tr>--%>
            <tr>
                <td style="padding-left: 10px">Font Weight</td>
                <td>
                    <asp:TextBox ID="txt74" runat="server"></asp:TextBox> <em>(example: bold, none)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Font Underline</td>
                <td>
                    <asp:TextBox ID="txt75" runat="server"></asp:TextBox> <em>(example: underline, none)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">Text Padding</td>
                <td>
                    <asp:TextBox ID="txt81" runat="server"></asp:TextBox> <em>(padding syntax: top right bottom left)</em></td>
            </tr>
            <tr>
                <td style="padding-left: 10px">
                </td>
                <td>
                    <br />
                    <asp:Button ID="butSaveChanges" runat="server" Text="Save Changes" /></td>
            </tr>
        </table>