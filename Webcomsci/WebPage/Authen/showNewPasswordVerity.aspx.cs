using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.Authen
{
    public partial class showNewPasswordVerity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request["name"].ToString() != null)
                {
                    lblname.Text = Request["name"].ToString();
                }
            }catch(Exception){}

        }
    }
}