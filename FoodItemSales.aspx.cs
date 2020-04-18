using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class FoodItemSales : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        
        {
            SqlDataAdapter da;
            DataSet ds=new DataSet();
            string s="select foodname from AddFood";
            da=new SqlDataAdapter(s,con);
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count>0)
            {
                for(int i=0;i<ds.Tables[0].Rows.Count;i++)
                {
                DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime dt = Convert.ToDateTime(TextBox1.Text);
        string date = dt.ToString("yyyy/MM/dd");

        DateTime tt = Convert.ToDateTime(TextBox2.Text);
        string date2 = tt.ToString("yyyy/MM/dd");

        if (dt > tt)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Select Date Properly !!!')", true);
        }
        else
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string ol = "select foodname,sum(quantity) as quantity,sum(amount) as amount,date from transact where date >= '" + date + "' and date<='" + date2 + "' and foodname='" + DropDownList1.SelectedItem.Text + "' group by foodname,quantity,amount,date";
            da = new SqlDataAdapter(ol, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                 Chart1.DataSource = ds;
                Chart1.Series["Series1"].XValueMember = "date";
            Chart1.Series["Series1"].YValueMembers = "amount";
             

            Chart1.DataBind();
            }

           
            
            
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('No Data Available !!!')", true);
            }
        }
    }
}