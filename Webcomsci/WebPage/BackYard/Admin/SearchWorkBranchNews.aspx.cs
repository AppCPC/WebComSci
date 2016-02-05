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
    public partial class SearchWorkBranchNews : System.Web.UI.Page
    {
        private static string status;
        private static string pathImage = "";
        private static string picturPath;
        private static bool setDelete;
        private static string setWorkBranchDdelete;

        protected object WorkBranch_ID
        {
            get
            {
                return ViewState["workBranchID"];
            }
            set
            {
                ViewState["workBranchID"] = value;
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
            this.gvWorkBranch.DataSource = this.Session["workBranchID"];
            this.gvWorkBranch.PageIndex = pageindex;
            this.gvWorkBranch.DataBind();
        }
        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../BackYard/Admin/AddWorkBranchNews.aspx");

        }


        protected void gvWorkBranch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }



        protected void gvWorkBranch_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            setWorkBranchDdelete = e.Keys[0].ToString();
            mdlpopupmsg.Show();


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string search = txtsearchStdNews.Text.ToString();
            this.Session["workBranchID"] = BLL.WorkBranchNews.LoadAll(search);
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


        protected void gvWorkBranch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             try
            {

                if (e.CommandName == "updateBranch")
                {
            
                WorkBranch_ID =e.CommandArgument.ToString();


                Entity.WorkBranchNewsInfo workBranch = new Entity.WorkBranchNewsInfo();
                workBranch = BLL.WorkBranchNews.selectShowPopup(WorkBranch_ID.ToString());


                txtPoPtitle.Text = workBranch.WorkBranchNews_Name;
                editorPopup.Content = workBranch.WorkBranchNews_Detail;



                pathImage = workBranch.WorkBranchNews_Path.ToString();
                imgID = pathImage;
                if (pathImage.Length > 0)
                {
                    imgPopPic.ImageUrl = pathImage;
                    imgPopPic.Visible = true;
                }
                else imgPopPic.Visible = false;

                string status = workBranch.WorkBranchNews_status;
                if (status == "A") { ddlStatus.SelectedIndex = 0; }
                else { ddlStatus.SelectedIndex = 1; }
                txtPopdate.Text = workBranch.Date_End;

                mdlpopup.Show();

                }
                else if (e.CommandName=="deleteBranch")
                {
                    setWorkBranchDdelete=e.CommandArgument.ToString();
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

        protected void gvWorkBranch_RowDataBound(object sender, GridViewRowEventArgs e)
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


            String virtualPath = "~/image/ManageFontEnd/workbranch/" + System.Guid.NewGuid().ToString() + "." + ext;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);
            picturPath = virtualPath.ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            Entity.WorkBranchNewsInfo update = new Entity.WorkBranchNewsInfo();
            update.Create_user = Session["userid"].ToString();
            update.Update_user = Session["userid"].ToString();

            update.WorkBranchNews_ID = WorkBranch_ID.ToString();
            update.WorkBranchNews_Name = txtPoPtitle.Text.ToString();
            update.WorkBranchNews_Detail = editorPopup.Content.ToString();
            update.Date_End = txtPopdate.Text.ToString();

            if (FUCPic.FileBytes.Length > 0)
            {
                uploadPic();
                update.WorkBranchNews_Path = picturPath;

            }
            else update.WorkBranchNews_Path = imgID.ToString();


            if (ddlStatus.SelectedIndex == 0) { update.WorkBranchNews_status = "A"; }
            else { update.WorkBranchNews_status = "U"; }

            bool checkStatusUpdate = BLL.WorkBranchNews.UpdateWorkBranchNews(update);
            if (checkStatusUpdate)
            {
                if (FUCPic.FileBytes.Length > 0 && imgID.ToString().Length>0)
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

            if (setWorkBranchDdelete.Length > 0)
            {
                string pathPicDelte = BLL.WorkBranchNews.getPictreForDel(setWorkBranchDdelete);
                bool checkDelete = BLL.WorkBranchNews.deleteWorkBranchNews(setWorkBranchDdelete);

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