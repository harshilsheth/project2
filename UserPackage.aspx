<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserPackage.aspx.cs" Inherits="UserPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding ="0" cellspacing ="0"  border ="0" width ="500">
        <tr>
            <td width="500px">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PackageMaster.PackageName, PackageMaster.PackageImage, PackageMaster.Cost, PackageMaster.NoofDays, PackageMaster.PackageDetail, PackageMaster.PackageType, TourMaster.TourId FROM PackageMaster INNER JOIN TourMaster ON PackageMaster.PackageId = TourMaster.PackageId
where TourMaster.TourDate &gt; @TourDate">
                    <SelectParameters>
                        <asp:SessionParameter Name="TourDate" SessionField="Date" />
                    </SelectParameters>
                </asp:SqlDataSource>  
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"  OnItemCommand = "Repeater1_ItemCommand">
                <ItemTemplate>
                    <table cellpadding ="0" cellspacing ="0"  border ="0" width ="500" >
                        <tr>
                            <td colspan ="2" class ="Packages" >
                               <b><%#Eval("PackageName") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Image ID="Image1" runat="server" ImageUrl = '<%#Eval("PackageImage")%>' Width="150px"/>
                            </td>
                        
                            <td class="sidebar"  >
                               
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
    </table>
</asp:Content>

