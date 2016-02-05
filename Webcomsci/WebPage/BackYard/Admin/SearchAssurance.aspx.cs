using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Text;
using System.Drawing;
namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class SearchAssurance : System.Web.UI.Page
    {

        private static string status;
        private static string pathImage = "";
        private static string picturPath;
        private static bool setDelete;
        private static string setAssurancedelete;

        protected object Assurance_ID
        {
            get
            {
                return ViewState["assuranceID"];
            }
            set
            {
                ViewState["assuranceID"] = value;
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

            this.butImgSearch_Click(null, null);
        }


        private void bind(int pageindex)
        {
            this.gvAssurance.DataSource = this.Session["Assurance"];
            this.gvAssurance.PageIndex = pageindex;
            this.gvAssurance.DataBind();
        }
        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../BackYard/Admin/AddAssurance.aspx");

        }


        protected void gvAssurance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }



        protected void gvAssurance_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            setAssurancedelete = e.Keys[0].ToString();
            mdlpopupmsg.Show();


        }

        protected void butImgSearch_Click(object sender, ImageClickEventArgs e)
        {
            string search = txtsearchAssurance.Text.ToString();
            this.Session["Assurance"] = BLL.Assurance.LoadAll(search);
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


        protected void gvAssurance_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                Assurance_ID = gvAssurance.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();


                Entity.AssuranceInfo assurance = new Entity.AssuranceInfo();
                assurance = BLL.Assurance.selectShowPopup(Assurance_ID.ToString());


                txtPoPtitle.Text = assurance.Assurance_Name;
                editorPopup.Content = assurance.Assurance_Detail;



                pathImage = assurance.Assurance_Path.ToString();
                imgID = pathImage;
                if (pathImage.Length > 0)
                {
                    imgPopPic.ImageUrl = pathImage;
                    imgPopPic.Visible = true;
                }
                else imgPopPic.Visible = false;

                string status = assurance.Assurance_status;
                if (status == "A") { ddlStatus.SelectedIndex = 0; }
                else { ddlStatus.SelectedIndex = 1; }
                txtPopdate.Text = assurance.Date_End;

                mdlpopup.Show();

            }

        }


        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {
            mdlpopup.Hide();
        }

        protected void gvAssurance_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            System.Web.UI.WebControls.Image NewImageControl = new System.Web.UI.WebControls.Image();


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[6].Text == "1")
                {
                    e.Row.Cells[6].Text = "ผู้ดูแลระบบ";
                }

                //   if (e.Row.Cells[5].Text == "1")
                if (e.Row.Cells[5].Text.ToString().Equals("A"))
                {
                    NewImageControl.ImageUrl = "~/image/active_.png";
                    NewImageControl.AlternateText = "เผยแพร่";
                    e.Row.Cells[5].Controls.Add(NewImageControl);
                    //e.Row.Cells[5].Text = "ใช้งาน";
                }
                //   else if (e.Row.Cells[5].Text == "2")
                else if (e.Row.Cells[5].Text.ToString().Equals("U"))
                {
                    NewImageControl.ImageUrl = "~/image/unactive.png";
                    NewImageControl.AlternateText = "ไม่เผยแพร่";
                    e.Row.Cells[5].Controls.Add(NewImageControl);
                    //   e.Row.Cells[5].Text = "ไม่ใช้งาน";
                }


                for (int i = 1; i < gvAssurance.Rows.Count + 2; i++)
                {
                    e.Row.Cells[1].Text = i.ToString();

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


            String virtualPath = "~/image/ManageFontEnd/assurance/" + System.Guid.NewGuid().ToString() + "." + ext;

            String tempFileName = Server.MapPath(virtualPath);
            resizedImage.Save(tempFileName, uploadedImage.RawFormat);
            picturPath = virtualPath.ToString();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            Entity.AssuranceInfo update = new Entity.AssuranceInfo();
            update.Assurance_ID = Assurance_ID.ToString();
            update.Assurance_Name = txtPoPtitle.Text.ToString();
            update.Assurance_Detail = editorPopup.Content.ToString();
            update.Date_End = txtPopdate.Text.ToString();

            if (FUCPic.FileBytes.Length > 0)
            {
                uploadPic();
                update.Assurance_Path = picturPath;

            }
            else update.Assurance_Path = imgID.ToString();


            if (ddlStatus.SelectedIndex == 0) { update.Assurance_status = "A"; }
            else { update.Assurance_status = "U"; }

            bool checkStatusUpdate = BLL.Assurance.UpdateAssurance(update);
            if (checkStatusUpdate)
            {
                if (FUCPic.FileBytes.Length > 0 && imgID.ToString().Length > 0)
                {
                    System.IO.File.Delete(Server.MapPath(imgID.ToString()));
                }
                ShowMessageWeb("Update TrainningNews Success ! ");
            }
            else
            {
                ShowMessageWeb("Update TrainningNews Fail ! ");
                System.IO.File.Delete(Server.MapPath(picturPath));
            }
            this.butImgSearch_Click(null, null);

        }

        protected void btnokMessage_Click(object sender, EventArgs e)
        {

            if (setAssurancedelete.Length > 0)
            {
                string pathPicDelte = BLL.Assurance.getPictreForDel(setAssurancedelete);
                bool checkDelete = BLL.Assurance.deleteAssurance(setAssurancedelete);

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