<%@ Page Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="SecurityImage.aspx.cs" Inherits="SecurityImage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:MultiView ID="mvSecurityImage" runat="server" ActiveViewIndex="0">
            <asp:View ID="View" runat="server">
                <table>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblSecurityImage" runat="server" Text="Security Image" CssClass="text"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gvSecurityImage" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                                DataSourceID="sdsSecurityImage" OnSelectedIndexChanged="gvSecurityImage_SelectedIndexChanged" HeaderStyle-CssClass="head" CssClass="text">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="ImgPath" HeaderText="ImgPath" SortExpression="ImgPath" />
                                    <asp:BoundField DataField="Ans" HeaderText="Ans" SortExpression="Ans" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="sdsSecurityImage" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                DeleteCommand="DELETE FROM [Securityimg] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Securityimg] ([Id], [ImgPath], [Ans]) VALUES (@Id, @ImgPath, @Ans)"
                                SelectCommand="SELECT * FROM [Securityimg]" UpdateCommand="UPDATE [Securityimg] SET [ImgPath] = @ImgPath, [Ans] = @Ans WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ImgPath" Type="String" />
                                    <asp:Parameter Name="Ans" Type="String" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                    <asp:Parameter Name="ImgPath" Type="String" />
                                    <asp:Parameter Name="Ans" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align ="center" >
                            <asp:Button ID="btnNew" runat="server" Text="Add New" OnClick="btnNew_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Save" runat="server">
                <table>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Label ID="lblAdd" runat="server" Text="Add/Edit Security Image" Font-Size="Large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblImagePath" runat="server" Text="ImagePath"></asp:Label>
                        </td>
                        <td>
                            
                            <asp:FileUpload ID="fuImagePath" runat="server"  />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblAns" runat="server" Text="Answer"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox ID="txtAns" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                    <td >
                        
                    </td>
                    <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
                       &nbsp;&nbsp;&nbsp; <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                            onclick="btnCancel_Click" />
                    </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
