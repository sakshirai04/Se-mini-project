using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class AddInventory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["add"] == "add")
        {
            Page.ClientScript.RegisterStartupScript(GetType(),"msgtype()","alert('Data Added !!!')",true);
            Session["add"] = "";
        }

        if (!IsPostBack)
        {
            SqlCommand cmd;
            con.Open();
            string s = "select top 1 prod_id from Product order by prod_id desc";
            cmd = new SqlCommand(s, con);
            object count = cmd.ExecuteScalar();
            int c = Convert.ToInt32(count);
            if (c != 0)
            {
                c = c + 1;
                TextBox1.Text = Convert.ToString(c);
                TextBox1.ReadOnly = true;
            }
            else
            {
                TextBox1.Text = "10001";
            }
            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd;
        con.Open();
        string s = "insert into Product values('" + TextBox1.Text + "','" + TextBox5.Text + "','" + TextBox4.Text + "')";
        cmd = new SqlCommand(s, con);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "add";
        Response.Redirect("AddInventory.aspx");
    }
}