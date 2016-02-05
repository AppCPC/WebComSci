using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ManageUserTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.btnSearch_Click(null, null);
            }

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        private void bind(int pageindex)
        {
            this.gvListTeacher.DataSource = this.Session["teacherShowGride"];
            this.gvListTeacher.PageIndex = pageindex;
            this.gvListTeacher.DataBind();
        }

      

        protected void gvListTeacher_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = "";
            try
            {

                if (e.CommandName == "editeTch")
                {
                    id = e.CommandArgument.ToString();
                    Response.Redirect("UpdateUserTeacher.aspx?idupdate=" + id);



                }
                else if (e.CommandName == "deleteTch")
                {

                    id = e.CommandArgument.ToString();

                    bool del = BLL.Teacher.deleteUserDelete(id);
                    if (del)
                    {
                        ShowMessageWeb("ลบข้อมูลเรียบร้อย ");

                        this.btnSearch_Click(null, null);
                    }

                }
            }
            catch (Exception)
            {


            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

           // string code = txtcodeTeacher.Text.Trim();
            string fname = txtNameTch.Text.Trim();
            string lname = txtLnameTch.Text.Trim();
            string type = ddlTypeUser.Text.Trim();

            Session["teacherShowGride"] = BLL.Teacher.searchShowPageTchAdmin("", fname, lname, type);
            bind(0);
        }

        protected void gvListTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }

        protected void btnInsertExcell_Click(object sender, EventArgs e)
        {
          //  mdlconsult.Show();
        }

        protected void gvListTeacher_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[4].Text == "TE")
                {
                    e.Row.Cells[4].Text = "อาจารย์ประจำ";
                }
                else if (e.Row.Cells[4].Text == "TS")
                {
                     e.Row.Cells[4].Text = "อาจารย์พิเศษ";
                }
            }
        }

    }
}