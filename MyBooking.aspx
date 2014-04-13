<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true"
    CodeFile="MyBooking.aspx.cs" Inherits="MyBooking" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table border="0">
            <tr>
                <td>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <table border="0" style="border: thin solid #003063">
                            <tr>
                            <td align="center" class="Packages">Your Booking Detail</td>
                            </tr>
                                <tr>
                                    <td style="font-family:Comic Sans MS">
                                        <table>
                                            <tr>
                                                <td>
                                                    You are Booked
                                                </td>
                                                <td style="color:White">
                                                    <%# Eval ("TBook") %></font>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Tickets of
                                                </td>
                                                <td style="color:White">
                                                    <%# Eval ("PackageName")  %>
                                                    Tour
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Your Tour will start on
                                                </td>
                                                <td style="color:White">
                                                    <%# Eval ("TourDate") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Your Payment is Rs.
                                                </td>
                                                <td style="color:White">
                                                    <%# Eval ("TotalCost") %>
                                                </td>
                                            </tr>
                                        </table>
                                        </br><font color="white" face="Comic Sans MS">  After Receiving Payment Your Tickets will
                                        be confirmed. </br> Tickets are confirmed in first come first.</font>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT PackageMaster.PackageName, Booking.TBook, Booking.TotalCost, TourMaster.TourDate FROM Booking INNER JOIN TourMaster ON Booking.TourId = TourMaster.TourId INNER JOIN PackageMaster ON TourMaster.PackageId = PackageMaster.PackageId where Booking.BookingId = @BookingId  ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfId" Name="BookingId" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <asp:HiddenField ID="hfId" runat="server" />
        </table>
    </div>
</asp:Content>
