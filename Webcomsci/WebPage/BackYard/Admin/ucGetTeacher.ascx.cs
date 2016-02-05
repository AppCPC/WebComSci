using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ucGetTeacher : System.Web.UI.UserControl
    {
        Entity.Teacher tea = new Entity.Teacher();
        public delegate void RowselectedEventHandler(object sender, string e);
        public event RowselectedEventHandler RowselectedProType;



        protected void Page_Load(object sender, EventArgs e)
        {
            
                this.butSearchTeacher_Click(null, null);
            
        }
        private void bindTchShow(int pageindex)
        {
            this.gvShowTeacher.DataSource = this.Session["searchDetailTeach"];
            this.gvShowTeacher.PageIndex = pageindex;
            this.gvShowTeacher.DataBind();
        }
        protected void butSearchTeacher_Click(object sender, ImageClickEventArgs e)
        {
            string fname = txtTchName.Text.ToString();
            string lname = txtTchLastname.Text.ToString();
            string type = ddlTypeUser.SelectedValue.ToString();
            this.Session["searchDetailTeach"] = BLL.Teacher.searchShowPageTchAdmin("", fname, lname, type);
            bindTchShow(0);
        }
        private string value = "";
        protected void gvShowTeacher_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "getTchName")
            {
                   // RowselectedProType(this, e.CommandArgument.ToString());
                value = e.CommandArgument.ToString();
             
            }
        }

        protected void gvShowTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bindTchShow(e.NewPageIndex);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            RowselectedProType(this,value);
        }

        protected void gvShowTeacher_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string gvProType = gvShowTeacher.Rows[e.NewSelectedIndex].Cells[1].Text;
            
            if (RowselectedProType != null)
                tea.Tch_FName=gvProType;
                RowselectedProType(this, gvProType);
                //RowselectedProType(this, gvProType);
        }
    }
}