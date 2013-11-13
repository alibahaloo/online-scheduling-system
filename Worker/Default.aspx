<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Worker_Home" title="Online Scheduling System - Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
    <ul>
    <li class="active"><a href="Default.aspx">Home</a></li>
    <li><a href="CoSchedule.aspx">Company's Schedule</a></li>
    <li><a href="MySchedule.aspx">My Schedule</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
        <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Admin/Default.aspx" Visible="False">Manager Tools</asp:LinkButton>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
<asp:Image ID="Image1" runat="server" ImageUrl="~/images/Home.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
<h3>
    <span class="style1">This is the page that displays new announcements that are made by the manager.</span>
</h3><br />
<h1>Below is the list of announcements:</h1>
<hr />
    <asp:GridView ID="AnnouncementGridView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" Height="73px" SelectedIndex="0" 
            ShowHeader="False" Width="736px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:CommandField SelectText="View" ShowSelectButton="True" 
                    HeaderText="Click To View" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                    SortExpression="Subject" />
                <asp:BoundField DataField="Maker" HeaderText="Writer" SortExpression="Maker" />
                <asp:BoundField DataField="aDate" HeaderText="Date" SortExpression="aDate" />
            </Columns>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [aDate], [Maker], [Subject], [Announcement] FROM [Announcements] ORDER BY [aDate] DESC">
        </asp:SqlDataSource>
       
        <asp:DetailsView ID="AnnouncementDetailsView" runat="server" 
            AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" Height="97px" Width="752px" 
            Visible="False">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                    SortExpression="Subject" />
                <asp:BoundField DataField="Maker" HeaderText="Writer" SortExpression="Maker" />
                <asp:BoundField DataField="aDate" HeaderText="Date" SortExpression="aDate" />
                <asp:BoundField HtmlEncode="False" DataField="Announcement" HeaderText="Announcement" 
                    SortExpression="Announcement" />
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
    <hr />
    <h1>Options with their descriptions: </h1>
    <li><a href="Default.aspx">Home</a></li><br />
In this section you can view the new accouncements that are made by the manager.
<li><a href="CoSchedule.aspx">Available</a></li><br />
In this section you can have an overview of the company's working schedule in three different views: Monthly,Weekly and daily view.
also you can set the calendar to dispaly available and un-available shifts. shifts are created by the manager. you can book your desired
working shift with the tool provided below the calendar.
<li><a href="MySchedule.aspx">My Schedule</a></li><br />
In this section you can view your own working schedule in three different views: Monthly,Weekly and daily view.
<li><a href="Messaging.aspx">Messeging</a></li><br />
In this section you can send messages to other workers or the manager, you can also view your incoming messages.
<li><a href="ChangePassword.aspx">Change Password</a></li><br />
In this section you change your password.
</asp:Content>

