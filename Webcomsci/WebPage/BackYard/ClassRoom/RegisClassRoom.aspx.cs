using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class RegisClassRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             string userId = "";
             if (Session["userid"].ToString() != null)
             {
                 DataTable dt = BLL.PlanEducate.LoadListBoxCounsel(Session["userid"].ToString());
                 repResults.DataSource = dt;
                 repResults.DataBind();
             }
        }
        protected void repResults_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
        }
    }
}