<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CoSchedule.aspx.vb" Inherits="CoSchedule" title="Untitled Page" %>

<%@ Register src="~/Controls/Calendar.ascx" tagname="Calendar" tagprefix="uc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF9900;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            font-weight: normal;
            color: #FFFFFF;
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
 <ul>
    <li><a href="Default.aspx">Home</a></li>
    <li class="active"><a href="CoSchedule.aspx">Company's Schedule</a></li>
    <li><a href="MySchedule.aspx">My Schedule</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
        <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Admin/Default.aspx" Visible="False">Manager Tools</asp:LinkButton>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/CoSchedule.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
    <h3 class="style1">Here you can have an overview of company's schedule with available.</h3>
<h1>you can book your apporpriate shift with the tools provided below the calendar.</h1>
<hr />
    <table class="style2">
        <tr>
            <td style="border-style: groove; border-width: thin">
                Filter Mode:
                (Use this option to view only available or un-available shifts)&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td style="border-style: groove; border-width: thin">
                
    <asp:RadioButtonList ID="FilterRadioList" runat="server" AutoPostBack="True">
        <asp:ListItem>Available Shifts</asp:ListItem>
        <asp:ListItem>Company&#39;s Schedule</asp:ListItem>
    </asp:RadioButtonList>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
<br />
<div>
    <center>
    <strong>
    <h3>
        <asp:Label ID="FilterLabel" runat="server" Text="Available Shifts"></asp:Label> 
    </h3>
    </strong>
    </center>
    </div>
    <uc1:Calendar ID="CompanyScheduleW" runat="server" Calender="11" 
        ViewType="Week" Visible="False" />
    <uc1:Calendar ID="AvailableShiftW" runat="server" Calender="10" 
        ViewType="Week" Visible="True" />
    *Move the mouse on shift and full description of that shift appears.
<hr />
    <div>
    <h3 class="style1">Shift Booking Tool:</h3>
    <h1>
        <span class="style3">Select a date to show the available shift of that day:<br />
    (Dark Gray Color indicate today's date, Blue Indicates selected date.)</span><br /></h1>
        <asp:Calendar ID="DatePicker" runat="server" BackColor="White" 
            BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
            Width="330px">
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                Height="8pt" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="12pt" ForeColor="White" Height="12pt" />
        </asp:Calendar>
        <h0><span class="style3">Select a shift to be booked:</span><br /></h0>
        <asp:DropDownList ID="ShiftDropDownList" runat="server" 
            DataSourceID="ShiftDropDownListDataSource" DataTextField="Title" 
            DataValueField="ID" AutoPostBack="True">
            <asp:ListItem>Select a date from the calendar first!</asp:ListItem>
        </asp:DropDownList><br />
        
                            <asp:Panel ID="Panel1" runat="server" Height="123px" Width="331px" 
                                Visible="False">
                                <h1>Shift Details:</h1>
                                <table class="style2" style="border: thin groove #C0C0C0">
                                    <tr>
                                        <td style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                                            Shift Description:</td>
                                        <td style="border-left-style: groove; border-left-width: thin; border-left-color: #C0C0C0">
                                            <asp:DropDownList ID="DescriptioDropDownList" runat="server" 
                                                DataSourceID="ShiftDataSource" DataTextField="Description" 
                                                DataValueField="Description" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                                            Start Time:</td>
                                        <td style="border-left-style: groove; border-left-width: thin; border-left-color: #C0C0C0">
                                            <asp:DropDownList ID="StartTimeDropDownList" runat="server" 
                                                DataSourceID="ShiftDataSource" DataTextField="StartTime" 
                                                DataValueField="StartTime" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                                            End Time:</td>
                                        <td style="border-left-style: groove; border-left-width: thin; border-left-color: #C0C0C0">
                                            <asp:DropDownList ID="EndTimeDropDownList" runat="server" 
                                                DataSourceID="ShiftDataSource" DataTextField="EndTime" DataValueField="EndTime" 
                                                Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                                            Start Date:</td>
                                        <td style="border-left-style: groove; border-left-width: thin; border-left-color: #C0C0C0">
                                            <asp:DropDownList ID="StartDateDropDownList" runat="server" 
                                                DataSourceID="ShiftDataSource" DataTextField="StartDate" 
                                                DataValueField="StartDate" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="border-left-style: groove; border-left-width: thin; border-left-color: #C0C0C0">
                                        <td style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                                            End Date:</td>
                                        <td>
                                            <asp:DropDownList ID="EndDateDropDownList" runat="server" 
                                                DataSourceID="ShiftDataSource" DataTextField="EndDate" DataValueField="EndDate" 
                                                Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br/>
 
        <asp:DropDownList ID="CalendarPicker" runat="server" Visible="False">
        </asp:DropDownList>

        <asp:DropDownList ID="EventTypePicker" runat="server" Visible="False">
        </asp:DropDownList><br />
        <h0><span class="style3">Click on &quot;Book Shift&quot; button to book your selected 
        shift.<h0><br /></h0>
        <asp:Button ID="Submit" runat="server" Text="Book Shift" Font-Bold="True" />
        <cc1:ConfirmButtonExtender ID="Submit_ConfirmButtonExtender" runat="server" 
            ConfirmText="Are you sure you want to book the selected shift?" Enabled="True" TargetControlID="Submit">
        </cc1:ConfirmButtonExtender>
        <asp:Label ID="MessageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:SqlDataSource ID="ShiftDropDownListDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT * FROM [RecurEvents] WHERE (([Calendar] = @Calendar) AND ([StartDate] = @StartDate))">
            <SelectParameters>
                <asp:Parameter DefaultValue="10" Name="Calendar" Type="Int32" />
                <asp:ControlParameter ControlID="DatePicker" Name="StartDate" 
                    PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ShiftDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT * FROM [RecurEvents] WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ShiftDropDownList" Name="ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </span>
</asp:Content>

