using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class UpdateInventory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["update"] == "update")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Quantity Updated !!!')", true);
            Session["update"] = "";
        }

        if (!IsPostBack)
        {
            Panel1.Visible = false;
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string op = "select prod_name from Product";
            da = new SqlDataAdapter(op, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for(int i=0;i<ds.Tables[0].Rows.Count;i++)
                {
                    DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.Text != "--Select--")
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string s = "select quantity from Product where prod_name='" + DropDownList2.SelectedItem.Text + "'";
            da = new SqlDataAdapter(s, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                TextBox5.Text = ds.Tables[0].Rows[0][0].ToString();
                TextBox5.ReadOnly = true;
                Panel1.Visible = true;

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        double res = 0;
        if (DropDownList2.SelectedItem.Text != "--Select--")
        {
            res = Convert.ToDouble(TextBox5.Text) + Convert.ToDouble(TextBox4.Text);
            SqlCommand cmd;
            con.Open();
            string s = "update Product set quantity='" + res + "' where prod_name='" + DropDownList2.SelectedItem.Text + "'";
            cmd = new SqlCommand(s, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Session["update"] = "update";
            Response.Redirect("UpdateInventory.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Select Product Name !!!')", true);
        }
    }
}