using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class UpdatePlanEducate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string id = Request["plan"].ToString();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void gvSubject_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}