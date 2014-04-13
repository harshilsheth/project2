<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="TourMaster.aspx.cs" Inherits="TourMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <asp:MultiView ID="mvTourMaster" runat="server" ActiveViewIndex ="1">
    <asp:View ID = "Edit" runat ="server" >
    <table border ="0" cellpadding ="0" cellspacing ="0"  align="center">
          <tr>
          <td class="head " colspan ="2" align="center" >
          <asp:Label ID="Label1" runat="server" Text="Tour Detail"  Font-Bold="False"></asp:Label>
          </td>
              
          </tr>
          
        <tr>
                <td class ="menu ">
                <asp:Label ID="LblpackageId" runat="server" Text="Package Id"></asp:Label>
                </td>
                <td class ="menu ">
                    <asp:DropDownList ID="ddlPackageId" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="PackageName" 
                        DataValueField="PackageId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [PackageMaster]"></asp:SqlDataSource>
                </td>
        </tr>
        
       
                <tr>
                <td class ="menu ">
                <br />
                
                <asp:Label ID="Lbldate" runat="server" Text="Tour Date"></asp:Label>
                <br />
                </td>
                <td class ="menu ">
                
                    <asp:TextBox ID="Txtdate" runat="server"></asp:TextBox>
                
                    <asp:ImageButton ID="ImgBtn" runat="server" height="25px" Width ="25px"  
                        ImageUrl ="~/Images/logo1.jpg" onclick="ImgBtn_Click"/>
                    
                    <asp:Calendar ID="Calendar1" runat="server" Visible ="false" 
                        onselectionchanged="Calendar1_SelectionChanged" 
                        style="margin-bottom: 0px" ></asp:Calendar>
                
                </td>
        </tr>
        <tr>
                <td class ="menu ">
                <asp:Label ID="Lblavailable" runat="server" Text="Total Seats"></asp:Label>
                </td>
                <td class ="menu ">
                    <asp:TextBox ID="Txtavailable" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
                <td class ="menu ">
                <asp:Label ID="Lbloccupied" runat="server" Text="Seats Remaining"></asp:Label>
                </td>
                <td class ="menu ">
                    <asp:TextBox ID="Txtoccupied" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
                <td class ="menu ">
                <asp:Label ID="Lblactivated" runat="server" Text="Activated"></asp:Label>
                </td>
                <td class ="menu ">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>False</asp:ListItem>
                    <asp:ListItem>True</asp:ListItem>
                    </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td align ="center" colspan ="2" >
                <asp:Button ID="BtnSave" runat="server" Text="Save" BackColor="#325826" 
                    BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Size="15px" 
                    ForeColor="White" Width="75px" onclick="BtnSave_Click" />

                     <asp:Button ID="Btncancel" runat="server" Text="Cancel" BackColor="#325826" 
                    BorderColor="White" BorderStyle="Solid" Font-Bold="True" Font-Size="15px" 
                    ForeColor="White" Width="75px" onclick="Btncancel_Click" />

                        </td>
        </tr>
        
    </table>
    </asp:View>
    <asp:View ID ="View" runat ="server" >
    <table>
    <tr>
    <td>
        <asp:Label ID="lblTourMaster" runat="server" Text="Tour Master" CssClass="text"></asp:Label>
    </td>
    </tr>
    <tr>
    <td>
        <asp:GridView ID="gvTourMaster" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="TourId" DataSourceID="sdsTourMaster" 
            onselectedindexchanged="gvTourMaster_SelectedIndexChanged" HeaderStyle-CssClass="head " CssClass="text">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="TourId" HeaderText="TourId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="TourId" />
                <asp:BoundField DataField="PackageId" HeaderText="PackageId" 
                    SortExpression="PackageId" />
                <asp:BoundField DataField="TourDate" HeaderText="TourDate" 
                    SortExpression="TourDate" />
                <asp:BoundField DataField="TotalSeats" HeaderText="TotalSeats" 
                    SortExpression="TotalSeats" />
                <asp:BoundField DataField="SeatsRemaining" HeaderText="SeatsRemaining" 
                    SortExpression="SeatsRemaining" />
                <asp:BoundField DataField="IsActivated" HeaderText="IsActivated" 
                    SortExpression="IsActivated" />
            </Columns>
        </asp:GridView>
    </td>
    </tr>
    <tr>
    <td>
        <asp:SqlDataSource ID="sdsTourMaster" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [TourMaster] WHERE [TourId] = @TourId" 
            InsertCommand="INSERT INTO [TourMaster] ([PackageId], [Capacity], [TourDate], [TotalSeats], [SeatsRemaining], [IsActivated]) VALUES (@PackageId, @Capacity, @TourDate, @TotalSeats, @SeatsRemaining, @IsActivated)" 
            SelectCommand="SELECT * FROM [TourMaster]" 
            
            
            UpdateCommand="UPDATE [TourMaster] SET [PackageId] = @PackageId, [Capacity] = @Capacity, [TourDate] = @TourDate, [TotalSeats] = @TotalSeats, [SeatsRemaining] = @SeatsRemaining, [IsActivated] = @IsActivated WHERE [TourId] = @TourId">
            <DeleteParameters>
                <asp:Parameter Name="TourId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="PackageId" Type="Int32" />
                <asp:Parameter Name="Capacity" Type="Int32" />
                <asp:Parameter Name="TourDate" Type="DateTime" />
                <asp:Parameter Name="TotalSeats" Type="Int32" />
                <asp:Parameter Name="SeatsRemaining" Type="Int32" />
                <asp:Parameter Name="IsActivated" Type="String" />
                <asp:Parameter Name="TourId" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="PackageId" Type="Int32" />
                <asp:Parameter Name="Capacity" Type="Int32" />
                <asp:Parameter Name="TourDate" Type="DateTime" />
                <asp:Parameter Name="TotalSeats" Type="Int32" />
                <asp:Parameter Name="SeatsRemaining" Type="Int32" />
                <asp:Parameter Name="IsActivated" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="btnAdd" runat="server" Text="Add New" onclick="btnAdd_Click" />
    </td>
    </tr>
    </table>
    </asp:View>
    </asp:MultiView>
</div>

    </asp:Content>

