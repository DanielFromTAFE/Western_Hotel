<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WesternSydneyHotel.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
     <fieldset>
    <legend>Create a new account</legend>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="Email" CssClass="text-danger" Display="Dynamic" ErrorMessage="Invalid email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Given name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtGivenName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtGivenName"
                    CssClass="text-danger" ErrorMessage="The given name field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtGivenName" Display="Dynamic" ErrorMessage="RegularExpressionValidator" Text="English letters, apostrophe and hyphen only, at most 20 letters long" ValidationExpression="^([a-zA-Z/'/-]{1,20})$" CssClass="text-danger"></asp:RegularExpressionValidator>

            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Family name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFamilyName" CssClass="form-control" TextMode="Singleline" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtFamilyName"
                    CssClass="text-danger" ErrorMessage="The family name field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFamilyName" Display="Dynamic" ErrorMessage="RegularExpressionValidator" Text="English letters, apostrophe and hyphen only, at most 20 letters long" ValidationExpression="^([a-zA-Z/'/-]{1,20})$" CssClass="text-danger"></asp:RegularExpressionValidator>
            </div>
        </div>
                <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-lg-10">
                <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtAddress"
                    CssClass="text-danger" ErrorMessage="The address field is required." />
            </div>
        </div>
            <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Suburb</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtSuburb" CssClass="form-control" TextMode="Singleline" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtSuburb"
                    CssClass="text-danger" ErrorMessage="The suburb field is required." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DDLState" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="DDLState" class="col-lg-2 control-label" runat="server">
                    <asp:ListItem text="Choose here" Value="" />
                    <asp:ListItem>NSW</asp:ListItem>
                    <asp:ListItem>VIC</asp:ListItem>
                    <asp:ListItem>QLD</asp:ListItem>
                    <asp:ListItem>SA</asp:ListItem>
                    <asp:ListItem>TSA</asp:ListItem>
                    <asp:ListItem>WA</asp:ListItem>
                    <asp:ListItem>ACT</asp:ListItem>
                    <asp:ListItem>NT</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The state field is required." />
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Postcode</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtPostcode" CssClass="form-control" TextMode="Singleline" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtPostcode"
                    CssClass="text-danger" ErrorMessage="The postcode field is required." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPostcode" CssClass="text-danger" Display="Dynamic" ErrorMessage="Must be 4 digits" ValidationExpression="^[\d]{4}$"></asp:RegularExpressionValidator>

            </div>
        </div>
                  <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Mobile</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control" TextMode="Singleline" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobile"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The postcode field is required." />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMobile" CssClass="text-danger" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0][4]\d{8}">Must be in format 04dd ddd ddd, where d is a digit</asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
         </fieldset>
    </div>

</asp:Content>
