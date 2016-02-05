using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ManageDetailTeach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                showDropDownList();
                showDataGride();
                
            }
        }
        private void showDropDownList()
        {
            DateTime dt = DateTime.Now;
            int year = (dt.Year + 543);

            ddlYear.Items.Insert(0, new ListItem("--เลือก--", "N"));

            for (int i = 2550; i <= year; i++)
            {

                ddlYear.Items.Add(i.ToString());
            }


        }


        private void showDataGride() {
            string year = ddlYear.SelectedValue;
            string level = ddlLevel.SelectedValue;
            string term = ddlterm.SelectedValue;
            DataTable dt = new DataTable();
            Session["dtShowDtch"] = BLL.DetailTeach.searchShowDetailTeach(year, level, term);
            bind(0);
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            showDataGride();
        }
        private void bind(int pageindex)
        {
            this.dgvShowdetailTeach.DataSource = this.Session["dtShowDtch"];
            this.dgvShowdetailTeach.PageIndex = pageindex;
            this.dgvShowdetailTeach.DataBind();
        }

        protected void gvSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            showDataGride();
        }

        protected void ddlLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            showDataGride();
        }

        protected void ddlterm_SelectedIndexChanged(object sender, EventArgs e)
        {
            showDataGride();
        }
    }
}