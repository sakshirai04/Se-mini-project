<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><center>
  <center> <table width="80%" class="intLog">
        <tr>
            <td colspan="3" align="center" class="intLog">
                <asp:Label ID="Label3" runat="server" style="font-family: calibri; font-size: xx-large;"  Text="-- Add Customers --"></asp:Label>
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
                <asp:Label ID="Label2" runat="server" CssClass="style11" Width="80%"></asp:Label></td>
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
                    placeholder="  Name" required="Required" Width="40%" Height="30px"></asp:TextBox>
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
                    Width="40%"></asp:TextBox>
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
            <td>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="style12" 
                    placeholder="  Mobile No." required="Required" MaxLength="10" Width="40%" 
                    Height="30px"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RxvMobNo" runat="Server" 
                                ControlToValidate="TextBox3" ErrorMessage="Invalid Mobile No.!" 
                                ForeColor="#FF3300" ValidationExpression="^[7-9]\d{9}$" 
                                
                    style="font-family: Calibri; color: #990000; font-size: large;" 
                    Width="100%"></asp:RegularExpressionValidator>
            </td>
            <td align="left" class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="style12" 
                    placeholder="  Email Id" required="Required" Width="40%" Height="30px"></asp:TextBox>
                <br />
                 <asp:RegularExpressionValidator ID="RxvEmail" runat="Server" 
                                ControlToValidate="TextBox4" ErrorMessage="Invalid Email Id!" 
                                ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                
                    style="font-family: Calibri; color: #800000; font-size: large;" 
                    Width="100%"></asp:RegularExpressionValidator>
            </td>
            <td align="left" class="style13">
                 &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="style12" 
                    placeholder="  Your Age" required="Required" MaxLength="3" Width="40%" 
                    Height="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                <br />
                <asp:TextBox ID="TextBox6" runat="server" CssClass="style12" 
                    placeholder="  Password" required="Required" MaxLength="15" Width="40%" 
                    Height="30px"></asp:TextBox>
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        
       
        <tr>
            <td align="right" class="style13">
                &nbsp;</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" 
                    style="color: #000000; font-family: Candara; font-size: x-large; font-weight: 700" 
                    Width="40%">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
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
            <td align="center" colspan="3" width="100%">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    Height="40px" Width="20%" Font-Size="X-Large" ForeColor="#333333" 
                    BorderColor="#009933" OnClick="btnSubmit_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
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
    </center>
   </asp:Content>
