using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class StaffLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Log"] == "Data")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Registration Successful. Please login to access the system.')", true);
            Session["Log"] = "";
        }
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
        else if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            string str1 = "select Staffid,password from StaffReg where Uname='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            SqlDataAdapter da1 = new SqlDataAdapter(str1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Session["Type"] = "Staff";
                Session["Sid"] = dt1.Rows[0][0].ToString();
                Response.Redirect("OrderPlacedCustomer.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Incorrect User Id or Password.')", true);
            }
        }
    }
}