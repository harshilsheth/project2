<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="CountryMaster.aspx.cs" Inherits="CountryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
        <asp:View ID="ViewInsert" runat="server">
            <table width="500px" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td colspan="2" align="center" class="head">
                        <asp:Label ID="LBStatus" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBCName" runat="server" Text="Country Name"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="TBName" runat="server" Width="150px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter The Properly"
                            Text="Name Not Blank " ControlToValidate="TBName"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="menu">
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
                            Width="75" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="LBSubStr" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ViewDisplay" runat="server">
            <table cellpadding="0" cellspacing="0" align="center"  style="vertical-align:top">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblHeading" Text="List of Country" runat="server" CssClass="text"></asp:Label>
                    </td>
                </tr>
                <tr >
                    <td >
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [CountryMaster]" DeleteCommand="DELETE FROM [CountryMaster] WHERE [CountryId] = @CountryId"
                            InsertCommand="INSERT INTO [CountryMaster] ([CountryId], [CountryName]) VALUES (@CountryId, @CountryName)"
                            UpdateCommand="UPDATE [CountryMaster] SET [CountryName] = @CountryName WHERE [CountryId] = @CountryId">
                            <DeleteParameters>
                                <asp:Parameter Name="CountryId" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CountryName" Type="String" />
                                <asp:Parameter Name="CountryId" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CountryId" Type="Int32" />
                                <asp:Parameter Name="CountryName" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text"><center>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CountryId"
                            DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                            HeaderStyle-CssClass="head">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="CountryId" HeaderText="CountryId" ReadOnly="True" SortExpression="CountryId" />
                                <asp:BoundField DataField="CountryName" HeaderText="CountryName" SortExpression="CountryName" />
                            </Columns>
                        </asp:GridView></center>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnNewCountry" runat="server" Text="NEW COUNTRY" align="center" BorderColor="White"
                            BorderStyle="Solid" BackColor="#2D5522" Font-Bold="True" Font-Size="15" ForeColor="White"
                            Width="170" OnClick="btnNewCountry_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
