<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>
<head>
    <style type="text/css">
        .auto-style1 {
            width: 726px;
        }
    </style>
     <style type="text/css">

     .style10
     {
         -webkit-border-radius: 10px;
         -moz-border-radius: 10px;
         font-family: Calibri;
     }
     </style>
</head>
<form runat="server">
    <body style="background-image:url(images/FoodBackground.jpg);">
    

            <p>

         
        <table class="style1" width="80%" height="80%" style="background-image: url('images/1.jpg')" align="center">
                &nbsp; 
       
                <br />
                <br />
                <br />
                <br />
       
            <tr>
                <td colspan="2" class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                     
                   <asp:Label ID="Label1" runat="server" 
                        style="color: #FFFFFF; font-size: xx-large; font-family: Candara" 
                        Text="User Login"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server" 
                        placeholder="                      UserId" CssClass="auto-style1" 
                        style="font-size: large" Width="300px" OnTextChanged="TextBox1_TextChanged" Height="40px" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    <asp:Label ID="Label2" runat="server" 
                        style="font-size: large; color: #FFFF66; font-family: Candara" 
                        Width="100%"></asp:Label>
                        <br />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    <asp:TextBox ID="TextBox2" runat="server" 
                        placeholder="                   UserPassword" CssClass="auto-style1" Height="40px" 
                        style="font-size: large" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    <asp:Label ID="Label3" runat="server" 
                        style="font-size: large; color: #FFFF66; font-family: Candara" 
                        Width="100%"></asp:Label>
                        <br />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="auto-style1">
                    <asp:Button ID="Button1" runat="server" BorderColor="#004221" 
                        CssClass="auto-style1" 
                        style="font-size: x-large; font-family: Candara; color: #0E7644" Text="Login" 
                        Width="200px" onclick="Button1_Click" Height="40px" BorderStyle="None" />
                    <br />
                </td>
                
            </tr>
            <tr>
                <td colspan="2" align="Center" class="auto-style1">
                    
                   
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/UContactUs.aspx" 
                        
                        style="color: #ff0000; font-size: large; font-family: Candara; font-weight: 700" 
                        Width="100%" ForeColor="Red">Contact Us</asp:HyperLink>
                     
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="auto-style1">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/URegistration.aspx" 
                        
                        style="color: #66FFFF; font-size: large; font-family: Candara; font-weight: 700" 
                        Width="100%">Register Now</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td  colspan="2" align="center" class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style1">
                    &nbsp;</td>
            </tr>
        </table>
    </p>
    </body>
    </form>