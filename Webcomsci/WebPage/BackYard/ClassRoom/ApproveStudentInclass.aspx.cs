using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class ApproveStudentInclass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.btnSearch_Click(null, null);
                string dchID = Request.QueryString["dchID"].ToString();

                Session["appStd"] = BLL.Student.appoveStudentInclass(dchID);
                bind(0);

            }
        }
        private void bind(int pageindex)
        {
            this.gvList.DataSource = this.Session["appStd"];
            this.gvList.PageIndex = pageindex;
            this.gvList.DataBind();
        }


        protected void gvListStd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            string dchID = Request.QueryString["dchID"].ToString();

            Session["appStd"] = BLL.Student.appoveStudentInclass(dchID);
            bind(0);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = "";
            try
            {
                if (e.CommandName == "stdGet")
                {
                    string dchID = Request.QueryString["dchID"].ToString();
                    id = e.CommandArgument.ToString();
                    BLL.ClassRoom.AppoveStudentInclass(id, dchID,"A");
                    gvListStudentInclass.DataBind();

                    this.btnSearch_Click(null, null);

                }
            }
            catch (Exception)
            {

            }

        }

        protected void gvListStudentInclass_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = "";
            try
            {
                if (e.CommandName == "stddel")
                {
                    string dchID = Request.QueryString["dchID"].ToString();
                    id = e.CommandArgument.ToString();
                    BLL.ClassRoom.AppoveStudentInclass(id, dchID,"N");
                    gvListStudentInclass.DataBind();

                    this.btnSearch_Click(null, null);

                }
            }
            catch (Exception)
            {

            }
        }

        protected void imgback_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MainCreateUserInClass.aspx?classid=" + Request.QueryString["classid"] + "&dchID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"] + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"]);
        }





    }
}