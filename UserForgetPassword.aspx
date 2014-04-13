<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserForgetPassword.aspx.cs" Inherits="UserForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <center>
    <table width="250px" align="center" cellpadding="0" cellspacing="0" style="border: thin solid #003063">
        <tr>
            <td colspan="2"  align="center" valign="middle" class="Packages">
                Forget password
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align ="left" > 
                <asp:Label ID="Username" runat="server" Text="Username" CssClass="sidebar"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="txtusername" runat="server" Width="150px">
                </asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="username is necessary"
                    ControlToValidate="txtusername"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align ="left" >
                <asp:Label ID="Email" runat="server" Text="Email" CssClass="sidebar"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="TxtEmail" runat="server" Width="150px">
                </asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is necessary"
                    ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <table>
                    <tr>
                        <td align="center">
                            <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click"
                                BackColor="#2E4E78" BorderStyle="Solid" Font-Bold="True" Font-Size="17px" 
                                ForeColor="White" />
                        </td>
                        <td align="center">
                            <asp:Button ID="BtnCancel" runat="server" Text="Cancel" CausesValidation="False"
                                OnClick="BtnCancel_Click" BackColor="#2E4E78" BorderColor="White" BorderStyle="Solid"
                                Font-Bold="True" Font-Size="15px" ForeColor="White" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-weight: bold">
                <asp:Label ID="lblstatus" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </center>
</asp:Content>

