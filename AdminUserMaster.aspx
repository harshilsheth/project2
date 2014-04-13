<%@ Page Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="AdminUserMaster.aspx.cs" Inherits="AdminUserMaster" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td align="center">
                    <asp:Label ID="lblUserMaster" runat="server" Text="USER MASTER" CssClass="text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvUserMaster" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                        DataSourceID="sdsUserMaster" HeaderStyle-CssClass="head" CssClass="text">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                SortExpression="id" />
                            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                            <asp:BoundField DataField="Countryid" HeaderText="Countryid" SortExpression="Countryid" />
                            <asp:BoundField DataField="Stateid" HeaderText="Stateid" SortExpression="Stateid" />
                            <asp:BoundField DataField="Cityid" HeaderText="Cityid" SortExpression="Cityid" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="Emailid" HeaderText="Emailid" SortExpression="Emailid" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="sdsUserMaster" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [Registration] WHERE [id] = @id" InsertCommand="INSERT INTO [Registration] ([Firstname], [Lastname], [Countryid], [Stateid], [Cityid], [Username], [Password], [Emailid]) VALUES (@Firstname, @Lastname, @Countryid, @Stateid, @Cityid, @Username, @Password, @Emailid)"
                        SelectCommand="SELECT * FROM [Registration]" UpdateCommand="UPDATE [Registration] SET [Firstname] = @Firstname, [Lastname] = @Lastname, [Countryid] = @Countryid, [Stateid] = @Stateid, [Cityid] = @Cityid, [Username] = @Username, [Password] = @Password, [Emailid] = @Emailid WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Firstname" Type="String" />
                            <asp:Parameter Name="Lastname" Type="String" />
                            <asp:Parameter Name="Countryid" Type="Int32" />
                            <asp:Parameter Name="Stateid" Type="Int32" />
                            <asp:Parameter Name="Cityid" Type="Int32" />
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Emailid" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Firstname" Type="String" />
                            <asp:Parameter Name="Lastname" Type="String" />
                            <asp:Parameter Name="Countryid" Type="Int32" />
                            <asp:Parameter Name="Stateid" Type="Int32" />
                            <asp:Parameter Name="Cityid" Type="Int32" />
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Emailid" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
