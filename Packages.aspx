<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Packages.aspx.cs" Inherits="Packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:listview ID="Listview1" runat="server" GroupPlaceholderID="gt" 
            ItemPlaceholderID="it" DataSourceID="SqlDataSource1" 
            onitemcommand="Listview1_ItemCommand" style="margin-right: 0px" 
             >
            <LayoutTemplate>
               <table border = "0" cellpadding = "0" cellspacing = "0" width = "480px">
                  <asp:PlaceHolder ID="gt" runat = "server">
                  </asp:PlaceHolder> 
               </table>
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID = "Listview1" PageSize="3" >
                   <Fields>
                     <asp:NumericPagerField /> 
                   </Fields> 
                </asp:DataPager>
            </LayoutTemplate> 
            <GroupTemplate>
                <tr>
                   <asp:PlaceHolder ID="it" runat = "server">
                   </asp:PlaceHolder> 
                </tr>
                <tr>
                        <td colspan="4" height="10">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <img src="images/seperator.JPG" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" height="10">
                        </td>
                    </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td width = "50">
                  &nbsp;
                </td>
                 <td style="vertical-align: middle" width="100">
                        <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("PackageImage") %>' Width="100"
                            Height="120" ImageAlign="AbsMiddle" />
               </td>
               <td width="20">
               </td>
               <td style="vertical-align: middle">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="td_top_left">
                                </td>
                                <td class="td_top_middle">
                                </td>
                                <td class="td_top_right">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_middle_left">
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("PackageName") %>' Font-Size="18px"
                                        ForeColor="Red"></asp:Label>
                                    <br />
                                    <asp:Label ID="lbl" runat="server" Text='<%#Eval("Cost") %>' Font-Size="13px"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="lb" runat="server" Text="Click here for more details" ForeColor="Blue"
                                        CommandName="Details" CommandArgument='<%#Eval("PackageId") %>'></asp:LinkButton>
                                </td>
                                <td class="td_middle_right">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bottom_left">
                                </td>
                                <td class="td_bottom_middle">
                                </td>
                                <td class="td_bottom_bottom">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="30">
                    </td>
            </ItemTemplate>  
       </asp:listview>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [PackageMaster]"></asp:SqlDataSource>
</asp:Content>

