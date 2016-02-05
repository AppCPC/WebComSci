using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddPlanEducate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showAll();

        }
          private void bind(int pageindex)
        {
            this.gvSubjectShow.DataSource = this.Session["subject"];
            this.gvSubjectShow.PageIndex = pageindex;
            this.gvSubjectShow.DataBind();
        }
        private void showAll() {
            //if (!ddlYear.SelectedValue.ToString().Equals("--กรุณาเลือก--") && !ddlSemester.SelectedValue.ToString().Equals("--กรุณาเลือก--"))
            //{
                Entity.CurriculumInfo sub = new Entity.CurriculumInfo();
                sub.ShowPlan_YearUpdate = ddlYearMod.SelectedValue.ToString();
                sub.ShowPlan_Year = ddlYear.SelectedValue.ToString();
                sub.ShowPlan_Semester = ddlSemester.SelectedValue.ToString();

                this.Session["subject"] = BLL.Curriculum.LoadAllShowManagePlanEducate(sub);
                bind(0);
           // }
        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
      
        protected void btnSearch_Click(object sender, EventArgs e)
        {
          // showAll();
           //show.Visible = true;
        }


        protected void gvSubjectShow_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            bind(e.NewPageIndex);
        
        }

        protected void gvSubjectShow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "DeleteSubject")
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
            showAll();
        
        }

        protected void gvSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "subjectGet")
                {

                    bool delete = BLL.Curriculum.getInsertGridAddPlanEducate(ddlYearMod.SelectedValue.ToString(),ddlYear.SelectedValue,ddlSemester.SelectedValue, e.CommandArgument.ToString());
                    if (delete)
                    {

                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
            showAll();
        }

        protected void btnAddNewSubject_Click(object sender, EventArgs e)
        {

            ModalPopupExtender.Show();
        }
    }
}