using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_Plan : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
