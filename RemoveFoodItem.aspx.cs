using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class RemoveFoodItem : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["delete"] == "delete")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Data Deleted !!!')", true);
            Session["delete"] = "";
        }
        if (!IsPostBack)
        {
            Button1.Visible = false;
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string s = "select distinct category from Addfood";
            da = new SqlDataAdapter(s, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }

            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string s = "select foodname from Addfood where category='"+DropDownList1.SelectedItem.Text+"'";
        da = new SqlDataAdapter(s, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            SqlCommand cmd;
            string s = "delete from AddFood where foodno='" + Label4.Text + "'";
            con.Open();
            cmd = new SqlCommand(s, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Session["delete"] = "delete";
            Response.Redirect("RemoveFoodItem.aspx");

        }
       
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Label4.Text != "--Select--")
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string s = "select foodno from AddFood where foodname='" + DropDownList2.SelectedItem.Text + "'";
            da = new SqlDataAdapter(s, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label4.Text = ds.Tables[0].Rows[0][0].ToString();
            }
            Button1.Visible = true;
        }
        else
        {
            Label4.Text = "";
        }
    }
}