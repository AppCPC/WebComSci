using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci.WebPage.BackYard.Profile
{
    public partial class AddGradeStartSystem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                selectShowGrade();
            }

        }
        private void selectShowGrade() {

            string year = Request.QueryString["yearEdu"];
            DataTable dt = BLL.DetailTeach.selectShowGrideAddGradeStart(year);
            gvListStudentInclass.DataSource = dt;
            gvListStudentInclass.DataBind();
        }
        private bool checkGrade(string grade) {

            string g = grade.ToLower();
            switch (g) {
                case "a": return true; break;
                case "b": return true; break;
                case "c": return true; break;
                case "d": return true; break;
                case "f": return true; break;
                case "w": return true; break;
                case "b+": return true; break;
                case "c+": return true; break;
                case "d+": return true; break;
                case "i": return true; break;
                default: return false; break;
            
            }
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            string userid = Session["userid"].ToString();

            foreach (GridViewRow row in gvListStudentInclass.Rows)
            {

                string resultGrade = ((TextBox )row.FindControl("txtgrad")).Text;
                string usertype = "ST";

                string year = row.Cells[0].Text.ToString();
                string level = row.Cells[1].Text.ToString();
                string term = row.Cells[2].Text.ToString();

                string code = row.Cells[3].Text.ToString();
                string namethai = row.Cells[4].Text.ToString();

                
                //lblcheckgrade
                bool check = checkGrade(resultGrade);
                if (!check) { ((Label)row.FindControl("lblcheckgrade")).Text = "กรุณาอย่ากรอกข้อมูลเกรดมั่ว ! "; break; }
                else {
                    ((Label)row.FindControl("lblcheckgrade")).Text = "";
                 //  bool insertGradeStart = BLL.DetailTeach.insertGradeStart(year, level, term, code, resultGrade.ToUpper(), userid, usertype);

                    string detailTeachID = ((Label)row.FindControl("lbldetailTeach")).Text;
                    bool insertGradeStart = BLL.DetailTeach.insertGradeStart2( detailTeachID, resultGrade.ToUpper(), userid, usertype,code);

                }
          
            }
            Response.Redirect("../Plane/Education2.aspx");

          
           

        }

        protected void btncheck_Click(object sender, EventArgs e)
        {
            bool che=true;
            foreach (GridViewRow row in gvListStudentInclass.Rows)
            {

                string resultGrade = ((TextBox)row.FindControl("txtgrad")).Text;
                string code = row.Cells[3].Text.ToString();
                string namethai = row.Cells[4].Text.ToString();
                //lblcheckgrade
                bool check = checkGrade(resultGrade);
                if (!check) {
                    che = false;
                    ((Label)row.FindControl("lblcheckgrade")).Text = "กรุณาอย่ากรอกข้อมูลเกรดมั่ว ! ";
                    
                    break; 
                }
                else
                {
                    ((Label)row.FindControl("lblcheckgrade")).Text = "";
                    che = true;
                 
                }

            }

            if (che)
            {
                btnok.Visible = true;
                btncheck.Visible = false;
            }

        }

    }
}