using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class UpdateSubject : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {


            show.Visible = true;
          
            if (!Page.IsPostBack == true)
            {
                txtCode.Enabled = false;
                txtCode.Text = Request.QueryString["subjectcode"].ToString();
                 showAll();  
                loadShowSubject();
               
                
            }
            
        }
        private void loadShowSubject() {
            Entity.CurriculumInfo subject = new Entity.CurriculumInfo();
            subject=BLL.Curriculum.selectLoadShowSubject(txtCode.Text);

            txtNameThai.Text = subject.StructSub_NameTha.ToString();
            TxtNameEn.Text = subject.StructSub_NameEn.ToString();
            txtCredit.Text = subject.StructSub_Credit.ToString();
           // editor.Content = subject.StructSub_Detail.ToString();
            txtArea.Text = subject.StructSub_Detail.ToString();

            txtyear.Text = subject.Curri_Year.ToString();
            txtcour.Text = subject.Curri_Course.ToString();
            txtGroup.Text = subject.Curri_Group.ToString();

            ddlYear.Visible = false;
            ddlCourses.Visible = false;
            ddlGroup.Visible = false;
        }
        private void bind(int pageindex)
        {
            this.gvSubjectShow.DataSource = this.Session["subject"];
            this.gvSubjectShow.PageIndex = pageindex;
            this.gvSubjectShow.DataBind();
        }
        private void showAll()
        {

            this.Session["subject"] = BLL.Curriculum.LoadAllShowGridePageSubject(txtCode.Text.ToString());
            bind(0);
        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        private bool checkTxtNull()
        {

            if (txtCode.Text.Equals("") || txtNameThai.Text.Equals("") || txtCredit.Text.Equals("") || txtArea.Text.Equals(""))
            {
                return false;
            }
            else
            {

                return true;
            }

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (checkTxtNull())
            {
                

                    Entity.CurriculumInfo subject = new Entity.CurriculumInfo();

                    //subject.Curri_Year = ddlYear.SelectedValue.ToString();
                    //subject.Curri_Course = ddlCourses.SelectedValue.ToString();
                    //subject.Curri_Group = ddlGroup.SelectedValue.ToString();
                    subject.StructSub_Code = txtCode.Text.ToString();
                    subject.StructSub_NameEn = TxtNameEn.Text.ToString();
                    subject.StructSub_NameTha = txtNameThai.Text.ToString();
                    subject.StructSub_Detail = txtArea.Text.ToString();
                    subject.StructSub_Credit = txtCredit.Text.ToString();
                    //subject.StructSub_CodePass = TxtCodePass.Text.ToString();

                    bool insertSubject = BLL.Curriculum.updateSubject(subject);
                    if (insertSubject)
                    {
                        ShowMessageWeb("บันทึกข้อมูลหลักสูตรเรียบร้อย");
                        //clearValue();
                    }
                    else
                    {
                        ShowMessageWeb("บันทึกข้อมูลหลักสูตรล้มเหลว");
                    }

               
            }
            else
            {
                ShowMessageWeb("กรุณากรอกข้อมูลให้ครบ ! ");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            showAll();
            show.Visible = true;
        }

        protected void gvSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "subjectGet")
                {
                    
                    bool delete = BLL.Curriculum.getInsertGridAddSubject(txtCode.Text.ToString(), e.CommandArgument.ToString());
                    if (delete)
                    {

                        // ShowMessageWeb("ลบข้อมูลสมบูรณ์");
                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
            showAll();
        }
        protected void gvSubjectShow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "DeleteSubject")
                {

                    bool delete = BLL.Curriculum.deleteSubjectFollowSubject(txtCode.Text.ToString(), e.CommandArgument.ToString());
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

        protected void gvSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }

        protected void btnAddNewSubject_Click(object sender, EventArgs e)
        {

            ModalPopupExtender.Show();
        }
    }
}