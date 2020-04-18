using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class AddFoodItem : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["add"] == "add")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Data Submitted !!!')", true);
            Session["add"] = "";
        }
        if (!IsPostBack)
        {
            SqlCommand cmd;
            con.Open();
            string s = "select top 1 foodno from AddFood order by foodno desc";
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
                TextBox1.Text = "1001";
            }
            con.Close();
            fill();

        }
    }
    public void fill()
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string m = "select prod_name from Product";
        da = new SqlDataAdapter(m, con);
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
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string se = "select prodid,quantity from Link where foodid='" + TextBox1.Text + "'";
        da = new SqlDataAdapter(se, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            for(int i=0;i<ds.Tables[0].Rows.Count;i++)
            {
                double res = 0;
                double qua =Convert.ToDouble(ds.Tables[0].Rows[i][1].ToString());
                     SqlDataAdapter da1;
                     DataSet ds1 = new DataSet();
                     string me = "select quantity from Product where prod_id='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                     da1 = new SqlDataAdapter(me, con);
                     da1.Fill(ds1);
                     if (ds1.Tables[0].Rows.Count > 0)
                     {
                         res = Convert.ToDouble(ds1.Tables[0].Rows[0][0].ToString()) - qua;
                         SqlCommand cmd;
                         con.Open();
                         string op = "update Product set quantity='" + res + "' where prod_id='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                         cmd = new SqlCommand(op, con);
                         cmd.ExecuteNonQuery();
                         con.Close();

                     }
            }
        }
        SqlCommand cmd1;
        con.Open();
        string s = "insert into AddFood values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')";
        cmd1 = new SqlCommand(s, con);
        cmd1.ExecuteNonQuery();
        con.Close();
        Session["add"] = "add";
        Response.Redirect("AddFoodItem.aspx");

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.Text != "--Select--")
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string m = "select prod_id from Product where prod_name='" + DropDownList2.SelectedItem.Text + "'";
            da = new SqlDataAdapter(m, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                TextBox6.Text = ds.Tables[0].Rows[0][0].ToString();
                TextBox7.Text = "1";
            }
        }
        else
        {
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int flag = 0;
        if (TextBox6.Text == "")
        {
            flag = 1;
        }
        if (TextBox7.Text == "")
        {
            flag = 2;
        }
      
        if (flag == 1)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Select Product Name !!!')", true);
        }
        else if (flag == 2)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Enter Quantity !!!')", true);
        }
       
        else
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string m = "select quantity from Product where prod_id='" + TextBox6.Text + "'";
            da = new SqlDataAdapter(m, con);
            da.Fill(ds);
            double qua=0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                qua = Convert.ToDouble(ds.Tables[0].Rows[0][0].ToString());
                if (qua < Convert.ToDouble(TextBox7.Text))
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('No Enough Stock !!!')", true);

                }
                else
                {

                    SqlCommand cmd;
                    con.Open();
                    string s = "insert into Link values('" + TextBox1.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')";
                    cmd = new SqlCommand(s, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Product Added !!!')", true);
                    fill();
                    TextBox6.Text = "";
                    TextBox7.Text = "1";
                }
            }
           
            
           
        }

    }
    protected void TextBox7_TextChanged(object sender, EventArgs e)
    {

    }
}