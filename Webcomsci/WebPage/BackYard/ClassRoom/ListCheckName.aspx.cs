using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class checkName2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                string DeEduStd = Request.QueryString["stdClass"];
                string classStd = Request.QueryString["stdClass"];
                int checknum = BLL.ClassRoom.countCheckName(DeEduStd);
                lblNumcheckname.Text = checknum.ToString();
                if (checknum >= 15) {
                    chk.Visible = false;
                }
            }
        }

        protected void lbutCheckName_Click(object sender, EventArgs e)
        {
            string deid = Request["dchID"].ToString();
            Response.Redirect("CheckNameStd.aspx?deid=" + deid);
        }

        protected void lblDetailCheckName_Click(object sender, EventArgs e)
        {
            string deid = Request["dchID"].ToString();
            Response.Redirect("DetailcheckName.aspx?deid=" + deid);
    
        }

        protected void checkNameSum_Click(object sender, EventArgs e)
        {
            string deid = Request["dchID"].ToString();
            Response.Redirect("checkNameSum.aspx?deid=" + deid);
        }
    }
}