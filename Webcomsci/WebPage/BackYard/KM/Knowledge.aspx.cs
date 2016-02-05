using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Webcomsci
{
    public partial class Knowledge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    showLIstview();
                }
                catch (Exception)
                {

                }
            }

        }
        protected object postID
        {
            get
            {
                return ViewState["postID"];
            }
            set
            {
                ViewState["postID"] = value;
            }
        }




        private void showLIstview()
        {
            try
            {
                string usertype = Session["userType"].ToString();
                DataTable dtpostkm = new DataTable();
                dtpostkm = BLL.Knowledge.selectComment(usertype);

                //if (dtpostkm.Rows.Count > 0)
                //{
                //    int i = 0;
                //    foreach (DataRow row in dtpostkm.Rows)
                //    {
                //        foreach (DataColumn column in dtpostkm.Columns)
                //        {
                //            Response.Write(row[column] + "  ");

                //        }
                //        Response.Write("<br/>");
                //        i++;
                //    }
                //    Response.Write("count B " + i.ToString());
                //}



            ListViewShowKmPost.DataSource = dtpostkm;
           ListViewShowKmPost.DataBind();
            }
            catch (Exception)
            {

            }
        }



        protected DataTable getCommentsForPost(string thePost)
        {
            int clickPostID = 0;

            try
            {
                clickPostID = Convert.ToInt32(postID);
            }
            catch (Exception)
            {
                postID = 0;
            }


            DataTable dt = new DataTable();
            if (clickPostID == (Convert.ToInt32(thePost)))
            {
                dt = BLL.Knowledge.getCommentsForPost(Convert.ToInt32(thePost), clickPostID);



            }
            else
            {
                dt = BLL.Knowledge.getCommentsForPost(Convert.ToInt32(thePost), 0);

            }

            return dt;

        }

        protected void AutoRefreshTimer_Tick(object sender, EventArgs e)
        {
         //   ListViewShowKmPost.DataBind();
        }

        protected void btnCreateKm_Click(object sender, EventArgs e)
        {
            
                modalpopupshow.Show();

        }





        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }





        protected void btnComment_Click(object sender, EventArgs e)
        {

            /**********************************
             * 
             * ปุ่มคอมเม้น
             * 
             * ******************************/
            Button objImage = (Button)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0];
            string userid = Session["userid"].ToString();
            string usertype = Session["userType"].ToString();


            TextBox tbcomment = (TextBox)objImage.FindControl("textarea");


            bool re = BLL.Knowledge.insertComment(id, tbcomment.Text, userid, usertype);

            if (re)
            {
                tbcomment.Text = "";

                showLIstview();
            }

            postID = id;
            tbcomment.Focus();
        }

        protected void ListViewShowKmPost_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            /**************************
             * 
             * เช็คการเปิดปุ่มลบของการโพสต์
             * 
             ************************** */
            string sessionuserid = Session["userid"].ToString();
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {

                Label user = (Label)e.Item.FindControl("lblPostUserID");
                Label posID = (Label)e.Item.FindControl("lblpostClassID");
                ImageButton imgPostClose = (ImageButton)e.Item.FindControl("imgBtnClosePost");

                LinkButton linkShowAllComment = (LinkButton)e.Item.FindControl("lblshowAllComment");
                Image imgShowAllcom = (Image)e.Item.FindControl("imgPicAllcom");

                string userid = user.Text;


                bool checkOpenShowAllcomment = BLL.Knowledge.selectShowAllComment(posID.Text.ToString());
                if (checkOpenShowAllcomment)
                {
                    linkShowAllComment.Visible = true;
                    imgShowAllcom.Visible = true;
                }

                if (sessionuserid.Equals(userid))
                {
                    imgPostClose.Visible = true;

                }

                /***************imageuser*******************************/

                string usertype = Session["userType"].ToString();
                string path = BLL.mainManage.selectPathPictureUser(sessionuserid, usertype);
                ImageButton imgOwn = (ImageButton)e.Item.FindControl("imgOwn");
                imgOwn.ImageUrl = path;

                /***********************************************/
            }

        }

        protected void lvwComments_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            /**************************
             * 
             * เช็คการเปิดปุ่มลบของการคอมเม้น
             * 
             ************************** */
            string sessionuserid = Session["userid"].ToString();
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {

                Label user = (Label)e.Item.FindControl("lblcomuseridID");
                ImageButton imgPostClose = (ImageButton)e.Item.FindControl("imgBtnCloseComment");

                string userid = user.Text;

                if (sessionuserid.Equals(userid))
                {
                    imgPostClose.Visible = true;
                }
            }
        }




        protected void DataPagerPost_PreRender(object sender, EventArgs e)
        {
            showLIstview();
        }



        protected void lblshowAllComment_Click(object sender, EventArgs e)
        {
            /*********************************
             * 
             * แสดงคอมเม้นทั้งหมด
             * 
             * *****************************/
            LinkButton objImage = (LinkButton)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0];

            LinkButton lblshowAll = (LinkButton)objImage.FindControl("lblshowAllComment");
            lblshowAll.Visible = false;



            TextBox tbcomment = (TextBox)objImage.FindControl("textarea");

            postID = id;
            tbcomment.Focus();
        }

        protected void imgBtnClosePost_Click(object sender, ImageClickEventArgs e)
        {
            /********************************
             * 
             * ลบข้อมูลโพสต์
             * 
             * *****************************/
            ImageButton objImage = (ImageButton)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string posid = commandArgs[0];
            string userid = commandArgs[1];

            bool delPost = BLL.Knowledge.closePost(posid);
            if (delPost)
            {
                showLIstview();
            }

        }

        protected void imgBtnCloseComment_Click(object sender, ImageClickEventArgs e)
        {
            /********************************
             * 
             * ลบข้อมูลคอมเม้น
             * 
             * *****************************/

            ImageButton objImage = (ImageButton)sender;

            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string commentid = commandArgs[0];
            string userid = commandArgs[1];


            bool delPost = BLL.Knowledge.closeComment(commentid);
            Label tbcomment = (Label)objImage.FindControl("lbldetailComment");
            if (delPost)
            {
                showLIstview();
                tbcomment.Focus();
            }




        }




    }
}