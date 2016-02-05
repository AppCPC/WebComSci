using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.FrontYard
{
    public partial class showDetailNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string requestID = Request["id"].ToString();
            string sub = requestID.Substring(0,1);
            string query = requestID.Substring(1, requestID.Length-1);
            if (sub== "1") { 
                lbltitle.Text = "ข่าวสาขา";

                Entity.BranchNewsInfo branch = new Entity.BranchNewsInfo();
                branch = BLL.BranchNews.selectBranchNewsShowDetailNewsPage(query);
                lblheader.Text = branch.BranchNews_Name;
                detail.InnerHtml = branch.Branch_Detail;
                //imgPic.ImageUrl = branch.Branch_Path;
                imgPic.ImageUrl = "../../image/slideshow/11.png";
                lbltime.Text = branch.Update_date;

            }
            else if (sub == "2") { 
                lbltitle.Text = "ข่าวฝึกอบรม";
                Entity.TrainingNewsInfo train = new Entity.TrainingNewsInfo();
                train = BLL.TrainingNews.selectTrainingNewsShowDetailNewsPage(query);
                lblheader.Text = train.Training_Name;
                detail.InnerHtml = train.Training_Detail;
                imgPic.ImageUrl = train.Training_Path;
                lbltime.Text = train.Update_date;

            }
            else if (sub == "3") { 
                lbltitle.Text = "ผลงานสาขา";
                Entity.WorkBranchNewsInfo workbranch = new Entity.WorkBranchNewsInfo();
                workbranch = BLL.WorkBranchNews.selectTrainingNewsShowDetailNewsPage(query);
                lblheader.Text = workbranch.WorkBranchNews_Name;
                detail.InnerHtml = workbranch.WorkBranchNews_Detail;
                imgPic.ImageUrl = workbranch.WorkBranchNews_Path;
                lbltime.Text = workbranch.Update_date;
            }
            else if (sub == "4") {
                lbltitle.Text = "กิจกรรมนักศึกษา";
                lblheader.Text = query;
                Entity.StudentNewsInfo stdNews = new Entity.StudentNewsInfo();
                stdNews = BLL.StudentNews.selectTrainingNewsShowDetailNewsPage(query);
                lblheader.Text = stdNews.StudentNews_Name;
                detail.InnerHtml = stdNews.StudentNews_Detail;
                imgPic.ImageUrl = stdNews.StudentNews_Path;
                lbltime.Text = stdNews.Update_date;
            }
            else if (sub == "5")
            {
                lbltitle.Text = "ข่าวประกาศ";
                lblheader.Text = query;
                Entity.SlideShow slide = new Entity.SlideShow();
                slide = BLL.SlideShow.selectBranchNewsShowDetailNewsPage(query);
                lblheader.Text = slide.SlideShow_Name;
                detail.InnerHtml = slide.SlideShow_Detail;
                imgPic.ImageUrl = slide.SlideShow_Path;
                lbltime.Text = slide.Update_date;
            }



        }
    }
}