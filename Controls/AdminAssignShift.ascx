<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AdminAssignShift.ascx.vb" Inherits="Controls_AdminShiftCreator" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">

    .style1
    {
        width: 453px;
    }
    .style2
    {
        width: 110px;
    }
    .style3
    {
        width: 451px;
    }
    .style4
    {
        width: 203px;
    }
    .style5
    {
        width: 716px;
        height: 87px;
    }
</style>
Shift Assignment Tool<br />
        <br />
        <asp:GridView ID="gvEvents" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            PageSize="25" Width="696px" CellPadding="4" ForeColor="#333333" 
    GridLines="None">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Worker's Name / Shift Title" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" HtmlEncode="false" DataFormatString="{0:d}" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" HtmlEncode="false" DataFormatString="{0:d}" />
                <asp:BoundField DataField="RecurTypeStr" HeaderText="Shift Type" />
                <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <br />
        <asp:Button ID="butAdd" runat="server" Text="Assign Shift" />
<br />
<table class="style5">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Select Your Mode:"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
<asp:RadioButtonList ID="RadioButtonList1" runat="server" Visible="False" 
                AutoPostBack="True">
    <asp:ListItem>Assign to availabe shifts</asp:ListItem>
    <asp:ListItem>Assign to a new shift</asp:ListItem>
</asp:RadioButtonList>
        </td>
    </tr>
</table>
<hr /><br />
<asp:Panel ID="AvPanel" runat="server" Height="648px" Width="1093px" 
    Visible="False">
    Select A Date:<br />
    <asp:Calendar ID="AVCalendar" runat="server" BackColor="White" 
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
    <table class="style3" style="border-style: groove; border-width: thin">
        <tr>
            <td class="style4">
                Select a user:</td>
            <td style="border-left-style: groove; border-left-width: thin">
                Selected user Personal Number:</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:DropDownList ID="UserAVDropDownList" runat="server" AutoPostBack="True" 
                    DataSourceID="UserAVSqlDataSource" DataTextField="FullName" 
                    DataValueField="FullName">
                </asp:DropDownList>
            </td>
            <td style="border-left-style: groove; border-left-width: thin">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="UserAvPersnoSqlDataSource" DataTextField="Persno" 
                    DataValueField="Persno" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="UserAvPersnoSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Persno] FROM [UserInfo] WHERE ([FullName] = @FullName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="UserAVDropDownList" Name="FullName" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="UserAVSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [FullName], [Persno] FROM [UserInfo]">
    </asp:SqlDataSource>
    <br />
    Select an available shift:<br />
    <asp:DropDownList ID="ShiftDropDownList" runat="server" 
        DataSourceID="AvShiftsSqlDataSource" DataTextField="Title" 
        DataValueField="Title">
    </asp:DropDownList>
    <asp:SqlDataSource ID="AvShiftsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Calendar] = @Calendar))">
        <SelectParameters>
            <asp:ControlParameter ControlID="AVCalendar" Name="StartDate" 
                PropertyName="SelectedDate" Type="DateTime" />
            <asp:Parameter DefaultValue="10" Name="Calendar" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Shift Details:<br />
    <table class="style1" style="border-style: groove; border-width: thin">
        <tr>
            <td class="style2">
                Shift Description:</td>
            <td style="border-left-style: groove; border-left-width: thin">
                <asp:DropDownList ID="ShiftDescrDropDownList" runat="server" 
                    DataSourceID="AvShiftsSqlDataSource" DataTextField="Description" 
                    DataValueField="Description" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Start Time:</td>
            <td style="border-left-style: groove; border-left-width: thin">
                <asp:DropDownList ID="ShiftSTDropDownList" runat="server" 
                    DataSourceID="AvShiftsSqlDataSource" DataTextField="StartTime" 
                    DataValueField="StartTime" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                End Time:</td>
            <td style="border-left-style: groove; border-left-width: thin">
                <asp:DropDownList ID="ShiftETDropDownList" runat="server" 
                    DataSourceID="AvShiftsSqlDataSource" DataTextField="EndTime" 
                    DataValueField="EndTime" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Start Date:</td>
            <td style="border-left-style: groove; border-left-width: thin">
                <asp:DropDownList ID="ShiftSDDropDownList" runat="server" 
                    DataSourceID="AvShiftsSqlDataSource" DataTextField="StartDate" 
                    DataValueField="StartDate" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                End Date:</td>
            <td style="border-left-style: groove; border-left-width: thin">
                <asp:DropDownList ID="ShiftEDDropDownList" runat="server" 
                    DataSourceID="AvShiftsSqlDataSource" DataTextField="EndDate" 
                    DataValueField="EndDate" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Shift Type:</td>
            <td style="border-left-style: groove; border-left-width: thin">
                <asp:DropDownList ID="EventTypeDropDownList" runat="server" 
                    DataSourceID="AvShiftsSqlDataSource" DataTextField="RecurType" 
                    DataValueField="RecurType" Enabled="False">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="AssignAV" runat="server" Text="Assign" />
    <cc1:ConfirmButtonExtender ID="AssignAV_ConfirmButtonExtender" runat="server" 
        ConfirmText="Are you sure you want assign this shift?" Enabled="True" TargetControlID="AssignAV"></cc1:ConfirmButtonExtender>
&nbsp;
    <asp:Button ID="CancelAV" runat="server" Text="Cancel" />
    &nbsp;<asp:Label ID="AVLabel" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Panel>
<br />
<br />
        <br />
        <asp:Panel ID="pnlEditEvent" runat="server" Visible="False">
            <table cellpadding="2" cellspacing="0" border="0" style="width: 947px">
                <tr>
                    <td>Worker&#39;s Name:</td>
                    <td>
                        <asp:DropDownList ID="WorkerDropDownList" runat="server" 
                            DataSourceID="WorkersSqlDataSource" DataTextField="FullName" 
                            DataValueField="FullName" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="WorkersSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [FullName] FROM [UserInfo]"></asp:SqlDataSource>
                        </td>
                </tr>
                <tr>
                    <td>
                        Selected user Personal Number:</td>
                    <td>
                        <asp:DropDownList ID="WorkerPersnoDropDownList" runat="server" 
                            DataSourceID="WorkerAVPersnoSqlDataSource" DataTextField="Persno" 
                            DataValueField="Persno" Enabled="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="WorkerAVPersnoSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Persno] FROM [UserInfo] WHERE ([FullName] = @FullName)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="WorkerDropDownList" Name="FullName" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td valign="top">Shift Description:</td>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" Height="184px" Width="496px" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription"
                            ErrorMessage="* Required"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td valign="top">
                        Shift Type:</td>
                    <td>
                        <asp:DropDownList ID="ddlTypes" runat="server" Width="256px" AutoPostBack="True">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Label ID="lblDate" runat="server"></asp:Label></td>
                    <td>
                        <table cellpadding="2" border="0" cellspacing="0">
                            <tr>
                                <td><asp:Calendar ID="calStartDate" runat="server" SelectedDate="2007-11-01" 
                                        VisibleDate="2007-11-01" BackColor="White" BorderColor="Black" 
                                        BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" 
                                        ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <DayStyle BackColor="#CCCCCC" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                        Height="8pt" />
                                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                                        Font-Size="12pt" ForeColor="White" Height="12pt" />
                                    </asp:Calendar></td>
                                <td runat="server" id="EndDateCellOne" valign="top">End Date</td>
                                <td runat="server" id="EndDateCellTwo"><asp:Calendar ID="calEndDate" runat="server" 
                                        SelectedDate="2007-11-01" VisibleDate="2007-11-01" BackColor="White" 
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
                                        </asp:Calendar></td>
                            </tr>
                        </table>      
                    </td>
                </tr>
                <tr>
                    <td valign="middle" style="height: 28px">Start Time:</td>
                    <td style="height: 28px">
                        <asp:DropDownList ID="HourDropDownList" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;:&nbsp;<asp:DropDownList ID="MinDropDownList" runat="server">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>45</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList ID="AMPMDropDownList" runat="server">
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>PM</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<i>Time Format: H:MM AM/PM</i></td>
                </tr>
                <tr>
                    <td valign="middle">End Time:</td>
                    <td style="font-style: italic">
                        <asp:DropDownList ID="HourEndDropDownList" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;:&nbsp;<asp:DropDownList ID="MinEndDropDownList" runat="server">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>45</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList ID="AMPMEndDropDownList" runat="server">
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>PM</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<i>Time Format: H:MM AM/PM</i></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                    <br />
                        <asp:Button ID="butSave" runat="server" Text="Assign" />
                        <cc1:ConfirmButtonExtender ID="butSave_ConfirmButtonExtender" runat="server" 
                            ConfirmText="Are you sure you want to assign the shift?" Enabled="True" TargetControlID="butSave"></cc1:ConfirmButtonExtender>
                        &nbsp;
                        <asp:Button ID="butCancel" runat="server" Text="Cancel" 
                            CausesValidation="false" style="height: 26px" /></td>
                </tr>
            </table>
        </asp:Panel>    
                        <asp:Label ID="lblMessage" runat="server" Width="552px"></asp:Label>
                        