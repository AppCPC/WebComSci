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
    public partial class SearchTrainning : System.Web.UI.Page
    {

        private static string status;
        private static string pathImage = "";
        private static string picturPath;
        private static bool setDelete;
        private static string setTrainNewsdelete;

        protected object trainNews_ID
        {
            get
            {
                return ViewState["traingNewsID"];
            }
            set
            {
                ViewState["traingNewsID"] = value;
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
                this.butImgSearch_Click(null, null);
            }
        }


        private void bind(int pageindex)
        {
            this.gvSearchTrainning.DataSource = this.Session["TrainNews"];
            this.gvSearchTrainning.PageIndex = pageindex;
            this.gvSearchTrainning.DataBind();
        }
        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../BackYard/Admin/AddTrainning.aspx");

        }


        protected void gvSearchTrainning_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }



        protected void gvSearchTrainning_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            setTrainNewsdelete = e.Keys[0].ToString();
            mdlpopupmsg.Show();
           

        }

        protected void butImgSearch_Click(object sender, ImageClickEventArgs e)
        {
            string search = txtsearchTrainning.Text.ToString();
            this.Session["TrainNews"] = BLL.TrainingNews.LoadAll(search);
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


        protected void gvSearchTrainning_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                trainNews_ID = gvSearchTrainning.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();


                Entity.TrainingNewsInfo trainNews = new Entity.TrainingNewsInfo();
                trainNews = BLL.TrainingNews.selectShowPopup(trainNews_ID.ToString());


                txtPoPtitle.Text = trainNews.Training_Name;
                editorPopup.Content = trainNews.Training_Detail;



                pathImage = trainNews.Training_Path.ToString();
                imgID = pathImage;
                if (pathImage.Length > 0)
                {
                    imgPopPic.ImageUrl = pathImage;
                    imgPopPic.Visible = true;
                }
                else imgPopPic.Visible = false;

                string status = trainNews.Training_status;
                if (status == "A") { ddlStatus.SelectedIndex = 0; }
                else { ddlStatus.SelectedIndex = 1; }
                txtPopdate.Text = trainNews.Date_End;

                mdlpopup.Show();

            }

        }


        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {
            mdlpopup.Hide();
        }

        protected void gvSearchTrainning_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            System.Web.UI.WebControls.Image NewImageControl = new System.Web.UI.WebControls.Image();


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                if (e.Row.Cells[3].Text.ToString().Equals("A"))
                {
                    NewImageControl.ImageUrl = "~/image/active_.png";
                    NewImageControl.AlternateText = "เผยแพร่";
                    e.Row.Cells[3].Controls.Add(NewImageControl);
                    //e.Row.Cells[5].Text = "ใช้งาน";
                }
                //   else if (e.Row.Cells[5].Text == "2")
                else if (e.Row.Cells[3].Text.ToString().Equals("U"))
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


            String virtualPath = "~/image/ManageFontEnd/trainning/" + System.Guid.NewGuid().ToString() + "." + ext;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);
            picturPath = virtualPath.ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            Entity.TrainingNewsInfo update = new Entity.TrainingNewsInfo();
            update.Create_user = Session["userid"].ToString();
            update.Update_user = Session["userid"].ToString();

            update.Training_ID = trainNews_ID.ToString();
            update.Training_Name = txtPoPtitle.Text.ToString();
            update.Training_Detail = editorPopup.Content.ToString();
            update.Date_End = txtPopdate.Text.ToString();

            if (FUCPic.FileBytes.Length > 0)
            {
                uploadPic();
                update.Training_Path = picturPath;

            }
            else update.Training_Path = imgID.ToString();


            if (ddlStatus.SelectedIndex == 0) { update.Training_status = "A"; }
            else { update.Training_status = "U"; }

            bool checkStatusUpdate = BLL.TrainingNews.UpdateTrainingNews(update);
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
            this.butImgSearch_Click(null, null);

        }

        protected void btnokMessage_Click(object sender, EventArgs e)
        {

            if (setTrainNewsdelete.Length > 0)
            {
                string pathPicDelte = BLL.TrainingNews.getPictreForDel(setTrainNewsdelete);
                bool checkDelete = BLL.TrainingNews.deleteTrainingNews(setTrainNewsdelete);

                if (checkDelete)
                {


                    if (pathPicDelte.Length > 0)
                    {
                        System.IO.File.Delete(Server.MapPath(pathPicDelte));
                    }

                    ShowMessageWeb("ลบข้อมูลเรียบร้อย ! ");

                }
                else { ShowMessageWeb("เกิดข้อมูลผิดพลาดไม่สามารถลบข้อมูลได้ ! "); }

                this.butImgSearch_Click(null, null);
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