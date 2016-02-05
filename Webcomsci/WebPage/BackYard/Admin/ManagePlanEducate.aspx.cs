using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ManagePlanEducate : System.Web.UI.Page
    {

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Entity.CurriculumInfo subject = new Entity.CurriculumInfo();

            //subject.Curri_Year = ddlYear.SelectedValue.ToString();
            subject.ShowPlan_Year = ddlCourses.SelectedValue.ToString();
            subject.ShowPlan_Semester = ddlSemester.SelectedValue.ToString();
            subject.StructSub_Code = txtCodeSubject.Text.ToString();
            subject.StructSub_NameTha = txtSubNameThai.Text.ToString();

            this.Session["subject"] = BLL.Curriculum.LoadAllShowManagePlanEducate(subject);
            bind(0);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.btnSearch_Click(null, null);
            }
        }


        private void bind(int pageindex)
        {
            this.gvSubject.DataSource = this.Session["subject"];
            this.gvSubject.PageIndex = pageindex;
            this.gvSubject.DataBind();
        }

     
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }

        protected void gvSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {


                if (e.CommandName == "EditeSubject")
                {
                    ShowMessageWeb(e.CommandArgument.ToString());
                 Response.Redirect("~/WebPage/BackYard/Admin/UpdatePlanEducate.aspx?plan=" + e.CommandArgument, false);
                }

                else if (e.CommandName == "DeleteSubject")
                {
                    bool delete = BLL.Curriculum.deletePlanEducate(e.CommandArgument.ToString());
                    if (delete)
                    {

                        ShowMessageWeb("ลบข้อมูลสมบูรณ์");
                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
            this.btnSearch_Click(null, null);

        }

        protected void gvSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }
    }
}