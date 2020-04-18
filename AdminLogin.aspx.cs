using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label2.Visible = true;
            Label2.Text = "Please fill out this field";
        }
        else if (TextBox2.Text == "")
        {
            Label3.Visible = true;
            Label3.Text = "Please fill out this field";
        }
        else if (TextBox1.Text == "admin" && TextBox2.Text == "admin")
        {
            Session["Type"] = "Admin";
            Session["Aid"] = TextBox1.Text;
            Response.Redirect("AddFoodItem.aspx");
        }
        else
        {
            Label2.Visible = false;
            Label3.Visible = false;
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Incorrect Admin Id or Password.')", true);
        }
    }
}