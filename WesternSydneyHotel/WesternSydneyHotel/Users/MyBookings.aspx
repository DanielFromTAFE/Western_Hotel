<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="WesternSydneyHotel.Users.MyBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Booking record</h2>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="bid" DataSourceID="SqlDataSource1" class="table table-striped table-hover">
        <Columns>
            <asp:BoundField DataField="gname" HeaderText="First name" SortExpression="gname" />
            <asp:BoundField DataField="sname" HeaderText="Last name" SortExpression="sname" />
            <asp:BoundField DataField="bid" HeaderText="Booking ID" SortExpression="bid" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="checkin" HeaderText="Check-In" SortExpression="checkin" />
            <asp:BoundField DataField="checkout" HeaderText="Check-out" SortExpression="checkout" />
            <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
            <asp:BoundField DataField="btime" HeaderText="Booking time" SortExpression="btime" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>" SelectCommand="SELECT customers.gname, customers.sname, bookings.bid, bookings.checkin, bookings.checkout, bookings.cost, bookings.btime FROM bookings INNER JOIN customers ON customers.username = bookings.username WHERE (bookings.username = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
