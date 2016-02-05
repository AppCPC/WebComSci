using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Webcomsci.WebPage.BackYard.Photo
{
    public partial class CreatePicture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (fileUpPic.HasFile && !string.IsNullOrEmpty(txtPicName.Text))
            {
                DataTable dt = BLL.Album.LoadAll(Session["userid"].ToString());
                if (dt.Rows.Count > 0)
                {
                    Entity.Picture itemPic = new Entity.Picture();
                    itemPic.Album_ID = dt.Rows[0]["Album_ID"].ToString();
                    itemPic.Picture_Name = txtPicName.Text;
                    itemPic.Picture_Detail = txtdesciption.Text;
                    itemPic.Picture_Path = "~/image/Photo/TestPhoto/" + fileUpPic.FileName;
                    fileUpPic.SaveAs(Server.MapPath("~/image/Photo/TestPhoto/" + fileUpPic.FileName));
                    BLL.Picture.insertPicture(itemPic);
                }
                else
                {
                    Entity.Picture itemPic = new Entity.Picture();
                    itemPic.Album_ID = BLL.Album.CountAlbum().Rows[0]["COUNT_ID"].ToString();
                    itemPic.Picture_Name = txtPicName.Text;
                    itemPic.Picture_Detail = txtdesciption.Text;
                    itemPic.Picture_Path = "~/image/Photo/TestPhoto/" + fileUpPic.FileName;
                    fileUpPic.SaveAs(Server.MapPath("~/image/Photo/TestPhoto/" + fileUpPic.FileName));
                    BLL.Picture.insertPicture(itemPic);
                    Entity.AlbumPicture itemAl = new Entity.AlbumPicture();
                    itemAl.Album_Name = Session["userid"].ToString();
                    itemAl.Create_User = Session["userid"].ToString();
                    BLL.Album.insertAlbum(itemAl);
                }


                ShowMessageWeb("บันทึกข้อมูลเรียบร้อย");
            }
            else
                ShowMessageWeb("กรุณาเลือกภาพก่อน");
            
        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        
    }
}