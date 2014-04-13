<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" border="0" cellspacing="0"  style="border: thin solid #003063">
        
        <tr>
            <td align="center" colspan="2" class="Packages">
                Change Password
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="Lblusername" runat="server" Text="Username" CssClass="sidebar"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtusername" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is essential"
                    ControlToValidate="txtusername"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lbloldpass" runat="server" Text="Old Password" CssClass="sidebar"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Txtoldpass" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Old password is essential"
                    ControlToValidate="txtoldpass"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lblnewpass" runat="server" Text="New password" CssClass="sidebar"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtnewpass" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="New password is essential"
                    ControlToValidate="txtnewpass"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lblconfirm" runat="server" Text="Confirm password" CssClass="sidebar"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Txtconfirm" runat="server"></asp:TextBox><br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not matching"
                    ControlToCompare="txtnewpass" ControlToValidate="Txtconfirm"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Btnsave" runat="server" Text="Save" BackColor="#2E4E78" BorderColor="White"
                    BorderStyle="Solid" Font-Bold="True" Font-Size="20px" ForeColor="White" OnClick="Btnsave_Click" />
                <asp:Button ID="Btncancel" runat="server" Text="Cancel" BackColor="#2E4E78" BorderColor="White"
                    BorderStyle="Solid" CausesValidation="False" Font-Bold="True" Font-Size="20px"
                    ForeColor="White" OnClick="Btncancel_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
