using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class searchBranchNews : System.Web.UI.Page
    {
        private static string status;
        private static string pathImage = "";
        private static string picturPath;
        private static bool setDelete;
        private static string setBranchIDdelete;

        protected object Branch_ID
        {
            get
            {
                return ViewState["branchID"];
            }
            set
            {
                ViewState["branchID"] = value;
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
            this.gvBranchNews.DataSource = this.Session["branchNews"];
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
            this.Session["branchNews"] = BLL.BranchNews.LoadAll(search);
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
                    Branch_ID =e.CommandArgument.ToString();


                    Entity.BranchNewsInfo branchIn = new Entity.BranchNewsInfo();
                    branchIn = BLL.BranchNews.selectShowPopup(Branch_ID.ToString());


                    txtPoPtitle.Text = branchIn.BranchNews_Name;
                    editorPopup.Content = branchIn.Branch_Detail;


                    pathImage = branchIn.Branch_Path.ToString();
                    imgID = pathImage;
                    if (pathImage.Length > 0)
                    {
                        imgPopPic.ImageUrl = pathImage;
                        imgPopPic.Visible = true;
                    }
                    else imgPopPic.Visible = false;

                    string status = branchIn.Branch_status;
                    if (status == "A") { ddlStatus.SelectedIndex = 0; }
                    else { ddlStatus.SelectedIndex = 1; }
                    txtPopdate.Text = branchIn.Date_End;

                    mdlpopup.Show();
                }
                else if (e.CommandName=="deleteBranch")
                {
                    pnlprogress.Visible = true;
                    setBranchIDdelete=e.CommandArgument.ToString();
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

            int maxWidth = 480;
            int maxHeight = 0;

            ManagePicture te = new ManagePicture();
            Bitmap resizedImage = te.GetScaledPicture(uploadedImage, maxWidth, maxHeight);


            String virtualPath = "~/image/ManageFontEnd/branchNews/" + System.Guid.NewGuid().ToString() + "." + ext;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);
            picturPath = virtualPath.ToString();
        }
        
        protected void btnsave_Click(object sender, EventArgs e)
        {
           
            Entity.BranchNewsInfo update = new Entity.BranchNewsInfo();
            
            update.Create_user=Session["userid"].ToString();
            update.Update_user = Session["userid"].ToString();

            update.BranchNews_ID = Branch_ID.ToString();
            update.BranchNews_Name = txtPoPtitle.Text.ToString();
            update.Branch_Detail = editorPopup.Content.ToString();
            update.Date_End = txtPopdate.Text.ToString();

            if (FUCPic.FileBytes.Length > 0)
            {
                uploadPic();
                update.Branch_Path = picturPath;

            }
            else update.Branch_Path = imgID.ToString() ;
  

            if (ddlStatus.SelectedIndex == 0) { update.Branch_status = "A"; }
            else { update.Branch_status = "U"; }

            bool checkStatusUpdate =BLL.BranchNews.UpdateBranch(update);
            if (checkStatusUpdate)
            {
                if (FUCPic.FileBytes.Length > 0 && imgID.ToString().Length > 0)
                {
                    System.IO.File.Delete(Server.MapPath(imgID.ToString()));
                }
                ShowMessageWeb("บันทึกข้อมูลสมบูรณ์! ");
            }
            else {
                ShowMessageWeb("บันทึกข้อมูลล้มเหลว ! ");
                System.IO.File.Delete(Server.MapPath(picturPath));
            }
            this.ImageButton1_Click(null, null);
  
        }

        protected void btnokMessage_Click(object sender, EventArgs e)
        {
           
            if (setBranchIDdelete.Length > 0)
            {
                string pathPicDelte = BLL.BranchNews.getPictreForDel(setBranchIDdelete);
                bool checkDelete = BLL.BranchNews.deleteBranch(setBranchIDdelete);

                if (checkDelete) {


                    if (pathPicDelte.Length > 0)
                    {
                        System.IO.File.Delete(Server.MapPath(pathPicDelte));
                    }

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