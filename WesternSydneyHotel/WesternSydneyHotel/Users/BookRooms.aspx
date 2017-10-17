<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookRooms.aspx.cs" Inherits="WesternSydneyHotel.Users.BookRooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="form-horizontal">

      <fieldset>
    <legend>Book room</legend>
    <div class="form-group">
      <label for="select" class="col-lg-2 control-label">Room ID</label>
      <div class="col-lg-10">
          <asp:DropDownList  class="form-control" id="DDLRoomId" runat="server" DataSourceID="SqlDataSource1" DataTextField="rId" DataValueField="rId">
          </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" CssClass="text-danger" Display="Dynamic" ErrorMessage="The room of beds field is required." ControlToValidate="DDLRoomId"></asp:RequiredFieldValidator>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>" SelectCommand="SELECT [rId] FROM [rooms]"></asp:SqlDataSource>
        <br>
      </div>
    </div>
      <div class="form-group">
      <label class="col-lg-2 control-label">Check in</label>
      <div class="col-lg-10">
          <asp:TextBox ID="txtCheckIn" class="form-control" placeholder="Check in" runat="server" TextMode="Date"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="The ccheck in field is required." ControlToValidate="txtCheckIn"></asp:RequiredFieldValidator>
      <asp:CompareValidator ID="checkInDate" ControlToValidate="txtCheckIn" Type="Date" Operator="GreaterThan"
                            ErrorMessage="Date must be after today" Display="Dynamic" CssClass="text-danger" 
                            runat="server"></asp:CompareValidator>
           <asp:CompareValidator
    id="CompareValidator1" runat="server" 
    ControlToValidate="txtCheckIn"
    ErrorMessage="Please enter a valid date." Operator="DataTypeCheck" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
      </div>          
    </div>
          <div class="form-group">
      <label class="col-lg-2 control-label">Check out</label>
      <div class="col-lg-10">
          <asp:TextBox ID="txtCheckOut" class="form-control" placeholder="Check out" runat="server" TextMode="Date"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="The check out field is required." ControlToValidate="txtCheckOut"></asp:RequiredFieldValidator>     
                <asp:CompareValidator ID="checkOutDate" ControlToValidate="txtCheckOut" Type="Date" Operator="GreaterThan"
                            ErrorMessage="Check out must be after check in date" Display="Dynamic" CssClass="text-danger" 
                            runat="server" ControlToCompare="txtCheckIn"></asp:CompareValidator>
          <asp:CompareValidator
    id="dateValidator" runat="server" 
    ControlToValidate="txtCheckOut"
    ErrorMessage="Please enter a valid date." Operator="DataTypeCheck" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
      </div>
        </div>

      <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2 modal-footer">
          <asp:Button ID="btnReset" runat="server" Text="Reset" OnClientClick="this.form.reset();return false;" class="btn btn-default" />
          <asp:Button ID="btnSubmit" runat="server" Text="Submit"  class="btn btn-primary" OnClick="btnSubmit_Click" />
      </div>
    </div>
          </fieldset>
     </div>
        <div class="alert alert-dismissible alert-success" id="success_alert" runat="server" Visible="false">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <strong>Thank you!</strong><p>You successfully booked your room!</p>
    </div>
    <table class="table table-striped table-hover " runat="server" id="tb_invoice" visible="false" >
  <thead>
    <tr>
      <th>Room ID</th>
      <th>Check in</th>
      <th>Check out</th>
      <th>Cost</th>
    </tr>
  </thead>
  <tbody>
<tr class="success">
      <td><%= DDLRoomId.SelectedValue %></td>
      <td><%= txtCheckIn.Text %></td>
      <td><%= txtCheckOut.Text %></td>
      <td id="td_cost"></td>
    </tr>
        </tbody>
</table> 
    <div class="alert alert-dismissible alert-warning" id="br_alert" runat="server" Visible="false">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4><strong>No available room</strong></h4>
    <p>Please search again.</p>
    </div>
</asp:Content>
