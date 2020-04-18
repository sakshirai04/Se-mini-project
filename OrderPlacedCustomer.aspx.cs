using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class OrderPlacedCustomer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["update"]=="update")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Data Updated !!!')", true);
            Session["update"] = "";
        }
        if (!IsPostBack)
        {
            string dt = DateTime.Now.ToString("hh:mm");
            string dt1 = DateTime.Now.AddHours(-1).ToString("HH");
            string adt = DateTime.Now.AddHours(1).ToString("HH");
            string date = DateTime.Now.ToString("yyyy/MM/dd");
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string m = "select tid,CName,FoodName,Amount,address from transtemp where flag='no' and date='"+date+ "' and DATEPART(hh,[time])>='" + dt1+ "' and DATEPART(hh,[time])<='" + adt+"'";
            da = new SqlDataAdapter(m, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                Button1.Visible = true;
            }
            else
            {
                Button1.Visible = false;
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
  
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

        string str = string.Empty;
        string strname = string.Empty;
        foreach (GridViewRow gvrow in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
            if (chk != null & chk.Checked)
            {
                str = gvrow.Cells[0].Text;

            }
            SqlCommand cmd;
            con.Open();
            string s = "update transtemp set flag='yes' where tid='" + str + "'";
            cmd = new SqlCommand(s, con);
            cmd.ExecuteNonQuery();
            con.Close();

        }
        Session["update"] = "update";
        Response.Redirect("OrderPlacedCustomer.aspx");
    }
}
