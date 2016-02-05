using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class wucConditionCheckname : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void rbtncon1_CheckedChanged(object sender, EventArgs e)
        {
           //Response.Write(rbtncon1.Text);
            rbtncon2.Checked = false;
            rbtncon3.Checked = false;
        }

        protected void rbtncon2_CheckedChanged(object sender, EventArgs e)
        {
            rbtncon1.Checked = false;
            rbtncon3.Checked = false;
         // Response.Write(rbtncon2.Text);
        }

        protected void rbtncon3_CheckedChanged(object sender, EventArgs e)
        {
            rbtncon1.Checked = false;
            rbtncon2.Checked = false;
        }
        protected void btnokMessage_Click(object sender, EventArgs e)
        {
            string late="";
            string numlate="";
            string status="";

            if (rbtncon1.Checked)
            {
                late = txtlate.Text;
                //numlate = txtlatenum.Text;
                status = "A";

            }
            else if (rbtncon2.Checked)
            {
                status = "B";
            }
            else if (rbtncon3.Checked)
            {
                status = "C";
            }
            else
                status = "N";
            if(status.Equals("N")){
                lblAlert.Text = "**กรุณาเลือกเงือนไขเพือประกอบการคำนวณคะแนนเช็คชือ ";
            }
            else{

                string percentValueCheckname = txtscore.Text;
                string dechID=Request.QueryString["dchID"].ToString();
              //  Session["ListStudent"] = BLL.ClassRoom.selectShowListStudentPageAddEducate(dechID,status,late,percentValueCheckname);

                Response.Redirect("AddEducateStudentInclass.aspx?classid=" + Request.QueryString["classid"] + "&dchID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"] + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"]);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEducateStudentInclass.aspx?classid=" + Request.QueryString["classid"] + "&dchID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"] + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"]);
        }
        


      

    
    }
}