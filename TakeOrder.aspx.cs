using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class TakeOrder : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            DateTime dt = DateTime.Now;
            string todate = dt.ToShortDateString();
            TextBox4.Text = todate;
            DateTime time = DateTime.Now;
            string ti = time.ToString("HH:mm");
            TextBox5.Text = ti;
            Button2.Visible = false;
            SqlCommand cmd;
            con.Open();
            string s = "select top 1 tid from transact order by tid desc";
            cmd = new SqlCommand(s, con);
            object count = cmd.ExecuteScalar();
            int c = Convert.ToInt32(count);
            if (c != 0)
            {
                c = c + 1;
                TextBox3.Text = Convert.ToString(c);
                TextBox3.ReadOnly = true;
            }
            else
            {
                TextBox3.Text = "2501";
            }
            con.Close();
            SqlDataAdapter da;
            DataSet ds = new DataSet();
             s = "select distinct category from AddFood";
            da = new SqlDataAdapter(s, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
            
            ds = new DataSet();
            s = "select comboname from AddOffers";
            da = new SqlDataAdapter(s, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList4.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }

            }
            ds = new DataSet();
            s = "select Userid from Registration";
            da = new SqlDataAdapter(s, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                  DropDownList3.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }

            }
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string s = "select foodno,amount from AddFood where foodname='" + DropDownList1.SelectedItem.Text + "'";
        da = new SqlDataAdapter(s, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            TextBox1.Text = "1";
            TextBox2.Text = ds.Tables[0].Rows[0][1].ToString();
            Label8.Text = ds.Tables[0].Rows[0][1].ToString();
            Label6.Text = ds.Tables[0].Rows[0][0].ToString();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                string i = e.CommandArgument.ToString();
                string s = "delete from takeorder where foodno='" + i + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Session["Delete"] = "Data";
                Response.Redirect("TakeOrder.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime dt11AM = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 9, 0,0);
        DateTime dt5PM = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 17, 0,0);
        DateTime ctime = DateTime.Now;
        int result = DateTime.Compare(dt11AM, dt5PM);
       
         if (System.DateTime.Now.Hour <dt11AM.Hour || System.DateTime.Now.Hour > dt5PM.Hour)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('You cant order during this time !!!')", true);
        }
        else
        {

            if (RadioButtonList1.SelectedItem.Text == "No")
            {
                int fla = 0;
                if (DropDownList2.SelectedItem.Text == "--Select--")
                {
                    fla = 1;
                }
                else if (DropDownList1.SelectedItem.Text == "--Select--")
                {
                    fla = 2;
                }
                else if (TextBox1.Text == "0")
                {
                    fla = 3;
                }
                if (fla == 1)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Select Category!!!')", true);

                }
                else if (fla == 2)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Select Food Name!!!')", true);

                }
                else if (fla == 3)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Enter Quantity!!!')", true);

                }
                else
                {
                    int flag = 0;
                    SqlDataAdapter da;
                    DataSet ds;

                    ds = new DataSet();
                    string se = "select prodid,quantity from Link where foodid='" + Label6.Text + "'";
                    da = new SqlDataAdapter(se, con);
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {


                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            double res = 0;
                            double qua = Convert.ToDouble(ds.Tables[0].Rows[i][1].ToString());
                            SqlDataAdapter da2;
                            DataSet ds2 = new DataSet();
                            string me = "select quantity from Product where prod_id='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                            da2 = new SqlDataAdapter(me, con);
                            da2.Fill(ds2);
                            if (ds2.Tables[0].Rows.Count > 0)
                            {
                                qua = qua * Convert.ToDouble(TextBox1.Text);
                                res = Convert.ToDouble(ds2.Tables[0].Rows[0][0].ToString()) - qua;
                                if (res < 0.0)
                                {
                                    flag = 1;
                                    break;

                                }

                            }
                        }
                        if (flag == 1)
                        {
                            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('No enough stock !!!')", true);
                        }
                        else
                        {


                            ds = new DataSet();
                            se = "select prodid,quantity from Link where foodid='" + Label6.Text + "'";
                            da = new SqlDataAdapter(se, con);
                            da.Fill(ds);

                            if (ds.Tables[0].Rows.Count > 0)
                            {


                                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                {
                                    double res = 0;
                                    double qua = Convert.ToDouble(ds.Tables[0].Rows[i][1].ToString());
                                    SqlDataAdapter da2;
                                    DataSet ds2 = new DataSet();
                                    string me = "select quantity from Product where prod_id='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                                    da2 = new SqlDataAdapter(me, con);
                                    da2.Fill(ds2);
                                    if (ds2.Tables[0].Rows.Count > 0)
                                    {
                                        qua = qua * Convert.ToDouble(TextBox1.Text);
                                        res = Convert.ToDouble(ds2.Tables[0].Rows[0][0].ToString()) - qua;

                                        SqlCommand cmd;
                                        con.Open();
                                        string op = "update Product set quantity='" + res + "' where prod_id='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                                        cmd = new SqlCommand(op, con);
                                        cmd.ExecuteNonQuery();
                                        con.Close();



                                    }
                                }
                                SqlCommand cmd1;
                                con.Open();
                                string s = "insert into takeorder values('" + DropDownList2.SelectedItem.Text + "','" + Label6.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "')";
                                cmd1 = new SqlCommand(s, con);
                                cmd1.ExecuteNonQuery();
                                con.Close();
                                Panel1.Visible = false;
                                Panel2.Visible = false;
                                Panel3.Visible = false;
                                RadioButtonList1.SelectedItem.Value = null;
                                ds = new DataSet();
                                s = "select foodno,category,foodname,quantity,total from takeorder";
                                da = new SqlDataAdapter(s, con);
                                da.Fill(ds);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    GridView1.DataSource = ds;
                                    GridView1.DataBind();
                                    Button2.Visible = true;

                                }

                            }
                        }
                    }
                }


            }
            else if (RadioButtonList1.SelectedItem.Text == "Yes")
            {
                int fla = 0;
                if (DropDownList4.SelectedItem.Text == "--Select--")
                {
                    fla = 1;
                }

                else if (TextBox1.Text == "0")
                {
                    fla = 3;
                }
                if (fla == 1)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Select Combo!!!')", true);

                }

                else if (fla == 3)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Enter Quantity!!!')", true);

                }
                else
                {
                    SqlDataAdapter da;
                    DataSet ds = new DataSet();
                    string y = "select id from AddOffers where comboname='" + DropDownList4.SelectedItem.Text + "'";
                    da = new SqlDataAdapter(y, con);
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        SqlDataAdapter da1;
                        DataSet ds1 = new DataSet();
                        string ol = "select fid from combolk where cid='" + ds.Tables[0].Rows[0][0].ToString() + "'";
                        da1 = new SqlDataAdapter(ol, con);
                        da1.Fill(ds1);
                        if (ds1.Tables[0].Rows.Count > 0)
                        {
                            int flag = 0;
                            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                            {
                                SqlDataAdapter da2;
                                DataSet ds2 = new DataSet();
                                string op = "select prodid,quantity from Link where foodid='" + ds1.Tables[0].Rows[i][0].ToString() + "'";
                                da2 = new SqlDataAdapter(op, con);
                                da2.Fill(ds2);

                                if (ds2.Tables[0].Rows.Count > 0)
                                {
                                    double qua = 0;
                                    double res = 0;

                                    for (int j = 0; j < ds2.Tables[0].Rows.Count; j++)
                                    {
                                        qua = Convert.ToDouble(ds2.Tables[0].Rows[j][1].ToString()) * Convert.ToDouble(TextBox1.Text);
                                        SqlDataAdapter da3;
                                        DataSet ds3 = new DataSet();
                                        string kl = "select quantity from Product where prod_id='" + ds2.Tables[0].Rows[j][0].ToString() + "'";
                                        da3 = new SqlDataAdapter(kl, con);
                                        da3.Fill(ds3);
                                        if (ds3.Tables[0].Rows.Count > 0)
                                        {
                                            res = Convert.ToDouble(ds3.Tables[0].Rows[0][0].ToString()) - qua;
                                            if (res < 0)
                                            {
                                                flag = 1;
                                                break;

                                            }
                                        }
                                    }
                                }
                            }
                            if (flag == 1)
                            {
                                Page.ClientScript.RegisterStartupScript(GetType(), "magtype()", "alert('No enough stock !!!')", true);

                            }
                            else
                            {
                                ds = new DataSet();
                                y = "select id from AddOffers where comboname='" + DropDownList4.SelectedItem.Text + "'";
                                da = new SqlDataAdapter(y, con);
                                da.Fill(ds);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    ds1 = new DataSet();
                                    ol = "select fid from combolk where cid='" + ds.Tables[0].Rows[0][0].ToString() + "'";
                                    da1 = new SqlDataAdapter(ol, con);
                                    da1.Fill(ds1);
                                    if (ds1.Tables[0].Rows.Count > 0)
                                    {

                                        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                                        {
                                            SqlDataAdapter da2;
                                            DataSet ds2 = new DataSet();
                                            string op = "select prodid,quantity from Link where foodid='" + ds1.Tables[0].Rows[i][0].ToString() + "'";
                                            da2 = new SqlDataAdapter(op, con);
                                            da2.Fill(ds2);

                                            if (ds2.Tables[0].Rows.Count > 0)
                                            {
                                                double qua = 0;
                                                double res = 0;

                                                for (int j = 0; j < ds2.Tables[0].Rows.Count; j++)
                                                {
                                                    qua = Convert.ToDouble(ds2.Tables[0].Rows[j][1].ToString()) * Convert.ToDouble(TextBox1.Text);
                                                    SqlDataAdapter da3;
                                                    DataSet ds3 = new DataSet();
                                                    string kl = "select quantity from Product where prod_id='" + ds2.Tables[0].Rows[j][0].ToString() + "'";
                                                    da3 = new SqlDataAdapter(kl, con);
                                                    da3.Fill(ds3);
                                                    if (ds3.Tables[0].Rows.Count > 0)
                                                    {
                                                        res = Convert.ToDouble(ds3.Tables[0].Rows[0][0].ToString()) - qua;
                                                        SqlCommand cmd;
                                                        con.Open();
                                                        op = "update Product set quantity='" + res + "' where prod_id='" + ds1.Tables[0].Rows[i][0].ToString() + "'";
                                                        cmd = new SqlCommand(op, con);
                                                        cmd.ExecuteNonQuery();
                                                        con.Close();

                                                    }
                                                }
                                            }
                                        }
                                        SqlCommand cmd1;
                                        con.Open();
                                        string s = "insert into takeorder values('','" + Label6.Text + "','" + DropDownList4.SelectedItem.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "')";
                                        cmd1 = new SqlCommand(s, con);
                                        cmd1.ExecuteNonQuery();
                                        con.Close();
                                        Panel1.Visible = false;
                                        Panel2.Visible = false;
                                        Panel3.Visible = false;
                                        RadioButtonList1.SelectedItem.Value = null;
                                        ds = new DataSet();
                                        s = "select foodno,category,foodname,quantity,total from takeorder";
                                        da = new SqlDataAdapter(s, con);
                                        da.Fill(ds);
                                        if (ds.Tables[0].Rows.Count > 0)
                                        {
                                            GridView1.DataSource = ds;
                                            GridView1.DataBind();
                                            Button2.Visible = true;

                                        }


                                    }
                                }
                            }
                        }



                    }
                }
            }

        }
}
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        DataSet ds;
        ds = new DataSet();
       string s = "select foodname from AddFood where category='"+DropDownList2.SelectedItem.Text+"'";
        da = new SqlDataAdapter(s, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DropDownList1.Items.Clear();
            DropDownList1.Items.Add("--Select--");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            TextBox2.Text = Convert.ToString(Convert.ToDouble(Label8.Text) * Convert.ToDouble(TextBox1.Text));
        }
        else
        {
            TextBox1.Text = "0";
            TextBox2.Text = "0";
        
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox4.Text == "mm/dd/yyyy")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Select Date !!!')", true);
        }
        if (DropDownList3.SelectedItem.Text == "--Select--")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Select User ID !!!')", true);
        }
        else
        {
            SqlCommand cmd;
            string date = TextBox4.Text;
            DateTime dt = Convert.ToDateTime(date);
            date = dt.ToString("yyyy/MM/dd");
            string time = TextBox5.Text;
            DateTime ct = Convert.ToDateTime(time);
           time = ct.ToString("HH:mm");
            double amt = 0;
            foreach (GridViewRow g1 in GridView1.Rows)
            {
                string m = "insert into transact values('" + TextBox3.Text + "','" + g1.Cells[1].Text + "','" + g1.Cells[3].Text + "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + date + "','" + time + "','" + DropDownList3.SelectedItem.Text + "')";
                cmd = new SqlCommand(m, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label14.Text += g1.Cells[3].Text + ",";
                amt = amt + Convert.ToDouble(g1.Cells[5].Text);
            }
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string op = "select Name from registration where Userid='" + DropDownList3.SelectedItem.Text + "'";
            da = new SqlDataAdapter(op, con);
            da.Fill(ds);
            string name = "";
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label14.Text = Label14.Text.TrimEnd(',');
                name = ds.Tables[0].Rows[0][0].ToString();
                SqlCommand cmd2;
                con.Open();
                string ui = "insert into transtemp values('" + TextBox3.Text + "','" + name + "','" + Label14.Text + "','" + amt + "','no','"+date+"','"+time+"','"+HiddenField1.Value+"')";
                cmd2 = new SqlCommand(ui, con);
                cmd2.ExecuteNonQuery();
                con.Close();



            }

            string del = "delete from takeorder";
            SqlCommand cmd1 = new SqlCommand(del, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            string val = TextBox3.Text;
            Session["Data"] = val;
            Response.Redirect("Bill.aspx");
        }
        
       
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.Text == "Yes")
        {
            Panel2.Visible = true;
            Panel3.Visible = true;
            Panel1.Visible = false;
            TextBox1.Text = "";
            TextBox2.Text = "";

        }
        else
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
            Panel3.Visible = true;
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string m = "select id,amount from Addoffers where comboname='" + DropDownList4.SelectedItem.Text + "'";
        da = new SqlDataAdapter(m, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            TextBox2.Text = ds.Tables[0].Rows[0][1].ToString();
            Label8.Text = ds.Tables[0].Rows[0][1].ToString();
            TextBox1.Text = "1";
            Label6.Text = ds.Tables[0].Rows[0][0].ToString();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string ml = "select address from Registration where Userid='" + DropDownList3.SelectedItem.Text + "'";
        da = new SqlDataAdapter(ml, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();
        }
    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {

    }
    protected void HiddenField1_ValueChanged(object sender, EventArgs e)
    {

    }
}