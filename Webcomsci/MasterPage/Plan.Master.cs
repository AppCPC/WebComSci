using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.MasterPage
{
    public partial class Plan : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //#region
            //try
            //{
            //    string usertype = Session["userType"].ToString();
            //    // DataTable dtShowAllUser = BLL.mainManage.selectShowAllUserSearch();

            //    string userid = Session["userid"].ToString();

            //    string yearedu = Session["yearEducate"].ToString();
            //    Session["gradeuser"] = BLL.PlanEducate.selectShowPlanTreeForUser(userid, yearedu);

            //    string imgurl = Session["picturepath"].ToString();
            //    if (imgurl.Length > 0)
            //    {
            //        imgUser.ImageUrl = imgurl.ToString();
            //        imgProfile.ImageUrl = imgurl.ToString();
            //    }
            //    else
            //    {
            //        imgUser.ImageUrl = "/image/User.png";
            //        imgProfile.ImageUrl = "/image/User.png";
            //    }

            //    if (string.IsNullOrEmpty(usertype))
            //    {
            //        Response.Redirect("../../../WebPage/Authen/Login.aspx");
            //    }
            //    else if (usertype.Equals("TS") || usertype.Equals("TE"))
            //    {
            //        lblname.Text = Session["name"].ToString();
            //        b3.Visible = false;
            //    }
            //    else if (usertype.Equals("ST") || usertype.Equals("AL"))
            //    {
            //        lblname.Text = Session["name"].ToString();
            //    }
            //}
            //catch (Exception)
            //{
            //    //Response.Redirect("../../../WebPage/Authen/Login.aspx");
            //}
            //#endregion
        }

        protected void btngrademe_Click(object sender, EventArgs e)
        {
            Session["showYear"] = "";

            string userid = Session["userid"].ToString();
            string yearedu = Session["yearEducate"].ToString();
            Session["gradeuser"] = BLL.PlanEducate.selectShowPlanTreeForUser(userid, yearedu);
            Response.Redirect("../Plane/EducationPage1.aspx");
        }

        protected void btncheck_Click(object sender, EventArgs e)
        {
            //Session.Remove("showYear");
            Session["showYear"] = "abcde";
            Response.Redirect("../Plane/Counsel.aspx");
        }

        protected void btnchecksubject_Click(object sender, EventArgs e)
        {
            Session["showYear"] = "abcde";
            Response.Redirect("~/WebPage/BackYard/Plane/PlanTreeEducation.aspx");
        }

        protected void imgsetClearSessionPlan_Click(object sender, ImageClickEventArgs e)
        {
            //   Session.Remove("showYear");
            Session["showYear"] = "";
            Response.Redirect("~/WebPage/BackYard/Plane/Education2.aspx");
        }

        protected void imgsetClearSession_Click(object sender, ImageClickEventArgs e)
        {
            Session["showYear"] = "";
            // Session.Remove("showYear");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["showYear"] = "abcde";
            Response.Redirect("~/WebPage/BackYard/Plane/FromGradeStudent.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["showYear"] = "";
            Response.Redirect("~/WebPage/BackYard/Plane/Education2.aspx");
        }
    }
}