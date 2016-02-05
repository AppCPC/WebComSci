using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddEducationStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgback_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SubmenuDetailteach.aspx?detailTeachID=" + Request.QueryString["dchID"]+"&subjectcode="+ Request.QueryString["subjectcode"]+"&ShowPlan_Id="+Request.QueryString["ShowPlan_Id"]);
      
        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            int count = 0;
            foreach (GridViewRow row in gvListStudentInclass.Rows)
            {

                string  grade = ((TextBox)row.FindControl("txtgrad")).Text;
                string codesubject = Request.QueryString["subjectcode"].ToString();
                string codestd = gvListStudentInclass.Rows[count].Cells[0].Text;
                string userid = Session["userid"].ToString();
                string userType = Session["userType"].ToString();
                string detailTeach= Request.QueryString["dchID"];

                //BLL.ClassRoom.insertGrade(codesubject,codestd,grade,detailTeach,userid,userType);
                count++;
            }


            //Response.Redirect("updateDetailTeach.aspx?subjectcode=" + Request.QueryString["subjectcode"].ToString() + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"].ToString());
        }
    }
}