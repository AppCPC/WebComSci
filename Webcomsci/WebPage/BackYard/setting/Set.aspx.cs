using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Drawing;

namespace Webcomsci.WebPage.BackYard.setting
{
    public partial class Setting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnupdate.Visible = true;
                btnSave.Visible = false;
                showlabel();

                string userid = Session["userid"].ToString();
                string usertype = Session["userType"].ToString();
                if (usertype.Equals("ST") || usertype.Equals("AL"))
                {
                    showProfileStd(userid);

                }
                else if (usertype.Equals("TE") || usertype.Equals("TS"))
                {

                    showProfileTch(userid);
                }


            }
        }


        private void showProfileStd(string userid)
        {

            Entity.Student student = new Entity.Student();
            student = BLL.Student.selectShowProfileStd(userid);

            //  txtSubCode.Text = student.Std_Campus_Code;
            lblCodeStd.Text = student.Std_Campus_Code;

            txtNameStd.Text = student.Std_FName;
            lblNameStd.Text = student.Std_FName;

            txtLname.Text = student.Std_LName;
            lblLnameStd.Text = student.Std_LName;

            txtnameStdEn.Text = student.Std_FNameEn;
            lblnameStdEn.Text = student.Std_FNameEn;

            txtLnameEnStd.Text = student.Std_LNameEn;
            lblLnameEnstd.Text = student.Std_LNameEn;

            txtNickName.Text = student.Std_Nickname;
            lblNickNameStd.Text = student.Std_Nickname;

            string sex = student.Std_Sex;
            if (sex.Equals("M"))
            {
                RadioButtonListSex.SelectedValue = "M";
                lblSexStd.Text = "ชาย";
            }
            else if (sex.Equals("F"))
            {
                RadioButtonListSex.SelectedValue = "F";
                lblSexStd.Text = "หญิง";
            }

            txtBirthDate.Text = student.Std_Birth;
            lblBirthStd.Text = student.Std_Birth;

            TextAreaAddress.InnerHtml = student.Std_Address;
            lblAddressStd.Text = student.Std_Address;

            txttel.Text = student.Std_Tel;
            lblTelStd.Text = student.Std_Tel;


            txtEmail.Text = student.Std_email;
            lblEmailStd.Text = student.Std_email;

            txtUsername.Text = student.Std_Username;
            lblUsernameStd.Text = student.Std_Username;


            txtpassword.Text = student.Std_Password;
            lblPasswordStd.Text = student.Std_Password;


            string path = student.std_picturepath;
            ImageUser.ImageUrl = path;

            lblgroup.Text = student.Std_Group;
            lblyear.Text = student.Std_YearEducate;
            lbtype.Text = student.Std_Type;

            lblpicturepath.Text = student.std_picturepath;


        }


        private void showProfileTch(string userid)
        {

            Entity.Teacher tch = new Entity.Teacher();
            tch = BLL.Teacher.selectShowProfileTch(userid);

            //  txtSubCode.Text = student.Std_Campus_Code;
            lblCodeStd.Visible = false;
            lblcodestda.Visible = false;

            txtNameStd.Text = tch.Tch_FName;
            lblNameStd.Text = tch.Tch_FName;

            txtLname.Text = tch.Tch_LName;
            lblLnameStd.Text = tch.Tch_LName;

            txtnameStdEn.Text = tch.Tch_FNameEn;
            lblnameStdEn.Text = tch.Tch_FNameEn;

            txtLnameEnStd.Text = tch.Tch_LNameEn;
            lblLnameEnstd.Text = tch.Tch_LNameEn;

            txtNickName.Text = tch.Tch_Nickname;
            lblNickNameStd.Text = tch.Tch_Nickname;

            string sex = tch.Tch_Sex;
            if (sex.Equals("M"))
            {
                RadioButtonListSex.SelectedValue = "M";
                lblSexStd.Text = "ชาย";
            }
            else if (sex.Equals("F"))
            {
                RadioButtonListSex.SelectedValue = "F";
                lblSexStd.Text = "หญิง";
            }

            txtBirthDate.Text = tch.Tch_Birth;
            lblBirthStd.Text = tch.Tch_Birth;

            TextAreaAddress.InnerHtml = tch.Tch_Address;
            lblAddressStd.Text = tch.Tch_Address;

            txttel.Text = tch.Tch_Address;
            lblTelStd.Text = tch.Tch_Address;


            txtEmail.Text = tch.Tch_email;
            lblEmailStd.Text = tch.Tch_email;

            txtUsername.Text = tch.Tch_username;
            lblUsernameStd.Text = tch.Tch_username;


            txtpassword.Text = tch.Tch_password;
            lblPasswordStd.Text = tch.Tch_password;


            string path = tch.Tch_picturepath;
            ImageUser.ImageUrl = path;

            lbtype.Text = tch.Tch_Type;

            lblpicturepath.Text = tch.Tch_picturepath;


        }

        private void showTextbox()
        {

            // txtSubCode.Visible = true;
            lblCodeStd.Visible = true;

            txtNameStd.Visible = true;
            lblNameStd.Visible = false;

            txtLname.Visible = true;
            lblLnameStd.Visible = false;

            txtNickName.Visible = true;
            lblNickNameStd.Visible = false;

            RadioButtonListSex.Visible = true;
            lblSexStd.Visible = false;

            FileUploadPicture.Visible = true;

            txtBirthDate.Visible = true;
            lblBirthStd.Visible = false;

            TextAreaAddress.Visible = true;
            lblAddressStd.Visible = false;


            txttel.Visible = true;
            lblTelStd.Visible = false;

            txtEmail.Visible = true;
            lblEmailStd.Visible = false;

            txtUsername.Visible = true;
            lblUsernameStd.Visible = false;

            txtpassword.Visible = true;
            lblPasswordStd.Visible = false;

            txtnameStdEn.Visible = true;
            lblnameStdEn.Visible = false;

            txtLnameEnStd.Visible = true;
            lblLnameEnstd.Visible = false;

        }


        private void showlabel()
        {

            txtSubCode.Visible = false;
            lblCodeStd.Visible = true;

            txtNameStd.Visible = false;
            lblNameStd.Visible = true;

            txtLname.Visible = false;
            lblLnameStd.Visible = true;

            txtNickName.Visible = false;
            lblNickNameStd.Visible = true;

            RadioButtonListSex.Visible = false;
            lblSexStd.Visible = true;

            FileUploadPicture.Visible = false;

            txtBirthDate.Visible = false;
            lblBirthStd.Visible = true;

            TextAreaAddress.Visible = false;
            lblAddressStd.Visible = true;


            txttel.Visible = false;
            lblTelStd.Visible = true;

            txtEmail.Visible = false;
            lblEmailStd.Visible = true;

            txtUsername.Visible = false;
            lblUsernameStd.Visible = true;

            txtpassword.Visible = false;
            lblPasswordStd.Visible = true;

            txtnameStdEn.Visible = false;
            lblnameStdEn.Visible = true;

            txtLnameEnStd.Visible = false;
            lblLnameEnstd.Visible = true;

        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            string userid = Session["userid"].ToString();
            string usertype = Session["userType"].ToString();


            showlabel();

            if (usertype.Equals("ST") || usertype.Equals("AL"))
            {
                updateProfile();
                showProfileStd(userid);

            }
            else if (usertype.Equals("TE") || usertype.Equals("TS"))
            {
                updateProfileTch(userid);
                showProfileTch(userid);
            }

            btnupdate.Visible = true;

            btnSave.Visible = false;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {


            showTextbox();
            btnupdate.Visible = false;
            btnSave.Visible = true;


        }


        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }


        private static string picturPath = "";
        private void uploadPic()
        {
            if (FileUploadPicture.FileBytes.Length == 0)
                return;
            string ext = System.IO.Path.GetExtension(FileUploadPicture.FileName).TrimStart(".".ToCharArray()).ToLower();
            if ((ext != "jpeg") && (ext != "jpg") && (ext != "png") && (ext != "gif") && (ext != "bmp"))
            {
                return;
            }

            Bitmap uploadedImage = new Bitmap(FileUploadPicture.FileContent);

            int maxWidth = 480;
            int maxHeight = 0;
            ManagePicture te = new ManagePicture();
            Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);

            string virtualPath = "~/WebPage/BackYard/setting/pictureUser/" + System.Guid.NewGuid().ToString() + "." + ext;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);

            picturPath = virtualPath.ToString();
        }

        private void updateProfile()
        {


            Entity.Student std = new Entity.Student();
            std.Std_Campus_Code = lblCodeStd.Text;
            std.Std_FName = txtNameStd.Text;
            std.Std_LName = txtLname.Text;
            std.Std_FNameEn = txtnameStdEn.Text;
            std.Std_LNameEn = txtLnameEnStd.Text;
            std.Std_Nickname = txtNickName.Text;
            std.Std_Sex = RadioButtonListSex.SelectedValue;
            std.Std_Birth = txtBirthDate.Text;
            std.Std_Address = TextAreaAddress.InnerHtml;
            std.Std_Tel = txttel.Text;
            std.Std_email = txtEmail.Text;
            std.Std_Username = txtUsername.Text;
            std.Std_Password = txtpassword.Text;

            std.Std_Group = lblgroup.Text;
            std.Std_YearEducate = lblyear.Text;
            std.Std_Type = lbtype.Text;

            string a = FileUploadPicture.FileName;

            if (FileUploadPicture.FileBytes.Length > 0)
            {
                uploadPic();
                std.std_picturepath = picturPath;
            }
            else
            {

                std.std_picturepath = lblpicturepath.Text;
            }


            bool insert = BLL.Student.updateUserStudent(std);
            if (insert)
            {
                ShowMessageWeb("บันทึกข้อมูลสมบูรณ์ ! ");
            }
            else
            {
                ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถบันทึกข้อมูลได้ ! ");

                if (FileUploadPicture.FileBytes.Length > 0)
                {
                    System.IO.File.Delete(Server.MapPath(picturPath));
                }
            }

        }


        private void updateProfileTch(string userid)
        {


            Entity.Teacher tch = new Entity.Teacher();
            tch.Tch_ID = userid;
            tch.Tch_FName = txtNameStd.Text;
            tch.Tch_LName = txtLname.Text;
            tch.Tch_FNameEn = txtnameStdEn.Text;
            tch.Tch_LNameEn = txtLnameEnStd.Text;
            tch.Tch_Nickname = txtNickName.Text;
            tch.Tch_Sex = RadioButtonListSex.SelectedValue;
            tch.Tch_Birth = txtBirthDate.Text;
            tch.Tch_Address = TextAreaAddress.InnerHtml;
            tch.Tch_Tel = txttel.Text;
            tch.Tch_email = txtEmail.Text;
            tch.Tch_username = txtUsername.Text;
            tch.Tch_password = txtpassword.Text;

            tch.Tch_Type = lbtype.Text;


            string a = FileUploadPicture.FileName;

            if (FileUploadPicture.FileBytes.Length > 0)
            {
                uploadPic();
                tch.Tch_picturepath = picturPath;
            }
            else
            {

                tch.Tch_picturepath = lblpicturepath.Text;
            }


            bool insert = BLL.Teacher.updateUserTeacher(tch);
            if (insert)
            {
                ShowMessageWeb("บันทึกข้อมูลสมบูรณ์ ! ");
            }
            else
            {
                ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถบันทึกข้อมูลได้ ! ");

                if (FileUploadPicture.FileBytes.Length > 0)
                {
                    System.IO.File.Delete(Server.MapPath(picturPath));
                }
            }

        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            showlabel();
            btnSave.Visible = false;
            btnupdate.Visible = true;
        }




    }
}