using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci
{
    public partial class Front : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string usertype = Session["userType"].ToString();

                if (!usertype.Equals(""))
                {

                    lbluser.Text = "|  ยินดีต้อนรับ : " + Session["username"];//+ Session["name"];

                    if (usertype.Equals("EM") || usertype.Equals("AD"))
                    {
                       // linkLog.HRef = "../WebPage/BackYard/Post/My_posts.aspx";
                        //linkLog.HRef = "../WebPage/BackYard/Admin/MainAdmin.aspx";
                        linkLog.HRef = "../WebPage/BackYard/Admin/MainAdmin.aspx";
                    }
                    else
                    {
                       // linkLog.HRef = "../WebPage/BackYard/Post/My_posts.aspx";
                       // linkLog.HRef = "../WebPage/BackYard/Admin/MainAdmin.aspx";
                        linkLog.HRef = "../WebPage/BackYard/ClassRoom/mainClassroom.aspx";
                    }
                    imgkey.Visible = false;
                }
                else {
                    lbluser.Text = "|  เข้าสู่ระบบ";
                    linkLog.HRef = "../WebPage/Authen/Login.aspx";
             
                }
               
            }
            catch (Exception)
            {

                lbluser.Text = "เข้าสู่ระบบ";
                linkLog.HRef = "../WebPage/Authen/Login.aspx";
            }
            
        }
    }
}