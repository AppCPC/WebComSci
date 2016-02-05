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
    public partial class ManinChooseDetailTeach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {

                showddlYear();
                showDropdown();
                showddlYearSwap();
            }
        }
        private void showddlYear() {

            //DateTime dt = DateTime.Now;
            //string yearpast = (dt.Year - 1 +543).ToString();
            //string year = (dt.Year+543).ToString();
            //if(dt.Month<4){
            //    /****ตรวจสอบว่าเดือน < 4 ให้เป็นปีที่แล้ว*****/
            //  ddlYear.Items.Add(new ListItem(yearpast, (dt.Year - 1).ToString()));
                
            //}
            //ddlYear.Items.Add(new ListItem(year, (dt.Year).ToString()));

            DataTable dt = BLL.ManageDate.manageYear();
            for (int i=0;i<3;i++)
            {
                foreach (DataRow item in dt.Rows )
                {
                    ddlYear.Items.Add(new ListItem(item[i].ToString(), (Convert.ToInt32(item[i].ToString())-543).ToString()));
                }
              
            }

        }


        private void showddlYearSwap()
        {

            DateTime dt = DateTime.Now;
            string yearpast = (dt.Year - 1 + 543).ToString();
            string year = (dt.Year + 543).ToString();
 
                //DropDownListYearswap.Items.Add(new ListItem(yearpast, (dt.Year - 1).ToString()));
                // DropDownListYearswap.Items.Add(new ListItem(year, (dt.Year).ToString()));
        }


        private void showDropdown() {

            ddlTerm.Items.Clear();
            DateTime dtmoment = DateTime.Now;
            int mont = dtmoment.Month;
            string yearvalue = ddlYear.SelectedValue;

            ddlTerm.Items.Add(new ListItem("เทอม 1", "1"));
            ddlTerm.Items.Add(new ListItem("เทอม 2", "2"));
            ddlTerm.Items.Add(new ListItem("เทอม 3", "3"));
            //if (yearvalue.Equals(dtmoment.Year.ToString()))
            //{

            //    if (mont > 1 && mont < 6)
            //    {
            //        ddlTerm.Items.Add(new ListItem("เทอม 1", "1"));
            //    }
            //    else if (mont > 9 && mont < 11)
            //    {

            //        ddlTerm.Items.Add(new ListItem("เทอม 2", "2"));
            //    }
            //    else {
            //        divdetail.Visible = false;
            //        lblAlert.Visible = true;
            //        lblAlert.Text = "ขณะนี้ไม่ได้อยู่ในช่วงของการเปิดรายวิชาสอน..ระบบไม่อนุญาติให้คุณใช้งานในส่วนนี้.....";
            //    }

            //}
            //else
            //{

            //    ddlTerm.Items.Add(new ListItem("เทอม 3", "3"));

            //}

        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            showDropdown();

        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
         bool checkDetailsubject = BLL.DetailTeach.checkDetailTeach();
            //if (checkDetailsubject)
            //{
                Response.Redirect("~/WebPage/BackYard/Admin/AddDetailTeachNew.aspx?year=" + ddlYear.SelectedValue + "&term=" + ddlTerm.SelectedValue);
            //}
            //else {
            //    ShowMessageWeb("รายวิชาบางรายวิชายังไม่ได้เพิ่มผลการเรียน ทางระบบไม่อนุญาติให้เปิดรายวิชา");
            //}
           
        }

        protected void btnSwap_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPage/BackYard/Admin/swapSubject.aspx?year=" + ddlYear.SelectedValue + "&term=" + ddlTerm.SelectedValue);
        }

        protected void btnNextCase2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPage/BackYard/Admin/AddDetailTeachCase2.aspx?year=" + ddlYear.SelectedValue + "&term=" + ddlTerm.SelectedValue);
        }

        protected void btnNextCase3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebPage/BackYard/Admin/AddDetailTeachCase3.aspx?year=" + ddlYear.SelectedValue + "&term=" + ddlTerm.SelectedValue);
        }
    }
}