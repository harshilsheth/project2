<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true"
    CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="350px" cellpadding="0px" cellspacing="0px" border="0px" align="center"
        style="border: thin solid #003063">
        <tr>
            <td colspan="2" class="Packages" align="center" valign="middle">
                Login
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <asp:Label ID="Lblusername" runat="server" Text="Username:" CssClass="sidebar" ForeColor="White"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="Username" runat="server" Width="150px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required"
                    ControlToValidate="Username"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <asp:Label ID="lblpassword" runat="server" Text="Password:" CssClass="sidebar" ForeColor="White"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="Password" runat="server" Width="150px" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required"
                    ControlToValidate="Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Save" runat="server" Text="OK" BorderStyle="Solid" BackColor="#2E4E78"
                    ForeColor="White" Width="75px" Font-Bold="True" Font-Size="15px" OnClick="Save_Click" />
                &nbsp; &nbsp;
                <asp:Button ID="Cancel" runat="server" Text="Cancel" BorderColor="White" BorderStyle="Solid"
                    Font-Bold="True" Font-Size="15 px" Font-Strikeout="False" ForeColor="White" BackColor="#2E4E78"
                    CausesValidation="False" EnableTheming="True" OnClick="Cancel_Click" Width="75px" />
            </td>
        </tr>
        <tr align="center">
            <td ><br />
                <asp:LinkButton ID="Forgetpassword" runat="server" CausesValidation="False" OnClick="Forgetpassword_Click">Forget Password</asp:LinkButton>
            </td>
            <td align="center"><br />
                <asp:LinkButton ID="Changepassword" runat="server" CausesValidation="false" OnClick="Changepassword_Click">Change password</asp:LinkButton>
                &nbsp;
            </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:LinkButton ID="Newregistration" runat="server" OnClick="Newregistration_Click"
                        CausesValidation="false"><font face="Comic Sans MS"> New registration</font></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
    </table>
</asp:Content>
