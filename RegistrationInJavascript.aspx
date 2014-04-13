<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="RegistrationInJavascript.aspx.cs" Inherits="RegistrationInJavascript" %>

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
        .style10
        {
            height: 123px;
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
    <script language="javascript" type ="text/javascript" >
        function validate() {
            var strMessage = "";
            var SetFocus;

            if (document.getElementById('<%= TBFName.ClientID %>').value == "") {
                strMessage = strMessage + "\n Enter The First Name";
            }
            if (document.getElementById('<%=TBLName.ClientID %>').value == "")
                strMessage = strMessage + "\n Enter The Last Name";
            if (document.getElementById('<%=TBUName.ClientID %>').value == "")
                strMessage = strMessage + "\n Enter The User Name";

           
            var str = document.getElementById('<%=TBEmail.ClientID %>').value;
            var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            if (filter.test(str))
                testresults = true
            else
                strMessage = strMessage + "\n Enter The Valid Email Address";


            
            
            if (document.getElementById('<%=TBpass.ClientID %>').value == "")
                strMessage = strMessage + "\n Enter The Password missing ";
           
           
            if (document.getElementById('<%=DDLCountry.ClientID %>').value == "")
                strMessage = strMessage + "\n Enter The Country missing ";
            if (document.getElementById('<%=DDLState.ClientID %>').value == "")
                strMessage = strMessage + "\n Enter The State missing ";
            if (document.getElementById('<%=DDLCity.ClientID %>').value == "")
                strMessage = strMessage + "\n Enter The City missing ";
            if (document.getElementById('<%=TBAns.ClientID %>').value == "")
                strMessage = strMessage + "\n Enter The Ans";
            if (strMessage != "") {
                alert(strMessage);
                return false;
            }
            else 

                return true;
        }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table border ="0" cellpadding ="0" cellspacing ="0" width ="500px">
            <tr>
                <td colspan="3" align ="center" valign ="top" 
                    style=" color:white;font-family :Calibri  ;font-size  :50px ;font-weight :  bold; " 
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
             </tr>
          <tr>
                <td  align ="left"  valign ="top" >
                    
                    <asp:Label ID="LBLName" runat="server" Text="Last Name" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="TBLName" runat="server" Columns ="25"></asp:TextBox>
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
           </tr>
          <tr>
                <td  align ="left"  valign ="top" 
                    style=" color :#333366  ;font-family :Lucida Sans;font-size  :600 ;font-weight :bold; " 
                    class="style8">
                    <asp:Label ID="LBUserName" runat="server" Text="UserName" CssClass="sidebar"></asp:Label>
                </td>
                <td class="style8">
                    <asp:TextBox ID="TBUName" runat="server" Columns ="25" AutoPostBack="True" 
                        OnTextChanged ="TBUName_TextChanged"></asp:TextBox>
                    
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
                        <br />
                        
                    <asp:Label ID="LBAvail" runat="server" Text="check Availability"></asp:Label>
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
                         OnClick ="BtnChangeImg_Click" CausesValidation="False" BackColor="#2D4D75" 
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
                <asp:Button ID="BtnReg" runat="server" Text="REGISTER" 
                    BackColor="#2D4D75" BorderColor="White" BorderStyle="Solid" CssClass="sidebar" 
                    ForeColor="White" onclick="BtnReg_Click"  OnClientClick="return validate();" />
                    
            </td>
            <td>
                <asp:Label ID="status" runat="server" Text=""></asp:Label>
            </td>
            </tr>
        </table>


              
               
</asp:Content>

