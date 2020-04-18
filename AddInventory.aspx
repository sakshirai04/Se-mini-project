<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="AddInventory.aspx.cs" Inherits="AddInventory" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table width="40%">
    
    <tr>
    <td colspan="2" align="center">
        <asp:Label ID="Label1" runat="server" Text="Add Product Details" 
            style="font-family: candara; font-size: x-large; font-style: italic" 
            Font-Bold="True"></asp:Label></td>
    </tr>
    <tr><td colspan="2"><br /></td></tr>
    <tr>
    <td align="right" class="style1" width="20%">
        <asp:Label ID="Label2" runat="server" Text="Product ID :" Font-Names="Candara"></asp:Label></td>
        <td align="left" width="20%">
            <asp:TextBox ID="TextBox1"  runat="server"></asp:TextBox></td></tr>
            <tr><td colspan="2"><br /></td></tr>
           
               
            <tr><td  align="right">
                <asp:Label ID="Label7" runat="server" Text="Product Name :" 
                    Font-Names="Candara"></asp:Label>
                </td><td  align="left">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td></tr>
                <tr><td colspan="2"><br /></td></tr>
                 <tr><td align="right">
                     <asp:Label ID="Label5" runat="server" Text="Quantity :" Font-Names="Candara"></asp:Label></td><td align="left">
                         <asp:TextBox ID="TextBox4" required runat="server"></asp:TextBox></td></tr>
                  


                <tr><td colspan="2">
                    <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                    <br /></td></tr>
                <tr><td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" /></td></tr>
    </table>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>
</asp:Content>

