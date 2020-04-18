<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu3.aspx.cs" Inherits="_Menu" %>


<html xmlns="http://www.w3.org/1999/xhtml">

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
   
      
</head>

<body  height="100%" width="100%" style="background-image: url('images/FreshFood.jpg')">
<form runat="server">
<center>
    <div>
        <br />
 <table width="100%">
 <tr>
 <td colspan="2" align="center">
     <asp:Label ID="Label1" runat="server" Text="Order Details" Font-Bold="True" 
         style="font-family: candara; font-size: x-large; font-style: italic" 
         Width="100%" ForeColor="White"></asp:Label></td>
 </tr>
  <tr><td colspan="2"><br /></td></tr>
   <tr><td colspan="2" align="center">
    <asp:GridView ID="GridView1" runat="server" Width="100%" 
           OnRowCommand="GridView1_RowCommand" 
           style="color: #000000; font-family: candara" CellPadding="3" 
           BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
           BorderWidth="1px" onrowdeleting="GridView1_RowDeleting">
            <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1"  runat="server" CommandArgument='<%#Eval("foodno")%>' Text ="Delete Item" CommandName ="Delete" Font-Bold="True" Font-Size="Large" Font-Underline="True" style="font-family: candara; color: #CC0000"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
       </asp:GridView>
   </td></tr>
   <tr><td colspan="2"><br /></td></tr>
   <tr><td align="right" width="50%">
       <asp:Label ID="Label7" runat="server" Text="Tranaction ID:" 
           Font-Names="Candara" Width="100%" Font-Bold="True" ForeColor="White" Height="30px"></asp:Label></td>
       <td align="left" width="50%">
           <asp:TextBox ID="TextBox3" runat="server" Width="50%" CssClass="intabular" Height="30px"></asp:TextBox></td>
       
       </tr>
 <tr><td colspan="2"><br /></td></tr>
 
   <tr><td align="right" width="50%">
       <asp:Label ID="Label11" runat="server" Text="User id:" Width="100%" 
           Font-Names="Candara" Font-Bold="True" ForeColor="White" Height="30px"></asp:Label></td>
   <td align="left" width="50%">
       <asp:Label ID="Label15" runat="server" Width="100%" Font-Bold="True" 
           ForeColor="White" Height="30px"></asp:Label>
       <asp:HiddenField ID="HiddenField1" runat="server" />
   </td></tr>
   <tr><td colspan="2" class="style1"><br /></td></tr>
        <tr><td align="right" width="50%">
     <asp:Label ID="Label9" runat="server" Text="Date:" Font-Names="Candara" Width="100%" 
                Font-Bold="True" ForeColor="White" Height="30px"></asp:Label></td>
     <td align="left" width="50%">
         <asp:TextBox ID="TextBox4"  runat="server" Width="50%" CssClass="intabular" Height="30px"></asp:TextBox>
     </td>
     </tr>
     <tr><td colspan="2" class="style1"><br /></td></tr>
        <tr><td align="right" width="50%">
     <asp:Label ID="Label10" runat="server" Text="Time:" Font-Names="Candara" Width="100%" 
                Font-Bold="True" ForeColor="White" Height="30px"></asp:Label></td>
     <td align="left" width="50%">
         <asp:TextBox ID="TextBox5" type="time" runat="server" Width="50%" CssClass="intabular" Height="30px"></asp:TextBox>
     </td>
     </tr>
   <tr><td colspan="2"><br /></td></tr>
   <tr><td align="right" width="50%">
       <asp:Label ID="Label13" runat="server" Text="Combo Pack " Width="99%" 
           Font-Bold="True" ForeColor="White" Height="23px" 
           style="margin-bottom: 0px"></asp:Label></td><td align="left" width="50%">
           <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
               RepeatDirection="Horizontal" 
               onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
               Width="50%" Font-Bold="True" ForeColor="White" Height="30px">
               <asp:ListItem>Yes</asp:ListItem>
               <asp:ListItem>No</asp:ListItem>
           </asp:RadioButtonList>
           <br />
           <br />
            <asp:Button ID="Button3" runat="server" Text="See Combo Offers" onclick="Button3_Click" 
             style="font-size: small; " Width="32%" CssClass="intabular" 
               Height="30px" />
           &nbsp;
           <asp:Button ID="Button5" runat="server" Text="See Menu" onclick="Button5_Click" 
             style="font-size: small; " Width="32%" CssClass="intabular" 
               Height="30px" />
       </td></tr>
     
   </table>
        <asp:Panel ID="Panel1" runat="server">
        
   <table  width="100%">
      <tr><td align="right" width="50%">
          <br /></td>
          <td>
              &nbsp;</td></tr>
  <tr><td align="right" width="50%">
      <asp:Label ID="Label5" runat="server" Text="Category:" Font-Names="Candara" 
          Width="100%" Font-Bold="True" ForeColor="White" Height="30px"></asp:Label></td>
      <td align="left" width="50%">
          <asp:DropDownList ID="DropDownList2" runat="server"  
              onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
              AutoPostBack="True" Width="50%" CssClass="intabular" Height="30px">
              <asp:ListItem>--Select--</asp:ListItem>
          </asp:DropDownList>
      </td></tr>
   <tr><td align="right"></td><td  align="left">
       <asp:Label ID="Label17" runat="server" ForeColor="White"></asp:Label>
       <br /></td></tr>
 <tr><td align="right" width="50%">
     <asp:Label ID="Label2" runat="server" Text="Food Name:" Font-Names="Candara" 
         Width="100%" Font-Bold="True" ForeColor="White"></asp:Label></td>
     <td align="left" width="50%">  
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
             onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="50%" CssClass="intabular" Height="30px">
             <asp:ListItem>--Select--</asp:ListItem>
         </asp:DropDownList>
     </td>
     </tr>
     <tr><td align="right"></td><td align="left">
         <asp:Label ID="Label21" runat="server" Font-Size="Medium" ForeColor="White"></asp:Label>
         </td></tr>
     </table>
     </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
        
     <table  width="100%">
    
<tr><td align="right" width="50%">
    <asp:Label ID="Label12" runat="server" Text="Combo Name" Width="100%" 
        Font-Bold="True" ForeColor="White"></asp:Label></td><td align="left" width="50%">
        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList4_SelectedIndexChanged" Width="50%" CssClass="intabular" Height="30px">
            <asp:ListItem>--Select--</asp:ListItem>
        </asp:DropDownList>
    </td></tr>
     <tr><td></td><td  align="left">
         <asp:Label ID="Label19" runat="server" ForeColor="White"></asp:Label>
         <br /></td></tr>
    </table>
    </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
       
    <table  width="100%">
    
      <tr><td align="right" class="style2" width="50%">
     <asp:Label ID="Label3" runat="server" Text="Quantity:" Font-Names="Candara" 
              Width="100%" Font-Bold="True" ForeColor="White"></asp:Label></td>
     <td align="left" class="style2" width="50%">
         <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged" 
             AutoPostBack="True" Width="50%" CssClass="intabular" Height="30px"></asp:TextBox>
     </td>
     </tr>
     <tr><td></td><td  class="style1" align="left">
         <asp:Label ID="Label20" runat="server" Font-Size="Medium" ForeColor="White"></asp:Label>
         </td></tr>
        <tr><td align="right" width="50%">
     <asp:Label ID="Label4" runat="server" Text="Total Amount:" Font-Names="Candara" 
                Width="100%" Font-Bold="True" ForeColor="White"></asp:Label></td>
     <td align="left" width="50%">
         <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Width="50%" CssClass="intabular" Height="30px"></asp:TextBox>
     </td>
     </tr>
     
     <tr><td colspan="2">
         <asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
         <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
         <asp:Label ID="Label14" runat="server" Visible="False"></asp:Label>
         <br /></td></tr>
         <tr><td align="right"></td><td align="left">
             <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" 
                 ForeColor="White"></asp:Label></td></tr>
     <tr><td colspan="2" align="center">
         <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" 
             style="font-size: large; height: 33px;" Width="30%" CssClass="intabular" Height="30px" />&nbsp;
         
         </td></tr>
 </table>
  </asp:Panel>
 <center> <asp:Button Id="Button2" runat="server" Text="Confirm" 
         OnClick="Button2_Click" style="font-size: large" Width="30%" CssClass="intabular" Height="35px"/>
     <br />
     <asp:Button Id="Button4" runat="server" Text="Back" 
         OnClick="Button4_Click" style="font-size: large" Width="30%" 
         CssClass="intabular" Height="35px"/>
        </center>
        </div>
</center>
</form>


<asp:Content ID="Content1" runat="server" contentplaceholderid="head"  >

    <style type="text/css" runat="server">
        .style1
        {
            height: 23px;
        }
        .style2
        {
            height: 26px;
        }
    </style>
       <script type = "text/javascript">
           function Confirm() {
               var confirm_value = document.createElement("INPUT");
               confirm_value.type = "hidden";
               confirm_value.name = "confirm_value";
               if (confirm("Do you want to Delete this Food Item?")) {
                   confirm_value.value = "Yes";
               } else {
                   confirm_value.value = "No";
               }
               document.forms[0].appendChild(confirm_value);
           }
    </script>
</asp:Content>
</body>
</html>
-->--%>