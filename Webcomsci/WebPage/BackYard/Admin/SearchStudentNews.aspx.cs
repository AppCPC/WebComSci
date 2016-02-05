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
    public partial class SearchStudentNews : System.Web.UI.Page
    {

        private static string status;
        private static string pathImage = "";
        private static string picturPath;
        private static bool setDelete;
        private static string setStdNewsDdelete;

        protected object stdNews_ID
        {
            get
            {
                return ViewState["stdNewsID"];
            }
            set
            {
                ViewState["stdNewsID"] = value;
            }
        }

        protected object imgID
        {
            get
            {
                return ViewState["imgID"];
            }
            set
            {
                ViewState["imgID"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ImageButton1_Click(null, null);
            }
        }


        private void bind(int pageindex)
        {
            this.gvStdNews.DataSource = this.Session["stdNews"];
            this.gvStdNews.PageIndex = pageindex;
            this.gvStdNews.DataBind();
        }
        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../BackYard/Admin/AddStudentNews.aspx");

        }


        protected void gvStdNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }



        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string search = txtsearchStdNews.Text.ToString();
            this.Session["stdNews"] = BLL.StudentNews.LoadAll(search);
            bind(0);
        }



        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }


        protected void gvStdNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             try
            {

                if (e.CommandName == "updateNews")
                {
                stdNews_ID = e.CommandArgument.ToString();


                Entity.StudentNewsInfo stdNewsEn = new Entity.StudentNewsInfo();
                stdNewsEn = BLL.StudentNews.selectShowPopup(stdNews_ID.ToString());


                txtPoPtitle.Text = stdNewsEn.StudentNews_Name;
                editorPopup.Content = stdNewsEn.StudentNews_Detail;



                pathImage = stdNewsEn.StudentNews_Path.ToString();
                imgID = pathImage;
                if (pathImage.Length > 0)
                {
                    imgPopPic.ImageUrl = pathImage;
                    imgPopPic.Visible = true;
                }
                else imgPopPic.Visible = false;

                string status = stdNewsEn.StudentNews_status;
                if (status == "A") { ddlStatus.SelectedIndex = 0; }
                else { ddlStatus.SelectedIndex = 1; }
                txtPopdate.Text = stdNewsEn.Date_End;

                mdlpopup.Show();

                }
                else if (e.CommandName == "deleteNews")
                {
                    setStdNewsDdelete = e.CommandArgument.ToString();
                    mdlpopupmsg.Show();
                }


            }
             catch (Exception ex)
             {

                 ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
             }

        }


        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {
            mdlpopup.Hide();
        }

        protected void gvStdNews_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            System.Web.UI.WebControls.Image NewImageControl = new System.Web.UI.WebControls.Image();


            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (e.Row.Cells[3].Text == "A")
                {
                    NewImageControl.ImageUrl = "~/image/active_.png";
                    NewImageControl.AlternateText = "เผยแพร่";
                    e.Row.Cells[3].Controls.Add(NewImageControl);
                    //e.Row.Cells[5].Text = "ใช้งาน";
                }
                else if (e.Row.Cells[3].Text == "U")
                {
                    NewImageControl.ImageUrl = "~/image/unactive.png";
                    NewImageControl.AlternateText = "ไม่เผยแพร่";
                    e.Row.Cells[3].Controls.Add(NewImageControl);
                    //   e.Row.Cells[5].Text = "ไม่ใช้งาน";
                }
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            mdlpopup.Hide();

        }


        private void uploadPic()
        {
            string ext = System.IO.Path.GetExtension(FUCPic.FileName).TrimStart(".".ToCharArray()).ToLower();
            if ((ext != "jpeg") && (ext != "jpg") && (ext != "png") && (ext != "gif") && (ext != "bmp"))
            {
                return;
            }
            Bitmap uploadedImage = new Bitmap(FUCPic.FileContent);

            int maxWidth = 480;
            int maxHeight = 0;

            ManagePicture te = new ManagePicture();
            Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);


            String virtualPath = "~/image/ManageFontEnd/studentNews/" + System.Guid.NewGuid().ToString() + "." + ext;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);
            picturPath = virtualPath.ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            Entity.StudentNewsInfo update = new Entity.StudentNewsInfo();

            update.Create_user = Session["userid"].ToString();
            update.Update_user = Session["userid"].ToString();

            update.StudentNews_ID = stdNews_ID.ToString();
            update.StudentNews_Name = txtPoPtitle.Text.ToString();
            update.StudentNews_Detail = editorPopup.Content.ToString();
            update.Date_End = txtPopdate.Text.ToString();

            if (FUCPic.FileBytes.Length > 0)
            {
                uploadPic();
                update.StudentNews_Path = picturPath;

            }
            else update.StudentNews_Path = imgID.ToString();


            if (ddlStatus.SelectedIndex == 0) { update.StudentNews_status = "A"; }
            else { update.StudentNews_status = "U"; }

            bool checkStatusUpdate = BLL.StudentNews.UpdateStdNews(update);
            if (checkStatusUpdate)
            {
                if (FUCPic.FileBytes.Length > 0 && imgID.ToString().Length > 0)
                {
                    System.IO.File.Delete(Server.MapPath(imgID.ToString()));
                }
                ShowMessageWeb("บันทึกข้อมูลเรียบร้อย ! ");
            }
            else
            {
                ShowMessageWeb("บันทึกข้อมูลล้มเหลว ! ");
                System.IO.File.Delete(Server.MapPath(picturPath));
            }
            this.ImageButton1_Click(null, null);

        }

        protected void btnokMessage_Click(object sender, EventArgs e)
        {

            if (setStdNewsDdelete.Length > 0)
            {
                string pathPicDelte =BLL.StudentNews.getPictreForDel(setStdNewsDdelete);
                bool checkDelete = BLL.StudentNews.deleteStdNews(setStdNewsDdelete);

                if (checkDelete)
                {


                    if (pathPicDelte.Length > 0)
                    {
                        System.IO.File.Delete(Server.MapPath(pathPicDelte));
                    }

                    ShowMessageWeb("ลบข้อมูลเรียบร้อย ! ");

                }
                else { ShowMessageWeb("เกิดข้อมูลผิดพลาดไม่สามารถลบข้อมูลได้ ! "); }

                this.ImageButton1_Click(null, null);
            }

            //setDelete = true;
        }

        protected void btnCancelMessage_Click(object sender, EventArgs e)
        {
            // setDelete = false;
            mdlpopupmsg.Hide();
        }

        protected void hidden_popupmsg_ValueChanged(object sender, EventArgs e)
        {

        }

    }
}