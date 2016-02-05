using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

 namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddSubjectOpen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showDropDownList();
               showDDlYearEdu();
            }
        }

        private void showDDlYearEdu() { 
        
            DataTable dtt = BLL.DetailTeach.getCurrentMonth();
            ddlYearEdu.Items.Insert(0, new ListItem("--เลือกปีการศึกษา--", "N"));


            foreach (DataRow item in dtt.Rows)
            {
                int month = Convert.ToInt32(item[0].ToString());
                if (month >= 1 && month <= 6)
                {
                    int year = Convert.ToInt32(item[1].ToString());
                    ddlYearEdu.Items.Add(year.ToString());
                    ddlYearEdu.Items.Add((year - 1).ToString());
                }
                else {
                   
                    ddlYearEdu.Items.Add(item[1].ToString());
                   
                }
            }
        }

        private void showDropDownList()
        {
            //DateTime dt = DateTime.Now;
            //int year = (dt.Year + 543);
            DataTable dtt = BLL.DetailTeach.searchShowDetailTeach("N");
            ddlYear.Items.Insert(0, new ListItem("--เลือกรหัสนักศึกษา--", "N"));
           
            
            foreach (DataRow item in dtt.Rows)
            {
                ddlYear.Items.Add(" รหัส "+item[0].ToString());
            }


        }
        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btn_Click(object sender, EventArgs e)
        {

        }

        protected void btnchotsub1_Click(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(Request.QueryString["year"].ToString()) + 543;
            string yy = BLL.DetailTeach.selectYear(year.ToString());

            lblyearCur.Text = year.ToString();
            lblyear.Text = yy;
            int level = Convert.ToInt32(((Button)sender).CommandArgument);
            lbllevel.Text = level.ToString();
            mdlSubject.Show();
        }
    }
}