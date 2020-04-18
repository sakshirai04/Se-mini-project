using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Menu : System.Web.UI.Page
{
    SqlConnection connect = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        Button4.Visible = true;
        Label16.Text = "";
        Label17.Text = "";
        Label19.Text = "";
        Label20.Text = "";
        Label21.Text = "";
        if (Session["Type"] != "User")
        {
            Response.Redirect("UserLogin.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
               
                Label15.Text = Session["Uid"].ToString();
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                DateTime dt = DateTime.Now;
                string todate = dt.ToShortDateString();
                TextBox4.Text = todate;
                DateTime time = DateTime.Now;
                string ti = time.ToShortTimeString();
                TextBox5.Text = ti;
                Button2.Visible = false;
                SqlDataAdapter da12;
                DataSet ds12 = new DataSet();
                string ml2 = "select address from Registration where Userid='" + Session["Uid"] + "'";
                da12 = new SqlDataAdapter(ml2, connect);
                da12.Fill(ds12);

                if (ds12.Tables[0].Rows.Count > 0)
                {
                    HiddenField1.Value = ds12.Tables[0].Rows[0][0].ToString();
                }

                SqlCommand cmd;
                connect.Open();
                string s = "select top 1 tid from transact order by tid desc";
                cmd = new SqlCommand(s, connect);
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
                connect.Close();
                SqlDataAdapter da;
                DataSet ds = new DataSet();
                s = "select distinct category from AddFood";
                da = new SqlDataAdapter(s, connect);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    }
                }
                ds = new DataSet();
                s = "select foodno,category,foodname,quantity,total from takeorder";
                da = new SqlDataAdapter(s, connect);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    Button2.Visible = true;

                }
                ds = new DataSet();
                s = "select comboname from AddOffers";
                da = new SqlDataAdapter(s, connect);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DropDownList4.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    }

                }

            }
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string s = "select foodno,amount from AddFood where foodname='" + DropDownList1.SelectedItem.Text + "'";
        da = new SqlDataAdapter(s, connect);
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
                connect.Open();
                SqlCommand cmd = new SqlCommand(s, connect);
                cmd.ExecuteNonQuery();
                connect.Close();
                Session["Delete"] = "Data";
                Response.Redirect("Menu.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label16.Text = "";
        Label17.Text = "";
        Label19.Text = "";
        Label20.Text = "";
        Label21.Text = "";
        DateTime dt11AM = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 9, 0, 0);
        DateTime dt5PM = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 17, 0, 0);
        DateTime ctime = DateTime.Now;
        int result = DateTime.Compare(dt11AM, dt5PM);

        if (System.DateTime.Now.Hour < dt11AM.Hour || System.DateTime.Now.Hour > dt5PM.Hour)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('You cant order during this time !!!')", true);
        }
      
        if (RadioButtonList1.SelectedItem.Text == "No")
        {
            int fla=0;
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
                Label17.Text = "Select Category!!!";

            }
           
            else if (fla == 2)
            {
                Label21.Text="Select Food Name!!!";

            }
            
            else  if (fla == 3)
            {
                Label20.Text = "Enter Quantity!!!";

            }

            else
            {
               
                int flag = 0;
                SqlDataAdapter da;
                DataSet ds;

                ds = new DataSet();
                string se = "select prodid,quantity from Link where foodid='" + Label6.Text + "'";
                da = new SqlDataAdapter(se, connect);
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
                        da2 = new SqlDataAdapter(me, connect);
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
                       Label16.Text="No enough stock !!!";
                    }
                    else
                    {


                        ds = new DataSet();
                        se = "select prodid,quantity from Link where foodid='" + Label6.Text + "'";
                        da = new SqlDataAdapter(se, connect);
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
                                da2 = new SqlDataAdapter(me, connect);
                                da2.Fill(ds2);
                                if (ds2.Tables[0].Rows.Count > 0)
                                {
                                    qua = qua * Convert.ToDouble(TextBox1.Text);
                                    res = Convert.ToDouble(ds2.Tables[0].Rows[0][0].ToString()) - qua;

                                    SqlCommand cmd;
                                    connect.Open();
                                    string op = "update Product set quantity='" + res + "' where prod_id='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                                    cmd = new SqlCommand(op, connect);
                                    cmd.ExecuteNonQuery();
                                    connect.Close();



                                }
                            }
                            SqlCommand cmd1;
                            connect.Open();
                            string s = "insert into takeorder values('" + DropDownList2.SelectedItem.Text + "','" + Label6.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "')";
                            cmd1 = new SqlCommand(s, connect);
                            cmd1.ExecuteNonQuery();
                            connect.Close();

                            RadioButtonList1.SelectedItem.Value = null;
                            ds = new DataSet();
                            s = "select foodno,category,foodname,quantity,total from takeorder";
                            da = new SqlDataAdapter(s, connect);
                            da.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                GridView1.DataSource = ds;
                                GridView1.DataBind();
                                Button2.Visible = true;

                            }
                            Panel1.Visible = false;
                            Panel2.Visible = false;
                            Panel3.Visible = false;

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
                Label19.Text="Select Combo!!!";

            }

            else if (fla == 3)
            {
                Label20.Text = "Enter Quantity!!!!";
               

            }
            else
            {
                SqlDataAdapter da;
                DataSet ds = new DataSet();
                string y = "select id from AddOffers where comboname='" + DropDownList4.SelectedItem.Text + "'";
                da = new SqlDataAdapter(y, connect);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataAdapter da1;
                    DataSet ds1 = new DataSet();
                    string ol = "select fid from combolk where cid='" + ds.Tables[0].Rows[0][0].ToString() + "'";
                    da1 = new SqlDataAdapter(ol, connect);
                    da1.Fill(ds1);
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        int flag = 0;
                        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                        {
                            SqlDataAdapter da2;
                            DataSet ds2 = new DataSet();
                            string op = "select prodid,quantity from Link where foodid='" + ds1.Tables[0].Rows[i][0].ToString() + "'";
                            da2 = new SqlDataAdapter(op, connect);
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
                                    da3 = new SqlDataAdapter(kl, connect);
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
                            Label16.Text="No enough Stock !!!";

                        }
                        else
                        {
                            ds = new DataSet();
                            y = "select id from AddOffers where comboname='" + DropDownList4.SelectedItem.Text + "'";
                            da = new SqlDataAdapter(y, connect);
                            da.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                ds1 = new DataSet();
                                ol = "select fid from combolk where cid='" + ds.Tables[0].Rows[0][0].ToString() + "'";
                                da1 = new SqlDataAdapter(ol, connect);
                                da1.Fill(ds1);
                                if (ds1.Tables[0].Rows.Count > 0)
                                {

                                    for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                                    {
                                        SqlDataAdapter da2;
                                        DataSet ds2 = new DataSet();
                                        string op = "select prodid,quantity from Link where foodid='" + ds1.Tables[0].Rows[i][0].ToString() + "'";
                                        da2 = new SqlDataAdapter(op, connect);
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
                                                da3 = new SqlDataAdapter(kl, connect);
                                                da3.Fill(ds3);
                                                if (ds3.Tables[0].Rows.Count > 0)
                                                {
                                                    res = Convert.ToDouble(ds3.Tables[0].Rows[0][0].ToString()) - qua;
                                                    SqlCommand cmd;
                                                    connect.Open();
                                                    op = "update Product set quantity='" + res + "' where prod_id='" + ds1.Tables[0].Rows[i][0].ToString() + "'";
                                                    cmd = new SqlCommand(op, connect);
                                                    cmd.ExecuteNonQuery();
                                                    connect.Close();

                                                }
                                            }
                                        }
                                    }
                                    SqlCommand cmd1;
                                    connect.Open();
                                    string s = "insert into takeorder values('','" + Label6.Text + "','" + DropDownList4.SelectedItem.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "')";
                                    cmd1 = new SqlCommand(s, connect);
                                    cmd1.ExecuteNonQuery();
                                    connect.Close();
                                    RadioButtonList1.SelectedItem.Value = null;
                                    ds = new DataSet();
                                    s = "select foodno,category,foodname,quantity,total from takeorder";
                                    da = new SqlDataAdapter(s, connect);
                                    da.Fill(ds);
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        GridView1.DataSource = ds;
                                        GridView1.DataBind();
                                        Button2.Visible = true;

                                    }
                                    Panel1.Visible = false;
                                    Panel2.Visible = false;
                                    Panel3.Visible = false;


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
        string s = "select foodname from AddFood where category='" + DropDownList2.SelectedItem.Text + "'";
        da = new SqlDataAdapter(s, connect);
        da.Fill(ds);
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("--Select--");
        if (ds.Tables[0].Rows.Count > 0)
        {
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
        
        else
        {
            SqlCommand cmd;
            string date = TextBox4.Text;
            DateTime dt = Convert.ToDateTime(date);
            date = dt.ToString("yyyy/MM/dd");
            string time = TextBox5.Text;
          //  DateTime ct = Convert.ToDateTime(time);
          //  time = ct.ToString("hh:mm");
            double amt = 0;
            foreach (GridViewRow g1 in GridView1.Rows)
            {
                string m = "insert into transact values('" + TextBox3.Text + "','" + g1.Cells[1].Text + "','" + g1.Cells[3].Text + "','" + g1.Cells[4].Text + "','" + g1.Cells[5].Text + "','" + date + "','" + time + "','" + Label15.Text+ "')";
                cmd = new SqlCommand(m, connect);
                connect.Open();
                cmd.ExecuteNonQuery();
                connect.Close();
                Label14.Text += g1.Cells[3].Text + ",";
                amt = amt + Convert.ToDouble(g1.Cells[5].Text);
            }
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string op = "select Name from registration where Userid='" + Label15.Text + "'";
            da = new SqlDataAdapter(op, connect);
            da.Fill(ds);
            string name = "";
            if (ds.Tables[0].Rows.Count > 0)
            {
                Label14.Text = Label14.Text.TrimEnd(',');
                name = ds.Tables[0].Rows[0][0].ToString();
                SqlCommand cmd2;
                connect.Open();
                string ui = "insert into transtemp values('" + TextBox3.Text + "','" + name + "','" + Label14.Text + "','" + amt + "','no','" + date + "','" + time + "','" + HiddenField1.Value + "')";
                cmd2 = new SqlCommand(ui, connect);
                cmd2.ExecuteNonQuery();
                connect.Close();


            }

            string del = "delete from takeorder";
            SqlCommand cmd1 = new SqlCommand(del, connect);
            connect.Open();
            cmd1.ExecuteNonQuery();
            connect.Close();
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
            Button3.Visible = true;
            Button4.Visible = true;
            Button5.Visible = true;

        }
        else
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
            Panel3.Visible = true;
            TextBox1.Text = "";
            TextBox2.Text = "";
            Button3.Visible = false;
            Button4.Visible = true;
            Button5.Visible = true;
        }
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string m = "select id,amount from Addoffers where comboname='" + DropDownList4.SelectedItem.Text + "'";
        da = new SqlDataAdapter(m, connect);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            TextBox2.Text = ds.Tables[0].Rows[0][1].ToString();
            Label8.Text = ds.Tables[0].Rows[0][1].ToString();
            TextBox1.Text = "1";
            Label6.Text = ds.Tables[0].Rows[0][0].ToString();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("UComboOffers.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserLogin.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("UMenu.aspx");
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("suggestion.aspx");

    }
}