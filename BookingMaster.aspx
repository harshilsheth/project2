<%@ Page Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="BookingMaster.aspx.cs" Inherits="BookingMaster" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="view" runat="server">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td align="center">
                            <asp:Label ID="Label1" runat="server" Text="Booking Master" CssClass="text"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="gvBookingMaster" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingId"
                                DataSourceID="sdsBookingMaster" OnSelectedIndexChanged="gvBookingMaster_SelectedIndexChanged" HeaderStyle-CssClass="head" CssClass="text">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="BookingId" HeaderText="BookingId" InsertVisible="False"
                                        ReadOnly="True" SortExpression="BookingId" />
                                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                                    <asp:BoundField DataField="TourId" HeaderText="TourId" SortExpression="TourId" />
                                    <asp:BoundField DataField="TBook" HeaderText="TBook" SortExpression="TBook" />
                                    <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
                                    <asp:BoundField DataField="PaymentRec" HeaderText="PaymentRec" SortExpression="PaymentRec" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:SqlDataSource ID="sdsBookingMaster" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                DeleteCommand="DELETE FROM [Booking] WHERE [BookingId] = @BookingId" InsertCommand="INSERT INTO [Booking] ([UserId], [TourId], [TBook], [TotalCost], [PaymentRec]) VALUES (@UserId, @TourId, @TBook, @TotalCost, @PaymentRec)"
                                SelectCommand="SELECT * FROM [Booking]" UpdateCommand="UPDATE [Booking] SET [UserId] = @UserId, [TourId] = @TourId, [TBook] = @TBook, [TotalCost] = @TotalCost, [PaymentRec] = @PaymentRec WHERE [BookingId] = @BookingId">
                                <DeleteParameters>
                                    <asp:Parameter Name="BookingId" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="UserId" Type="Int32" />
                                    <asp:Parameter Name="TourId" Type="Int32" />
                                    <asp:Parameter Name="TBook" Type="Int32" />
                                    <asp:Parameter Name="TotalCost" Type="Int32" />
                                    <asp:Parameter Name="PaymentRec" Type="String" />
                                    <asp:Parameter Name="BookingId" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="UserId" Type="Int32" />
                                    <asp:Parameter Name="TourId" Type="Int32" />
                                    <asp:Parameter Name="TBook" Type="Int32" />
                                    <asp:Parameter Name="TotalCost" Type="Int32" />
                                    <asp:Parameter Name="PaymentRec" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Edit" runat="server">
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblHeading" runat="server" Text="Payment Received" Font-Size="X-Large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMassage" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPayment" runat="server" Text="Is Payment Received"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                    <td colspan ="2" align ="center" >
                        <asp:Button ID="btnViewDetail" runat="server" Text="Ticket Person Detail" 
                            onclick="btnViewDetail_Click" />
                    </td>
                    </tr>
                    <tr>
                        <td align ="center" >
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </td>
                        <td align ="center" >
                            
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="TicketDetail" runat="server"  >
            <table >
            <tr>
            <td>
                <asp:Label ID="lblTicketDetail" runat="server" Text="Ticket Detail"  CssClass="text" ></asp:Label>
            </td>
            </tr>
            <tr>
            <td>
                <asp:GridView ID="gvTicketDetail" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id" DataSourceID="sdsTicketDetail">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" 
                            SortExpression="Gender" />
                        <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" 
                            SortExpression="ContactNo" />
                    </Columns>
                </asp:GridView>
            </td>
            </tr>
            <tr>
            <td>
                <asp:SqlDataSource ID="sdsTicketDetail" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [BookingDetail] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [BookingDetail] ([Name], [Age], [Gender], [ContactNo]) VALUES (@Name, @Age, @Gender, @ContactNo)" 
                    SelectCommand="SELECT [Id], [Name], [Age], [Gender], [ContactNo] FROM [BookingDetail] WHERE ([BookingId] = @BookingId)" 
                    UpdateCommand="UPDATE [BookingDetail] SET [Name] = @Name, [Age] = @Age, [Gender] = @Gender, [ContactNo] = @ContactNo WHERE [Id] = @Id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfBId" Name="BookingId" PropertyName="Value" 
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Age" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="ContactNo" Type="Decimal" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Age" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="ContactNo" Type="Decimal" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            <tr>
            <td>
                <asp:Button ID="btnOk" runat="server" Text="Ok" onclick="btnOk_Click" />
            </td>
            </tr>
            <tr>
            <td>
                <asp:HiddenField ID="hfBId" runat="server" />
            </td>
            </tr>
            </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
