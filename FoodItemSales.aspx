<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FoodItemSales.aspx.cs" Inherits="FoodItemSales" %>


<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><table width="80%">
<tr><td colspan="6" align="center"><asp:Label ID="Label1" runat="server" 
        Text="Sales As Per Product" Font-Bold="True" 
        style="font-family: candara; font-size: x-large; font-style: italic"></asp:Label></td></tr>
<tr><td colspan="6"><br /></td></tr>
<tr><td align="right">
    <asp:Label ID="Label2" runat="server" Text="From Date" Font-Names="Candara"></asp:Label></td>
<td align="left">
    <asp:TextBox ID="TextBox1" type="date" required runat="server"></asp:TextBox></td>
   <td align="right">
    <asp:Label ID="Label3" runat="server" Text="To Date" Font-Names="Candara"></asp:Label></td>
<td align="left">
    <asp:TextBox ID="TextBox2" type="date" required runat="server"></asp:TextBox></td>
     <td align="right">
    <asp:Label ID="Label4" runat="server" Text="Food Items"></asp:Label></td>
<td align="left">
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>--Select--</asp:ListItem>
    </asp:DropDownList>
    </td>
</tr> 
<tr><td colspan="6" align="center"><br /></td></tr>

<tr><td colspan="6" align="center">
    <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" /></td></tr>
    <tr><td colspan="6"><br /></td></tr>
    <tr><td colspan="6" align="center">
        <asp:GridView ID="GridView1" runat="server" Width="80%" 
            AutoGenerateColumns="False" Font-Names="Candara">
        <Columns>
                <asp:BoundField HeaderText="Food Name" DataField="foodname"/>
                <asp:BoundField HeaderText="Quantity" DataField="quantity"/>
                <asp:BoundField HeaderText="Amount" DataField="amount" />
                <asp:BoundField HeaderText="Date" DataField="date" />
               
                </Columns>

        </asp:GridView>
    </td></tr>
        <tr><td colspan="6"><br /></td></tr>
            <tr><td colspan="6" align="center">
                <asp:Chart ID="Chart1" runat="server" Width="1000px">
                    <Series>
                        <asp:Series Name="Series1">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </td></tr>
</table></center>

</asp:Content>
