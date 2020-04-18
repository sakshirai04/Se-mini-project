<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="TakeOrder.aspx.cs" Inherits="TakeOrder" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
 <table width="80%">
 <tr>
 <td colspan="2" align="center">
     <asp:Label ID="Label1" runat="server" Text="Order Details" Font-Bold="True" style="font-family: candara; font-size: x-large; font-style: italic"></asp:Label></td>
 </tr>
  <tr><td colspan="2"><br /></td></tr>
   <tr><td colspan="2" align="center">
    <asp:GridView ID="GridView1" runat="server" Width="80%" 
           OnRowCommand="GridView1_RowCommand" 
           style="color: #000000; font-family: candara" 
           onrowdeleting="GridView1_RowDeleting">
            <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" OnClientClick="Confirm()" runat="server" CommandArgument='<%#Eval("foodno")%>' Text ="Delete Item" CommandName ="Delete" Font-Bold="True" Font-Size="Large" Font-Underline="True" style="font-family: candara; color: #CC0000"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
       </asp:GridView>
   </td></tr>
   <tr><td colspan="2"><br /></td></tr>
   <tr><td align="right" width="40%">
       <asp:Label ID="Label7" runat="server" Text="Tranaction ID:" 
           Font-Names="Candara"></asp:Label></td>
       <td align="left" width="40%">
           <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
       
       </tr>
 <tr><td colspan="2"><br /></td></tr>
 
   <tr><td align="right" width="40%">
       <asp:Label ID="Label11" runat="server" Text="User ID:" Font-Names="Candara"></asp:Label></td>
   <td align="left" width="40%">
       <asp:DropDownList ID="DropDownList3" runat="server" 
           onselectedindexchanged="DropDownList3_SelectedIndexChanged" 
           AutoPostBack="True" style="height: 22px">
           <asp:ListItem>--Select--</asp:ListItem>
       </asp:DropDownList>
       <asp:HiddenField ID="HiddenField1" runat="server" 
           onvaluechanged="HiddenField1_ValueChanged" />
   </td></tr>
    <tr><td colspan="2" class="style1"><br /></td></tr>
        <tr><td align="right" width="40%">
     <asp:Label ID="Label9" runat="server" Text="Date:"></asp:Label></td>
     <td align="left" width="40%">
         <asp:TextBox ID="TextBox4"  runat="server" ReadOnly="True" 
             ontextchanged="TextBox4_TextChanged"></asp:TextBox>
     </td>
     </tr>
     <tr><td colspan="2" class="style1"><br /></td></tr>
        <tr><td align="right" width="40%">
     <asp:Label ID="Label10" runat="server" Text="Time:"></asp:Label></td>
     <td align="left" width="40%">
         <asp:TextBox ID="TextBox5" type="time" runat="server" ReadOnly="True" 
             ontextchanged="TextBox5_TextChanged"></asp:TextBox>
     </td>
     </tr>
 
   <tr><td colspan="2"><br /></td></tr>
   <tr><td align="right" width="40%">
       <asp:Label ID="Label13" runat="server" Text="Combo Pack " Font-Names="Candara"></asp:Label></td><td align="left" width="40%">
           <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
               RepeatDirection="Horizontal" 
               onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
               <asp:ListItem>Yes</asp:ListItem>
               <asp:ListItem>No</asp:ListItem>
           </asp:RadioButtonList>
       </td></tr>
   </table>
        <asp:Panel ID="Panel1" runat="server">
        
   <table  width="80%">
      <tr><td colspan="2"><br /></td></tr>
  <tr><td align="right">
      <asp:Label ID="Label5" runat="server" Text="Category:" Font-Names="Candara" width="40%"></asp:Label></td>
      <td align="left" width="40%">
          <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" 
              onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
              AutoPostBack="True">
              <asp:ListItem>--Select--</asp:ListItem>
          </asp:DropDownList>
      </td></tr>
   <tr><td colspan="2"><br /></td></tr>
 <tr><td align="right" width="40%">
     <asp:Label ID="Label2" runat="server" Text="Food Name:" Font-Names="Candara"></asp:Label></td>
     <td align="left" width="40%">
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
             onselectedindexchanged="DropDownList1_SelectedIndexChanged">
             <asp:ListItem>--Select--</asp:ListItem>
         </asp:DropDownList>
     </td>
     </tr>
     </table>
     </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
        
     <table  width="80%">
     <tr><td colspan="2"><br /></td></tr>
<tr><td align="right" width="40%">
    <asp:Label ID="Label12" runat="server" Text="Combo Name"></asp:Label></td><td align="left" width="40%">
        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList4_SelectedIndexChanged">
            <asp:ListItem>--Select--</asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    </table>
    </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
       
    <table  width="80%">
     <tr><td colspan="2"><br /></td></tr>
      <tr><td align="right" class="style2" width="40%">
     <asp:Label ID="Label3" runat="server" Text="Quantity:" Font-Names="Candara"></asp:Label></td>
     <td align="left" class="style2" width="40%">
         <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged" 
             AutoPostBack="True" ReadOnly="True"></asp:TextBox>
     </td>
     </tr>
     <tr><td colspan="2" class="style1"><br /></td></tr>
        <tr><td align="right" width="40%">
     <asp:Label ID="Label4" runat="server" Text="Total Amount:" Font-Names="Candara"></asp:Label></td>
     <td align="left" width="40%">
         <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
     </td>
     </tr>
    
     <tr><td colspan="2">
         <asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
         <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
         <asp:Label ID="Label14" runat="server" Visible="False"></asp:Label>
         <br /></td></tr>
     <tr><td colspan="2" align="center">
         <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" 
             style="font-size: large; height: 33px;" />&nbsp;
         
         </td></tr>
 </table>
  </asp:Panel>
 <center> <asp:Button Id="Button2" runat="server" Text="Confirm" OnClick="Button2_Click" style="font-size: large"/></center>
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

