<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true"
    CodeFile="ViewBooking.aspx.cs" Inherits="ViewBooking" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table >
            <tr>
                <td align="center" class="Packages">
                    My Booking
                        
                </td>
            </tr>
            <tr>
                <td style="color:#003063; font-family:Comic Sans MS">
                    <asp:DetailsView ID="dvViewBooking" runat="server" DataSourceID="sdsViewBooking"
                        AllowPaging="true" BorderColor="White">
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="sdsViewBooking" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT Booking.BookingId as BookingNo, PackageMaster.PackageName, TourMaster.TourDate as TourStartingDate, Booking.TBook as NoofTickets, Booking.TotalCost as TotalRs, Booking.PaymentRec as IsPaid FROM Booking INNER JOIN TourMaster ON Booking.TourId = TourMaster.TourId INNER JOIN PackageMaster ON TourMaster.PackageId = PackageMaster.PackageId where Booking.UserId = @UserId">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserId" SessionField="UserId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
