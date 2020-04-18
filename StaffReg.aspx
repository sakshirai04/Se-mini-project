<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StaffReg.aspx.cs" Inherits="StaffReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .intLog
        {
    	    -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
        }
        .style9
        {
            height: 40px;
        }
     .style10
     {
         -webkit-border-radius: 10px;
         -moz-border-radius: 10px;
         font-family: Calibri;
     }
     .style11
     {
         font-family: Calibri;
         font-size: x-large;
            color: #333333;
            font-weight: 700;
        }
     .style12
     {
         -webkit-border-radius: 10px;
         -moz-border-radius: 10px;
         font-family: Calibri;
         font-size: large;
     }
     .style13
     {
         width: 30%;
     }
     .style14
     {
         width: 20%;
     }
        .auto-style1 {
            width: 30%;
            height: 23px;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-image: url('Images/Chinese-new-year-2013-background.jpg'); " 
        width="100%" class="intLog">
        <tr>
            <td colspan="3" 
                style="background-image: url('Images/wingwahbackgroundchinese.jpg')" 
                align="center" class="intLog" bgcolor="#CC3300">
                <asp:Label ID="Label3" runat="server" style="font-family: calibri; font-size: xx-large; color: #FFFFFF;" Text="-- Register --"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
               <asp:Label ID="Label1" runat="server" CssClass="style11" Text="User Id :"></asp:Label>
                <asp:Label ID="Label2" runat="server" CssClass="style11"></asp:Label>
            </td>
            <td class="style13">
            </td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="style12" 
                    placeholder="  Name" required="Required" Width="100%" Height="30px"></asp:TextBox>
            </td>
            <td class="style13">
            </td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="style12" 
                    placeholder=" Address" required="Required" TextMode="MultiLine" 
                    Width="99%"></asp:TextBox>
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                </td>
            <td align="left">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="style12" 
                    placeholder="  Mobile No." required="Required" MaxLength="10" Width="100%" 
                    Height="30px"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RxvMobNo" runat="Server" 
                                ControlToValidate="TextBox3" ErrorMessage="Invalid Mobile No.!" 
                                ForeColor="#FF3300" ValidationExpression="^[7-9]\d{9}$" 
                                
                    style="font-family: Calibri; color: #990000; font-size: large;"></asp:RegularExpressionValidator>
            </td>
            <td align="left" class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                </td>
            <td class="style9" align="left" >
                <asp:TextBox ID="TextBox4" runat="server" CssClass="style12" 
                    placeholder="  Email Id" required="Required" Width="100%" Height="30px"></asp:TextBox>
                <br />
                 <asp:RegularExpressionValidator ID="RxvEmail" runat="Server" 
                                ControlToValidate="TextBox4" ErrorMessage="Invalid Email Id!" 
                                ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                
                    style="font-family: Calibri; color: #800000; font-size: large;"></asp:RegularExpressionValidator>
            </td>
            <td align="left" class="style13">
                 &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="style12" 
                    placeholder="  Your Age" required="Required" MaxLength="3" Width="100%" 
                    Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="style12" 
                    placeholder="Username" required="Required"
                   Width="100%" Height="30px"></asp:TextBox>
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Username Already Exist !!!" Visible="False"></asp:Label>
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="style12" 
                    placeholder="  Password" required="Required" TextMode="Password" 
                    MaxLength="16" Width="100%" Height="30px"></asp:TextBox>
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td align="center">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" 
                    style="color: #000000; font-family: Candara; font-size: x-large; font-weight: 700" 
                    Width="250px">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="auto-style1">
                </td>
            <td class="auto-style2">
                </td>
            <td class="auto-style1">
                </td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style13">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="style10" 
                    Height="40px" Width="200px" Font-Size="X-Large" ForeColor="#333333" 
                    BorderColor="#009933" OnClick="btnSubmit_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSubmit0" runat="server" Text="&lt; Go Back" CssClass="style10" 
                    Height="40px" Width="200px" Font-Size="X-Large" ForeColor="#333333" 
                    BorderColor="#009933" OnClick="btnSubmit_Click" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="20%">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

