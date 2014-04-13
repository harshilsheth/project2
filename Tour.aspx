<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Tour.aspx.cs" Inherits="Tour" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
<table border = "0" >
<tr>
<td>
    <asp:Repeater ID="rptrTour" runat="server" DataSourceID="sdsTour" OnItemCommand ="rptrTour_ItemCommand" >
    <ItemTemplate>
                    <table cellpadding ="0" cellspacing ="0"  border ="0" width ="500" >
                        <tr>
                            <td colspan ="2" class ="Packages" >
                                Package Detail 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Image ID="Image1" runat="server" ImageUrl = '<%#Eval("PackageImage")%>'/>
                            </td>
                        
                            <td class="sidebar"  >
                                Name: <b><%#Eval("PackageName") %></b><br /><br />
                                Cost: <b><%#Eval("cost") %></b><br /><br />
                                Type: <b><%#Eval("PackageType") %></b><br/><br/>
                          
                                <asp:Button ID="BtnBuy" runat = "server" Text = "MoreDetail" BackColor="#003366" BorderColor="White" Font-Bold="True" Font-Size="15px" ForeColor="White" BorderStyle="Solid" Width="85px" />
                                   
                            </td>
                                <td>
                                   <asp:Label ID="lblPId" runat = "server" Text = '<%#Eval("TourId")%>' Visible="False">
                                   </asp:Label> 
                                </td>
                         </tr>
                      
                    </table>
                </ItemTemplate>
    </asp:Repeater>
</td>
</tr>
<tr>
<td>
    <asp:SqlDataSource ID="sdsTour" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT TourMaster.TourId, PackageMaster.PackageName, PackageMaster.PackageImage,PackageMaster.Cost,PackageMaster.PackageType FROM PackageMaster INNER JOIN TourMaster ON PackageMaster.PackageId = TourMaster.PackageId where PackageMaster.PackageType = @PackageType and TourMaster.TourDate &gt; @TourDate">
        <SelectParameters>
            <asp:QueryStringParameter Name="PackageType" QueryStringField="type" />
            <asp:SessionParameter Name="TourDate" SessionField="Date" />
        </SelectParameters>
    </asp:SqlDataSource>
</td>
</tr>
</table>
</div>

</asp:Content>

