using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Bill : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        string tid = Session["Data"].ToString();
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string s = "select foodname,quantity,amount from transact where tid='" + tid + "'";
        da = new SqlDataAdapter(s, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblBillNo.Text = tid;
            lblDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
            lblTime.Text = DateTime.Now.ToString("HH:mm");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Label l1 = new Label();
                l1.Text = ds.Tables[0].Rows[i][0].ToString()+"<br>";
                p1.Controls.Add(l1);
                
                Label l2 = new Label();
                l2.Text = ds.Tables[0].Rows[i][1].ToString()+ "<br>";
                p2.Controls.Add(l2);

                Label l3 = new Label();
                l3.Text = ds.Tables[0].Rows[i][2].ToString()+ "<br>";
                p3.Controls.Add(l3);
                
            }
            string total = "select amount from transact where tid='" + tid + "'";
            SqlDataAdapter da1 = new SqlDataAdapter(total, con);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            double amt = 0;
            if (ds1.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                {
                    amt = amt + Convert.ToDouble(ds1.Tables[0].Rows[i][0].ToString());
                }
                lblTotal.Text = amt.ToString();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["Type"] == "Admin")
        {
            Response.Redirect("TakeOrder.aspx");
        }
        else if (Session["Type"] == "User")
        {
            Response.Redirect("Menu.aspx");
        }
    }
}