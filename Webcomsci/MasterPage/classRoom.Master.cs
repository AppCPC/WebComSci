using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Webcomsci.MasterPage
{
    public partial class classRoom : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                string usertype = Session["userType"].ToString();
                //DataTable dtShowAllUser = BLL.mainManage.selectShowAllUserSearch();
                //rptShowSearchuser.DataSource = dtShowAllUser;
                //rptShowSearchuser.DataBind();

                string userId = Session["userid"].ToString();
                //     string path = BLL.mainManage.selectPathPictureUser(userId, usertype);
                //imgUser.ImageUrl = path;
                lblname.Text = Session["name"].ToString();


                string imgurl = Session["picturepath"].ToString();
                if (imgurl.Length > 0)
                {
                    imgUser.ImageUrl = imgurl.ToString();
                    imgprofile.ImageUrl = imgurl.ToString();
                }
                else
                {
                    imgUser.ImageUrl = "/image/User.png";
                    imgprofile.ImageUrl = "/image/User.png";

                } 
                if (string.IsNullOrEmpty(usertype))
                {
                    Response.Redirect("../../../WebPage/Authen/Login.aspx");
                }


                if (usertype.Equals("TE") || usertype.Equals("TS"))
                {
                    spanCheckname.Visible = true;
                    spanmanageroom.Visible = true;
                    b3.Visible = false;
                }
            }
            catch (Exception)
            {

                Response.Redirect("../../../WebPage/Authen/Login.aspx");
            }

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true); 
        }

        //protected void btnCreateUser_Click(object sender, EventArgs e)
        //{
        //     //PostBackUrl="~/WebPage/BackYard/ClassRoom/MainCreateUserInClass.aspx" 
        //    string deid = Request.QueryString["dchID"];
        //    string subcode = Request.QueryString["subjectcode"];
        //    string showPlan = Request.QueryString["ShowPlan_Id"];
        //    string classid = Request.QueryString["classid"];

        //    Response.Redirect("~/WebPage/BackYard/ClassRoom/MainRoomMangeUserInClass.aspx?classid=" + classid + "&dchID=" + deid + "&subjectcode=" + subcode + "&ShowPlan_Id=" + showPlan);
        //}

        //protected void btnFileMedia_Click(object sender, EventArgs e)
        //{
        //    string userType = Session["userType"].ToString();

        //    string deid = Request.QueryString["dchID"];
        //    string subcode = Request.QueryString["subjectcode"];
        //    string showPlan = Request.QueryString["ShowPlan_Id"];
        //    string classid = Request.QueryString["classid"];

        //    if (userType.Equals("TE") || userType.Equals("TS"))
        //    {
        //        Response.Redirect("~/WebPage/BackYard/ClassRoom/FileMediaTeacher.aspx?classid=" + classid + "&dchID=" + deid + "&subjectcode=" + subcode + "&ShowPlan_Id=" + showPlan);
        //    }
        //    else {
        //        Response.Redirect("~/WebPage/BackYard/ClassRoom/FileMediaStudent.aspx?classid=" + classid + "&dchID=" + deid + "&subjectcode=" + subcode + "&ShowPlan_Id=" + showPlan);
        //    }
        //}

        //protected void btncheck_Click(object sender, EventArgs e)
        //{
        //    string deid = Request.QueryString["dchID"];
        //   string subcode=Request.QueryString["subjectcode"];
        //   string showPlan = Request.QueryString["ShowPlan_Id"];
        //    string classid=Request.QueryString["classid"];
        //    Response.Redirect("~/WebPage/BackYard/ClassRoom/MainCheckName.aspx?classid="+classid+"&dchID="+deid+"&subjectcode="+subcode+"&ShowPlan_Id="+showPlan);
        //}

        //protected void btnCommentClass_Click(object sender, EventArgs e)
        //{
        //    string deid = Request.QueryString["dchID"];
        //    string subcode=Request.QueryString["subjectcode"];
        //    string showPlan = Request.QueryString["ShowPlan_Id"];
        //    string classid=Request.QueryString["classid"];
        //    Response.Redirect("~/WebPage/BackYard/ClassRoom/CommentClassroom.aspx?classid="+classid+"&dchID="+deid+"&subjectcode="+subcode+"&ShowPlan_Id="+showPlan);
        //}

        //protected void btnhomework_Click(object sender, EventArgs e)
        //{
        //    string deid = Request.QueryString["dchID"];
        //    string subcode = Request.QueryString["subjectcode"];
        //    string showPlan = Request.QueryString["ShowPlan_Id"];
        //    string classid = Request.QueryString["classid"];
        //    Response.Redirect("~/WebPage/BackYard/ClassRoom/MainHomework.aspx?classid=" + classid + "&dchID=" + deid + "&subjectcode=" + subcode + "&ShowPlan_Id=" + showPlan);

        //}
    }
}