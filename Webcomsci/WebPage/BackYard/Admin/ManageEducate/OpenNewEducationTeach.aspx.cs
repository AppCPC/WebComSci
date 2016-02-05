using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin.ManageEducate
{
    public partial class OpenNewEducationTeach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                showlblCurrenDay();
                bool check = BLL.DetailTeach.checkBtnOpenNewEducationPage(lblYearEdu.Text);
                if (check) {
                    btn.Visible = false;
                    lblDetail.Text = " *มีการเปิดรายวิชาของภาคการศึกษานี้แล้ว";
                }
            }
        }
        
        private void showlblCurrenDay()
        {

            DataTable dtt = BLL.DetailTeach.getCurrentMonth();
       
            foreach (DataRow item in dtt.Rows)
            {
                lblYearEdu.Text = item[1].ToString();

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


        protected void btn_Click(object sender, EventArgs e)
        {
            string year = lblYearEdu.Text;
            string yearcurri = ddlYearEdu.SelectedValue;
            string userid=Session["userid"].ToString();
            bool opensubject = BLL.DetailTeach.insertNewSubjectStd(year,yearcurri,userid);
            if (opensubject) {
                btn.Visible = false;
                lblDetail.Text = " * มีการเปิดรายวิชาของภาคการศึกษานี้แล้ว";
                ShowMessageWeb("เปิดรายวิชาเรียบร้อย ! ");
            }
            
        }
    }
}