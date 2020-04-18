<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="AddFoodItem.aspx.cs" Inherits="AddFoodItem" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table width="80%">
    
    <tr>
    <td colspan="2" align="center">
        <asp:Label ID="Label1" runat="server" Text="Add Food Items" Font-Bold="True" 
             style="font-family: candara; font-size: x-large; font-style: italic"></asp:Label></td>
    </tr>
    <tr><td colspan="2"><br /></td></tr>
    <tr>
    <td align="right" class="style1">
        <asp:Label ID="Label2" runat="server" Text="Food Item Number :" 
            Font-Names="Candara"></asp:Label></td>
        <td align="left">
            <asp:TextBox ID="TextBox1"  runat="server"></asp:TextBox></td></tr>
            <tr><td colspan="2"><br /></td></tr>
            <tr><td align="right">
                <asp:Label ID="Label3" runat="server" Text="Category :" Font-Names="Candara"></asp:Label></td><td  align="left">
                <asp:TextBox ID="TextBox2" required runat="server"></asp:TextBox></td></tr>
                <tr><td colspan="2"><br /></td></tr>
            <tr><td  align="right">
             <asp:Label ID="Label4" runat="server" Text="Food Name :" Font-Names="Candara"></asp:Label></td>
                <td align="left"><asp:TextBox ID="TextBox3"  required runat="server"></asp:TextBox></td></tr>
                <tr><td colspan="2"><br /></td></tr>
            <tr><td  align="right"> <asp:Label ID="Label5" runat="server" Text="Amount :" 
                    Font-Names="Candara"></asp:Label></td>
                <td align="left"><asp:TextBox ID="TextBox4" type="number"  required runat="server"></asp:TextBox></td></tr>
               
                
                  <tr><td colspan="2"><br /></td></tr>
                  <tr><td align="right">
                      <asp:Label ID="Label6" runat="server" Text="Product Name :" 
                          Font-Names="Candara"></asp:Label></td><td align="left">
                          <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                              onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                              <asp:ListItem>--Select--</asp:ListItem>
                          </asp:DropDownList>
                      </td></tr>
                  <tr><td colspan="2"><br /></td></tr>
                   <tr><td align="right">
                      <asp:Label ID="Label7" runat="server" Text="Product ID :" Font-Names="Candara"></asp:Label></td><td align="left">
                          <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True"></asp:TextBox></td></tr>
                  <tr><td colspan="2"><br /></td></tr>
                  <tr><td align="right">
                      <asp:Label ID="Label8" runat="server" Text="Quantity :" Font-Names="Candara"></asp:Label></td><td align="left">
                          <asp:TextBox ID="TextBox7" runat="server" ontextchanged="TextBox7_TextChanged"></asp:TextBox>
                      </td></tr>
                  <tr><td colspan="2"><br /></td></tr>
                  <tr><td colspan="2" align="center">
                      <asp:Button ID="Button2" runat="server" Text="Add" onclick="Button2_Click" /></td></tr>
                  <tr><td colspan="2">
                     <asp:GridView ID="GridView1" runat="server" Width="80%" Font-Names="Candara">
                     </asp:GridView>
                      <br /></td></tr>
                <tr><td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" /></td></tr>
    </table>
    </asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 341px;
        }
    </style>
</asp:Content>

