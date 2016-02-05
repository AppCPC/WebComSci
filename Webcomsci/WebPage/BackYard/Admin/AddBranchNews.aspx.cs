using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddBranchNews : System.Web.UI.Page
    {
        //private string pathPicture = "";

        private static string picturPath="";
        MessageShow mess = new MessageShow();

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

  /*   protected void UploadButton_Click(object sender, EventArgs e)
        {
            // Validate the uploaded file
            // 1. The uploaded file should not be a blank file
            if (FUCPic.FileBytes.Length == 0)
                return;
            // 2. The uploaded file should be having one of the allowed extensions
            string ext = System.IO.Path.GetExtension(FUCPic.FileName).TrimStart(".".ToCharArray()).ToLower();
            if ((ext != "jpeg") && (ext != "jpg") && (ext != "png") && (ext != "gif") && (ext != "bmp"))
            {
                return;
            }

            // Validation successful
            // Load the image into Bitmap Object
            Bitmap uploadedImage = new Bitmap(FUCPic.FileContent);

            // Set the maximum width and height here.
            // You can make this versatile by getting these values from
            // QueryString or textboxes
            int maxWidth = 480;
            int maxHeight = 0;

            // Resize the image
            ManagePicture te = new ManagePicture();
            Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);

           // string picturename = FUCUpload.FileName;//picture Name:
            //Save the image

            String virtualPath = "~/image/ManageFontEnd/branchNews/" + System.Guid.NewGuid().ToString() + "." + ext;
       
            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);


           // picturPath = virtualPath.ToString();
            //imgPic.ImageUrl = virtualPath;
         imgPic.ImageUrl="C:/Users/Public/Pictures/Sample Pictures/Lighthouse.jpg";
           imgPic.Visible = true;
        }
   * */
     private void uploadPic() {

         // Validate the uploaded file
         // 1. The uploaded file should not be a blank file
         if (FUCPic.FileBytes.Length == 0)
             return;
         // 2. The uploaded file should be having one of the allowed extensions
         string ext = System.IO.Path.GetExtension(FUCPic.FileName).TrimStart(".".ToCharArray()).ToLower();
         if ((ext != "jpeg") && (ext != "jpg") && (ext != "png") && (ext != "gif") && (ext != "bmp"))
         {
             return;
         }

         // Validation successful
         // Load the image into Bitmap Object
         Bitmap uploadedImage = new Bitmap(FUCPic.FileContent);

         // Set the maximum width and height here.
         // You can make this versatile by getting these values from
         // QueryString or textboxes
         int maxWidth = 480;
         int maxHeight = 0;

         // Resize the image
         ManagePicture te = new ManagePicture();
         Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);

         // string picturename = FUCUpload.FileName;//picture Name:
         //Save the image


         String virtualPath = "~/image/ManageFontEnd/branchNews/" + System.Guid.NewGuid().ToString() + "." + ext;

         String tempFileName = Server.MapPath(virtualPath);
         resizedImage.Save(tempFileName, uploadedImage.RawFormat);

         // Load the resized image on the browser

         // test.InnerHtml="<img src=../../../image/ButHome1.png /> </br> xxxxxxxx";
         // dimgPic.InnerHtml = "<img src=" + virtualPath + " /> ";
         picturPath = virtualPath.ToString();
       //  imgPic.ImageUrl = virtualPath;
        // imgPic.Visible = true;
     }
        protected void submit_Click(object sender, EventArgs e)
        {

        }

        protected void ContentChanged(object sender, EventArgs e)
        {
         //   ContentChangedLabel.Text = "<span style='color:red'>Content changed</span>";
        }
        private void clearValue() {
            txtdate.Text = "";
            txttitle.Text = "";
            picturPath="";
            editor.Content="";
        
        }

        private bool checkNull() {

            if (txttitle.Text.ToString() == "") { ShowMessageWeb("คุณลืมใส่หัวข้อเรื่องหรือเปล่า !"); return false; }
            else if (txtdate.Text.ToString() =="" ) { ShowMessageWeb("คุณไม่ได้ระบุวันที่หมดอายุประกาศ !"); return false; }
            else if (FUCPic.FileBytes.ToString()== "") { ShowMessageWeb("คุณไม่ได้ Upload รูป เข้าไปในประกาศเปล่าขอรับ"); return false; }
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
                Entity.BranchNewsInfo branch = new Entity.BranchNewsInfo();
                branch.BranchNews_Name = txttitle.Text.ToString();
                branch.Date_End = txtdate.Text.ToString();
                branch.Branch_Detail = editor.Content.ToString();
                branch.Branch_Path = picturPath;
                branch.Create_user=Session["userid"].ToString();
                branch.Update_user = Session["userid"].ToString();

                bool insert =BLL.BranchNews.insertBranchNews(branch);
                if (insert)
                {
                    ShowMessageWeb("บันทึกข้อมูลสมบูรณ์ ! ");
                    clearValue();
                }
                else
                {
                    ShowMessageWeb("บันทึกข้อมูลล้มเหลว ! ");
                    if (FUCPic.FileBytes.Length > 0)
                    {
                        System.IO.File.Delete(Server.MapPath(picturPath));
                    }
                }

            }
           
           
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../BackYard/Admin/searchBranchNews.aspx");
        }
    }
}