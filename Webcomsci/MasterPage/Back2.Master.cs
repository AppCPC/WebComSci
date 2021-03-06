﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci.MasterPage
{
    public partial class Back2 : System.Web.UI.MasterPage
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

                string imgurl = Session["picturepath"].ToString();
                if (imgurl.Length > 0)
                {
                    imgUser.ImageUrl = imgurl.ToString();
                    imgProfile.ImageUrl = imgurl.ToString();
                }
                else
                {
                    imgUser.ImageUrl = "/image/User.png";
                    imgProfile.ImageUrl = "/image/User.png";

                }



                if (string.IsNullOrEmpty(usertype))
                {
                    Response.Redirect("../../../WebPage/Authen/Login.aspx");
                }

                else if (usertype.Equals("TS") || usertype.Equals("TE"))
                {
                    lblname.Text = Session["name"].ToString();
                    b3.Visible = false;

                }
                else if (usertype.Equals("ST") || usertype.Equals("AL"))
                {

                    lblname.Text = Session["name"].ToString();
                }

            }
            catch (Exception)
            {

                Response.Redirect("../../../WebPage/Authen/Login.aspx");
            }


        }
    }
}