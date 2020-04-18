<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UComboOffers.aspx.cs" Inherits="UComboOffers" %>
<body  style="background-image: url('images/FreshFood.jpg')">
<center>

<form runat="server">




    <br />
    <br />
    <br />
    <br />




<table width="100%" style=" background-image: url('images/Chinese-new-year-2013-background.jpg')">
<tr><td colspan="2"><br /></td></tr>
<tr><td colspan="2" align="center">
    <asp:Label ID="Label1" runat="server" Text="Combo Offers" 
        style="font-family: candara; font-size: x-large; font-style: italic" 
        Width="100%" Font-Bold="True" ForeColor="White"></asp:Label></td></tr>
   <tr><td colspan="2"><br /></td></tr>
  
<tr><td  align="right" width="50%">
    <asp:Label ID="Label6" runat="server" Text="Combo Pack" Width="100%" 
        Font-Names="Candara" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
   </td><td  align="left" width="50%">
       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="100%">
           <asp:ListItem>--Select--</asp:ListItem>
       </asp:DropDownList>
   </td></tr>
   <tr><td colspan="2"><br /></td></tr>
</table style="background-image: url('images/Chinese-new-year-2013-background.jpg')">
    <asp:Panel ID="Panel1" runat="server">
   
 <center>  
 
 <table width="100%" style=" background-image: url('images/Chinese-new-year-2013-background.jpg') ">
 <tr>
 <td colspan="3" align="left">
     <asp:Label ID="Label2" runat="server" Text="Combo Pack" Font-Bold="True" 
         Font-Size="X-Large" Width="100%" Font-Names="Candara" ForeColor="White"></asp:Label></td>
 </tr>
 <tr>
 <td width="40%">
     <asp:Label ID="Label3" runat="server" Text="Combo Name" Font-Bold="True" 
         Font-Size="Large" Width="100%" Font-Names="Candara" ForeColor="White"></asp:Label></td>
  <td width="40%">
      <asp:Label ID="Label4" runat="server" Text="Food Items" Font-Bold="True" 
          Font-Size="Large" Width="100%" Font-Names="Candara" ForeColor="White"></asp:Label></td>
   <td width="20%">
       <asp:Label ID="Label5" runat="server" Text="Amount" Font-Bold="True" 
           Font-Size="Large" Width="100%" Font-Names="Candara" ForeColor="White"></asp:Label></td>
 </tr>
 <tr>
 <td width="40%" style="font-size:small; font-weight:bold; color:White">
     <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>  </td>
  <td width="40%" style="font-size:small; font-weight:bold; color:White">
      <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
  </td>
   <td width="20%" style="font-size:small; font-weight:bold; color:White">
       <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
   </td>
 </tr>
    
 </table>
 
 
 <div width="100%" style=" background-image: url('images/Chinese-new-year-2013-background.jpg')">
 <asp:Button ID="Button2" runat="server" 
            style="font-family: calibri; font-size: x-large" Text="Back" Width="150px" 
            onclick="Button2_Click" Height="50px" />
 </div>
 </center>
  </asp:Panel>
</form> 
   

</body>
