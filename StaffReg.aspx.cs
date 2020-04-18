﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class StaffReg : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string str = "select top 1 Staffid from StaffReg order by Staffid desc";
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count==0)
            { 
                Label2.Text = "101";
            }
            else
            {
                string s = ds.Tables[0].Rows[0][0].ToString();
                int s1 = Convert.ToInt32(s) + 1;
                Label2.Text = s1.ToString();
            }
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string lp = "select Uname from StaffReg where Uname='" + TextBox7.Text + "'";
        da = new SqlDataAdapter(lp, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label4.Visible = true;
        }
        else
        {
            con.Open();
            string ins = "insert into StaffReg values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + RadioButtonList1.SelectedItem.Text + "','"+TextBox7.Text+"')";
            SqlCommand cmd = new SqlCommand(ins, con);
            cmd.ExecuteNonQuery();
            Session["Log"] = "Data";
            Response.Redirect("StaffLogin.aspx");
        }
    }
}