using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class CreateMediafile : System.Web.UI.Page
    {
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
        private void clearvalue(){

            txtdesciption.Text = "";
            txtfilename.Text = "";
          //  gvshowInstruction.DataBind();
       
        }
      
        protected void UploadFile(object sender, EventArgs e)
        {
            long fileSize = FileUploadMedia.PostedFile.ContentLength;
            if (fileSize <= 10485760)
            {

                if (txtfilename.Text.Length < 40 && txtfilename.Text.Length > 0)
                {

                    if (FileUploadMedia.FileName.Length > 0)
                    {

                        string classroomid = Request.QueryString["classid"];
                        string strFileName = DateTime.Now.ToString("ddMMyyyy_HHmmss");
                        string ext = System.IO.Path.GetExtension(FileUploadMedia.FileName).TrimStart(".".ToCharArray()).ToLower();
                        string namefile = txtfilename.Text;
                        string path = "~/WebPage/BackYard/ClassRoom/instructionMedia/" + namefile + "." + ext;
                        FileUploadMedia.SaveAs(Server.MapPath(path));

                        string des = txtdesciption.Text;
                        bool insert = BLL.ClassRoom.insertInstruction(classroomid, namefile, ext, path, des, fileSize.ToString());
                        if (insert)
                        {
                            ShowMessageWeb("บันทึกข้อมูลสื่อการสอนเสร็จสิ้น ! ");
                            //            gvshowInstruction.DataBind();
                        }
                    }
                    else
                    {
                        ShowMessageWeb("กรุณาเลือกไฟล์ที่ต้องการอัพโหลด ! ");
                    }
                }
                else
                {
                    ShowMessageWeb("ข้อมูลไฟล์ไม่ถูกต้องกรุณาตรวจสอบ ! ");
                }
            }
            else {
                ShowMessageWeb("ระบบเราอนุญาติให้มีการอัพโหลดไฟล์ได้ไม่เกิน 10 MB. !");
            }
            clearvalue();
        }

        protected void DeleteFile(object sender, EventArgs e)
        {

        }

        protected void DownloadFile(object sender, EventArgs e)
        {

        }

       
    }
}