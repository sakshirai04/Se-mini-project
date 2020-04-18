using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class PrdictionBasedHours : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=canteen;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ftime = TextBox1.Text+":"+TextBox3.Text;
       // DateTime ct = Convert.ToDateTime(ftime);
       // ftime = ct.ToString("hh:mm");
        string ttime = TextBox2.Text+":"+TextBox4.Text;
     //  DateTime tt = Convert.ToDateTime(ttime);
       // ttime = tt.ToString("hh:mm");
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        string s = "select distinct foodno from transact where time >='" + ftime + "' and time<='" + ttime + "'";
        da = new SqlDataAdapter(s, con);
        da.Fill(ds);
        double tamt = 0;
        SqlDataAdapter da6;
        DataSet ds6 = new DataSet();
        string l = "select amount from transact where time>='" + ftime + "' and time<='" + ttime + "'";
        da6 = new SqlDataAdapter(l, con);
        da6.Fill(ds6);
        if (ds6.Tables[0].Rows.Count > 0)
        {
            for (int o = 0; o < ds6.Tables[0].Rows.Count; o++)
            {
                tamt = tamt + Convert.ToDouble(ds6.Tables[0].Rows[o][0].ToString());
            }
        }
        if (ds.Tables[0].Rows.Count > 0)
        {
            
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                SqlDataAdapter da1;
                DataSet ds1 = new DataSet();
                string m = "select foodname,quantity,amount from transact where foodno='" + ds.Tables[0].Rows[i][0].ToString() + "' and time>='" + ftime + "' and time<='" + ttime + "'";
                da1 = new SqlDataAdapter(m, con);
                da1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    double totalquant = 0, totalamt = 0, per = 0; ;
                    string fname = "";
                    for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
                    {
                        totalquant = totalquant + Convert.ToDouble(ds1.Tables[0].Rows[j][1].ToString());
                        totalamt = totalamt + Convert.ToDouble(ds1.Tables[0].Rows[j][2].ToString());
                    }
                    fname = ds1.Tables[0].Rows[0][0].ToString();
                    per = (totalamt/ tamt) * 100 ;
                    TableRow tRow = new TableRow();
                    TableCell tcell = new TableCell();
                    TableCell tcell1 = new TableCell();

                    tcell.Text = "Food Name:";
                    tcell1.Text = fname;



                    tRow.Cells.Add(tcell);
                    tRow.Cells.Add(tcell1);

                    Table1.Rows.Add(tRow);
                    TableRow tr = new TableRow();
                    TableCell tc = new TableCell();
                    TableCell tc1 = new TableCell();

                    tc.Text = "Total Sales:";
                    tc1.Text = Convert.ToString(totalquant);



                    tr.Cells.Add(tc);
                    tr.Cells.Add(tc1);

                    Table1.Rows.Add(tr);
                    TableRow tr1 = new TableRow();
                    TableCell tcc = new TableCell();
                    TableCell tcc1 = new TableCell();

                    tcc.Text = "Total Amount:";
                    tcc1.Text = Convert.ToString(totalamt);



                    tr1.Cells.Add(tcc);
                    tr1.Cells.Add(tcc1);

                    Table1.Rows.Add(tr1);
                    TableRow tper = new TableRow();
                    TableCell tcp = new TableCell();
                    TableCell tcp1 = new TableCell();

                    tcp.Text = "Percentage:";
                    tcp1.Text = Convert.ToString(per) + " %";



                    tper.Cells.Add(tcp);
                    tper.Cells.Add(tcp1);

                    Table1.Rows.Add(tper);
                    TableRow thr = new TableRow();
                    TableCell tch = new TableCell();
                    tch.ColumnSpan = 2;


                    tch.Text = "<hr>";
                    tch.Width = 500;





                    thr.Cells.Add(tch);


                    Table1.Rows.Add(thr);

                }
            }
           
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('No Data Available !!!')", true);
        }
    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}