<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Inbox.aspx.vb" Inherits="Worker_Inbox" title="Online Scheduling System - Messaging - Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
  <ul>
    <li><a href="Default.aspx">Home</a></li>
    <li><a href="CoSchedule.aspx">Company's Schedule</a></li>
    <li><a href="MySchedule.aspx">My Schedule</a></li>
    <li class="active"><a href="Messaging.aspx">Messaging</a></li>
        <li class="active"><a href="Inbox.aspx">- Inbox</a></li>
    <li><a href="Compose.aspx">- Compose</a></li>
    <li><a href="Sent.aspx">- Sent</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
    <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Admin/Default.aspx" Visible="False">Manager Tools</asp:LinkButton>
    </ul>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Inbox.gif" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3 class="style1">
Below is your inbox. you can check your messegas by selecting each message.
</h3>
<br />
    <p class="style1">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="noMessageLabel" runat="server" Font-Bold="True" 
            Font-Italic="True" ForeColor="#D4D4D4" Text="You have no message!" 
            Visible="False"></asp:Label>
</p>
    <asp:Panel ID="InboxPanel" runat="server" Height="339px">
    <h1>Click on "View Message" to view the message.</h1><br />
        &nbsp;&nbsp;
        <asp:GridView ID="InboxGridView" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" Height="73px" Width="736px" AllowPaging="True" 
            SelectedIndex="0">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField SelectText="View Message" ShowSelectButton="True" />
                <asp:BoundField DataField="sender" HeaderText="From" 
                    SortExpression="sender" />
                <asp:BoundField DataField="subject" HeaderText="Subject" 
                    SortExpression="subject" />
                <asp:BoundField DataField="mDate" HeaderText="Date" SortExpression="mDate" />
            </Columns>
            <PagerStyle BackColor="#284775" ForeColor="White" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CCFFCC" ForeColor="#333333" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
            
            
            
            SelectCommand="SELECT [subject], [sender], [mDate], [message] FROM [Messaging] WHERE ([reciept] = @reciept) ORDER BY [mDate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="InvisNameLabel" Name="reciept" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="InvisNameLabel" runat="server" Visible="False"></asp:Label>
        <asp:DetailsView ID="InboxDetailsView" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" Height="48px" Width="710px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="sender" HeaderText="From" SortExpression="sender" />
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
    </asp:Panel>
<br />
</asp:Content>

