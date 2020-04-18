<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                <marquee direction="right">
                   <asp:Label ID="Label1" runat="server" 
                        style="color:Black; font-size: xx-large; font-family: Candara" 
                        Text="Admin Login"></asp:Label></marquee>
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="                      Username" CssClass="intabular" Height="40px" 
                        style="font-size: large" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="Label2" runat="server" 
                        style="font-size: large; color: #FFFF66; font-family: Candara"></asp:Label>
                        <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:TextBox ID="TextBox2" runat="server" 
                        placeholder="                      Password" CssClass="intabular" Height="40px" 
                        style="font-size: large" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="Label3" runat="server" 
                        style="font-size: large; color: #FFFF66; font-family: Candara"></asp:Label>
                        <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="Button1" runat="server" BorderColor="#004221" 
                        CssClass="intabular" Height="45px" 
                        style="font-size: x-large; font-family: Candara; color: #0E7644" Text="Login &gt;" 
                        Width="175px" onclick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" BorderColor="#004221" 
                        CssClass="intabular" Height="45px" 
                        style="font-size: x-large; font-family: Candara; color: #0E7644" Text="&lt; Go Back" 
                        Width="175px" onclick="Button1_Click" PostBackUrl="~/MainLogin.aspx" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

