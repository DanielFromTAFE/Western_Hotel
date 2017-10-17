<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchRooms.aspx.cs" Inherits="WesternSydneyHotel.Users.SearchRooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
  <fieldset>
    <legend>Search room</legend>
    <div class="form-group">
      <label for="select" class="col-lg-2 control-label">Number of beds</label>
      <div class="col-lg-10">
          <asp:DropDownList  class="form-control" id="DDLBeds" runat="server">
              <asp:ListItem text="Select" Value="0" />
              <asp:ListItem>1</asp:ListItem>
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
          </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" CssClass="text-danger" Display="Dynamic" ErrorMessage="The room of beds field is required." ControlToValidate="DDLBeds"></asp:RequiredFieldValidator>
        <br>
      </div>
    </div>
      <div class="form-group">
      <label for="select" class="col-lg-2 control-label">Orientation</label>
      <div class="col-lg-10">
          <asp:DropDownList  class="form-control" id="DDLOri" runat="server">
              <asp:ListItem text="Optional" Value="" />
              <asp:ListItem Value="N" Text="N">North</asp:ListItem>
              <asp:ListItem Value="S" Text="S">South</asp:ListItem>
              <asp:ListItem Value="W" Text="W" >West</asp:ListItem>
              <asp:ListItem Value="E" Text="E">East</asp:ListItem>
          </asp:DropDownList>
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  class="table table-striped table-hover">
        <Columns>
            <asp:BoundField DataField="rId" HeaderText="Room ID" />
            <asp:BoundField DataField="level" HeaderText="Level" />
            <asp:BoundField DataField="beds" HeaderText="Beds" />
            <asp:BoundField DataField="orientation" HeaderText="Orientation" />
            <asp:BoundField DataField="price" HeaderText="Price" />
        </Columns>
    </asp:GridView>
    
    <div class="alert alert-dismissible alert-warning" id="sr_alert" runat="server" Visible="false">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>No available room</h4>
    <p>Please search again.</p>
    </div>
</asp:Content>
