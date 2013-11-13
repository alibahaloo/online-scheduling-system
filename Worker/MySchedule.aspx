<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MySchedule.aspx.vb" Inherits="MySchedule" title="Untitled Page" %>


<%@ Register src="../Controls/Calendar.ascx" tagname="Calendar" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FF9900;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 205px;
        }
        .style5
        {
            width: 849px;
        }
        .style6
        {
            width: 119px;
        }
        .style7
        {
            color: #00FF00;
        }
        .style8
        {
            color: #FF9900;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftSide" Runat="Server">
  <ul>
    <li><a href="Default.aspx">Home</a></li>
    <li><a href="CoSchedule.aspx">Company's Schedule</a></li>
    <li class="active"><a href="MySchedule.aspx">My Schedule</a></li>
    <li><a href="Messaging.aspx">Messaging</a></li>
    <li><a href="ChangePassword.aspx">Change Password</a></li>
        <asp:LinkButton ID="LinkButton1" runat="server" 
            PostBackUrl="~/Admin/Default.aspx" Visible="False">Manager Tools</asp:LinkButton>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Header" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/MySchedule.gif" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
    <h3 class="style1">
 
        An overview of you own work schedule.</h3><br />
  
<div>
    <h5>
        <h1>Click on the <span class="style7">green</span> arrow to view more details about that shift.</h1></h5>
    <h1>The date shown in <span class="style8">Orange</span> is the current date.</h1>
  
    
    <center>
    <h3>
    My Schedule</h3>
        <div>
        
        
        
            <table class="style3">
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Prev" />
                    </td>
                    <td>
                        <h4>
                            <asp:Label ID="weekNr" runat="server" Text="WEEK"></asp:Label>
                        </h4>
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Next" />
                    </td>
                </tr>
            </table>
            <br />
        
        
        
        </div>
        <table class="style5" style="border: thin groove #C0C0C0">
            <tr>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        Monday</h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        Tuesday</h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        Wednesday</h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        Thursday</h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        Friday</h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        Saturday</h5>
                </td>
                <td class="style6">
                    <h5>
                        Sunday</h5>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        <asp:Label ID="dateMon" runat="server" Text="Date"></asp:Label>
                    </h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        <asp:Label ID="dateTue" runat="server" Text="Date"></asp:Label>
                    </h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        <asp:Label ID="dateWed" runat="server" Text="Date"></asp:Label>
                    </h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        <asp:Label ID="dateThu" runat="server" Text="Date"></asp:Label>
                    </h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        <asp:Label ID="dateFri" runat="server" Text="Date"></asp:Label>
                    </h5>
                </td>
                <td class="style6">
                    <h5 style="border-right-style: groove; border-right-width: thin; border-right-color: #C0C0C0">
                        <asp:Label ID="dateSat" runat="server" Text="Date"></asp:Label>
                    </h5>
                </td>
                <td class="style6">
                    <h5>
                        <asp:Label ID="dateSun" runat="server" Text="Date"></asp:Label>
                    </h5>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:GridView ID="GridView1" runat="server" 
                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.bmp" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="End time" 
                                SortExpression="EndTime" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td class="style6">
                    <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource2" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.bmp" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="End time" 
                                SortExpression="EndTime" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td class="style6">
                    <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource3" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.bmp" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="End time" 
                                SortExpression="EndTime" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td class="style6">
                    <asp:GridView ID="GridView5" runat="server" DataSourceID="SqlDataSource4" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.bmp" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="End time" 
                                SortExpression="EndTime" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td class="style6">
                    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource5" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.bmp" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="End time" 
                                SortExpression="EndTime" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td class="style6">
                    <asp:GridView ID="GridView6" runat="server" DataSourceID="SqlDataSource6" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.bmp" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="End time" 
                                SortExpression="EndTime" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td class="style6">
                    <asp:GridView ID="GridView7" runat="server" DataSourceID="SqlDataSource7" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/arrow.bmp" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                                SortExpression="StartTime" />
                            <asp:BoundField DataField="EndTime" HeaderText="End time" 
                                SortExpression="EndTime" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <div>
        
        
            <br />
        
        </div>
        </center>
        <div> 
            <h5>
                &nbsp;</h5>
          <div> 
          
              <table class="style3" width="150">
                  <tr>
                      <td class="style4">
                          <h4>
        <asp:Label ID="labelShiftDetail" runat="server" Text="Shift detail:" Visible="False" 
                                  ForeColor="#FF9900"></asp:Label>
                          </h4>
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                DataSourceID="SqlDataSource1" Height="50px" Visible="False" 
                Width="197px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                        SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End time" 
                        SortExpression="EndTime" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                DataSourceID="SqlDataSource2" Height="50px" Visible="False" Width="197px" 
                              CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                        SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End time" 
                        SortExpression="EndTime" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
            <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                DataSourceID="SqlDataSource3" Height="50px" Visible="False" Width="197px" 
                              CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                        SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End time" 
                        SortExpression="EndTime" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
            <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" 
                DataSourceID="SqlDataSource4" Height="50px" Visible="False" Width="197px" 
                              CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                        SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End time" 
                        SortExpression="EndTime" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
            <asp:DetailsView ID="DetailsView5" runat="server" AutoGenerateRows="False" 
                DataSourceID="SqlDataSource5" Height="50px" Visible="False" Width="197px" 
                              CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                        SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End time" 
                        SortExpression="EndTime" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
            <asp:DetailsView ID="DetailsView6" runat="server" AutoGenerateRows="False" 
                DataSourceID="SqlDataSource6" Height="50px" Visible="False" Width="197px" 
                              CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                        SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End time" 
                        SortExpression="EndTime" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style4">
            <asp:DetailsView ID="DetailsView7" runat="server" AutoGenerateRows="False" 
                DataSourceID="SqlDataSource7" Height="50px" Visible="False" Width="197px" 
                              CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="StartTime" HeaderText="Start time" 
                        SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End time" 
                        SortExpression="EndTime" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
        
                      </td>
                      <td>
                          &nbsp;</td>
                  </tr>
              </table>
          
          </div>
        
        </div>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Description], [StartTime], [EndTime] FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Title] = @Title))">
                <SelectParameters>
                    <asp:ProfileParameter Name="StartDate" PropertyName="dateSun" Type="DateTime" />
                    <asp:ProfileParameter Name="Title" PropertyName="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Description], [StartTime], [EndTime] FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Title] = @Title))">
                <SelectParameters>
                    <asp:ProfileParameter Name="StartDate" PropertyName="dateSat" Type="DateTime" />
                    <asp:ProfileParameter Name="Title" PropertyName="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Description], [StartTime], [EndTime] FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Title] = @Title))">
                <SelectParameters>
                    <asp:ProfileParameter Name="StartDate" PropertyName="dateFri" Type="DateTime" />
                    <asp:ProfileParameter Name="Title" PropertyName="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Description], [StartTime], [EndTime] FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Title] = @Title))">
                <SelectParameters>
                    <asp:ProfileParameter Name="StartDate" PropertyName="dateThu" Type="DateTime" />
                    <asp:ProfileParameter Name="Title" PropertyName="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Description], [StartTime], [EndTime] FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Title] = @Title))">
                <SelectParameters>
                    <asp:ProfileParameter Name="StartDate" PropertyName="dateWed" Type="DateTime" />
                    <asp:ProfileParameter Name="Title" PropertyName="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Description], [StartTime], [EndTime] FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Title] = @Title))">
                <SelectParameters>
                    <asp:ProfileParameter Name="StartDate" PropertyName="dateTue" Type="DateTime" />
                    <asp:ProfileParameter Name="Title" PropertyName="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Description], [StartTime], [EndTime] FROM [RecurEvents] WHERE (([StartDate] = @StartDate) AND ([Title] = @Title))">
                <SelectParameters>
                    <asp:ProfileParameter Name="StartDate" PropertyName="dateMon" Type="DateTime" />
                    <asp:ProfileParameter Name="Title" PropertyName="userID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
   <br />
   
</div>
</asp:Content>

