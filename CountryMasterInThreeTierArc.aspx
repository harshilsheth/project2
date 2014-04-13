<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="CountryMasterInThreeTierArc.aspx.cs" Inherits="CountryMasterInThreeTierArc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex ="1">
        <asp:View ID="ViewInsert" runat="server"  >
            <table width ="500px" cellpadding ="0" cellspacing ="0"  align="center" >
                <tr> 
                    <td colspan ="2" align ="center"  class ="head">
                  
                        <asp:Label ID="LBStatus" runat="server" Text=""></asp:Label>
                  
                    </td>
                </tr>
                <tr>
                    <td align="left" valign ="top" class="menu"  >
                    <br />
                        <asp:Label ID="LBCName" runat="server" Text="Country Name" ></asp:Label>
                    <br />
                    </td>
                    <td class="menu"  >
                    <br />
                        <asp:TextBox ID="TBName" runat="server" Width ="150px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter The Properly" Text ="Name Not Blank " ControlToValidate ="TBName"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                <td class="menu"  >
                </td>
           </tr>   
           <tr>
            <td colspan ="2" align="center">
                <asp:Button ID="BtnSave" runat="server" Text="Save" BorderColor="White" 
                    BorderStyle="Solid" BackColor="#2D5522"  Font-Bold="True" Font-Size="15" 
                    ForeColor="White" Width="75"  OnClick ="BtnSave_Click" />
     &nbsp;&nbsp;       
                <asp:Button ID="BtnCancel" runat="server" Text="Cancel" BorderColor="White" BorderStyle="Solid" BackColor="#2D5522"  Font-Bold="True" Font-Size="15" ForeColor="White" CausesValidation="False" Width="75" OnClick ="BtnCancel_Click"/>
            </td>
            </tr>
                   
               
                <tr>
                <td colspan = "2" >
                  <asp:Label ID="LBSubStr" runat = "server"></asp:Label> 
                </td>
             </tr>
            </table>
            
        </asp:View>
        <asp:View ID="ViewDisplay" runat="server">
            <table width ="500px" cellpadding ="0" cellspacing ="0"  align="center" >
             
             <tr>
              
                 <td colspan ="2" align="center">
                  <asp:GridView ID="grvCountry" runat="server" AutoGenerateColumns="false" 
                      onrowcommand="grvCountry_RowCommand" 
                     >
                      <Columns>
                          <asp:BoundField DataField="CountryName" HeaderText="Name" />
                          <asp:TemplateField>
                              <ItemTemplate>
                                  <asp:LinkButton ID="BtnEdit" runat="server" 
                                      CommandArgument='<%#Eval("CountryId")%> ' CommandName="RowEdit" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField>
                              <ItemTemplate>
                                  <asp:LinkButton ID="BtnDelete" runat="server" 
                                      CommandArgument='<%#Eval("CountryId")%>' CommandName="RowDelete" Text="Delete"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                  </asp:GridView>
              </td>
              <td>
              <asp:Label ID="lblHid"  runat = "server" Visible = "false"></asp:Label> 
              </td>
              <td>
                <asp:Label ID="lblMsg" runat = "server"></asp:Label> 
              </td>
           </tr>
            <tr>
            <td align ="center">
            
             <asp:Button  ID="btnNewCountry" runat="server" Text="NEW COUNTRY" align="center" BorderColor="White" 
                    BorderStyle="Solid" BackColor="#2D5522"  Font-Bold="True" Font-Size="15" 
                    ForeColor="White" Width="170"
                onclick="btnNewCountry_Click" />  
       </td>
       </tr>
       </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

