using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.setting
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                showProfileStd();

            }
        }


        private void showProfileStd()
        {

            string userid = Session["userid"].ToString();
            string usertype = Session["userType"].ToString();
            if (usertype.Equals("ST") || usertype.Equals("AL"))
            {
                Entity.Student student = new Entity.Student();
                student = BLL.Student.selectShowProfileStd(userid);

                lblNameStd.Text = student.Std_FName + "   " + student.Std_LName; 
                
                lblnameStdEn.Text = student.Std_FNameEn + "  "+student.Std_LNameEn;

                lblNickNameStd.Text = student.Std_Nickname;

                string sex = student.Std_Sex;
                if (sex.Equals("M"))
                {
                    lblSexStd.Text = "ชาย";
                }
                else if (sex.Equals("F"))
                {
                    lblSexStd.Text = "หญิง";
                }

                lblBirthStd.Text = student.Std_Birth;
                lblTelStd.Text = student.Std_Tel;
                lblEmailStd.Text = student.Std_email;
                string path = student.std_picturepath;
                ImageUser.ImageUrl = path;

            }
            else if (usertype.Equals("TE") || usertype.Equals("TS"))
            {

                Entity.Teacher tch = new Entity.Teacher();
                tch = BLL.Teacher.selectShowProfileTch(userid);

                lblNameStd.Text = "อาจารย์ "+tch.Tch_FName +" "+ tch.Tch_LName;

                lblnameStdEn.Text = tch.Tch_FNameEn + "  "+ tch.Tch_LNameEn;

                lblNickNameStd.Text = tch.Tch_Nickname;

                string sex = tch.Tch_Sex;
                if (sex.Equals("M"))
                {
                    lblSexStd.Text = "ชาย";
                }
                else if (sex.Equals("F"))
                {
                    lblSexStd.Text = "หญิง";
                }

                lblBirthStd.Text = tch.Tch_Birth;
                lblTelStd.Text = tch.Tch_Tel;
                lblEmailStd.Text = tch.Tch_email;
                string path = tch.Tch_picturepath;
                ImageUser.ImageUrl = path;

            }
           


        }



    }
}