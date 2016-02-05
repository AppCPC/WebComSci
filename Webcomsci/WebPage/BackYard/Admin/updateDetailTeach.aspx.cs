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
    public partial class updateDetailTeach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack == true)
            {
                
                txtCode.Enabled = false;
                txtCode.Text = Request.QueryString["subjectcode"].ToString();
                loadShowSubject();


            }

        }
        private void loadShowSubject()
        {
            Entity.CurriculumInfo subject = new Entity.CurriculumInfo();
            subject = BLL.Curriculum.selectLoadShowSubject(txtCode.Text);

            txtNameThai.Text = subject.StructSub_NameTha.ToString();
            TxtNameEn.Text = subject.StructSub_NameEn.ToString();
            txtCredit.Text = subject.StructSub_Credit.ToString();
            // editor.Content = subject.StructSub_Detail.ToString();
           

            txtyear.Text = subject.Curri_Year.ToString();
            txtcour.Text = subject.Curri_Course.ToString();
            txtGroup.Text = subject.Curri_Group.ToString();

            
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
        private void bindteacher(int pageindex)
        {
            this.gvShowTeacher.DataSource = this.Session["teacherShowGride"];
            this.gvShowTeacher.PageIndex = pageindex;
            this.gvShowTeacher.DataBind();
        }
       private static DataTable dt = new DataTable();
        protected void btnok_Click(object sender, EventArgs e)
        {
            string fname = txtNameTeacher.Text.Trim();
            string lname = txtLnameTeacher.Text.Trim();
            string type = ddlTypeTeacher.Text.Trim();
                
                dt= BLL.Teacher.searchShowPageTchAdmin("", fname, lname, type);
                Session["teacherShowGride"] = dt;
            bindteacher(0);
            btnConfirmTea.Visible = true;
        }

        protected void gvShowTeacher_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "getTeacher")
                {
                   string id= e.CommandArgument.ToString();
                    foreach (DataRow row in dt.Rows) {
                        if ((row[0].ToString()).Equals(id)) {
                            lblid.Text = row[0].ToString();
                            txFulltNameTeacher.Text = "อาจารย์ " + row[1].ToString() + " " + row[2].ToString();
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
        }
        protected void gvSubjectShow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
                try
                {
                    if (e.CommandName == "delResuble")
                    {

                        bool delete = BLL.ClassRoom.deleteTeach(e.CommandArgument.ToString());
                        if (delete)
                        {

                            ShowMessageWeb("ลบข้อมูลสมบูรณ์");


                            gvSubjectShow.DataBind();

                        }
                    }
                    else if (e.CommandName == "AddResultGrade")
                    {
                        Response.Redirect("SubmenuDetailteach.aspx?detailTeachID=" + e.CommandArgument.ToString() + "&subjectcode=" + Request.QueryString["subjectcode"].ToString() + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"].ToString());
                        




                    }

                }
                catch (Exception ex)
                {

                    ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
                }
            
        }

   

        protected void btnShowGrideTeacher_Click(object sender, EventArgs e)
        {
            btnShowGrideTeacher.Enabled = false;
            idshowGride.Visible = true;
        }

        protected void btnConfirmTea_Click(object sender, EventArgs e)
        {
            btnShowGrideTeacher.Enabled = true;
            idshowGride.Visible = false;

        }

        protected void txtsaveDetailTearch_Click(object sender, EventArgs e)
        {
            
                string level = txtYearTeach.Text.ToString();
                string group = txtgroupteach.Text.ToString();
                string term = ddlterm.Text.ToString();
                string showPlanId = Request.QueryString["ShowPlan_Id"];
                string teacherid = lblid.Text;
                string createUser = Session["userid"].ToString();
                string year = txtyearEdu.Text;

                if (!term.Equals("N"))
                {
                    bool reCreateDetailTeach = BLL.ClassRoom.CreateDeatilTeach(year,level, group, term, showPlanId, teacherid, createUser);
                    if (reCreateDetailTeach)
                    {
                        txtYearTeach.Text = "";
                        txtgroupteach.Text = "";
                        txFulltNameTeacher.Text = "";
                        lblid.Text = "";
                        txtyearEdu.Text = "";

                        ShowMessageWeb("บันทึกข้อมูลเรียบร้อย ! ");

                        gvSubjectShow.DataBind();
                        idshowGride.Visible = false;

                    }
                }
            
            
        }

      
    }
}