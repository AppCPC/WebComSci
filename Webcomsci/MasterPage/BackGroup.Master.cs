using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci.MasterPage
{
    public partial class BackGroup : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                string usertype = Session["userType"].ToString();
                //DataTable dtShowAllUser = BLL.mainManage.selectShowAllUserSearch();
                //rptShowSearchuser.DataSource = dtShowAllUser;
                //rptShowSearchuser.DataBind();

                string userid = Session["userid"].ToString();
                //string path = BLL.mainManage.selectPathPictureUser(userid, usertype);
                //imgUser.ImageUrl = path;
                imgUser.ImageUrl = Session["picturepath"].ToString();


                if (string.IsNullOrEmpty(usertype))
                {
                    Response.Redirect("../../../WebPage/Authen/Login.aspx");
                }

                else if (usertype.Equals("TS") || usertype.Equals("TE"))
                {

                    b3.Visible = false;

                }
                else if (usertype.Equals("ST") || usertype.Equals("AL"))
                {

                }

            }
            catch (Exception)
            {

                Response.Redirect("../../../WebPage/Authen/Login.aspx");
            }

        }
    }
}