<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Sent.aspx.vb" Inherits="Worker_Default2" title="Online Scheduling System - Messaging - Sent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
  <ul>
    <li><a href="CreateNewUser.aspx">Manage Users</a></li>
    <li><a href="MakeAnnouncement.aspx">Make Announcement</a></li>
    <li><a href="ManageShifts.aspx">Manage Shifts</a></li>
    <li><a href="ManageStyles.aspx">Manage Style</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <li class="active"><a href="../Worker/Messaging.aspx">Messaging</a></li>
    <li><a href="Inbox.aspx">- Inbox</a></li>
    <li><a href="Compose.aspx">- Compose</a></li>
    <li class="active"><a href="Sent.aspx">- Sent</a></li>
    <li><a href="../Worker/Default.aspx">Worker's Area</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Sent.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3>
    <span class="style1">Below is the list of messages that you've sent to other users through the system.</span>
</h3><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="noMessageLabel" runat="server" Font-Bold="True" 
        Font-Italic="True" ForeColor="#D4D4D4" Text="You have no message!" 
        Visible="False"></asp:Label>
    <br />
    <asp:Panel ID="SentPanel" runat="server">
    <h1>Click on "View Message" to view the message.</h1><br />
        <asp:GridView ID="SentGridView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" Height="73px" Width="736px" 
            SelectedIndex="0">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField SelectText="View Message" ShowSelectButton="True" />
                <asp:BoundField DataField="recieptName" HeaderText="To" 
                    SortExpression="recieptName" />
                <asp:BoundField DataField="subject" HeaderText="Subject" 
                    SortExpression="subject" />
                <asp:BoundField DataField="mDate" HeaderText="Date" SortExpression="mDate" />
            </Columns>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CCFFFF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT [message], [subject], [mDate], [recieptName] FROM [Messaging] WHERE ([senderPersNo] = @senderPersNo) ORDER BY [mDate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="InvisNameLabel" Name="senderPersNo" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="SentDetailsView" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" Height="41px" Width="738px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="recieptName" HeaderText="To" 
                    SortExpression="recieptName" />
                <asp:BoundField DataField="subject" HeaderText="Subject" 
                    SortExpression="subject" />
                <asp:BoundField DataField="mDate" HeaderText="Date" SortExpression="mDate" />
                <asp:BoundField HtmlEncode="False" DataField="message" HeaderText="Message" 
                    SortExpression="message" />
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        <br />
        <asp:Label ID="InvisNameLabel" runat="server" Visible="False"></asp:Label>
    </asp:Panel>
    <br />
    <br />
    <br />
    </asp:Content>

