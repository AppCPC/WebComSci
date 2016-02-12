using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class MasterPage_Default : System.Web.UI.Page
{
    private string request = "";
    private string tryrequest = "";
    private string username = "";
    private string userID = ""; 
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (Request["id"] != null)
        {
            request = Request["id"] != null ? Request["id"].ToString() : "";
            tryrequest = request.Substring(0, 1);
            username = request.Substring(1, request.Length - 1);
        }
        userID = Session["userid"] !=null ? Session["userid"].ToString()  : ""; 
        txtusername.Text = username;  
    }

    protected void btnok_Click(object sender, EventArgs e)
    {
        if (txtNewspassword.Text.ToString().Equals(txtusername.Text.ToString()))
        {
            CommonClass.MessageBox.Show("ระบบไม่อนุญาติให้คุณใช้รหัสผ่านเดี่ยวกับรหัสนักศึกษา ! ");
        }
        else if (txtNewspassword.Text.Equals("") && txtConfirmNewsPassword.Text.Equals(""))
        {
            CommonClass.MessageBox.Show("คุณไม่ได้ระบุรหัสผ่าน กรุณาระบุรหัสผ่าน ! ");
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
                            string yearuser = "25" + username.Substring(2, 2);

                            DateTime dt = DateTime.Now;
                            int yearCurrent = (dt.Year + 543);

                            if (Convert.ToInt32(yearuser) >= 2556) 
                                Response.Redirect("../BackYard/Plane/Education2.aspx"); 
                            else
                            {
                                Session["userid"] = username;
                                Response.Redirect("~/WebPage/BackYard/Profile/AddGradeStartSystem.aspx?yearEdu=" + yearuser); 
                            } 
                        }
                        else
                        {
                            CommonClass.MessageBox.Show("เกิดข้อผิดพลาดไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ ! ");
                        }
                    }
                    catch (Exception ex)
                    {
                        CommonClass.MessageBox.Show("เกิดข้อผิดพลาด : " + ex.ToString());
                    } 
                }
                else if (tryrequest.Equals("2"))
                {
                    try
                    {
                        bool updEmp = BLL.Employee.updateChangeNewsPasswordPage(userID, newPassword);
                        if (updEmp) 
                            Response.Redirect("../BackYard/Admin/MainAdmin.aspx"); 
                        else 
                            CommonClass.MessageBox.Show("เกิดข้อผิดพลาดไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ ! "); 
                    }
                    catch (Exception ex)
                    { 
                        CommonClass.MessageBox.Show("เกิดข้อผิดพลาด : " + ex.ToString());
                    } 
                }
                else if (tryrequest.Equals("3"))
                {
                    try
                    {
                        bool updEmp = BLL.Teacher.updateChangeNewsPasswordPage(userID, newPassword);
                        if (updEmp) 
                            Response.Redirect("../BackYard/ClassRoom/mainClassroom.aspx"); 
                        else 
                             CommonClass.MessageBox.Show("เกิดข้อผิดพลาดไม่สามารถเปลี่ยนแปลงรหัสผ่านได้ ! ");   
                    }
                    catch (Exception ex)
                    { 
                         CommonClass.MessageBox.Show("เกิดข้อผิดพลาด : " + ex.ToString());
                    } 
                } 
            }
            else
            {
                CommonClass.MessageBox.Show("รหัสผ่านที่คุณเปลี่ยนแปลงไม่ถูกต้องกรุณาตรวจสอบด้วย ! ");
            }
        }


    }
}