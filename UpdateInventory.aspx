<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="UpdateInventory.aspx.cs" Inherits="UpdateInventory" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table width="40%">
    
    <tr>
    <td colspan="2" align="center">
        <asp:Label ID="Label1" runat="server" Text="Update Inventory" 
            style="font-family: candara; font-size: x-large; font-style: italic" 
            Font-Bold="True"></asp:Label></td>
    </tr>
    <tr><td colspan="2" class="style1"><br /></td></tr>
    <tr>
    <td align="right" class="style1" width="20%">
        <asp:Label ID="Label2" runat="server" Text="Product Name:" Font-Names="Candara"></asp:Label></td>
        <td align="left" width="20%">
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem>--Select--</asp:ListItem>
            </asp:DropDownList>
        </td></tr>
            <tr><td colspan="2" class="style2"><br /></td></tr>
            <tr><td  align="right" width="20%">
                <asp:Label ID="Label3" runat="server" Text="Quantity Available:" 
                    Font-Names="Candara"></asp:Label>
                </td><td align="left" width="20%">
                    <asp:TextBox ID="TextBox5" type="number" runat="server"></asp:TextBox>
                </td></tr>
                 <tr><td colspan="2">
                   
                      <br /></td></tr>
                      </table>
     <asp:Panel ID="Panel1" runat="server">
    
                      <table width="40%">
                 <tr><td align="right">
                     <asp:Label ID="Label5" runat="server" Text="Actual Quantity" 
                         Font-Names="Candara"></asp:Label></td><td align="left">
                         <asp:TextBox ID="TextBox4" required  runat="server"></asp:TextBox></td></tr>
                  <tr><td colspan="2">
                   
                      <br /></td></tr>

            
                <tr><td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" /></td></tr>
    </table>
     </asp:Panel>
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
        height: 21px;
    }
    </style>
</asp:Content>


