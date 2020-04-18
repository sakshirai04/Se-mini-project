<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 55%;
        }
        .auto-style2 {
            background-color: #66FF66;
        }
        .auto-style3 {
            background-color: #FFFFFF;
        }
        .auto-style4 {
            background-color: #FFFFFF;
            font-family: calibri;
        }
        .auto-style5 {
            font-family: calibri;
        }
        .auto-style8 {
            font-family: calibri;
            font-size: x-large;
        }
        .auto-style9 {
            background-color: #FFFFFF;
            font-family: calibri;
            font-size: large;
            text-decoration: underline;
        }
        .auto-style10 {
            font-family: calibri;
            font-weight: bold;
        }
        .auto-style11 {
            background-color: #FFFFFF;
            font-family: calibri;
            font-weight: bold;
        }
        .auto-style12 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <center>
    <div>
    
        <table class="auto-style1" style="border: 2px solid #808080;">
            <tr>
                <td colspan="3" align="center" style="background-color: #CCCCCC" class="auto-style8">
                    <strong>Canteen Automation System</strong></td>
            </tr>
            <tr>
                <td  align="center" width="33.33%" class="auto-style3">
                    &nbsp;</td>
                <td  align="center" width="33.33%" class="auto-style9">
                    </td>
                <td  align="center" width="33.33%" class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td  align="center" width="33.33%" class="auto-style3">
                    &nbsp;</td>
                <td  align="center" width="33.33%" class="auto-style9">
                    Invoice</td>
                <td  align="center" width="33.33%" class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td  align="center" width="33.33%" class="auto-style3">
                    &nbsp;</td>
                <td  align="center" width="33.33%" class="auto-style3">
                    &nbsp;</td>
                <td  align="center" width="33.33%" class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td  align="center" width="33.33%" class="auto-style11">
                    <span class="auto-style10">Bill No. : </span>
                    <b>
                    <asp:Label ID="lblBillNo" runat="server" CssClass="auto-style5"></asp:Label>
                    </b>
                </td>
                <td  align="center" width="33.33%" class="auto-style4">
                    <b>Date :
                    <asp:Label ID="lblDate" runat="server" CssClass="auto-style5"></asp:Label>
                    </b>
                </td>
                <td  align="center" width="33.33%" class="auto-style4">
                    <b>Time :
                    <asp:Label ID="lblTime" runat="server" CssClass="auto-style5"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td  align="center" width="33.33%" class="auto-style11">
                    &nbsp;</td>
                <td  align="center" width="33.33%" class="auto-style4">
                    &nbsp;</td>
                <td  align="center" width="33.33%" class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td  align="center" width="33.33%" class="auto-style2">
                    <asp:Label ID="Label2" runat="server" style="font-weight: 700; font-family: calibri" Text="Food Items" CssClass="auto-style12"></asp:Label>
                </td>
                <td  align="center" width="33.33%" class="auto-style2">
                    <asp:Label ID="Label3" runat="server" style="font-weight: 700; font-family: calibri" Text="Quantity" CssClass="auto-style12"></asp:Label>
                </td>
                <td  align="center" width="33.33%" class="auto-style2">
                    <asp:Label ID="Label4" runat="server" style="font-weight: 700; font-family: calibri" Text="Amount" CssClass="auto-style12"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" width="33.33%" style="border-right: 1px solid #C0C0C0; font-family: calibri;">
                    <asp:PlaceHolder ID="p1" runat="server"></asp:PlaceHolder>
                </td>
                <td align="center" width="33.33%" style="border-right: 1px solid #C0C0C0; font-family: calibri;">
                    <asp:PlaceHolder ID="p2" runat="server"></asp:PlaceHolder>
                </td>
                <td align="center" width="33.33%" style="font-family: calibri">
                    <asp:PlaceHolder ID="p3" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td width="33.33%" style="border-top-style: solid; border-right-style: solid; border-top-width: 2px; border-right-width: 1px; border-top-color: #C0C0C0; border-right-color: #C0C0C0;" align="right" class="auto-style5" colspan="2"><strong>Total :</strong></td>
                <td align="center" width="33.33%" style="border-top-style: solid; border-width: 2px; border-color: #C0C0C0">
                    <asp:Label ID="lblTotal" runat="server" style="font-weight: 700; font-size: large; font-family: calibri"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>    
        <br />
        <asp:Button ID="Button1" runat="server" OnClientClick="javascript:window.print();" style="font-family: calibri; font-size: x-large" Text="Print Bill" />
        &nbsp;
        <asp:Button ID="Button2" runat="server" 
            style="font-family: calibri; font-size: x-large" Text="Back" Width="176px" 
            onclick="Button2_Click" />
        <br />
    
    </div>
            </center>
    </form>
</body>
</html>
