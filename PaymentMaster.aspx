<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="PaymentMaster.aspx.cs" Inherits="PaymentMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table border="0" cellpadding ="0" cellspacing ="0" align ="center"  >
        <tr>
            <td class ="head" colspan ="2" bgcolor="#2D5522">
                <asp:Label ID="Lblhead" runat="server" Text="Payment Details"></asp:Label>
            </td>
        
        </tr>     
        <tr>
            <td class ="menu ">
                <asp:Label ID="LblTourId" runat="server" Text="Tour Id"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLtourid" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="TourId" DataValueField="TourId" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [TourId] FROM [TourMaster]"></asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td class ="menu ">
                <asp:Label ID="lblUName" runat="server" Text="UserName"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlUName" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="Username" 
                    DataValueField="Username">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Username] FROM [Registration]"></asp:SqlDataSource>
            </td>
        </tr>
         <tr>
            <td class ="menu ">
                <asp:Label ID="lblPayMode" runat="server" Text="Payment Mode"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="Rblmode" runat="server">
                <asp:ListItem >Cash </asp:ListItem>
                <asp:ListItem >Cheque </asp:ListItem>
                <asp:ListItem >Card </asp:ListItem>
                </asp:RadioButtonList>
                
                
            </td>
        </tr>  
         <tr>
            <td class ="menu ">
                <asp:Label ID="LblAmount" runat="server" Text="Amount"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAmount" runat="server" columns="25"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan ="2" align="center">
                <asp:Button ID="BtnSave" runat="server" Text="Save" BorderColor="White" 
                    BorderStyle="Solid" BackColor="#2D5522"  Font-Bold="True" Font-Size="15" 
                    ForeColor="White" Width="75" onclick="BtnSave_Click"  />
            
                <asp:Button ID="BtnCancel" runat="server" Text="Cancel" BorderColor="White" 
                    BorderStyle="Solid" BackColor="#2D5522"  Font-Bold="True" Font-Size="15" 
                    ForeColor="White" CausesValidation="False" Width="75" 
                    onclick="BtnCancel_Click" />
            </td>
        </tr>
       </table>
       </asp:Content>

