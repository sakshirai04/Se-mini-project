<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="OrderPlacedCustomer.aspx.cs" Inherits="OrderPlacedCustomer" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="80%">
<tr>
<td colspan="2" align="center">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
        Text="Customer Order Details " style="font-family: candara; font-size: x-large; font-style: italic"></asp:Label>
    </td>
</tr>
<tr><td colspan="2">
<br /></td></tr>
<tr><td colspan="2">
    <asp:GridView ID="GridView1" runat="server" Width="80%" 
        AutoGenerateColumns="False" Font-Names="Candara">
    <Columns>
    <asp:BoundField HeaderText="Transaction ID" DataField="tid"/>
                <asp:BoundField HeaderText="Customer Name" DataField="CName"/>
                <asp:BoundField HeaderText="Food Name" DataField="FoodName"/>
                <asp:BoundField HeaderText="Amount" DataField="Amount" />
                 <asp:BoundField HeaderText="Address" DataField="address" />
              <asp:TemplateField>   
                          
                       <ItemTemplate>                              <asp:CheckBox ID="chkSelect" runat="server" />   
                        </ItemTemplate>   
                   </asp:TemplateField>

                </Columns>

    </asp:GridView>
<br /></td></tr>
<tr><td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Submit" 
        onclick="Button1_Click1" />
<br /></td></tr>
</table>

</asp:Content>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">   
// for check all checkbox   
       function CheckAll(Checkbox) {
           var GridVwHeaderCheckbox = document.getElementById("<%=GridView1.ClientID %>");   
            for (i = 1; i < GridVwHeaderCheckbox.rows.length; i++) {   
               GridVwHeaderCheckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;   
            }   
        }   
   </script>


</asp:Content>
