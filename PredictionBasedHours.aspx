<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="PredictionBasedHours.aspx.cs" Inherits="PrdictionBasedHours" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="80%">
<tr>
<td colspan="4" align="center">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Order Forecasting" style="font-family: candara; font-size: x-large; font-style: italic"></asp:Label>
    </td>
</tr>
<tr><td align="right">
    <asp:Label ID="Label2" runat="server" Text="From Time" Font-Names="Candara"></asp:Label>
    </td>
<td align="left" style="font-size: large; font-weight: bold">
    <asp:TextBox ID="TextBox1"  Placeholder="hh" runat="server" 
        Height="28px" Width="76px"></asp:TextBox>:<asp:TextBox
        ID="TextBox3" Placeholder="mm" runat="server" Height="28px" 
        ontextchanged="TextBox3_TextChanged" Width="76px"></asp:TextBox>
    </td>
<td align="right">
    <asp:Label ID="Label3" runat="server"   Text="To Time" Font-Names="Candara"></asp:Label>
    </td>
<td align="left" style="font-size: medium; font-weight: bold">
    <asp:TextBox ID="TextBox2" required Placeholder="hh"  runat="server" 
        Height="28px" Width="76px"></asp:TextBox>:<asp:TextBox
        ID="TextBox4" Placeholder="mm" runat="server" Height="28px" Width="76px"></asp:TextBox>
    </td>
</tr>
<tr><td colspan="4"><br /></td></tr>
<tr><td colspan="4" align="center">
    <asp:Button ID="Button1" runat="server" Text="Predict" 
        onclick="Button1_Click" style="height: 26px" /></td></tr>
        <tr><td colspan="4"><br /></td></tr>
        <tr><td colspan="4">
            <asp:Panel ID="Panel1" runat="server">
               <center><asp:Table ID="Table1" runat="server" Width="80%">
                </asp:Table>
                </center>
                
                  
         
            </asp:Panel>
        </td></tr>
</table>

</asp:Content>
