<%@ Page Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="TempBooking.aspx.cs" Inherits="TempBooking" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<table>
<tr>
<td>
    <asp:Label ID="lblTempBooking" runat="server" Text="Temporary Booking"></asp:Label>
</td>
</tr>
<tr>
<td>
    <asp:GridView ID="gvTempBooking" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Srno" DataSourceID="sdsTempBooking">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="Srno" HeaderText="Srno" InsertVisible="False" 
                ReadOnly="True" SortExpression="Srno" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
        </Columns>
    </asp:GridView>
</td>
</tr>
<tr>
<td>
    <asp:SqlDataSource ID="sdsTempBooking" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [TempBooking] WHERE [Srno] = @Srno" 
        InsertCommand="INSERT INTO [TempBooking] ([Name], [Age], [Sex]) VALUES (@Name, @Age, @Sex)" 
        SelectCommand="SELECT * FROM [TempBooking]" 
        UpdateCommand="UPDATE [TempBooking] SET [Name] = @Name, [Age] = @Age, [Sex] = @Sex WHERE [Srno] = @Srno">
        <DeleteParameters>
            <asp:Parameter Name="Srno" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="Sex" Type="String" />
            <asp:Parameter Name="Srno" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="Sex" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</td>
</tr>
</table>
</div>
</asp:Content>

