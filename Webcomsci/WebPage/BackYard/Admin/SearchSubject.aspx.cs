using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class SearchSubject : System.Web.UI.Page
    {
       
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
            Entity.CurriculumInfo subject = new Entity.CurriculumInfo();

            subject.Curri_Course = ddlCourses.SelectedValue.ToString();
            subject.Curri_Group = ddlGroup.SelectedValue.ToString();
            subject.StructSub_Code = txtcode.Text.ToString();
            subject.StructSub_NameEn = txtNameEn.Text.ToString();
            subject.StructSub_NameTha = txtNameThai.Text.ToString();
            subject.Curri_Year = ddlYear.SelectedValue.ToString();

            this.Session["subject"] = BLL.Curriculum.LoadAll(subject);
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

        protected void gvSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }



        protected void gvSubject_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ShowMessageWeb( gvSubject.DataKeys[e.RowIndex].Values[0].ToString());

            
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
            txtcode.Text = "";
            txtNameEn.Text = "";
            txtNameThai.Text = "";
        }



        protected void gvProductType_Selectcommand(object sender, System.Web.UI.WebControls.GridViewSelectEventArgs e)
        {
            string gvProType = gvSubject.Rows[e.NewSelectedIndex].Cells[1].Text;
            ShowMessageWeb(gvProType);
        }

        protected void gvSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
           try {


                   if (e.CommandName == "EditeSubject") {
                       Response.Redirect("~/WebPage/BackYard/Admin/UpdateSubject.aspx?subjectcode=" + e.CommandArgument, false);
                    }

                   else if (e.CommandName == "DeleteSubject"){
                       bool delete = BLL.Curriculum.deleteSubject(e.CommandArgument.ToString());
                       if (delete) {

                           ShowMessageWeb("ลบข้อมูลสมบูรณ์");
                       }
                    }

             } catch (Exception ex){

                 ShowMessageWeb("เกิดข้อผิดพลาด : "+ex);
	        }

           this.btnSearch_Click(null, null);

        }
       

 
    }
}