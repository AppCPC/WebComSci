using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddStudentNews : System.Web.UI.Page
    {
        private static string picturPath="";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void uploadPic()
        {

            if (FUCPic.FileBytes.Length == 0)
                return;
            string ext = System.IO.Path.GetExtension(FUCPic.FileName).TrimStart(".".ToCharArray()).ToLower();
            if ((ext != "jpeg") && (ext != "jpg") && (ext != "png") && (ext != "gif") && (ext != "bmp"))
            {
                return;
            }

            Bitmap uploadedImage     = new Bitmap(FUCPic.FileContent);

            int maxWidth = 480;
            int maxHeight = 0;

            // Resize the image
            ManagePicture te = new ManagePicture();
            Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);



            String virtualPath = "~/image/ManageFontEnd/studentNews/" + System.Guid.NewGuid().ToString() + "." + ext;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);

            picturPath = virtualPath.ToString();
        }
        protected void submit_Click(object sender, EventArgs e)
        {

        }

        protected void ContentChanged(object sender, EventArgs e)
        {
            //   ContentChangedLabel.Text = "<span style='color:red'>Content changed</span>";
        }
        private void clearValue()
        {
            txtdate.Text = "";
            txttitle.Text = "";
            picturPath = "";
            editor.Content = "";

        }

        private bool checkNull()
        {

            if (txttitle.Text.ToString() == "") { ShowMessageWeb("คุณลืมใส่หัวข้อเรื่องหรือเปล่า !"); return false; }
            else if (txtdate.Text.ToString() == "") { ShowMessageWeb("คุณไม่ได้ระบุวันที่หมดอายุประกาศ !"); return false; }
            else if (FUCPic.FileBytes.ToString() == "") { ShowMessageWeb("คุณไม่ได้ Upload รูป เข้าไปในประกาศเปล่าขอรับ"); return false; }
            else if (editor.Content.ToString() == "") { ShowMessageWeb("คุณลืมใส่รายละเอียดของประกาศหรือเปล่า !"); return false; }
            else if (editor.Content.ToString().Length < 300) { ShowMessageWeb("ข้อมูลรายละเอียดของประกาศน้อยเกินไป กรุณากรอกข้อมูลเพิ่ม !"); return false; }
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
        protected void btnok_Click(object sender, EventArgs e)
        {

           if (checkNull())
            {
                if (FUCPic.FileBytes.Length > 0)
                {
                    uploadPic();
                }
                Entity.StudentNewsInfo stdNews = new Entity.StudentNewsInfo();
                stdNews .StudentNews_Name= txttitle.Text.ToString();
                stdNews.Date_End = txtdate.Text.ToString();
                stdNews.StudentNews_Detail = editor.Content.ToString();
                stdNews.StudentNews_Path = picturPath;
                stdNews.Create_user = Session["userid"].ToString();
                stdNews.Update_user = Session["userid"].ToString();

            bool insert = BLL.StudentNews.insertStdNews(stdNews);
            if (insert)
            {
                ShowMessageWeb("บันทึกข้อมูลเรียบร้อย! ");
                clearValue();
            }
            else
            {
                ShowMessageWeb("บันทึกข้อมูลล้มเหลว!");
                if (FUCPic.FileBytes.Length > 0)
                {
                    System.IO.File.Delete(Server.MapPath(picturPath));
                }
            }

            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../BackYard/Admin/SearchStudentNews.aspx");
        }
    }
}