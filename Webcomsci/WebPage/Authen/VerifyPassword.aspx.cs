using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.Authen
{
    public partial class VerifyPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void butOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("showNewPasswordVerity.aspx");
        }
    }
}