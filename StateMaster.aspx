<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="StateMaster.aspx.cs" Inherits="StateMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mv" runat="server" ActiveViewIndex="1">
        <asp:View ID="Save" runat="server">
            <table width="500px" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td colspan="2" align="center" class="head">
                        <asp:Label ID="LBStatus" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBName" runat="server" Text="State Name"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="TxtStateName" runat="server" Width="150px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter The Properly"
                            Text="Name Not Blank " ControlToValidate="TxtStateName"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <asp:Label ID="LBCName" runat="server" Text="Country Name"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSourceCountry"
                            DataTextField="COUNTRYNAME" DataValueField="COUNTRYID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [COUNTRYID], [COUNTRYNAME] FROM [CountryMaster]"></asp:SqlDataSource>
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
            <table cellpadding="0" cellspacing="0" align="center">
                <tr align="center">
                    <td>
                        <asp:Label ID="lnlHeading" Text="List of State" runat="server" CssClass="text"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:GridView ID="GridViewState" runat="server" AutoGenerateColumns="False" DataKeyNames="StateId"
                            DataSourceID="SqlDataSourceState" OnSelectedIndexChanged="GridViewState_SelectedIndexChanged1" HeaderStyle-CssClass="head" CssClass="text">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="StateId" HeaderText="StateId" ReadOnly="True" SortExpression="StateId" />
                                <asp:BoundField DataField="StateName" HeaderText="StateName" SortExpression="StateName" />
                                <asp:BoundField DataField="Countryid" HeaderText="Countryid" SortExpression="Countryid" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:SqlDataSource ID="SqlDataSourceState" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            DeleteCommand="DELETE FROM [StateMaster] WHERE [StateId] = @StateId" InsertCommand="INSERT INTO [StateMaster] ([StateId], [StateName], [Countryid]) VALUES (@StateId, @StateName, @Countryid)"
                            SelectCommand="SELECT * FROM [StateMaster]" UpdateCommand="UPDATE [StateMaster] SET [StateName] = @StateName, [Countryid] = @Countryid WHERE [StateId] = @StateId">
                            <DeleteParameters>
                                <asp:Parameter Name="StateId" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="StateName" Type="String" />
                                <asp:Parameter Name="Countryid" Type="Int32" />
                                <asp:Parameter Name="StateId" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="StateId" Type="Int32" />
                                <asp:Parameter Name="StateName" Type="String" />
                                <asp:Parameter Name="Countryid" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="New State"
                            BorderColor="White" BorderStyle="Solid" BackColor="#2D5522" Font-Bold="True"
                            Font-Size="15" ForeColor="White" Width="170" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
