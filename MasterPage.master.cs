using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Type"] == "Admin")
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            
            Panel4.Visible = false;

        }
        else if (Session["Type"] == "User")
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
         
            Panel4.Visible = false;
        }
        else if (Session["Type"] == "Staff")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
         
            Panel4.Visible = false;

        }
        else
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
           
            Panel4.Visible = true;
        }
    }
}
