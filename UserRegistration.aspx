<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style3
        {
            height: 52px;
        }
        .style4
        {
        height: 40px;
    }
        .style5
        {
            height: 32px;
        }
        .style6
        {
            height: 30px;
        }
        .style8
        {
            height: 31px;
        }
        .style9
        {
            height: 35px;
        }
        
    .style11
    {
        height: 36px;
    }
    .style12
    {
        height: 47px;
    }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table border ="0" cellpadding ="5" cellspacing ="5" width ="500px">
            <tr>
                <td colspan="3" align ="center" valign ="top" 
                    style=" color:white;font-family : Comic Sans MS;font-size  :25px;font-weight :  bold; background-color: #18417B" 
                    class="style10">
              
                    
                    <asp:Label ID="LBhead" runat="server" Text="CREATE NEW USER"></asp:Label>    
                </td>
            </tr>
            <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#333366  ;font-family :Lucida Sans;font-size  :600 ;font-weight :bold;  " 
                    class="style4">
                    <asp:Label ID="LBFName" runat="server" Text="First Name" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="TBFName" runat="server" Columns ="25"></asp:TextBox>
                </td>
                 <td class="style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Not Blank" ControlToValidate ="TBFName"></asp:RequiredFieldValidator>
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" >
                    
                    <asp:Label ID="LBLName" runat="server" Text="Last Name" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="TBLName" runat="server" Columns ="25"></asp:TextBox>
                </td>
                 <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name Not Blank" ControlToValidate ="TBLName"></asp:RequiredFieldValidator>
               </td>         
          </tr>
          <tr>
                <td  align ="left" valign="top" 
                    style=" color :#333366; font-family :Lucida Sans; font-size:600 ; font-weight:bold; " 
                    class="style6">
                    <asp:Label ID="LBCountry" runat="server" Text="Country" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style6">
                    <asp:DropDownList ID="DDLCountry" runat="server" AutoPostBack ="True" 
                        DataSourceID="SqlDataSource1" DataTextField="COUNTRYNAME" 
                        DataValueField="COUNTRYID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [CountryMaster]"></asp:SqlDataSource> 
                </td>
                 <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select the appropriate country " ControlToValidate ="DDLCountry"></asp:RequiredFieldValidator>
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#333366 ; font-family :Lucida Sans; font-size:600 ; font-weight:bold; " 
                    class="style8">
                    <asp:Label ID="LBState" runat="server" Text="State" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style8">
                     <asp:DropDownList ID="DDLState" runat="server"  AutoPostBack ="True" 
                         DataSourceID="SqlDataSource2" DataTextField="StateName" 
                         DataValueField="StateId" Width="80px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                         SelectCommand="SELECT StateId, StateName, Countryid FROM StateMaster WHERE (Countryid = @Countryid) OR (StateId = 0)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLCountry" DefaultValue="0" Name="Countryid" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                     </asp:SqlDataSource>
                </td>
                 <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select the appropriate state" ControlToValidate ="DDLState"></asp:RequiredFieldValidator>
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style="color :#333366  ; font-family :Lucida Sans; font-size:600 ; font-weight:bold; " 
                    class="style12">
                    <asp:Label ID="LBCity" runat="server" Text="City" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style12">
                    <asp:DropDownList ID="DDLCity" runat="server" AutoPostBack ="True" 
                        DataSourceID="SqlDataSource3" DataTextField="CityName" DataValueField="CityId" >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT CityId, CityName, StateId FROM CityMaster WHERE (StateId = @StateId) OR (CityId = 0)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLState" DefaultValue="0" Name="StateId" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                 <td class="style12">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Name Not Blank" ControlToValidate ="DDLCity"></asp:RequiredFieldValidator>
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#333366  ;font-family :Lucida Sans;font-size  :600 ;font-weight :bold; " 
                    class="style8">
                    <asp:Label ID="LBUserName" runat="server" Text="UserName" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style8">
                    <asp:TextBox ID="TBUName" runat="server" Columns ="25" AutoPostBack="True" 
                        ontextchanged="TBUName_TextChanged"></asp:TextBox><br />
                    <asp:Label ID="LBAvail" runat="server" Text=""></asp:Label>
                </td>
                 <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="User Name Not Blank" ControlToValidate ="TBUName"></asp:RequiredFieldValidator>
                     
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#333366  ;font-family :Lucida Sans;font-size  :600 ;font-weight :bold; " 
                    class="style5">
                    <asp:Label ID="LBPass" runat="server" Text="Password" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="TBpass" runat="server" Columns ="25" TextMode="Password"  ></asp:TextBox>
                        
                        
                    
                </td>
                 <td class="style5">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Password Carefully" ControlToValidate ="TBpass"></asp:RequiredFieldValidator>
                     <br />
                     <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TBPass" ErrorMessage="Char Not Btw 6 to 12" ValidationExpression ="/w{6,12} "></asp:RegularExpressionValidator>--%>
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#333366  ;font-family :Lucida Sans;font-size  :600 ;font-weight :bold; " 
                    class="style9">
                    <asp:Label ID="LBEmailId" runat="server" Text="Email Id" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style9">
                    <asp:TextBox ID="TBEmail" runat="server" Columns ="25"></asp:TextBox>
                </td>
                 <td class="style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="EMail Id Not Blank" ControlToValidate ="TBEmail"></asp:RequiredFieldValidator>
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style="color :#333366 ;font-family :Lucida Sans;font-size  :600 ;font-weight :bold; " 
                    class="style11">
                    <asp:Label ID="CaptureImg" runat="server" Text="Capture Image" 
                        CssClass="sidebar"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Image ID="ImgCaptch" runat="server" />
                </td>
                 <td class="style11">
                     <asp:Button ID="BtnChangeImg" runat="server" Text="CHANGE" 
                         onclick="BtnChangeImg_Click" CausesValidation="False" BackColor="#2D4D75" 
                         BorderColor="White" BorderStyle="Solid" CssClass="sidebar" />
                    
               </td>         
          </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#ff9933;font-family :Lucida Sans;font-size  :20px ;font-weight :bold; " 
                    class="style6">
                    <asp:Label ID="LBAns" runat="server" Text="Answer" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style6">
                    <asp:TextBox ID="TBAns" runat="server" Columns ="25"></asp:TextBox>
                    <br />
                    
              <asp:Label ID="LBMatch" runat="server" Text=""></asp:Label>
                </td>
                 <td class="style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Answer Not Blank" ControlToValidate ="TBAns"></asp:RequiredFieldValidator>
               </td>         
          </tr>
          </table>
          <table>
          <tr>
          <td>
                
               <asp:CheckBox ID="CB1Accept" runat="server" />
          </td>
          <td>
              <asp:Label ID="LBAccept" runat="server" Text="I Accept All Terms And Condition" 
                  CssClass="sidebar"></asp:Label>
          </td>
                  
            </tr>
            <tr>
           
            <td colspan ="3" align ="center"   valign ="middle" class="style3"  >
                <asp:Button ID="BtnReg" runat="server" Text="REGISTER" onclick="BtnReg_Click" 
                    BackColor="#2D4D75" BorderColor="White" BorderStyle="Solid" CssClass="sidebar" 
                    ForeColor="White" />
                    
            </td>
            <td>
                <asp:Label ID="status" runat="server" Text=""></asp:Label>
            </td>
            </tr>
        </table>


</asp:Content>

