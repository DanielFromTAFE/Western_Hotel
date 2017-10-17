<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WesternSydneyHotel._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" id="customers" visible="false" runat="server">
        <h1>Welcome to Western Sydney Hotel</h1>
        <hr />
        <h2>Here is what you can do with this website</h2>
        <br />
        <p>
            <strong>Search rooms</strong> allows you to search available hotel rooms by presenting a form with the
following input fields
        </p>
        <p><strong>Book rooms</strong> allows logged-in customers to book a hotel room by entering the following information</p>
        <p><strong>Browse booking history</strong> you should be able to see all bookings that made by you </p>

    </div>

    <div class="jumbotron" id="admin" visible="false" runat="server">
        <h1>Welcome back</h1>
        <p><strong>Manage rooms</strong> allows you to List, delete and insert hotel rooms</p>
        <p><strong>Statistics</strong> allows you to plot two charts on the following statistics</p>
        <ul>
            <li>The number of bookings for each Room ID </li>
            <li>The number of bookings submitted in each month</li>
        </ul>
    </div>

    <div class="jumbotron" id="anonymous" visible="false" runat="server">
        <h1>Welcome to Western Sydney Hotel</h1>
        <br />
        <p>
            A hotel is an establishment that provides lodging paid on a short-term basis. Facilities provided may range from a modest-quality mattress in a small room to large suites with bigger, higher-quality beds, a dresser, a fridge and other kitchen facilities, upholstered chairs, a flatscreen television and en-suite bathrooms.
        </p>
    </div>


</asp:Content>
