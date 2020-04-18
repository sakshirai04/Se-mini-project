<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="SComboOffers.aspx.cs" Inherits="SComboOffers" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="80%">
<tr><td colspan="2"><br /></td></tr>
<tr><td colspan="2" align="center">
    <asp:Label ID="Label1" runat="server" Text="Combo Offers" Font-Bold="True" 
        Font-Size="Large" style="font-family: candara; font-size: x-large; font-style: italic"></asp:Label></td></tr>
   <tr><td colspan="2"><br /></td></tr>
  
<tr><td  align="right">
    <asp:Label ID="Label6" runat="server" Text="Combo Pack" Font-Names="Candara"></asp:Label>
   </td><td  align="left">
       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
           <asp:ListItem>--Select--</asp:ListItem>
       </asp:DropDownList>
   </td></tr>
   <tr><td colspan="2"><br /></td></tr>
</table>
    <asp:Panel ID="Panel1" runat="server">
   
 <center>  
 
 <table width="80%">
 <tr>
 <td colspan="3" align="left">
     <asp:Label ID="Label2" runat="server" Text="Combo Pack" Font-Bold="True" 
         Font-Size="X-Large" Font-Names="Candara"></asp:Label></td>
 </tr>
 <tr>
 <td>
     <asp:Label ID="Label3" runat="server" Text="Combo Name" Font-Bold="True" 
         Font-Size="Large" Font-Names="Candara"></asp:Label></td>
  <td>
      <asp:Label ID="Label4" runat="server" Text="Food Items" Font-Bold="True" 
          Font-Size="Large" Font-Names="Candara"></asp:Label></td>
   <td>
       <asp:Label ID="Label5" runat="server" Text="Amount" Font-Bold="True" 
           Font-Size="Large" Font-Names="Candara"></asp:Label></td>
 </tr>
 <tr>
 <td>
     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>  </td>
  <td>
      <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
  </td>
   <td>
       <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
   </td>
 </tr>
 
 </table></center>
  </asp:Panel>
</asp:Content>