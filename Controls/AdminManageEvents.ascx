<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AdminManageEvents.ascx.vb" Inherits="Controls_AdminManageEvents" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
Shift Management Tool<br />
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
        <asp:Button ID="butAdd" runat="server" Text="Create Shift" /><br />
        <br />
        <asp:Panel ID="pnlEditEvent" runat="server" Visible="False">
            <table cellpadding="2" cellspacing="0" border="0" style="width: 904px">
                <tr>
                    <td>Shift Title:</td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTitle"
                            ErrorMessage="* Required"></asp:RequiredFieldValidator></td>
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
                    <td>
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
                        <asp:Button ID="butSave" runat="server" Text="Create" />
                        <cc1:ConfirmButtonExtender ID="butSave_ConfirmButtonExtender" runat="server" 
                            ConfirmText="Are you sure you want to create the shift?" Enabled="True" TargetControlID="butSave"></cc1:ConfirmButtonExtender>
                        &nbsp;
                        <asp:Button ID="butCancel" runat="server" Text="Cancel" CausesValidation="false" /></td>
                </tr>
            </table>
        </asp:Panel>    
                        <asp:Label ID="lblMessage" runat="server" Width="552px"></asp:Label>