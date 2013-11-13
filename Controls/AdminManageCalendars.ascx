<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AdminManageCalendars.ascx.vb" Inherits="Controls_AdminManageCalendars" %>
 Calendar Component Management Tool<br />
        <br />
        <asp:GridView ID="dvCalendars" runat="server" 
    AutoGenerateColumns="False" Width="480px" CellPadding="4" ForeColor="#333333" 
    GridLines="None">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="Name" HeaderText="Calendar" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <br />
        <asp:Button ID="butAdd" runat="server" Text="Add New Calendar" />