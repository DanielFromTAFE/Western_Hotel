<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="WesternSydneyHotel.Admin.ManageRooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Room Management</h2>
    <hr />
    <asp:ValidationSummary ID="ValidationSummary2" class="alert alert-danger" ValidationGroup="updateGroup" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="rId" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="DeleteButton" class="btn btn-primary btn-xs" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" class="btn btn-default btn-xs" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="rIdLabel" runat="server" Text='<%# Eval("rId") %>' />
                </td>
                <td>
                    <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                </td>
                <td>
                    <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                </td>
                <td>
                    <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr class="success">
                <td>
                    <asp:Button ID="UpdateButton" class="btn btn-primary btn-xs" runat="server" ValidationGroup="updateGroup" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" class="btn btn-default btn-xs" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="rIdLabel1" runat="server" Text='<%# Eval("rId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="levelTextBox" runat="server" Text='<%# Bind("level") %>' ControlToValidate="levelTextBox" />
                    <asp:RequiredFieldValidator ValidationGroup="updateGroup" ID="RequiredFieldValidator9" runat="server" CssClass="text-danger" ErrorMessage="Level field required" Display="Dynamic" ControlToValidate="levelTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="updateGroup" ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Level only can be G,1,2,3" Text="*" ControlToValidate="levelTextBox" ValidationExpression="^[G,1,2,3]$"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:TextBox ID="bedsTextBox" runat="server" Text='<%# Bind("beds") %>' />
                     <asp:RequiredFieldValidator ValidationGroup="updateGroup" ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ErrorMessage="Beds field required" Display="Dynamic" ControlToValidate="bedsTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="updateGroup" ID="RegularExpressionValidator2" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Beds only can be 1,2,3" Text="*" ControlToValidate="bedsTextBox" ValidationExpression="^[1,2,3]$"></asp:RegularExpressionValidator>

                </td>
                <td>
                    <asp:TextBox ID="orientationTextBox" runat="server" Text='<%# Bind("orientation") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="updateGroup" ID="RequiredFieldValidator7" runat="server" CssClass="text-danger" ErrorMessage="Orientation field required" Display="Dynamic" ControlToValidate="orientationTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="updateGroup" ID="RegularExpressionValidator3" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Orientation only can be N,W,S,E" Text="*" ControlToValidate="orientationTextBox" ValidationExpression="^[N,W,S,E]$"></asp:RegularExpressionValidator>

                </td>
                <td>
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="updateGroup" ID="RequiredFieldValidator8" runat="server" CssClass="text-danger" ErrorMessage="Price field required" Display="Dynamic" ControlToValidate="priceTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ValidationGroup="updateGroup" ID="RangeValidator1" Text="*" runat="server" CssClass="text-danger" ErrorMessage="Must be a number between 10.00 and 1000.00" Display="Dynamic" MaximumValue="1000" MinimumValue="10" ControlToValidate="priceTextBox" Type="Currency"></asp:RangeValidator>

                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="info">
                <td>
                   <asp:Button ID="CancelButton" class="btn btn-default btn-xs" runat="server" CommandName="Cancel" Text="Clear" />
                    <asp:Button ID="InsertButton" class="btn btn-primary btn-xs" ValidationGroup="insertGroup" runat="server" CommandName="Insert" Text="Insert" />
                </td>
                <td>
                    <asp:TextBox ID="rIdTextBox" runat="server" Text='<%# Bind("rId") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="insertGroup" ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage="ID required" Display="Dynamic" ControlToValidate="rIdTextBox" Text="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="levelTextBox" runat="server" Text='<%# Bind("level") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="insertGroup" ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="Level required" Display="Dynamic" ControlToValidate="levelTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="insertGroup" ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Level only can be G,1,2,3" Text="*" ControlToValidate="levelTextBox" ValidationExpression="^[G,1,2,3]$"></asp:RegularExpressionValidator>

                </td>
                <td>
                    <asp:TextBox ID="bedsTextBox" runat="server" Text='<%# Bind("beds") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="insertGroup" ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="Beds required" Display="Dynamic" ControlToValidate="bedsTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="insertGroup" ID="RegularExpressionValidator2" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Beds only can be 1,2,3" Text="*" ControlToValidate="bedsTextBox" ValidationExpression="^[1,2,3]$"></asp:RegularExpressionValidator>

                </td>
                <td>
                    <asp:TextBox ID="orientationTextBox" runat="server" Text='<%# Bind("orientation") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="insertGroup" ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="Orientation required" Display="Dynamic" ControlToValidate="orientationTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="insertGroup" ID="RegularExpressionValidator3" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Orientation only can be N,W,S,E" Text="*" ControlToValidate="orientationTextBox" ValidationExpression="^[N,W,S,E]$"></asp:RegularExpressionValidator>

                </td>
                <td>
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="insertGroup" ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ErrorMessage="Price required" Display="Dynamic" ControlToValidate="priceTextBox" Text="*"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ValidationGroup="insertGroup" ID="RangeValidator1" Text="*" runat="server" CssClass="text-danger" ErrorMessage="Must be a number between 10.00 and 1000.00" Display="Dynamic" MaximumValue="1000" MinimumValue="10"  Type="Currency" ControlToValidate="priceTextBox"></asp:RangeValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="DeleteButton" class="btn btn-primary btn-xs" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" class="btn btn-default btn-xs" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="rIdLabel" runat="server" Text='<%# Eval("rId") %>' />
                </td>
                <td>
                    <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                </td>
                <td>
                    <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                </td>
                <td>
                    <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0"  class="table table-striped table-hover ">
                            <tr runat="server" class="active">
                                <th runat="server"></th>
                                <th runat="server">rId</th>
                                <th runat="server">level</th>
                                <th runat="server">beds</th>
                                <th runat="server">orientation</th>
                                <th runat="server">price</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" class="info"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="rIdLabel" runat="server" Text='<%# Eval("rId") %>' />
                </td>
                <td>
                    <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                </td>
                <td>
                    <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                </td>
                <td>
                    <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
      </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WesternHotel %>" DeleteCommand="DELETE FROM [rooms] WHERE [rId] = @rId" InsertCommand="INSERT INTO [rooms] ([rId], [level], [beds], [orientation], [price]) VALUES (@rId, @level, @beds, @orientation, @price)" SelectCommand="SELECT * FROM [rooms]" UpdateCommand="UPDATE [rooms] SET [level] = @level, [beds] = @beds, [orientation] = @orientation, [price] = @price WHERE [rId] = @rId">
        <DeleteParameters>
            <asp:Parameter Name="rId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="rId" Type="String" />
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="beds" Type="Byte" />
            <asp:Parameter Name="orientation" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="beds" Type="Byte" />
            <asp:Parameter Name="orientation" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="rId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" class="alert alert-danger" ValidationGroup="insertGroup" runat="server" />
</asp:Content>
