<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="CityMaster.aspx.cs" Inherits="CityMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mv" runat="server" ActiveViewIndex="1">
        <asp:View ID="Save" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" align="center">
                <tr>
                    <td colspan="2" align="center" class="head">
                        <asp:Label ID="LBStatus" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBCName" runat="server" Text="City Name"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtCityName" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBSName" runat="server" Text="State Name"></asp:Label>
                        <br />
                    </td>
                    <td>
                        <br />
                        <asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlDataSourceState"
                            DataTextField="STATENAME" DataValueField="STATEID">
                        </asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceState" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [STATEID], [STATENAME] FROM [StateMaster]"></asp:SqlDataSource>
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
        <asp:View ID="View" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" align="center">
                <tr align="center">
                    <td>
                        <asp:Label ID="lblHeaing" Text="List of City" CssClass="text " runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:GridView ID="GridViewCity" runat="server" AutoGenerateColumns="False" DataKeyNames="CityId"
                            DataSourceID="SqlDataSourceCity" OnSelectedIndexChanged="GridViewCity_SelectedIndexChanged1" CssClass="text" HeaderStyle-CssClass="head">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="CityId" HeaderText="CityId" ReadOnly="True" SortExpression="CityId" />
                                <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
                                <asp:BoundField DataField="StateId" HeaderText="StateId" SortExpression="StateId" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:SqlDataSource ID="SqlDataSourceCity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [CityMaster]" DeleteCommand="DELETE FROM [CityMaster] WHERE [CityId] = @CityId"
                            InsertCommand="INSERT INTO [CityMaster] ([CityId], [CityName], [StateId]) VALUES (@CityId, @CityName, @StateId)"
                            UpdateCommand="UPDATE [CityMaster] SET [CityName] = @CityName, [StateId] = @StateId WHERE [CityId] = @CityId">
                            <DeleteParameters>
                                <asp:Parameter Name="CityId" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CityName" Type="String" />
                                <asp:Parameter Name="StateId" Type="Int32" />
                                <asp:Parameter Name="CityId" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CityId" Type="Int32" />
                                <asp:Parameter Name="CityName" Type="String" />
                                <asp:Parameter Name="StateId" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="New City" BorderColor="White"
                            BorderStyle="Solid" BackColor="#2D5522" Font-Bold="True" Font-Size="15" ForeColor="White"
                            Width="170" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
