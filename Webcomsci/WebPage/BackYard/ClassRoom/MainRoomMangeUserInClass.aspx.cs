using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class MainRoomMangeUserInClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            try
            {
                string userType = Session["userType"].ToString();
                string userId = Session["userid"].ToString();
                string classRoom = Request.QueryString["classid"];



                if (userType.Equals("TE") || userType.Equals("TS"))
                {

                    dt = BLL.ClassRoom.showRoomMemberInClassCheckNamePage(userId, classRoom);
                }
             


                ListViewShowRoomInClass.DataSource = dt;
                ListViewShowRoomInClass.DataBind();

            }
            catch (Exception)
            {


            }
        }
    }
}