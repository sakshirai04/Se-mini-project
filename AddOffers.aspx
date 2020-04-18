<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="AddOffers.aspx.cs" Inherits="AddOffers" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table width="40%">
    
    <tr>
    <td colspan="2" align="center">
        <asp:Label ID="Label1" runat="server" Text="Add Combo" 
            style="font-family: candara; font-size: x-large; font-style: italic" 
            Font-Bold="True"></asp:Label></td>
    </tr>
    <tr><td colspan="2"><br /></td></tr>
    <tr>
    <td align="right" class="style1" width="20%">
        <asp:Label ID="Label2" runat="server" Text="Combo ID :" Font-Names="Candara"></asp:Label></td>
        <td align="left" width="20%">
            <asp:TextBox ID="TextBox1"  runat="server"></asp:TextBox></td></tr>
            <tr><td colspan="2"><br /></td></tr>
             
              <tr><td align="right">
                  <asp:Label ID="Label7" runat="server" Text="Combo Name :" Font-Names="Candara"></asp:Label>
                  </td><td align="left">
                      <asp:TextBox ID="TextBox5" required runat="server"></asp:TextBox>
                  </td></tr>
              <tr><td colspan="2"><br /></td></tr>
            <tr><td  align="right" width="20%">
                <asp:Label ID="Label3" runat="server" Text="Category :" Font-Names="Candara"></asp:Label>
                </td><td align="left" width="20%">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>--Select--</asp:ListItem>
                </asp:DropDownList>
                </td></tr>
                  <tr><td colspan="2"><br /></td></tr>
            <tr><td  align="right" width="20%">
                <asp:Label ID="Label8" runat="server" Text="Food Name :" Font-Names="Candara"></asp:Label>
                </td><td align="left" width="20%">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem>--Select--</asp:ListItem>
                </asp:DropDownList>
                </td></tr>
                 
        
                <tr><td colspan="2"><br /></td></tr>
                <tr><td  align="right" width="20%">
                <asp:Label ID="Label9" runat="server" Text="Food Frequently Bought Together :" 
                        Font-Names="Candara"></asp:Label>
                </td><td align="left" width="20%">
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>--Select--</asp:ListItem>
                </asp:DropDownList>
                </td></tr>
                 
        
                <tr><td colspan="2"><br /></td></tr>
                <tr><td colspan="2" align="center">
            <asp:Button ID="Button2" runat="server" Text="Add" onclick="Button2_Click" />
            <br /></td></tr>
                <tr><td colspan="2"><br /></td></tr>
                 <tr><td align="right" class="style2">
                     <asp:Label ID="Label5" runat="server" Text="Cost" Font-Names="Candara"></asp:Label></td>
                     <td align="left" class="style2">
                         <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td></tr>
                  <tr><td colspan="2" class="style1">
                      <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
                      <br /></td></tr>

            
              

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
        .style2
        {
            height: 26px;
        }
    </style>
</asp:Content>

