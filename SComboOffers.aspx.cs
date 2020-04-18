using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class SComboOffers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = false;
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string op = "select comboname from AddOffers";
            da = new SqlDataAdapter(op,con);
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
        if (DropDownList1.SelectedItem.Text != "--Select--")
        {
            Panel1.Visible = true;
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            ds = new DataSet();
            string s = "select id,comboname,amount from AddOffers where comboname='"+DropDownList1.SelectedItem.Text+"'";
            da = new SqlDataAdapter(s, con);
            da.Fill(ds);
            string cid = "", cname = "", amt = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
               
                    cid = ds.Tables[0].Rows[0][0].ToString();
                    cname = ds.Tables[0].Rows[0][1].ToString();
                    amt = ds.Tables[0].Rows[0][2].ToString();
                    Label l1 = new Label();
                    l1.Text = cname + "<br>";
                    PlaceHolder1.Controls.Add(l1);
                    SqlDataAdapter da1;
                    DataSet ds1 = new DataSet();
                    string m = "select fid from combolk where cid='" + cid + "'";
                    da1 = new SqlDataAdapter(m, con);
                    da1.Fill(ds1);

                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
                        {
                            string fid = ds1.Tables[0].Rows[j][0].ToString();
                            SqlDataAdapter da2;
                            da2 = new SqlDataAdapter();
                            DataSet ds2;
                            ds2 = new DataSet();
                            m = "select foodname from AddFood where foodno='" + fid + "'";
                            da2 = new SqlDataAdapter(m, con);
                            da2.Fill(ds2);



                            if (ds2.Tables[0].Rows.Count > 0)
                            {




                                Label l3 = new Label();
                                l3.Text = ds2.Tables[0].Rows[0][0].ToString() + "<br>";

                                PlaceHolder2.Controls.Add(l3);

                            }
                        }

                        Label l4 = new Label();
                        l4.Text = amt + "<br>";
                        PlaceHolder3.Controls.Add(l4);
                    }
                }
            
            
 
        }
    }
}
