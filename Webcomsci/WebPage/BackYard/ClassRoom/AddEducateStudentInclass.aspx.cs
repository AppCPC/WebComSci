using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Collections;
namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class AddEducateStudentInclass : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
               // checkGride();
                DataTable dtscopeScore = (DataTable)Session["dtScopeScore"];
                try
                {


                    //DataTable ddt = (DataTable)Session["ListStudent"];
                    //if (ddt.Rows.Count > 0)
                    //{
                    //    showgvListStudent();
                    //}
                    //else
                    //{
                    Session["ListStudent"] = BLL.ClassRoom.selectShowListStudentPageAddEducate(Request.QueryString["dchID"].ToString(), Session["status"].ToString(), Session["txtlate"].ToString(), Session["checkname"].ToString(), dtscopeScore);
                        showgvListStudent();
                  //  }

                   //System.Data.DataTable dtt = BLL.ClassRoom.selectShowListStudentPageAddEducate(Request.QueryString["dchID"].ToString(), "N", "", "", dtscopeScore);

                   // if (dtt.Rows.Count > 0)
                   // {
                   //     int i = 0;
                   //     foreach (DataRow row in dtt.Rows)
                   //     {
                   //         foreach (DataColumn column in dtt.Columns)
                   //         {
                   //             Response.Write(row[column] + "  ");

                   //         }
                   //         Response.Write("<br/>");
                   //         i++;
                   //     }
                   //     Response.Write("count B " + i.ToString());
                   // }


                }
                catch (Exception) {

                    //Session["ListStudent"] = BLL.ClassRoom.selectShowListStudentPageAddEducate(Request.QueryString["dchID"].ToString(), "N", Session["txtlate"].ToString(), "", dtscopeScore);
                    //showgvListStudent();

                }
                // cal grade: http://www.atriumtech.com/cgi-bin/hilightcgi?Home=/home/InterWeb2000&File=/home2/searchdata/Forums/http/www.pantip.com/cafe/library/topic/K2660439/K2660439.html

            }
   
        }

        private void showgvListStudent() {

          
            gvListStudentCalGrade.DataSource = (DataTable)Session["ListStudent"];
            gvListStudentCalGrade.DataBind();


       }

        //private void checkGride()
        //{
        //    try
        //    {
        //    //    ddlTypeCheckGrad.SelectedValue = Session["typeGrade"].ToString();

        //        string type = Session["typeGrade"].ToString();
        //        if (ddlTypeCheckGrad.SelectedValue.Equals("B")) //|| ddlTypeCheckGrad.SelectedValue.Equals("C"))
        //        {
        //            dt = (DataTable)Session["Grade"];
        //            dgvShowGrade.DataSource = dt;
        //            dgvShowGrade.DataBind();

        //            //Button btnCheck;
        //            //btnCheck = (Button)gvListStudentCalGrade.FooterRow.Cells[0].FindControl("btncheck");
        //         //   btnCheck.Visible = false;
        //        }
        //        else if (ddlTypeCheckGrad.SelectedValue.Equals("A"))
        //        {


        //            dt = (DataTable)Session["Grade"];
        //            dgvShowGrade.DataSource = dt;
        //            dgvShowGrade.DataBind();

        //            int i;
        //            LinkButton lblmanage;

        //            for (i = 0; i <= dgvShowGrade.Rows.Count - 1; i++)
        //            {
        //                lblmanage = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnEdit");
        //                lblmanage.Visible = false;
        //            }

        //        }
        //    }
        //    catch (Exception) { }
        //}

        protected void imgback_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MainCreateUserInClass.aspx?classid=" + Request.QueryString["classid"] + "&dchID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"] + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"]);

        }

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                callGrade();
                int count = 0;

 


                //string year = txtyear.Text;
                //string level = txtLevel.Text;
                //string term = txtterm.Text;


                string userid = Session["userid"].ToString();
                string userType = Session["userType"].ToString();
                string detailTeach = Request.QueryString["dchID"];
                string codesubject = Request.QueryString["subjectcode"].ToString();


                DataTable selectDetail = BLL.ClassRoom.selectDetail(detailTeach);
             
                string year = "";
                string level ="";
                string term = "";
                foreach (DataRow item in selectDetail.Rows) {
		            year=item[0].ToString();
                    level=item[1].ToString();
                    term=item[2].ToString();
	            }

                string classRoomid = Request.QueryString["classid"].ToString();

                //if (year.Equals("") && level.Equals("") && term.Equals(""))
                //{
                //    ShowMessageWeb("กรุณากรอกข้อมูลให้ครบ! ");
                //}
                //else
                //{
                    foreach (GridViewRow row in gvListStudentCalGrade.Rows)
                    {

                        string resultGrade = ((Label)row.FindControl("lblResultGrad")).Text;
                        string code = row.Cells[0].Text.ToString();

                        /*************DetailTeach path1*********************/
                      //  bool insert = BLL.ClassRoom.insertSchoolRecord(year, level, term, codesubject, resultGrade, code, userid, userType);

                        bool insert = BLL.DetailTeach.insertGradeStart2(detailTeach, resultGrade.ToUpper(), userid, userType,code);

                        count++;
                    }


                    bool checkCassDelete = BLL.ClassRoom.checkClassDelete();
                    if (checkCassDelete)
                    {
                        bool delClassRoom = BLL.ClassRoom.deleteClassRoom(classRoomid);
                        bool deletecommentInclass = BLL.ClassRoom.deleteCommentInClass(classRoomid);
                        bool delInStructMedia = BLL.ClassRoom.deleteInStructionMedia(classRoomid);
                        bool delHomeWork = BLL.ClassRoom.deleteHomework(detailTeach);

                    }


                    bool delCheckName = BLL.ClassRoom.delCheckName(detailTeach);
                    bool delEnrooll = BLL.ClassRoom.Delenroll(detailTeach);
                    BLL.ClassRoom.updateDetailEducationStudent(detailTeach);










                 

                    Response.Redirect("mainClassroom.aspx");
              //  }


                // Response.Redirect("updateDetailTeach.aspx?subjectcode=" + Request.QueryString["subjectcode"].ToString() + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"].ToString());
            }
            catch (Exception) { 
            

            
            }
        }


        protected void dgvShowGrade_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lbntEdit_Click(object sender, EventArgs e)
        {
            /********************************
             * 
             * ฟังก็ชันของ ปุ่มแก้ไข dgvShowGrade
             * 
             * ****************************/
            TextBox txtbox;
            LinkButton lbtnok;
            LinkButton lblcancel;
            LinkButton lbledit;
            Label lblrange;

            int i;
            //for (i = 0; i <= dgvShowGrade.Rows.Count - 1; i++)
            //{
            //    txtbox = (TextBox)dgvShowGrade.Rows[i].FindControl("txtvalue");
            //    lbtnok = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnOK");
            //    lblcancel = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnCancel");
            //    lbledit = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnEdit");
            //    lblrange = (Label)dgvShowGrade.Rows[i].FindControl("lblrange");
             
            //    txtbox.Visible = true;
            //    lbtnok.Visible = true;
            //    lblcancel.Visible = true;
            //    lbledit.Visible = false;
            //    lblrange.Visible = false;

            //}

        }

        protected void lbtnOK_Click(object sender, EventArgs e)
        {

                   /********************************
                 * 
                 * ฟังก็ชันของ ปุ่มตกลง dgvShowGrade
                 * 
                 * ****************************/
         //Session.Remove("typeGrade") ;
         //Session.Remove("Grade");


         //DataTable dtgrade = new DataTable();
         //dtgrade.Columns.Add("id");
         //dtgrade.Columns.Add("grade");
         //dtgrade.Columns.Add("status");
         //dtgrade.Columns.Add("range");
         //dtgrade.Columns.Add("type");

         //   TextBox txtbox;
         //   LinkButton lbtnok;
         //   LinkButton lblcancel;
         //   Label lblrange;
         //   Label lblstatus;
         //   Label type;
         //   int i;
         //   for (i = 0; i <= dgvShowGrade.Rows.Count - 1; i++)
         //   {

         //       txtbox = (TextBox)dgvShowGrade.Rows[i].FindControl("txtvalue");
         //       lbtnok = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnOK");
         //       lblcancel = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnCancel");
         //       lblrange = (Label)dgvShowGrade.Rows[i].FindControl("lblrange");
         //       lblstatus = (Label)dgvShowGrade.Rows[i].FindControl("lblstatus");
         //       type = (Label)dgvShowGrade.Rows[i].FindControl("lbltype");

         //       string no = dgvShowGrade.Rows[i].Cells[0].Text.ToString();
         //       string grade = dgvShowGrade.Rows[i].Cells[1].Text.ToString();
         //       string status = lblstatus.Text;
         //       string range = txtbox.Text;

         //       dtgrade.Rows.Add(no, grade, status, range,type.Text);

         //       txtbox.Visible = false;
         //       lblrange.Visible = false;
         //       lbtnok.Visible = true;
         //       lblcancel.Visible = true;


         //   }

           
         //       Session["typeGrade"] = ddlTypeCheckGrad.SelectedValue;
         //       Session["Grade"] = dtgrade;
         //       dgvShowGrade.DataSource = dtgrade;
         //       dgvShowGrade.DataBind();
         //        calResultScore(); 
        }

        protected void lbtnCancel_Click(object sender, EventArgs e)
        {

            ///********************************
            // * 
            // * ฟังก็ชันของ ปุ่มยกเลิก dgvShowGrade
            // * 
            // * ****************************/
            //Session.Remove("typeGrade");

            //TextBox txtbox;
            //LinkButton lbtnok;
            //LinkButton lblcancel;
            //Label lblrange;
            //Label lblstatus;
            //int i;
            //for (i = 0; i <= dgvShowGrade.Rows.Count - 1; i++)
            //{

            //    txtbox = (TextBox)dgvShowGrade.Rows[i].FindControl("txtvalue");
            //    lbtnok = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnOK");
            //    lblcancel = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnCancel");
            //    lblrange = (Label)dgvShowGrade.Rows[i].FindControl("lblrange");
            //    lblstatus = (Label)dgvShowGrade.Rows[i].FindControl("lblstatus");



            //    txtbox.Visible = false;
            //    lblrange.Visible = false;
            //    lbtnok.Visible = true;
            //    lblcancel.Visible = true;


            //}


            //Session["typeGrade"] = ddlTypeCheckGrad.SelectedValue;

            //dt = (DataTable)Session["Grade"];
            //dgvShowGrade.DataSource = dt;
            //dgvShowGrade.DataBind();

        }
       public void calResultScore(){
           try
           {
               int i;
               TextBox txtbox;
               TextBox txtmidterm;
               TextBox txtfinal;
               Label lblAllresult;
               Label checkname;
               int coutScore=0;
               double resultSum;

               for (i = 0; i <= gvListStudentCalGrade.Rows.Count - 1; i++)
               {
                   txtbox = (TextBox)gvListStudentCalGrade.Rows[i].FindControl("txtAll");
                   txtmidterm = (TextBox)gvListStudentCalGrade.Rows[i].FindControl("txtTestMidterm");
                   txtfinal = (TextBox)gvListStudentCalGrade.Rows[i].FindControl("txtTestFinal");
                   lblAllresult = (Label)gvListStudentCalGrade.Rows[i].FindControl("lblResult");
                   checkname = (Label)gvListStudentCalGrade.Rows[i].FindControl("lblnum");
                   #region checkCondition
                   if (txtbox.Text.Equals("0"))
                   {
                       txtbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF5050");
                   }
                   else
                   {
                       txtbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                   }

                   if (txtmidterm.Text.Equals("0"))
                   {

                       txtmidterm.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF5050");
                   }
                   else
                   {
                       txtmidterm.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                   }

                   if (txtfinal.Text.Equals("0"))
                   {
                       txtfinal.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF5050");

                   }
                   else
                   {
                       txtfinal.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                   }
                   #endregion

                   if (checkname.Text.Equals("N"))
                   {
                       resultSum = (Convert.ToDouble(txtbox.Text) + Convert.ToDouble(txtmidterm.Text) + Convert.ToDouble(txtfinal.Text));
                   }
                   else
                   {
                        resultSum = (Convert.ToDouble(txtbox.Text) + Convert.ToDouble(txtmidterm.Text) + Convert.ToDouble(txtfinal.Text)) + Convert.ToDouble(checkname.Text);
                   }
                  
                  if (resultSum> 100)
                  {
                      lblAllresult.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF5050");
                      ShowMessageWeb("คะแนนรวมทีคุณกรอกรวมกันมีค่ามากกว่า 100");
                     
                      coutScore++;

                  }
                  else {
                      lblAllresult.Text = resultSum.ToString();
                      lblAllresult.BackColor = System.Drawing.ColorTranslator.FromHtml("");
                  }

                  
                 
               }
               if (coutScore<= 0)
               {
                   calSumScore();
               }


           }
           catch(Exception ex){
               ShowMessageWeb("กรุณาตรวจสอบความถูกต้องของข้อมูลที่คุณกรอก ! ");
           }

        }  /*ตรวจสอบ และ set สีให้ datagride*/

       private void callGrade() {
           try
           {

              //  ddlTypeCheckGrad.SelectedValue = Session["typeGrade"].ToString();
                //if (ddlTypeCheckGrad.SelectedValue.Equals("A")) 
                //{
                    Label lblAllresult;
                    Label lblgrade;
                    for (int j = 0; j <= gvListStudentCalGrade.Rows.Count - 1; j++)
                    {

                        lblAllresult = (Label)gvListStudentCalGrade.Rows[j].FindControl("lblResult");
                        lblgrade = (Label)gvListStudentCalGrade.Rows[j].FindControl("lblResultGrad");
                        double score = Convert.ToDouble(lblAllresult.Text);
                        if (score > 0)
                        {
                            lblgrade.Text = returnGrade(score);
                        }
                    }
               // }
                

        
           }
           catch (Exception)
           {

           }
       
       }
       private string returnGrade(double score) {
           
           string grade = "";
           string typeCalGrade = Session["typeGrade"].ToString();
           DataTable mainGradedt = (DataTable)Session["Grade"];
           grade = BLL.ClassRoom.calGradeForStudent(score, mainGradedt);
           return grade;
       }

        protected void txtAll_TextChanged(object sender, EventArgs e)
        {
            calResultScore();
        }

        protected void txtTestMidterm_TextChanged(object sender, EventArgs e)
        {
            calResultScore();
        }

        protected void txtTestFinal_TextChanged(object sender, EventArgs e)
        {
            calResultScore();
        }


        private void calSumScore() {  /*หาค่าเฉลี่ย แสดง ในส่วน Footer GrideView */
            try
            { 
                decimal totalScore = 0M;
                int totalItems = 0;
                int i = 0;
                Label lblAllresult;
                Label avg;
                for (i = 0; i <= gvListStudentCalGrade.Rows.Count - 1; i++)
                {

                    lblAllresult = (Label)gvListStudentCalGrade.Rows[i].FindControl("lblResult");
                    decimal score = Decimal.Parse(lblAllresult.Text);
                    if (score > 0)
                    {
                        totalScore += score;
                        totalItems += 1;
                    }

                }

                avg = (Label)gvListStudentCalGrade.FooterRow.Cells[0].FindControl("lblScoreAverage");
                avg.Text = (totalScore / totalItems).ToString("0.00");

                   
       
            }
            catch (Exception)
            {

            }
        }

        protected void btncheck_Click(object sender, EventArgs e)
        {
            try
            {
                int i = 0;
                Label lblAllresult;
                ArrayList listAllSubjec = new ArrayList();

                for (i = 0; i <= gvListStudentCalGrade.Rows.Count - 1; i++)
                {
                    lblAllresult = (Label)gvListStudentCalGrade.Rows[i].FindControl("lblResult");
                    double score = Convert.ToDouble(lblAllresult.Text);
                    if (score > 0)
                    {
                        listAllSubjec.Add(score);
                    }
                }

                string type = Session["typeGrade"].ToString();
                if (type.Equals("A"))
                {
                    Session["Grade"] = BLL.ClassRoom.calGradeGroup(listAllSubjec);
                }


              //  checkGride();

                callGrade();
            }
            catch (Exception) { }

        }

        protected void ddlTypeCheckGrad_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    Session["typeGrade"] = ddlTypeCheckGrad.SelectedValue;


            //    TextBox txtbox;
            //    LinkButton lbtnok;
            //    LinkButton lblcancel;
            //    LinkButton lbledit;
            //    Label lblrange;
            //    Button btnCheck;
            //    Label lbltype;
            //    int i;
            //    for (i = 0; i <= dgvShowGrade.Rows.Count - 1; i++)
            //    {
            //        txtbox = (TextBox)dgvShowGrade.Rows[i].FindControl("txtvalue");
            //        lbtnok = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnOK");
            //        lblcancel = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnCancel");
            //        lbledit = (LinkButton)dgvShowGrade.Rows[i].FindControl("lbtnEdit");
            //        lblrange = (Label)dgvShowGrade.Rows[i].FindControl("lblrange");
            //        lbltype = (Label)dgvShowGrade.Rows[i].FindControl("lbltype");

            //        if (ddlTypeCheckGrad.SelectedValue.Equals("A"))
            //        {
            //            lbledit.Visible = false;
            //            lbledit.Visible = false;
            //            txtbox.Visible = false;
            //            lbtnok.Visible = false;
            //            lblcancel.Visible = false;
            //            lbltype.Text = " คะแนน ";

            //        }
            //        else if (ddlTypeCheckGrad.SelectedValue.Equals("B") )//|| ddlTypeCheckGrad.SelectedValue.Equals("C"))
            //        {
            //            if (ddlTypeCheckGrad.SelectedValue.Equals("B"))
            //            {
            //                lbltype.Text = " คะแนน ";
            //            }
            //            //else {
            //            //    lbltype.Text = " % ";
            //            //}
            //            lbtnok.Visible = true;
            //            lblcancel.Visible = true;
            //            txtbox.Visible = true;
            //        }

            //        txtbox.Text = "";
            //        lblrange.Text = "";
            //        lblrange.Visible = false;

            //    }

            //         btnCheck = (Button)gvListStudentCalGrade.FooterRow.Cells[0].FindControl("btncheck");

            //         btnCheck.Visible = true;

            //        //if (ddlTypeCheckGrad.SelectedValue.Equals("A"))
            //        //{

            //        //    btnCheck.Visible = true;
            //        //}
            //        //else
            //        //{


            //        //    btnCheck.Visible = false;
            //        //}

            //        calResultScore();
               
            //}
            //catch (Exception) { 
            
            //}

        }

        protected void gvListStudentCalGrade_DataBound(object sender, EventArgs e)
        {

            //int i;
            //Label checkname;
            //for (i = 0; i <= gvListStudentCalGrade.Rows.Count - 1; i++)
            //{
            //    checkname = (Label)gvListStudentCalGrade.Rows[i].FindControl("lblnum");

            //    if (checkname.Text.Equals("N"))
            //    {
            //        gvListStudentCalGrade.Columns[3].Visible = false;
            //    }
            //    else
            //        gvListStudentCalGrade.Columns[3].Visible = true;
            //}
       

        }

        protected void btnInsertCheckname_Click(object sender, EventArgs e)
        {
            mdlpopupmsg.Show();
        }

     

     


     

  





   

       
    }
}