using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ManageSubjectOpen : System.Web.UI.Page
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
            //DateTime dt = DateTime.Now;
            //int year = (dt.Year + 543);

            DataTable dtt = BLL.DetailTeach.searchShowDetailTeach("N");
            ddlYear.Items.Insert(0, new ListItem("--เลือกปีการศึกษา--", "N"));
            foreach (DataRow item in dtt.Rows)
            {
                 ddlYear.Items.Add(item[0].ToString());
            }

        }

        private void showDataGride()
        {
            string year = ddlYear.SelectedValue;
            DataTable dt = BLL.DetailTeach.searchShowDetailTeach(year);
            SubRepeater.DataSource = dt;
            SubRepeater.DataBind();
        }


        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            showDataGride();
        }

       

        protected void btnsearch_Click(object sender, EventArgs e)
        {

        }
    }
}