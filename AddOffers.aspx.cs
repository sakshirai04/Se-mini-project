using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class AddOffers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["add"] == "add")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Combo Pack Added!!!')", true);
                Session["add"] = "";
            }
            SqlCommand cmd;
            con.Open();
            string s = "select top 1 id from AddOffers order by id desc";
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
                TextBox1.Text = "5501";
            }
            con.Close();
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            
            ds = new DataSet();
            string m = "select distinct category from AddFood";
            da = new SqlDataAdapter(m, con);
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
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox4.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Enter Cost !!!')", true);
        }
        else
        {
            SqlCommand cmd;
            con.Open();
            string mm = "insert into AddOffers values('" + TextBox1.Text + "','" + TextBox5.Text + "','" + TextBox4.Text + "')";
            cmd = new SqlCommand(mm, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Session["add"] = "add";
            Response.Redirect("AddOffers.aspx");
        }
        
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string s = "select foodname from AddFood where category='" + DropDownList1.SelectedItem.Text + "'";
        da=new SqlDataAdapter(s,con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                
            }
        }
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int flag=0;
        if(DropDownList1.SelectedItem.Text=="--Select--")
        {
            flag=1;
        }
        else  if(DropDownList2.SelectedItem.Text=="--Select--")
                {
            flag=2;
        }
      
        if (flag == 1)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Select Category !!!')", true);

        }
        else if (flag == 2)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Select Food Name !!!')", true);

        }
        else
        {
            SqlCommand cmd;
            con.Open();
            string ol = "insert into combolk values('" + TextBox1.Text + "','" + Label6.Text + "')";
            cmd = new SqlCommand(ol, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Data Added !!!')", true);
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("--Select--");
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string m = "select foodname from AddFood";
            da = new SqlDataAdapter(m, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add("--Select--");
            
        }
        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (DropDownList2.SelectedItem.Text != "--Select--")
        {
            SqlCommand cmd;
            string kl = "delete from tempr";
            con.Open();
            cmd = new SqlCommand(kl, con);
            cmd.ExecuteNonQuery();
            con.Close();
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string mm = "select foodno from AddFood where foodname='" + DropDownList2.SelectedItem.Text + "'";
            da = new SqlDataAdapter(mm, con);
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Label6.Text = ds.Tables[0].Rows[0][0].ToString();
            }
            ds = new DataSet();
            mm = "select distinct tid from transact";
            da = new SqlDataAdapter(mm, con);
            da.Fill(ds);
            string[] arr = new string[ds.Tables[0].Rows.Count];
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    arr[i] = ds.Tables[0].Rows[i][0].ToString();
                }


            }
            string[] food;
            food = new string[50];
            for (int j = 0; j < arr.Length; j++)
            {
                ds = new DataSet();
                string ml = "select foodname from transact where tid='" + arr[j] + "'";
                da = new SqlDataAdapter(ml, con);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        food[j] = ds.Tables[0].Rows[i][0].ToString();
                    }
                }
            }
            int flag = 0;
            
            for (int i = 0; i < food.Length; i++)
            {
                int count = 0;
                if (food[i] != DropDownList2.SelectedItem.Text && food[i]!=null)
                {
                    SqlDataAdapter daa;
                    DataSet dss = new DataSet();
                    string s = "select fooditem,count from tempr";
                    daa = new SqlDataAdapter(s, con);
                    daa.Fill(dss);
                    if (dss.Tables[0].Rows.Count > 0)
                    {
                        for (int j = 0; j < dss.Tables[0].Rows.Count; j++)
                        {
                            if (dss.Tables[0].Rows[j][0].ToString() == food[i])
                            {
                                count = Convert.ToInt32(dss.Tables[0].Rows[j][1].ToString());
                                count = count + 1;
                                
                                con.Open();
                                string ss = "update tempr set count='" + count + "' where fooditem='" + dss.Tables[0].Rows[j][0].ToString() + "'";
                                cmd = new SqlCommand(ss, con);
                                cmd.ExecuteNonQuery();
                                con.Close();
                                flag = 1;
                            }
                            
                        }
                        if (flag == 0)
                        {
                           
                            con.Open();
                            string ss = "insert into tempr values('" + food[i] + "','1')";
                            cmd = new SqlCommand(ss, con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    else
                    {
                       
                        con.Open();
                        string ss = "insert into tempr values('" + food[i] + "','1')";
                        cmd = new SqlCommand(ss, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }
            }
            DropDownList3.Items.Clear();
            DropDownList3.Items.Add("--Select--");
            SqlDataAdapter da9;
            DataSet ds9 = new DataSet();
             kl = "select fooditem from tempr";
            da9 = new SqlDataAdapter(kl, con);
            da9.Fill(ds9);
            if (ds9.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds9.Tables[0].Rows.Count; i++)
                {
                    DropDownList3.Items.Add(ds9.Tables[0].Rows[i][0].ToString());
                }
            }

        }
    }
}