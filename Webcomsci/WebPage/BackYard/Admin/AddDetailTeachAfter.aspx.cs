using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddDetailTeachAfter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showYearEducate();
            }
        }

        private void showYearEducate() {

            DateTimeFormatInfo dtFI = new DateTimeFormatInfo();
            dtFI = DateTimeFormatInfo.InvariantInfo;
            string date = DateTime.Now.ToString("dd/MM/yyyy");
            string momentDate = date.Substring(6, 4).ToString();
            int x = Convert.ToInt32(date.Substring(6, date.Length - 6));

            DropDownListYear.Items.Insert(0, new ListItem("--เลือก--", "N"));

            for (int i = 2548; i <= 2555; i++)
            {
               
                DropDownListYear.Items.Add(i.ToString());
            }

    
         //  DropDownListYear.Items.Add(momentDate);
        
        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnAddDetailTeach_Click(object sender, EventArgs e)
        {
            string year = DropDownListYear.SelectedValue.ToString();
            string level = DropDownListLevel.SelectedValue;
            string term = DropDownListTerm.SelectedValue;
            string group = DropDownListGroup.SelectedValue;
            string subject = txtsubject.Text;

            if (year.Equals("N")) { ShowMessageWeb(" กรุณาเลือกปีการศึกษา ! "); }
            else if (level.Equals("N")) { ShowMessageWeb(" กรุณาเลือกชั้นปี ! "); }
            else if (term.Equals("N")) { ShowMessageWeb("กรุณาเลือกเทอมที่ศึกษา ! "); }
            else if (group.Equals("N")) { ShowMessageWeb("กรุณากลุ่มของนักศึกษา ! "); }
            else if (subject.Equals("")) { ShowMessageWeb("กรุณาระบุรายวิชา  ! "); }
            else
            {
                string userid = Session["userid"].ToString();
                bool insertDetailTeach = BLL.DetailTeach.insertDetailTeachAfter(year,level,term,group,subject,userid);
                if (insertDetailTeach)
                {
                    ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น");
                    txtcode.Text = "";
                    GridViewShowDetailTeach.DataBind();
                }
                else {
                    ShowMessageWeb("ไม่สามารถบันทึกได้กรุณาตรวจสอบข้อมูลที่คุณบันทึก ! ");
                }
            }
        }

        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {
            mdlpopup.Hide();
        }

       

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            mdlpopup.Hide();
        }

        protected void btnsearchsubject_Click(object sender, EventArgs e)
        {
            mdlpopup.Show();

         
        }

        protected void searchSubjectpopup_Click(object sender, EventArgs e)
        {

            Entity.CurriculumInfo subject = new Entity.CurriculumInfo();

            subject.Curri_Course = ddlCourses.SelectedValue.ToString();
            subject.Curri_Group = ddlGroup.SelectedValue.ToString();
            subject.StructSub_Code = txtcode.Text.ToString();
            subject.StructSub_NameEn = "";
            subject.StructSub_NameTha = txtNameThai.Text.ToString();
            subject.Curri_Year = ddlYear.SelectedValue.ToString();

            this.Session["subject"] = BLL.Curriculum.LoadAll(subject);
            bind(0);

            mdlpopup.Show();
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
            mdlpopup.Show();
        }

        protected void gvSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {


                if (e.CommandName == "getsubject")
                {
                    txtsubject.Text = e.CommandArgument.ToString();
                    mdlpopup.Hide();
                }


            }
            catch (Exception ex)
            {

               
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {


                if (e.CommandName == "del")
                {
                    string dchID = e.CommandArgument.ToString();
                    bool del = BLL.DetailTeach.deleteDetailTeach(dchID);
                    if (del) {

                        GridViewShowDetailTeach.DataBind();
                    }
                }


            }
            catch (Exception ex)
            {


            }
        }

 


       
    }
}