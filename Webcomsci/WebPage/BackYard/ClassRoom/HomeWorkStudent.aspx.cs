using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class HomeWorkStudent : System.Web.UI.Page
    {

      
        protected object idvalue
        {
            get
            {
                return ViewState["idvalue"];
            }
            set
            {
                ViewState["idvalue"] = value;
            }
        }

        protected object enrollID
        {
            get
            {
                return ViewState["enrollID"];
            }
            set
            {
                ViewState["enrollID"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkbtnsendHomework_Click(object sender, EventArgs e)
        {
            mdlpopupmsg.Show();
            LinkButton objImage = (LinkButton)sender;
            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0].ToString();
            string name = commandArgs[1].ToString();
            string enrolid = commandArgs[2].ToString();
            idvalue = id;
            enrollID = enrolid;
            lblhomework.Text = name;

        }

        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {
            mdlpopupmsg.Hide();
        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        protected void btnSendHomework_Click(object sender, EventArgs e)
        {
           
                long fileSize = FileUploadHomework.PostedFile.ContentLength;

                if (fileSize <= 10485760)
                {
                    if (FileUploadHomework.FileName.Length > 0)
                    {
                        string strFileName = DateTime.Now.ToString("ddMMyyyy_HHmmss");
                        string ext = System.IO.Path.GetExtension(FileUploadHomework.FileName).TrimStart(".".ToCharArray()).ToLower();
                        string path = "~/WebPage/BackYard/ClassRoom/homework/Hw" + strFileName + "." + ext;
                        FileUploadHomework.SaveAs(Server.MapPath(path));

                        bool sendhomework = BLL.ClassRoom.showStudentSendHomeWork(idvalue.ToString(), enrollID.ToString(), path);
                        if (sendhomework)
                        {
                            ShowMessageWeb("ส่งการบ้านเรียบร้อย ! ");
                        }
                        else
                        {
                            ShowMessageWeb("เกิดข้อผิดพลาดกรุณาตรวจสอบข้อมูลไฟล์ที่คุณส่ง ! ");
                        }
                    }
                    else
                    {

                        ShowMessageWeb("ไม่พบไฟล์การบ้านที่คุณต้องการจะส่ง ! ");
                    }
                }
                else
                {

                    ShowMessageWeb("ระบบเราอนุญาติให้มีการอัพโหลดไฟล์ได้ไม่เกิน 10 MB. !");
                }


                ListViewShowfileMedia.DataBind();
            
        }

    }
}