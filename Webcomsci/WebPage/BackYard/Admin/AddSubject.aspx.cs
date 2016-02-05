using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddSubject : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            showAll();

       
        }
         
        private void showAll() {

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
        private bool checkTxtNull() {

            if (txtCode.Text.Equals("") || txtNameThai.Text.Equals("") || txtCredit.Text.Equals("") ) {
                return false;
            }
            else {

                return true;
            }
        
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (checkTxtNull())
            {
                if (BLL.Curriculum.checkSubjectCode(txtCode.Text.ToString()))
                {


                    Entity.CurriculumInfo subject = new Entity.CurriculumInfo();

                    subject.Curri_Year = ddlYear.SelectedValue.ToString();
                    subject.Curri_Course = ddlCourses.SelectedValue.ToString();
                    subject.Curri_Group = ddlGroup.SelectedValue.ToString();
                    subject.StructSub_Code = txtCode.Text.ToString();
                    subject.StructSub_NameEn = TxtNameEn.Text.ToString();
                    subject.StructSub_NameTha = txtNameThai.Text.ToString();
                    subject.StructSub_Detail = txtArea.Text.ToString();
                    subject.StructSub_Credit = txtCredit.Text.ToString();

                    bool insertSubject = BLL.Curriculum.insertSubject(subject);
                    if (insertSubject)
                    {
                        ShowMessageWeb("บันทึกข้อมูลหลักสูตรเรียบร้อย");
                        clearValue();
                    }
                    else
                    {
                        ShowMessageWeb("บันทึกข้อมูลหลักสูตรล้มเหลว");
                    }
                }
                else
                {

                    ShowMessageWeb("รหัสรายวิชานี้ถูกใช้แล้ว กรุณาเปลี่ยนรหัสใหม่");
                }
            }
            else {
                ShowMessageWeb("กรุณากรอกข้อมูลให้ครบ ! ");
            }
        
        }




        public void clearValue()
        {

            txtCode.Text = "";
            TxtNameEn.Text = "";
            txtNameThai.Text = "";
            txtArea.Text = "";
            txtCredit.Text = "";
            TxtCodePass.Text = "";


        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {


        }
        private void bind(int pageindex)
        {
            this.gvSubjectShow.DataSource = this.Session["subject"];
            this.gvSubjectShow.PageIndex = pageindex;
            this.gvSubjectShow.DataBind();
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

        protected void TxtCodePass_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            if (!txtCode.Text.ToString().Equals("") && !txtNameThai.Text.Equals(""))
            {
                txtCode.Enabled = false;
                showAll();
                show.Visible = true;
            }
            else {
                ShowMessageWeb("กรุณาระบุรายละเอียดวิชาที่คุณต้องการจะสร้าง ! ");
            }
        }
        protected void gvSubject_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "subjectGet")
                {
                    if (!txtCode.Text.Equals("") || !txtNameThai.Text.Equals(""))
                    {
                        bool insert = BLL.Curriculum.getInsertGridAddSubject(txtCode.Text.ToString(), e.CommandArgument.ToString());
                        if (insert)
                        {
                        }
                    }
                    else { ShowMessageWeb("กรุณาระบุรายละเอียดวิชาที่คุณต้องการจะสร้าง ! "); }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
            showAll();
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            clearValue();
            txtCode.Enabled = true;
            txtNameThai.Enabled = true;
            TxtNameEn.Enabled = true;
            txtCredit.Enabled = true;
            txtArea.Enabled = true;
        }

        protected void btnAddNewSubject_Click(object sender, EventArgs e)
        {
            ModalPopupExtender.Show();
          
        }

   
    }
}