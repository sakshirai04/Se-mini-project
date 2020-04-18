<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="RemoveFoodItem.aspx.cs" Inherits="RemoveFoodItem" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table width="40%">
    
    <tr>
    <td colspan="4" align="center">
        <asp:Label ID="Label1" runat="server" Text="Remove Food Items" Font-Bold="True" 
            Font-Size="Large" style="font-family: candara; font-size: x-large; font-style: italic"></asp:Label></td>
    </tr>
    <tr><td colspan="4"><br /></td></tr>
    <tr>
    <td align="right" class="style1">
        <asp:Label ID="Label2" runat="server" Text="Category :" Font-Names="Candara"></asp:Label></td>
        <td align="left">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>--Select--</asp:ListItem>
            </asp:DropDownList>
       
    <td align="right" class="style1">
        <asp:Label ID="Label3" runat="server" Text="Food Name :" Font-Names="Candara"></asp:Label></td>
        <td align="left">
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem>--Select--</asp:ListItem>
            </asp:DropDownList>
        </td></tr>
            <tr><td colspan="4">
                <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                <br /></td></tr>
           <tr><td colspan="4" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Delete" OnClientClick = "Confirm()" onclick="Button1_Click" /></td></tr>
    </table>
    </asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 341px;
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

