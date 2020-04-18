<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  Runat="Server" >
    
    <style type="text/css">

        .img-circle
        {
            border-radius: 50%;
        
        }
    </style>

    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/sakshi.jpg" 
        align="left" class="img-circle"
                Width="250px" Height="300px" />
               

                <asp:Image ID="Image2" runat="server" 
        ImageUrl="~/images/rajvi.jpg" align="left" class="img-circle"
                Width="250px" Height="300px" />
               

                &nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="~/images/nitish.jpg" 
        align="left" class="img-circle"
                Width="250px" Height="300px" />
              

                &nbsp;<asp:Image ID="Image4" runat="server" 
        ImageUrl="~/images/danish.jpg" align="left" class="img-circle"
                Width="250px" Height="300px" />
               
&nbsp;
               
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
     <font size="5px";>
    <asp:Label ID="Label1" runat="server" Text="Sakshi"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="Rajvi"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Nitish"></asp:Label>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Danish"></asp:Label>
    <br />
    <br />
    </font>
               
</asp:Content>

