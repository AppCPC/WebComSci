using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ucAddDetailTeach1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                showLabelInpoup();
            
        }
        public delegate void RowselectedEventHandler(object sender, string e);
        public event RowselectedEventHandler RowselectedProType;

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtfullNameTeacher.Text = "";

            if (RowselectedProType != null)
                RowselectedProType(this, "test");

            
        }

        private void showLabelInpoup() {
            try
            {
                lblsubcode.Text = Session["subcodeDtch"].ToString();
                lblnameSubjec.Text = Session["subnameThaiDtch"].ToString();
                lblyear.Text = Session["yearDtch"].ToString();
                lblterm.Text = Session["termDtch"].ToString();
                lbllevel.Text = Session["level"].ToString();
            }
            catch (Exception) {
                lblsubcode.Text = "";
                lblnameSubjec.Text = "";
                lblyear.Text = "";
                lblterm.Text = "";
                lbllevel.Text = "";

            }
        }



        protected void imgbtnSeachTeacher_Click(object sender, ImageClickEventArgs e)
        {
            showSearch.Visible = true;

          

        }
        private void bindteacher(int pageindex)
        {
            this.gvShowTeacher.DataSource = this.Session["sSearchTch"];
            this.gvShowTeacher.PageIndex = pageindex;
            this.gvShowTeacher.DataBind();

        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void gvShowTeacher_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "getTeacher")
                {
                    DataTable dt = (DataTable)Session["sSearchTch"];
                    string id = e.CommandArgument.ToString();
                    foreach (DataRow row in dt.Rows)
                    {
                        if ((row[0].ToString()).Equals(id))
                        {
                            lblid.Text = row[0].ToString();
                            txtfullNameTeacher.Text = "อาจารย์ " + row[1].ToString() + " " + row[2].ToString();
                            showSearch.Visible = false;
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
            }
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            string fname = txtNameTeacher.Text.Trim();
            string lname = txtLnameTeacher.Text.Trim();
            string type = ddlTypeTeacher.SelectedValue.Trim();

            DataTable dt = BLL.Teacher.searchShowPageTchAdmin("", fname, lname, type);
            Session["sSearchTch"] = dt;
            bindteacher(0);
        }

        protected void btnSaveDetailTeach_Click(object sender, EventArgs e)
        {

            string year = lblyear.Text;
            string level = lbllevel.Text;
            string term = lblterm.Text;
            string group = DropDownListClass.SelectedValue;
            string subject = lblsubcode.Text;
            string teacher = lblid.Text;

            if (group.Equals("N")) { ShowMessageWeb("กรุณากลุ่มของนักศึกษา ! "); }
            else if (teacher.Equals("")) { ShowMessageWeb("กรุณาระบุชื่ออาจารย์ผู้สอน"); }
            else
            {
                string userid = Session["userid"].ToString();
                bool insertDetailTeach = BLL.DetailTeach.insertDetailTeach(year, level, term, group, subject, userid,teacher);
                if (insertDetailTeach)
                {
                    ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น");
                    GridViewShowDetailTeach.DataBind();

                    showTitle.Visible = true;
                }
                else
                {
                    ShowMessageWeb("ไม่สามารถบันทึกได้กรุณาตรวจสอบข้อมูลที่คุณบันทึก ! ");
                }
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
                    if (del)
                    {

                        GridViewShowDetailTeach.DataBind();
                    }
                }


            }
            catch (Exception ex)
            {


            }
        }

        protected void imgproClose_Click(object sender, ImageClickEventArgs e)
        {
            txtfullNameTeacher.Text = "";

            if (RowselectedProType != null)
                RowselectedProType(this, "test");
        }

    }
}