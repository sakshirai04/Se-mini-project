using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class SalesBasedOnDate : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime dt = Convert.ToDateTime(TextBox1.Text);
        string date = dt.ToString("yyyy/MM/dd");
       
        DateTime tt = Convert.ToDateTime(TextBox2.Text);
        string date2 = tt.ToString("yyyy/MM/dd");

        if (dt > tt)
        {
            Page.ClientScript.RegisterStartupScript(GetType(),"msgtype","alert('Select Date Properly !!!')",true);
        }
        else
        {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string ol = "select distinct  foodname from transact";
        da = new SqlDataAdapter(ol, con);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            SqlDataAdapter da2;
            DataSet ds2 = new DataSet();
            string kl = "select foodname,sum(quantity) as quantity,sum(amount) as amount,date from transact where date >= '" + date + "' and date<='" + date2 + "'  group by foodname,quantity,amount,date";
            da2 = new SqlDataAdapter(kl, con);
            da2.Fill(ds2);
            
            GridView1.DataSource = ds2;
            GridView1.DataBind();
            SqlDataAdapter da1;
                DataSet ds1 = new DataSet();

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
              
                ol = "select  foodname,sum(amount) as amount,date from transact where date >= '" + date + "' and date<='" + date2 + "' and  foodname='"+ds.Tables[0].Rows[i][0].ToString()+"' group by foodname,quantity,amount,date";
                da1 = new SqlDataAdapter(ol, con);
                da1.Fill(ds1);
                Chart1.DataSource = ds1;
            }

           
            Chart1.Series["Series1"].XValueMember = "foodname";
            Chart1.Series["Series1"].YValueMembers = "amount";
            // Chart1.Series.Add("Series2");
            // Chart1.Series["Series2"].YValueMembers = "date";

            Chart1.DataBind();
           
        }

        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('No Data Available !!!')", true);
        }


        }
    }
}