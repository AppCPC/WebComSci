using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.Authen
{
    public partial class ChangeNewPassword : System.Web.UI.Page
    {

        private string request="";
        private string tryrequest="";
        private string username="";
        private string userID = "";
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
       
        protected void Page_Load(object sender, EventArgs e)
        {
             request=Request["id"].ToString();
             tryrequest = request.Substring(0, 1);
             username = request.Substring(1,request.Length-1);
             userID = Session["userid"].ToString();
             
            txtusername.Text = username;

           
        }

        protected void btnok_Click(object sender, EventArgs e)
        {
            if (txtNewspassword.Text.ToString().Equals(txtusername.Text.ToString()))
            {
                ShowMessageWeb("ระบบไม่อนุญาติให้คุณใช้รหัสผ่านเดี่ยวกับรหัสนักศึกษา ! ");
            }
            else if (txtNewspassword.Text.Equals("") && txtConfirmNewsPassword.Text.Equals("")) {
                ShowMessageWeb("คุณไม่ได้ระบุรหัสผ่าน กรุณาระบุรหัสผ่าน ! ");
            }
            else
            {
                if (txtNewspassword.Text.ToString().Equals(txtConfirmNewsPassword.Text.ToString()))
                {
                    string newPassword = txtConfirmNewsPassword.Text.ToString();
                    if (tryrequest.Equals("1"))
                    {
                        try
                        {
                            bool upd = BLL.Student.updateChangeNewsPasswordPage(userID, newPassword);
                            if (upd)
                            {
                                string username = txtusername.Text;
                                string yearuser = "25"+username.Substring(2, 2);

                                DateTime dt =DateTime.Now;
                                int yearCurrent = (dt.Year + 543);

                                if (Convert.ToInt32(yearuser) >= 2556 )
                                {

                                    Response.Redirect("../BackYard/Plane/Education2.aspx");
                                }
                                else {
                                    Session["userid"] = username;
                                    Response.Redirect("~/WebPage/BackYard/Profile/AddGradeStartSystem.aspx?yearEdu="+yearuser);
            
                                }
                                //Response.Redirect("../BackYard/ClassRoom/mainClassroom.aspx");
                            }
                            else
                            {
                                ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ ! ");
                            }
                        }
                        catch (Exception ex)
                        {
                            ShowMessageWeb("เกิดข้อผิดพลาด : " + ex.ToString());
                        }

                    }
                    else if (tryrequest.Equals("2"))
                    {
                        try
                        {
                            bool updEmp = BLL.Employee.updateChangeNewsPasswordPage(userID, newPassword);
                            if (updEmp)
                            {

                                Response.Redirect("../BackYard/Admin/MainAdmin.aspx");

                            }
                            else
                            {
                                ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ ! ");
                            }
                        }
                        catch (Exception ex)
                        {

                            ShowMessageWeb("เกิดข้อผิดพลาด : " + ex.ToString());
                        }


                    }
                    else if (tryrequest.Equals("3"))
                    {
                        try
                        {
                            bool updEmp = BLL.Teacher.updateChangeNewsPasswordPage(userID, newPassword);
                            if (updEmp)
                            {

                                Response.Redirect("../BackYard/ClassRoom/mainClassroom.aspx");
                            }
                            else
                            {
                                ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ ! ");
                            }
                        }
                        catch (Exception ex)
                        {

                            ShowMessageWeb("เกิดข้อผิดพลาด : " + ex.ToString());
                        }

                    }

                }
                else
                {
                    ShowMessageWeb("รหัสผ่านที่คุณเปลี่ยนแปลงไม่ถูกต้องกรุณาตรวจสอบด้วย ! ");
                }
            }
        }
    }
}