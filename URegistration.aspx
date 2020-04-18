<%@ Page Language="C#" AutoEventWireup="true" CodeFile="URegistration.aspx.cs" Inherits="URegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image:url(images/FoodBackground.jpg);">
    <form id="form1" runat="server">
    <br />
    <br />
    <br />
    <div align="center"  style="background-image:url(images/white.PNG); font-family: calibri;" >
    
        <br />
        <br />
    
    
    <p>
                <asp:Label ID="Label3" runat="server" style="font-family: calibri; font-size: xx-large;"  Text="-- Add Customers --"></asp:Label>
            </p>
    <p>
               <asp:Label ID="Label1" runat="server" CssClass="style11"  Font-Bold="true" Text="User Id :"></asp:Label>
               
                <asp:Label ID="Label2" runat="server" CssClass="style11" Width="45%"  Font-Bold="true" Style="text-align: left"></asp:Label>
    </p>
    <p>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="style12" 
                    placeholder="  Name" required="Required" Width="40%" Height="30px"></asp:TextBox>
            </p>
    <p>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="style12" 
                    placeholder=" Address" required="Required" TextMode="MultiLine" 
                    Width="40%"></asp:TextBox>
            </p>
    <p>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="style12" 
                    placeholder="  Mobile No." required="Required" MaxLength="10" Width="40%" 
                    Height="30px" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RxvMobNo" runat="Server" 
                                ControlToValidate="TextBox3" ErrorMessage="Invalid Mobile No.!" 
                                ForeColor="#FF3300" ValidationExpression="^[7-9]\d{9}$" 
                                
                    style="font-family: Calibri; color: #990000; font-size: large;" 
                    Width="100%"></asp:RegularExpressionValidator>
            </p>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="style12" 
                    placeholder="  Email Id" required="Required" Width="40%" Height="30px"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RxvEmail" runat="Server" 
                                ControlToValidate="TextBox4" ErrorMessage="Invalid Email Id!" 
                                ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                
                    style="font-family: Calibri; color: #800000; font-size: large;" 
                    Width="100%"></asp:RegularExpressionValidator>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="style12" 
                    placeholder="  Your Age" required="Required" MaxLength="3" Width="40%" 
                    Height="30px"></asp:TextBox>
            <br />
    <br />
                <asp:TextBox ID="TextBox6" runat="server" CssClass="style12" 
                    placeholder="  Password" required="Required" MaxLength="15" Width="40%" 
                    Height="30px"></asp:TextBox>
                <br />
        <br />
        <br />
        <br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" 
                    style="color: #000000; font-family: Candara; font-size: x-large; font-weight: 700" 
                    Width="40%">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
                <br />
        <br />
        <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    Height="40px" Width="20%" Font-Size="X-Large" ForeColor="#333333" 
                    BorderColor="#009933" OnClick="btnSubmit_Click" />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Back" runat="server" Text="Back" 
                    Height="40px" Width="20%" Font-Size="X-Large" ForeColor="#333333" 
                    BorderColor="#009933" OnClick="Back_Click" />
   </div> </form>
</body>
</html>
