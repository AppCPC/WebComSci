using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ucAddSubject : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtyear.Text = Session["year"].ToString();
            //txtcour.Text = Session["course"].ToString();
            //txtGroup.Text= Session["group"].ToString();
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

            if (txtCode.Text.Equals("") || txtNameThai.Text.Equals("") || txtCredit.Text.Equals("") )
            {
                return false;
            }
            else
            {

                return true;
            }

        }

        public void clearValue()
        {
            txtCode.Text = "";
            TxtNameEn.Text = "";
            txtNameThai.Text = "";
            txtArea.Text = "";
            txtCredit.Text = "";


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

                    if (txtCode.Text.Substring(0, 1).Equals("x"))
                    {
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

                }
                else
                {

                    ShowMessageWeb("รหัสรายวิชานี้ถูกใช้แล้ว กรุณาเปลี่ยนรหัสใหม่");
                }
            }
            else
            {
                ShowMessageWeb("กรุณากรอกข้อมูลให้ครบ ! ");
            }
        

        }

        protected void imgbut_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
        }
    }
}