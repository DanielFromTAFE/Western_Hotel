<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="WesternSydneyHotel.Admin.Statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <label for="select" class="col-lg-2 control-label">Chart type</label>
                <asp:DropDownList ID="DDLType" class="form-control" runat="server" AutoPostBack="True">
                    <asp:ListItem>Column</asp:ListItem>
                    <asp:ListItem>Pie</asp:ListItem>
                    <asp:ListItem>Line</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <label for="select" class="col-lg-2 control-label">Dimension</label>
                <asp:DropDownList ID="DDLDimension" class="form-control" runat="server" AutoPostBack="True">
                    <asp:ListItem>2D</asp:ListItem>
                    <asp:ListItem>3D</asp:ListItem>
                </asp:DropDownList>
            </div>

            <hr />
            <br />
            <div class="form-group">
                <div>
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="1100px">
                        <Titles>
                            <asp:Title Text="The number of bookings for each Room ID"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" XValueMember="Room ID" YValueMembers="Book times"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Room ID" Interval="1"></AxisX>
                                
                                <AxisY Title="Number of booking"></AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>" SelectCommand="SELECT rid AS 'Room ID', COUNT(rid) AS 'Book times' FROM bookings GROUP BY rid"></asp:SqlDataSource>
                </div>
            </div>
            <hr />

            <div class="form-group">
                <p>
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="1100px">
                        <Titles>
                            <asp:Title Text="The number of bookings submitted in each month"></asp:Title>
                        </Titles>

                        <Series>
                            <asp:Series Name="Series1" XValueMember="Month" YValueMembers="Book times"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Month" Interval="1"></AxisX>
                                <AxisY Title="Number of booking"></AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </p>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>" SelectCommand="SELECT DATENAME(Month, btime) AS 'Month', COUNT(*) AS 'Book times' FROM bookings GROUP BY DATENAME(Month, btime)"></asp:SqlDataSource>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
