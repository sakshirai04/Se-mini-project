<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UMenu.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body height="100%" width="100%" style="background-image: url('images/FoodBackground.jpg')">
<br />
<br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<div style="background-image:url('images/1.jpg'); width: 746px; margin-left: 312px;" > 
<font style="color: #FFFFFF;  font-family: Candara" >

    <form id="form1" runat="server" >
    <br />
    <br />
    <br />
    <br />
    <br />
    
<font style="color: #FFFFFF;  font-family: Candara" >

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Height="245px" Width="538px" 
        style="margin-left: 115px" >
        
        <Columns>
            <asp:BoundField DataField="foodno" HeaderText="foodno" 
                SortExpression="foodno" />
            <asp:BoundField DataField="category" HeaderText="category" 
                SortExpression="category" />
            <asp:BoundField DataField="foodname" HeaderText="foodname" 
                SortExpression="foodname" />
            <asp:BoundField DataField="amount" HeaderText="amount" 
                SortExpression="amount" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:canteenConnectionString %>" 
        SelectCommand="SELECT * FROM [AddFood]"></asp:SqlDataSource>
    </font>
    &nbsp;
    &nbsp;&nbsp;&nbsp;
    <br /><br /><br />
        
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;
    <asp:Button ID="Button2" runat="server" 
            style="font-family: calibri; font-size: x-large" Text="Back" Width="150px" 
            onclick="Button2_Click" Height="50px" />
    &nbsp;<br />
    <br />
    <br />
    </form>
    </font>
    </div>
    <p>
        &nbsp;</p>
    </body>
</html>
