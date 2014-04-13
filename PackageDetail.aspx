<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true"
    CodeFile="PackageDetail.aspx.cs" Inherits="PackageDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvPackageDetail" runat="server" ActiveViewIndex ="0">
    <asp:View  ID = "Detail" runat ="server" >
    <div>
        <table cellpadding="0" cellspacing="0" border="0" width="500px">
            <tr>
                <td>
                    <asp:Repeater ID="rpPackageDetail" runat="server" DataSourceID="sdsPackageDetail">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" width="500px">
                                <tr class="Packages">
                                    <td colspan="4">
                                        <b>
                                            <%#Eval("PackageName")%>
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgPackage" runat="server" ImageUrl='<%# Eval("PackageImage") %>'  />
                                    </td>
                                    <td class="sidebar">
                                        <table cellpadding="3">
                                            <tr>
                                                <td style="border: thin solid #18417B">
                                                    <asp:Label ID="lblCost" runat="server" Text="Charge per Person in Rs."></asp:Label>
                                                </td>
                                                <td style="border: thin solid #18417B">
                                                    <%# Eval ("Cost") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border: thin solid #18417B">
                                                    <asp:Label ID="lblNoofDays" runat="server" Text="Tour Days"></asp:Label>
                                                </td>
                                                <td style="border: thin solid #18417B">
                                                    <%# Eval ("NoofDays") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border: thin solid #18417B">
                                                    <asp:Label ID="lblDate" runat="server" Text="Tour Date"></asp:Label>
                                                </td>
                                                <td style="border: thin solid #18417B">
                                                    <%# Eval ("TourDate") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border: thin solid #18417B">
                                                    Type
                                                </td>
                                                <td style="border: thin solid #18417B">
                                                    <%# Eval ("PackageType") %>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td style="border: thin solid #18417B">
                                                    Total Seats
                                                </td>
                                                <td style="border: thin solid #18417B">
                                                    <%# Eval ("TotalSeats") %>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td style="border: thin solid #18417B">
                                                    Seats Remaining
                                                </td>
                                                <td style="border: thin solid #18417B">
                                                    <%# Eval ("SeatsRemaining") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border: thin solid #18417B">
                                                    <asp:Label ID="lblTourDetail" runat="server" Text="Tour Detail"></asp:Label>
                                                </td>
                                                <td style="border: thin solid #18417B">
                                                    <%#Eval ("PackageDetail") %>
                                                </td>
                                            </tr>
                                        </table>
                            </td> </tr> </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="sdsPackageDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT PackageMaster.PackageName, PackageMaster.PackageImage, PackageMaster.Cost, PackageMaster.NoofDays, PackageMaster.PackageDetail,PackageMaster.PackageType,TourMaster.TourDate ,TourMaster.TotalSeats,TourMaster.SeatsRemaining FROM PackageMaster INNER JOIN TourMaster ON PackageMaster.PackageId = TourMaster.PackageId
where TourMaster.TourId = @TourId">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="TourId" QueryStringField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr class="Packages">
                <td>
                    <asp:Label ID="lblNoofTickets" runat="server" Text="No Of Tickets" CssClass="Packages"></asp:Label>
                    <asp:TextBox ID="txtNoofTickets" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBookNow" runat="server" Text="Book Now" OnClick="btnBookNow_Click" BackColor="#003366" BorderColor="White" Font-Bold="True" Font-Size="15px" ForeColor="White" BorderStyle="Solid" Width="85px"  />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Size="Large" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="hfId" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </asp:View>
    <asp:View ID="BookingDetail" runat ="server" >
    <table >
    <tr>
    <td>
        <asp:GridView ID="gvTicketDetail" runat="server" DataSourceID="sdsTicketDetail" >
            <Columns>
                <asp:CommandField ShowEditButton="True" />
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
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [Id], [Name], [Age], [Gender], [ContactNo] FROM [BookingDetail] WHERE ([BookingId] = @BookingId)" 
            
            UpdateCommand="UPDATE [BookingDetail] SET [Name] = @Name, [Age] = @Age, [Gender] = @Gender, [ContactNo] = @ContactNo WHERE [Id] = @Id">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfBId" Name="BookingId" 
                    PropertyName="Value" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Age" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="ContactNo" Type="Decimal"  />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Age" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="ContactNo" Type= "Decimal"  />
            </InsertParameters>
        </asp:SqlDataSource>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="btnSave" runat="server" Text="Ok" onclick="btnSave_Click" />
    </td>
    </tr>
    <tr>
    <td>
    <asp:HiddenField ID ="hfBId" runat ="server" />
    </td>
    </tr>
    </table>
    </asp:View>
    </asp:MultiView>
</asp:Content>
