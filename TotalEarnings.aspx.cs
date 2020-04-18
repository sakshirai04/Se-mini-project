using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class TotalEarnings : System.Web.UI.Page
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
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Select Date Properly !!!')", true);
        }
        else
        {
           
               
                    SqlDataAdapter da;
                    DataSet ds = new DataSet();
                    string ol = "select  foodname,sum(quantity) as quantity,sum(amount) as amount,date from transact where date >= '" + date + "' and date<='" + date2 + "' group by foodname,quantity,amount,date";
                    da = new SqlDataAdapter(ol, con);
                    da.Fill(ds);
                    double amt = 0;
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        TableHeaderRow hr = new TableHeaderRow();
                        TableHeaderCell thc = new TableHeaderCell();
                        TableHeaderCell thc1 = new TableHeaderCell();
                        TableHeaderCell thc2 = new TableHeaderCell();
                        TableHeaderCell thc3 = new TableHeaderCell();

                        thc.Text = "Food Name";
                        thc1.Text = "Quantity";

                        thc2.Text = "Amount";
                        thc3.Text = "Date";


                        hr.Cells.Add(thc);
                        hr.Cells.Add(thc1);
                        hr.Cells.Add(thc2);
                        hr.Cells.Add(thc3);
                        Table1.Rows.Add(hr);
                        for (int j = 0; j < ds.Tables[0].Rows.Count; j++)
                        {
                            TableRow tRow = new TableRow();
                            TableCell tcell = new TableCell();
                            TableCell tcell1 = new TableCell();
                            TableCell tcell2 = new TableCell();
                            TableCell tcell3 = new TableCell();
                            TableCell tcell4 = new TableCell();
                            TableCell tcell5 = new TableCell();
                            tcell.Text = ds.Tables[0].Rows[j][0].ToString();
                            tcell.HorizontalAlign = HorizontalAlign.Center;
                            tcell1.Text = ds.Tables[0].Rows[j][1].ToString();
                            tcell1.HorizontalAlign = HorizontalAlign.Center;
                            tcell2.Text = ds.Tables[0].Rows[j][2].ToString();
                            tcell2.HorizontalAlign = HorizontalAlign.Center;
                            tcell3.Text = ds.Tables[0].Rows[j][3].ToString();
                            tcell3.HorizontalAlign = HorizontalAlign.Center;
                            amt = amt + Convert.ToDouble(ds.Tables[0].Rows[j][2].ToString());

                            tRow.Cells.Add(tcell);
                            tRow.Cells.Add(tcell1);
                            tRow.Cells.Add(tcell2);
                            tRow.Cells.Add(tcell3);
                            Table1.Rows.Add(tRow);
                            
                        }
                        Chart1.DataSource = ds;
                        TableRow tr = new TableRow();
                        TableCell tc = new TableCell();
                        TableCell tc1 = new TableCell();
                        tc.ColumnSpan = 2;
                        tc.Text = "Total";
                        tc.HorizontalAlign = HorizontalAlign.Right;
                        tc.Font.Bold = true;
                        tc.Font.Size = 20;
                        tc1.Text = Convert.ToString(amt);
                        tc1.HorizontalAlign = HorizontalAlign.Center;
                        tc1.Font.Bold = true;
                        tc1.Font.Size = 20; ;

                        tr.Cells.Add(tc);
                        tr.Cells.Add(tc1);

                        Table1.Rows.Add(tr);
                        Chart1.Series["Series1"].XValueMember = "foodname";
                        Chart1.Series["Series1"].YValueMembers = "amount";
                        // Chart1.Series.Add("Series2");
                        // Chart1.Series["Series2"].YValueMembers = "date";

                        Chart1.DataBind();
                    }



                    else
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('No Data Available!!!')", true);
                    }
                }
            }
        
    
}