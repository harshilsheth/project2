<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="HotelMaster.aspx.cs" Inherits="HotelMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
        <asp:View ID="ViewSave" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" align="center">
                <tr>
                    <td colspan="2" align="center" class="head">
                        <asp:Label ID="LBStatus" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBHotelName" runat="server" Text="Hotel Name"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtHotelName" runat="server" column="25"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBRoomCharge" runat="server" Text="Room Charge"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtRoomCharge" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBCityName" runat="server" Text="City Name"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:DropDownList ID="ddlcity" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                            DataTextField="CityName" DataValueField="CityId">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [CityMaster]"></asp:SqlDataSource>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="BtnSave" runat="server" Text="Save" BorderColor="White" BorderStyle="Solid"
                            BackColor="#2D5522" Font-Bold="True" Font-Size="15" ForeColor="White" Width="75"
                            OnClick="BtnSave_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" BorderColor="White" BorderStyle="Solid"
                            BackColor="#2D5522" Font-Bold="True" Font-Size="15" ForeColor="White" CausesValidation="False"
                            Width="80" OnClick="BtnCancel_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ViewDisplay" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" align="center">
            <tr align="center">
            <td>
            <asp:label ID="lblHead" runat="server" Text="List of Hotel" CssClass="text"></asp:label>
            </td>
            </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelId"
                            DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HeaderStyle-CssClass=" head" CssClass="text">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="HotelId" HeaderText="HotelId" ReadOnly="True" SortExpression="HotelId" />
                                <asp:BoundField DataField="HotelName" HeaderText="HotelName" SortExpression="HotelName" />
                                <asp:BoundField DataField="RoomCharge" HeaderText="RoomCharge" SortExpression="RoomCharge" />
                                <asp:BoundField DataField="CityId" HeaderText="CityId" SortExpression="CityId" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [HotelMaster]" DeleteCommand="DELETE FROM [HotelMaster] WHERE [HotelId] = @HotelId"
                            InsertCommand="INSERT INTO [HotelMaster] ([HotelId], [HotelName], [RoomCharge], [CityId]) VALUES (@HotelId, @HotelName, @RoomCharge, @CityId)"
                            UpdateCommand="UPDATE [HotelMaster] SET [HotelName] = @HotelName, [RoomCharge] = @RoomCharge, [CityId] = @CityId WHERE [HotelId] = @HotelId">
                            <DeleteParameters>
                                <asp:Parameter Name="HotelId" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="HotelName" Type="String" />
                                <asp:Parameter Name="RoomCharge" Type="String" />
                                <asp:Parameter Name="CityId" Type="Decimal" />
                                <asp:Parameter Name="HotelId" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="HotelId" Type="Int32" />
                                <asp:Parameter Name="HotelName" Type="String" />
                                <asp:Parameter Name="RoomCharge" Type="String" />
                                <asp:Parameter Name="CityId" Type="Decimal" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="New Hotel"
                            BorderColor="White" BorderStyle="Solid" BackColor="#2D5522" Font-Bold="True"
                            Font-Size="15" ForeColor="White" Width="170" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
