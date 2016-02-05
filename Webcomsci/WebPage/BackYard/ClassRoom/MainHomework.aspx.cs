using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class MainHomework : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string usertype = Session["userType"].ToString();

                if (usertype.Equals("ST"))
                {
                    string classid = Request["classid"].ToString();
                    string dchID = Request["dchID"].ToString();
                    string subjectcode = Request["subjectcode"].ToString();
                    string ShowPlan_Id = Request["ShowPlan_Id"].ToString();
                    Response.Redirect("HomeWorkStudent.aspx?classid=" + classid + "&dchID=" + dchID + "&subjectcode=" + subjectcode + "&ShowPlan_Id=" + subjectcode);
                }


                if (!Page.IsPostBack)
                {

                    selectShowListView();

                }

            }
            catch (Exception ex)
            {

            }


        }
        private void selectShowListView()
        {

            string classid = Request.QueryString["classid"];
            string dchID = Request["dchID"].ToString();
            DataTable dt = BLL.ClassRoom.selectShowListViewMainHomework(classid, dchID);


           

            ListviewHomeWork.DataSource = dt;
            ListviewHomeWork.DataBind();




        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            LinkButton objImage = (LinkButton)sender;
            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0];
            string tchid = commandArgs[1];
            bool delete = BLL.ClassRoom.deleteHomeWorkByTeacher(id, tchid);
            if (delete) { ShowMessageWeb("ลบข้อมูลการบ้านเรียบร้อย ! "); }
            else { ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถลบข้อมูลได้"); }

            selectShowListView();
        }

        protected void btncreateHomework_Click(object sender, EventArgs e)
        {
            string homeworkname = txtCreateHomeWork.Text;
            string classid = Request.QueryString["classid"];
            string tchid = Session["userid"].ToString();
            string dthId = Request.QueryString["dchID"];
            if (homeworkname.Length > 0)
            {
                bool insertHomeWorkfilename = BLL.ClassRoom.insertHomeWorkfileName(homeworkname, dthId, tchid);
                if (insertHomeWorkfilename)
                {
                    ShowMessageWeb("ระบบได้สร้างไฟล์การบ้านแล้ว ! ");
                    txtCreateHomeWork.Text = "";
                    ListviewHomeWork.DataBind();

                }
                else
                {
                    ShowMessageWeb("การสร้างไฟล์การบ้านล้มเหลว");
                }
            }
            else
            {

                ShowMessageWeb("ไม่พบข้อมูลชื่อไฟล์การบ้านที่อาจารย์ต้องการจะสร้าง ! ");
            }

            selectShowListView();

        }
    }
}