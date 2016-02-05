using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.Authen
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request["log"].ToString().Equals("logout"))
                {
                    Session.Clear();
                }

            }
            catch (Exception)
            {
            }

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string username = txtusername.Text.ToString().ToLower();
            string password = txtpassword.Text.ToString().ToLower();


            try
            {



                if ((username.Substring(0, 2) + username.Substring(5, 4).ToString()).Equals("020461"))
                {
                    Entity.Student stdRole = new Entity.Student();
                    stdRole = BLL.Student.checkRoleLogin(username, password);

                    if (stdRole.Std_Type.Equals("ST"))
                    {
                        Session["userid"] = stdRole.Std_Campus_Code;
                        Session["userType"] = stdRole.Std_Type;
                        Session["username"] = stdRole.Std_FName;
                        Session["name"] = stdRole.Std_FName + "  " + stdRole.Std_LName;
                        Session["yearEducate"] = stdRole.Std_YearEducate;
                        Session["picturepath"] = stdRole.std_picturepath;

                        if (stdRole.Std_Username.Equals(stdRole.Std_Password))
                        {
                            Response.Redirect("ChangeNewPassword.aspx?id=1" + stdRole.Std_Username);

                        }
                        else
                        {
                            Response.Redirect("../BackYard/Plane/Education2.aspx");
                        }

                    }
                    else if (stdRole.Std_Type.Equals("AL"))
                    {

                        Session["username"] = stdRole.Std_FName;
                        Session["userType"] = stdRole.Std_Type;
                        Session["userid"] = stdRole.Std_Campus_Code;
                        Session["name"] = stdRole.Std_FName + "  " + stdRole.Std_LName;
                        Session["yearEducate"] = stdRole.Std_YearEducate;
                        Session["picturepath"] = stdRole.std_picturepath;

                        if (stdRole.Std_Username.Equals(stdRole.Std_Password))
                        {
                            Response.Redirect("ChangeNewPassword.aspx?id=1" + stdRole.Std_Username);

                        }
                        else
                        {
                            // Response.Redirect("../BackYard/Post/Post_all.aspx");
                            Response.Redirect("../Plane/Education2.aspx");
                        }

                    }
                    else
                    {
                        ShowMessageWeb("กรุณาตรวจสอบความถูกต้องของ username และ password ! ");
                    }

                }
                else if ((username.Substring(username.Length - 5, 5)).Equals("admin"))
                {

                    Entity.Employee empRole = new Entity.Employee();
                    empRole = BLL.Employee.checkRoleLogin(username, password);
                    if (empRole.Emp_Type.Equals("AD"))
                    {
                        Session["username"] = empRole.Emp_FName;
                        Session["userType"] = empRole.Emp_Type;
                        Session["userid"] = empRole.Emp_ID;
                        Session["name"] = empRole.Emp_FName + "  " + empRole.Emp_LName;
                        if (empRole.Emp_username.Equals(empRole.Emp_password))
                        {
                            Response.Redirect("ChangeNewPassword.aspx?id=2" + empRole.Emp_username);

                        }
                        else
                        {
                            Response.Redirect("../BackYard/Admin/MainAdmin.aspx");
                        }
                    }
                    else if (empRole.Emp_Type.Equals("EM"))
                    {
                        Session["username"] = empRole.Emp_FName;
                        Session["userType"] = empRole.Emp_Type;
                        Session["userid"] = empRole.Emp_ID;
                        Session["name"] = empRole.Emp_FName + "  " + empRole.Emp_LName;
                        if (empRole.Emp_username.Equals(empRole.Emp_password))
                        {
                            Response.Redirect("ChangeNewPassword.aspx?id=2" + empRole.Emp_username);

                        }
                        else
                        {
                            Response.Redirect("../BackYard/Admin/MainAdmin.aspx");
                        }
                    }
                    else
                    {
                        ShowMessageWeb("กรุณาตรวจสอบความถูกต้องของ username และ password ! ");
                    }

                }
                else if ((username.Substring(username.Length - 4, 1)).Equals("."))
                {
                    Entity.Teacher tchRole = new Entity.Teacher();
                    tchRole = BLL.Teacher.checkRoleLogin(username, password);
                    if (tchRole.Tch_Type.Equals("TE"))
                    {
                        Session["username"] = tchRole.Tch_FName;
                        Session["userType"] = tchRole.Tch_Type;
                        Session["userid"] = tchRole.Tch_ID;
                        Session["name"] = tchRole.Tch_FName + "  " + tchRole.Tch_LName;
                        Session["picturepath"] = tchRole.Tch_picturepath;
                        if (tchRole.Tch_username.Equals(tchRole.Tch_password))
                        {
                            Response.Redirect("ChangeNewPassword.aspx?id=3" + tchRole.Tch_username);

                        }
                        else
                        {
                            //  Response.Redirect("../BackYard/Post/Post_all.aspx");
                            Response.Redirect("../BackYard/ClassRoom/mainClassroom.aspx");
                        }
                    }
                    else if (tchRole.Tch_Type.Equals("TS"))
                    {
                        Session["username"] = tchRole.Tch_FName;
                        Session["userType"] = tchRole.Tch_Type;
                        Session["userid"] = tchRole.Tch_ID;
                        Session["name"] = tchRole.Tch_FName + "  " + tchRole.Tch_LName;
                        Session["picturepath"] = tchRole.Tch_picturepath;
                        if (tchRole.Tch_username.Equals(tchRole.Tch_password))
                        {
                            Response.Redirect("ChangeNewPassword.aspx?id=3" + tchRole.Tch_username);

                        }
                        else
                        {
                            // Response.Redirect("../BackYard/Post/Post_all.aspx");
                            Response.Redirect("../BackYard/ClassRoom/mainClassroom.aspx");
                        }
                    }
                    else
                    {
                        ShowMessageWeb("กรุณาตรวจสอบความถูกต้องของ username และ password ! ");
                    }

                }
                else
                {
                    ShowMessageWeb("กรุณาตรวจสอบความถูกต้องของ username และ password ! ");
                }


            }
            catch (Exception)
            {

                ShowMessageWeb("กรุณาตรวจสอบความถูกต้องของ username และ password ! ");
            }

        }
    }
}