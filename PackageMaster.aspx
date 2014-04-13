<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="PackageMaster.aspx.cs" Inherits="PackageMaster" %>

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
                        <asp:Label ID="LBPackageName" runat="server" Text="Package Name"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtPackageName" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBPackageImg" runat="server" Text="Package Image"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtPackageImg" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="LBPackageCost" runat="server" Text="Package Cost"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtCost" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="lblNoofDays" runat="server" Text="No. Of Days"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtNoofDays" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" class="menu">
                        <br />
                        <asp:Label ID="lblPackageDetail" runat="server" Text="Package Detail"></asp:Label>
                        <br />
                    </td>
                    <td class="menu">
                        <br />
                        <asp:TextBox ID="txtPackageDetail" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="menu">
                        <asp:Label ID="lblPackageType" runat="server" Text="Package Type"></asp:Label>
                    </td>
                    <td class="menu">
                        <asp:DropDownList ID="ddlPType" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>HoneyMoon</asp:ListItem>
                            <asp:ListItem>Religious</asp:ListItem>
                            <asp:ListItem>General</asp:ListItem>
                        </asp:DropDownList>
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
                        <asp:Label ID="lblHeading" runat="server" Text="List of Packages" CssClass="text"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageId"
                            DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HeaderStyle-CssClass="head" CssClass="text">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="PackageId" HeaderText="PackageId" ReadOnly="True" SortExpression="PackageId" />
                                <asp:BoundField DataField="PackageName" HeaderText="PackageName" SortExpression="PackageName" />
                                <asp:BoundField DataField="PackageImage" HeaderText="PackageImage" SortExpression="PackageImage" />
                                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                                <asp:BoundField DataField="NoofDays" HeaderText="NoofDays" SortExpression="NoofDays" />
                                <asp:BoundField DataField="PackageDetail" HeaderText="PackageDetail" SortExpression="PackageDetail" />
                                <asp:BoundField DataField="PackageType" HeaderText="PackageType" SortExpression="PackageType" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [PackageMaster]" DeleteCommand="DELETE FROM [PackageMaster] WHERE [PackageId] = @PackageId"
                            InsertCommand="INSERT INTO [PackageMaster] ([PackageId], [PackageName], [PackageImage], [Cost], [NoofDays], [PackageDetail], [PackageType]) VALUES (@PackageId, @PackageName, @PackageImage, @Cost, @NoofDays, @PackageDetail, @PackageType)"
                            UpdateCommand="UPDATE [PackageMaster] SET [PackageName] = @PackageName, [PackageImage] = @PackageImage, [Cost] = @Cost, [NoofDays] = @NoofDays, [PackageDetail] = @PackageDetail, [PackageType] = @PackageType WHERE [PackageId] = @PackageId">
                            <DeleteParameters>
                                <asp:Parameter Name="PackageId" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="PackageName" Type="String" />
                                <asp:Parameter Name="PackageImage" Type="String" />
                                <asp:Parameter Name="Cost" Type="Int32" />
                                <asp:Parameter Name="NoofDays" Type="String" />
                                <asp:Parameter Name="PackageDetail" Type="String" />
                                <asp:Parameter Name="PackageType" Type="String" />
                                <asp:Parameter Name="PackageId" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="PackageId" Type="Int32" />
                                <asp:Parameter Name="PackageName" Type="String" />
                                <asp:Parameter Name="PackageImage" Type="String" />
                                <asp:Parameter Name="Cost" Type="Int32" />
                                <asp:Parameter Name="NoofDays" Type="String" />
                                <asp:Parameter Name="PackageDetail" Type="String" />
                                <asp:Parameter Name="PackageType" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="New Package"
                            BorderColor="White" BorderStyle="Solid" BackColor="#2D5522" Font-Bold="True"
                            Font-Size="15" ForeColor="White" Width="170" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
