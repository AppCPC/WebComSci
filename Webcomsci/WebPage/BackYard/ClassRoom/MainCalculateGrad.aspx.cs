using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class MainCalculateGrad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlTypeCheckGrad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTypeCheckGrad.SelectedValue.Equals("B"))
            {
                pGran.Visible = true;
                lblA.Text = "คะแนน";
                lblB.Text = "คะแนน";
                lblBpus.Text = "คะแนน";
                lblC.Text = "คะแนน";
                lblCpus.Text = "คะแนน";
                lblD.Text = "คะแนน";
                lblDpus.Text = "คะแนน";
               // lblF.Text = "คะแนน";
            }
            //else if (ddlTypeCheckGrad.SelectedValue.Equals("C")) {

            //    pGran.Visible = true;
            //    lblA.Text = " % ";
            //    lblB.Text = " % ";
            //    lblBpus.Text = " % ";
            //    lblC.Text = " % ";
            //    lblCpus.Text = " % "; ;
            //    lblD.Text = " % ";
            //    lblDpus.Text = " % ";
            //    lblF.Text = " % ";
            //}
            else
            {
                pGran.Visible = false;
            }
        }

        private bool checkValueTextbox() {

            if ((txtA.Text.ToString()).Equals(""))
            {
                return false;
            }
            else if ((txtBpus.Text.ToString()).Equals(""))
            {
                return false;
            }
            else if ((txtB.Text.ToString()).Equals(""))
            {
                return false;
            }
            else if ((txtCpus.Text.ToString()).Equals(""))
            {
                return false;
            }
            else if ((txtC.Text.ToString()).Equals(""))
            {
                return false;
            }
            else if ((txtDpus.Text.ToString()).Equals(""))
            {
                return false;
            }
            else if ((txtD.Text.ToString()).Equals(""))
            {
                return false;
            }
            //else if ((txtF.Text.ToString()).Equals(""))
            //{
            //    return false;
            //}
            else
                return true;
        
        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        protected void btnsaveDetailGrade_Click(object sender, EventArgs e)
        {
            string typeGrade="";
            DataTable dtgrade = new DataTable();
            dtgrade.Columns.Add("id");
            dtgrade.Columns.Add("grade");
            dtgrade.Columns.Add("status");
            dtgrade.Columns.Add("range");
            dtgrade.Columns.Add("type");

            //if(ddlTypeCheckGrad.SelectedValue.Equals("C")){
            //    typeGrade=" %";
            //}else{

                  typeGrade=" คะแนน";
            //}
            //มากกว่าเท่ากับ
            //น้อยกว่าเท่ากับ

            dtgrade.Rows.Add("1", "A", ">= ", txtA.Text, typeGrade);
            dtgrade.Rows.Add("2", "B+", ">= ", txtBpus.Text, typeGrade);
            dtgrade.Rows.Add("3", "B", ">= ", txtB.Text, typeGrade);
            dtgrade.Rows.Add("4", "C+", ">= ", txtCpus.Text, typeGrade);
            dtgrade.Rows.Add("5", "C", ">= ", txtC.Text, typeGrade);
            dtgrade.Rows.Add("6", "D+", ">= ", txtDpus.Text, typeGrade);
            dtgrade.Rows.Add("7", "D", ">= ", txtD.Text, typeGrade);
            dtgrade.Rows.Add("8", "F", "< ", txtD.Text, typeGrade);

            Session["typeGrade"] = ddlTypeCheckGrad.SelectedValue;
            Session["Grade"] = dtgrade;

            if (!ddlTypeCheckGrad.SelectedValue.Equals("N"))
            {
                if (ddlTypeCheckGrad.SelectedValue.Equals("B"))// || ddlTypeCheckGrad.SelectedValue.Equals("C"))
                {

                    if (checkValueTextbox())
                    {
                        Response.Redirect("MainManageScore.aspx?classid=" + Request.QueryString["classid"] + "&dchID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"]);//+ "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"]);

                        
                    }
                    else
                    {
                        ShowMessageWeb("คุณกรอกข้อมูลผลการเรียนไม่ครบ กรุณาตรวจสอบด้วย ! ");
                    }
                }
                else
                {

                    Response.Redirect("MainManageScore.aspx?classid=" + Request.QueryString["classid"] + "&dchID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"]);//+ "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"]);
                }
            }
            else { ShowMessageWeb("กรุณาเลือกประเภทของการคำนวณผลการเรียน ! "); }

      }
    }
}