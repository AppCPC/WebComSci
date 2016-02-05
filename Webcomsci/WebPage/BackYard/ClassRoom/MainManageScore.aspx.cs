using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class MainManageScore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtsaveScore.Focus();
            if (!Page.IsPostBack)
            {
                txtCheckname.Enabled = false;
            }
        }

        //protected void txtA_TextChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int savescore =Convert.ToInt32(txtsaveScore.Text);
        //        int checkScore = Convert.ToInt32(txtCheckname.Text);
        //        int midterm = Convert.ToInt32(txtMidterm.Text);
        //        int final = Convert.ToInt32(txtfinal.Text);

        //        lblAllscore.Text = (savescore + checkScore + midterm + final).ToString();

               

        //    }
        //    catch (Exception)
        //    {
                
        //    }

        //}



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
            try
            {

                int totalSavescore = Convert.ToInt32(txtsaveScore.Text);
                int totalcheckName = Convert.ToInt32(txtCheckname.Text);
                int midtermScore = Convert.ToInt32(txtMidterm.Text);
                int final = Convert.ToInt32(txtfinal.Text);

                int totalScore = totalSavescore + totalcheckName + midtermScore + final;

                if (totalScore > 100)
                {
                    ShowMessageWeb("ระบบอนุญาติให้มีการกรอกข้อมูลรวมได้ไม่เกิน 100 คะแนน ! ");
                }
                else if (totalScore == 100)
                {

                    if (RadioButtonListCondition.SelectedValue.Length > 0)
                    {
                        Session["status"] = RadioButtonListCondition.SelectedValue;
                        if (RadioButtonListCondition.SelectedValue == "A")
                        {
                            Session["txtlate"] = txtlate.Text;
                        }
                        else
                        {
                            Session["txtlate"] = 0;
                        }
                    }
                    else
                    {
                        Session["status"] = "N";
                    }

                    System.Data.DataTable dttScopeScore = new System.Data.DataTable();
                    dttScopeScore.Columns.Add("Allscore");
                    dttScopeScore.Columns.Add("CheckNameScore");
                    dttScopeScore.Columns.Add("MidtermScore");
                    dttScopeScore.Columns.Add("FinalScore");
                    dttScopeScore.Rows.Add(txtsaveScore.Text, txtCheckname.Text, txtMidterm.Text, txtfinal.Text);

                    Session["checkname"] = txtCheckname.Text;
                    Session["dtScopeScore"] = dttScopeScore;

                    Response.Redirect("AddEducateStudentInclass.aspx?classid=" + Request.QueryString["classid"] + "&dchID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"]);
                }
                else {
                    ShowMessageWeb("กรุณากรอกข้อมูลให้ครบ 100 ");
                }
            }
            catch (Exception ex) {
                ShowMessageWeb("ข้อมูลมีความผิดพลาดกรุณาตรวจสอบ ! ");
            }
        }

        protected void CheckBoxCheckName_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxCheckName.Checked)
            {
                txtCheckname.Enabled = true;
                divconditionID.Visible = true;
            }
            else {
                txtCheckname.Text = "0";
                txtCheckname.Enabled = false;
                divconditionID.Visible = false;
            }
        }

        protected void RadioButtonListCondition_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonListCondition.SelectedValue == "A")
            {
                pinclass.Visible = true;
            }
            else {
                pinclass.Visible = false;
            }
        }
    }
}