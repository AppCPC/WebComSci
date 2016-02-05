using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class CheckNameStd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //foreach (GridViewRow row in gvCheckName.Rows)
            //{
            //    ((RadioButtonList)row.FindControl("RadioButtonList1")).SelectedIndex = 1;
                
            //}
        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
           int count = 0;
           string chk = "";
           string deEduStd = Request.QueryString["deEduStd"];
           string deid = Request.QueryString["dchID"];
            foreach (GridViewRow row in gvCheckName.Rows)
            {

                string checkType = ((RadioButtonList)row.FindControl("RadioButtonList1")).SelectedValue;
                string code = gvCheckName.Rows[count].Cells[0].Text;
                BLL.ClassRoom.checkNameStudent(checkType, code, deEduStd);
             
              count++;
            }

            if (count > 0)
            {
                ShowMessageWeb("บันทึกข้อมูลผลการเรียนเสร็จเรียบร้อย ! ");
            }
            else {
                ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถบันทึกข้อมูลได้ ! ");
            }

            string subcode = Request.QueryString["subjectcode"];
            string showPlan = Request.QueryString["ShowPlan_Id"];
            string classid = Request.QueryString["classid"];
            Response.Redirect("ListCheckName.aspx?classid=" + classid + "&dchID=" + deid + "&stdClass=" + deEduStd + "&deEduStd=" + deEduStd + "&subjectcode=" + subcode);
            //Response.Redirect("ListCheckName.aspx?classid=" + classid + "&dchID=" + deid + "&subjectcode=" + subcode + "&ShowPlan_Id=" + showPlan + "&deEduStd=" + deEduStd);
            
        }

        protected void gvCheckName_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //    e.Row.CssClass = "row";

            if (e.Row.RowType == DataControlRowType.DataRow &&
                e.Row.RowState == DataControlRowState.Normal)
                e.Row.CssClass = "row";

            //Add CSS class on alternate row.
            if (e.Row.RowType == DataControlRowType.DataRow &&
            e.Row.RowState == DataControlRowState.Alternate)
                e.Row.CssClass = "alternate";
        }


       

    }
}