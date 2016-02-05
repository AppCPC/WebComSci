using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Drawing;

namespace Webcomsci.WebPage.BackYard.KM
{
    public partial class Cratekm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { }

        }
        private static string picturPath = "";
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        private void clearValue()
        {
            txtName.Text = "";
            TextBoxLink.Text = "";
            picturPath = "";
            editor.Content = "";

        }

        protected void btnconfirm_Click(object sender, EventArgs e)
        {
           


            string title = txtName.Text;
            string detail = editor.Content.ToString();
            string link = TextBoxLink.Text;
            string user = Session["userid"].ToString();
            string type = Session["userType"].ToString();

            //string a = FileUpload.FileName;

            //if (FileUpload.FileBytes.Length > 0)
            //{
            //    uploadPic();
            //}

            //lblPathImage.Text = a;

            bool insert = BLL.Knowledge.insertPostKm(title, detail, link, user, type);

            if (insert)
            {
                ShowMessageWeb("สร้างข้อมูลเรียบร้อย ! ");
                clearValue();
            }
            else
            {
                ShowMessageWeb("บันทึกข้อมูลล้มเหลว ! ");
                //if (FileUpload.FileBytes.Length > 0)
                //{
                //    System.IO.File.Delete(Server.MapPath(picturPath));
                //}
            }


         }
        

        //private void uploadPic()
        //{
        //    if (FileUpload.FileBytes.Length == 0)
        //        return;
        //    string ext = System.IO.Path.GetExtension(FileUpload.FileName).TrimStart(".".ToCharArray()).ToLower();
        //    if ((ext != "jpeg") && (ext != "jpg") && (ext != "png") && (ext != "gif") && (ext != "bmp"))
        //    {
        //        return;
        //    }

        //    Bitmap uploadedImage = new Bitmap(FileUpload.FileContent);

        //    int maxWidth = 480;
        //    int maxHeight = 0;
        //    ManagePicture te = new ManagePicture();
        //    Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);

        //    string virtualPath = "~/WebPage/BackYard/KM/picture/" + System.Guid.NewGuid().ToString() + "." + ext;

        //    String tempFileName = Server.MapPath(virtualPath);
        //    resizedImage.Save(tempFileName, uploadedImage.RawFormat);

        //    picturPath = virtualPath.ToString();
        //}

        protected void ContentChanged(object sender, EventArgs e)
        {

        }
    }
}