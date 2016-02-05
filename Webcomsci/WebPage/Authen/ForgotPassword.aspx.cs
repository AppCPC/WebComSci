using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using System.Configuration;
using System.Net.Mail;

namespace Webcomsci.WebPage.Authen
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private string name = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        public void sendMail(string tomail,string frommail,string title,string detail) {
            try
            {
          
            MailMessage mail = new MailMessage();

            mail.To.Add(tomail);

            mail.From = new MailAddress(frommail);
            mail.Subject =title;
            string Body = detail;

            mail.Body = Body;

            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();

            smtp.Host = ConfigurationManager.AppSettings["SMTP"];

            smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FROMEMAIL"], ConfigurationManager.AppSettings["FROMPWD"]);

            smtp.EnableSsl = true;

            smtp.Send(mail);

            Response.Redirect("showNewPasswordVerity.aspx?name="+name);
            }
            catch (Exception)
            {

                throw;
            }
        
        }
        private string showMessageMail(string name,string username,string password) {

            StringBuilder sb = new StringBuilder();
            sb.Append("<span style=font-size: 14pt; font-weight: bold;>เรียนคุณ "+name+"</span><br /><br />");
            sb.Append("<span style=font-size: 10pt; font-weight: bold;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            sb.Append("ตามที่คุณ "+ name + "  ได้แจ้งลืมรหัสผ่าน เพื่อเข้าสู่เว็บไซต์สาขาวิทยาการคอมพิวเตอร์<br />");
            sb.Append("&nbsp;ทางเราจึงได้ทำการส่งรหัสผู้ใช้มาตามนี้</span><br /><br />");
            sb.Append("<span style=font-weight: bold;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=font-size: 12pt;>ชื่อผู้เข้าใช้ : "+username+"<br />");
            sb.Append("<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;รหัสผ่านผู้ใช้ระบบ : "+ password +"</span><br /><br />");
            sb.Append("ขอบคุณที่ใช้บริการ<br />&nbsp;by admin</span><br />");

            return sb.ToString();

        
        }
        protected void butOK_Click(object sender, EventArgs e)
        {


            //Response.Redirect("showNewPasswordVerity.aspx");
            string username = txtusername.Text.ToString().ToLower();
            string email = txtEmail.Text.ToString();

            try
            {
                string title = "แจ้งเตือน username และ password เข้าใช้ระบบ ";
               
                if ((username.Substring(0, 2) + username.Substring(5, 4).ToString()).Equals("020461"))
                {
                    Entity.Student std = new Entity.Student();
                    std = BLL.Student.checkForgotPassword(username, email);

                    if (! std.Std_Password.Equals("") || !std.Std_Password.Equals(null))
                    {
                        name=std.Std_FName+"  "+std.Std_LName;
                        string detail=showMessageMail(name,std.Std_Username,std.Std_Password);
                        string e_mail = std.Std_email.ToString().Trim();
                        sendMail(std.Std_email.ToString(), "admin@cs-rmutto.com", title, detail);
                    }
                    else
                    {
                        ShowMessageWeb("ไม่พบ username หรือ email ที่คุณกรอก กรุณาตรวจสอบอีกครั้ง !");
                    }
                }
                else if ((username.Substring(username.Length - 5, 5)).Equals("admin"))
                {
                    Entity.Employee emp = new Entity.Employee();
                    emp = BLL.Employee.checkForgotPassword(username, email);

                    if (!emp.Equals("") || !emp.Emp_password.Equals(null))
                    {
                        name = emp.Emp_FName + "  " + emp.Emp_LName;
                        string detail = showMessageMail(name, emp.Emp_username, emp.Emp_password);
                        string e_mail = emp.Emp_Email.ToString().Trim();
                        sendMail(emp.Emp_Email.ToString(), "admin@cs-rmutto.com", title, detail);
                    }
                    else
                    {
                        ShowMessageWeb("ไม่พบ username หรือ email ที่คุณกรอก กรุณาตรวจสอบอีกครั้ง !");
                    }

                }
                else if ((username.Substring(username.Length - 4, 1)).Equals("."))
                {
                    Entity.Teacher tea = new Entity.Teacher();
                    tea = BLL.Teacher.checkForgotPassword(username, email);

                    if (!tea.Tch_password.Equals("") || !tea.Tch_password.Equals(null))
                    {
                        name = tea.Tch_FName + "  " + tea.Tch_LName;
                        string detail = showMessageMail(name, tea.Tch_username, tea.Tch_password);
                        string e_mail = tea.Tch_email.ToString().Trim();
                        sendMail(tea.Tch_email.ToString(), "admin@cs-rmutto.com", title, detail);
                    }
                    else
                    {
                        ShowMessageWeb("ไม่พบ username หรือ email ที่คุณกรอก กรุณาตรวจสอบอีกครั้ง !");
                    }

                }
                else
                {
                    ShowMessageWeb("ไม่พบ username หรือ email ที่คุณกรอก กรุณาตรวจสอบอีกครั้ง !");
                }


            }
            catch (Exception)
            {

                ShowMessageWeb("การเชื่อมต่อระหว่างเมล์เซฟเวอร์มีปัญหา อาจเนื่องจากมีการบล็อกพอร์ตเมล์ กรุณาเปลี่ยนการเชื่อมต่ออินเตอร์เน็ต !");
            }
        }
    }
}