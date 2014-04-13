<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style4
        {
        height: 40px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <table border ="0" cellpadding ="0" cellspacing ="0" width ="500px">
            <tr>
                <td colspan="3" align ="center" valign ="top" 
                    style=" color:white;font-family :Calibri  ;font-size  :50px ;font-weight :  bold; " 
                    >
              
                    
                    <asp:Label ID="LBhead" runat="server" Text="BOOKING DETAIL"></asp:Label>    
                </td>
            </tr>
             <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#333366  ;font-family :Lucida Sans;font-size  :600 ;font-weight :bold;  " 
                    class="style4">
                    <asp:Label ID="LBFName" runat="server" Text="User Name" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="TBFName" runat="server" Columns ="25"></asp:TextBox>
                </td>
                 <td class="style4">
                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Not Blank" ControlToValidate ="TBFName"></asp:RequiredFieldValidator>--%>
               </td>         
          </tr>
          <tr>
              <td colspan = "3" align = "center" valign = "middle">
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="Srno" DataSourceID="SqlDataSource1" ShowFooter="True" 
                      onrowcommand="GridView1_RowCommand"> 
                      
                      <Columns>
                          <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                          <asp:TemplateField HeaderText="Srno" SortExpression="Srno">
                               <ItemTemplate>
                                   <asp:Label ID="lblSrno" runat="server" 
                                          Text='<%#Eval("Srno") %>'>
                                   </asp:Label>
                               </ItemTemplate>
                               <FooterTemplate>
                                   <asp:Button ID="btnInsert" runat="server" 
                                        Text="Insert" CommandName="Add" />
                               </FooterTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Name" 
                                    SortExpression="Name">
                              <ItemTemplate>
                                  <asp:Label ID="lblName" runat="server" 
                                     Text='<%#Eval("Name") %>'>
                                  </asp:Label>
                             </ItemTemplate>
                             <EditItemTemplate>
                                    <asp:TextBox ID="txtPName" runat="server" 
                                       Text='<%#Bind("Name") %>'>
                                    </asp:TextBox>
                             </EditItemTemplate>
                             <FooterTemplate>
                                  <asp:TextBox ID="txtName" runat="server">
                                  </asp:TextBox>
                             </FooterTemplate>
                             
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age" 
                                    SortExpression="Age">
                            <ItemTemplate>
                                  <asp:Label ID="lblAge" runat="server" 
                                     Text='<%#Eval("Age") %>'>
                                  </asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txtPAge" runat="server" 
                                     Text='<%#Bind("Age") %>'>
                               </asp:TextBox>
                           </EditItemTemplate>
                           <FooterTemplate>
                               <asp:TextBox ID="txtAge" runat="server">
                               </asp:TextBox>
                          </FooterTemplate>
                       </asp:TemplateField>   
                       <asp:TemplateField HeaderText="Sex" 
                                SortExpression="Sex">
                           <ItemTemplate>
                               <asp:Label ID="lblSex" runat="server" 
                                     Text='<%#Eval("Sex") %>'>
                               </asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                                <asp:TextBox ID="txtPSex" runat="server" 
                                    Text='<%#Bind("Sex") %>'>
                                </asp:TextBox>
                           </EditItemTemplate>
                           <FooterTemplate>
                              <asp:TextBox ID="txtSex" runat="server">
                              </asp:TextBox>
                           </FooterTemplate>
                       </asp:TemplateField>
                       
                      </Columns>
                      <EmptyDataTemplate>
                      
                      <table width="490 px" cellpadding ="0" cellspacing="0" border ="0">
                           <tr>
                           <td>
                               <asp:Button ID="Button1" runat="server" Text="iNSERT" OnClick ="SaveNewRecord" />
                           
                           </td>
                              <td class ="style4 ">
                                  Srno
                              </td>
                              <td  class ="style4 ">
                              name 
                              </td>
                              <td class="style4">
                              Age
                              </td>
                              <td class ="style4">
                              sex
                              </td>
                           </tr>
                           <tr>
                           <td>
                           <asp:TextBox ID="txtsrno" runat ="server" ></asp:TextBox>
                           </td>
                           <td>
                           <asp:TextBox ID="txtname" runat ="server"></asp:TextBox> 
                           </td>
                           <td>
                             <asp:TextBox ID="txtAge" runat="server">
                               </asp:TextBox>
                           </td>
                       
                      
                      </table>
                      </EmptyDataTemplate>
                  </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
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
                  <asp:Label ID="lblMessage" runat="server" 
                        Font-Bold="True"></asp:Label><br />            
              </td> 
          </tr>
          <tr>
              <td colspan = "3" align = "center" valign = "middle">
                 <asp:Button ID="BtnSave" runat = "server" Text = "Save" onclick="BtnSave_Click" 
                      />
                 <asp:Button ID="BtnCancel" runat = "server" Text = "Cancel" />
                 
              </td> 
          </tr>
          <tr>
              <td colspan = "3">
                  &nbsp;</td>
          </tr>
    </table> 
    
</div>  
    <asp:ListView ID="ListView1" runat="server">
    </asp:ListView>
 </asp:Content>

