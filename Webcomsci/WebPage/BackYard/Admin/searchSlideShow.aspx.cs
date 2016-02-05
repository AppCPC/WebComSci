using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Drawing;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class searchSlideShow : System.Web.UI.Page
    {
        private static string status;
        private static string pathImage = "";
        private static string picturPath;
        private static bool setDelete;
        private static string setBranchIDdelete;

        protected object SlideShowID
        {
            get
            {
                return ViewState["SlideShowID"];
            }
            set
            {
                ViewState["SlideShowID"] = value;
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
            this.gvBranchNews.DataSource = this.Session["SlideShow"];
            this.gvBranchNews.PageIndex = pageindex;
            this.gvBranchNews.DataBind();
        }


        protected void gvBranchNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string search = txtsearchbranch.Text.ToString();
            this.Session["SlideShow"] = BLL.SlideShow.LoadAll(search);
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


        protected void gvBranchNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {

                if (e.CommandName == "updateBranch")
                {
                    SlideShowID = e.CommandArgument.ToString();


                    Entity.SlideShow branchIn = new Entity.SlideShow();
                    branchIn = BLL.SlideShow.selectShowPopup(SlideShowID.ToString());


                    txtPoPtitle.Text = branchIn.SlideShow_Name;
                    editorPopup.Content = branchIn.SlideShow_Detail;


                    pathImage = branchIn.SlideShow_Path.ToString();
                    imgID = pathImage;
                    if (pathImage.Length > 0)
                    {
                        imgPopPic.ImageUrl = pathImage;
                        imgPopPic.Visible = true;
                    }
                    else imgPopPic.Visible = false;

                    string status = branchIn.SlideShow_status;
                    if (status == "A") { ddlStatus.SelectedIndex = 0; }
                    else { ddlStatus.SelectedIndex = 1; }
                    txtPopdate.Text = branchIn.Date_End;

                    mdlpopup.Show();
                }
                else if (e.CommandName == "deleteBranch")
                {
                    pnlprogress.Visible = true;
                    setBranchIDdelete = e.CommandArgument.ToString();
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

        protected void gvBranchNews_RowDataBound(object sender, GridViewRowEventArgs e)
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

            int maxWidth = 620;
            int maxHeight = 240;

            ManagePicture te = new ManagePicture();
            Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);


            string ranPic = System.Guid.NewGuid().ToString() + "." + ext;

            String virtualPath = "~/image/ManageFontEnd/SlideShow/" + ranPic;
            string pathImgSave = "../../image/ManageFontEnd/SlideShow/" + ranPic;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);
            picturPath = pathImgSave.ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {
                Entity.SlideShow update = new Entity.SlideShow();

                update.Create_user = Session["userid"].ToString();
                update.Update_user = Session["userid"].ToString();

                update.SlideShow_ID = SlideShowID.ToString();
                update.SlideShow_Name = txtPoPtitle.Text.ToString();
                update.SlideShow_Detail = editorPopup.Content.ToString();
                update.Date_End = txtPopdate.Text.ToString();

                if (FUCPic.FileBytes.Length > 0)
                {
                    uploadPic();
                    update.SlideShow_Path = picturPath;

                }
                else update.SlideShow_Path = imgID.ToString();


                if (ddlStatus.SelectedIndex == 0) { update.SlideShow_status = "A"; }
                else { update.SlideShow_status = "U"; }

                bool checkStatusUpdate = BLL.SlideShow.UpdateBranch(update);
                if (checkStatusUpdate)
                {
                    if (FUCPic.FileBytes.Length > 0 && imgID.ToString().Length > 0)
                    {
                        System.IO.File.Delete(Server.MapPath(imgID.ToString()));
                    }
                    ShowMessageWeb("บันทึกข้อมูลสมบูรณ์! ");
                }
                else
                {
                    ShowMessageWeb("บันทึกข้อมูลล้มเหลว ! ");
                    try
                    {
                        string a = picturPath;
                        string currentpath = "~" + a.Substring(5, a.Length - 5);
                        System.IO.File.Delete(Server.MapPath(currentpath));
                    }
                    catch (Exception) { }
                }
                this.ImageButton1_Click(null, null);
            }
            catch (Exception) { }

        }

        protected void btnokMessage_Click(object sender, EventArgs e)
        {

            if (setBranchIDdelete.Length > 0)
            {
                string pathPicDelte = BLL.SlideShow.getPictreForDel(setBranchIDdelete);
                bool checkDelete = BLL.SlideShow.deleteBranch(setBranchIDdelete);

                if (checkDelete)
                {
                    try
                    {
                        string a = pathPicDelte;
                        string currentpath = "~" + a.Substring(5, a.Length - 5);

                        if (pathPicDelte.Length > 0)
                        {
                            System.IO.File.Delete(Server.MapPath(currentpath));
                        }
                    }
                    catch (Exception) { }

                    ShowMessageWeb("ลบข้อมูลเรียบร้อย ! ");


                }
                else { ShowMessageWeb("เกิดข้อมูลผิดพลาดไม่สามารถลบข้อมูลได้ ! "); }

                this.ImageButton1_Click(null, null);
            }

            Response.AppendHeader("Refresh", "0");
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