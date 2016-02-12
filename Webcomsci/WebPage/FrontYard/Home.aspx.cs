using System;
using System.Data;

namespace Webcomsci
{
    public partial class Home : System.Web.UI.Page
    {
        public int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            showBranchNews();
            // showSlideShow();
        }

        private void showSlideShow()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("path");

            //for (int i = 0; i < 3; i++)
            //{
            //    dt.Rows.Add("../../image/slideshow/11.png");
            //    dt.Rows.Add("../../image/slideshow/13.png");
            //    dt.Rows.Add("~/image/ManageFontEnd/slideshow/6ddf0439-e680-4b1e-8a17-af4582828c0f.jpg");

            //}

            //dt.AsEnumerable().Take(5);
            dt = BLL.SlideShow.selectShowSlideShowHomePage();

            if (dt.Rows.Count > 0)
            {
                int i = 1;

                foreach (DataRow row in dt.Rows)
                {
                    if (i <= 1)
                    {
                        imgSlideShow.ImageUrl = row[1].ToString();
                    }
                    else
                    {
                        break;
                    }
                    i++;
                }
            }

            //  dt = BLL.SlideShow.selectShowSlideShowHomePage();

            //if (dt.Rows.Count > 0)
            //{
            //    int i = 0;
            //    foreach (DataRow row in dt.Rows)
            //    {
            //        foreach (DataColumn column in dt.Columns)
            //        {
            //            Response.Write(row[column] + "  ");

            //        }
            //        Response.Write("<br/>");
            //        i++;
            //    }
            //    Response.Write("count B " + i.ToString());
            //}

            rptbind.DataSource = dt;
            rptbind.DataBind();
        }

        private void bind(int pageindex)
        {
            // this.myDataList.DataSource = this.Session["branchNewsShow"];
            //// this.myDataList.PageIndex = pageindex;
            // this.myDataList.DataBind();
        }

        private void showBranchNews()
        {
            //Entity.BranchNewsInfo branchShow = new Entity.BranchNewsInfo();
            ////branchShow = BLL.BranchNews.selectShowNews();
            ////this.branchNewsHome.InnerHtml = "hello world";//+branchShow.BranchNews_Name.ToString() + "<br/><hr/>";
            //this.Session["branchNewsShow"] = BLL.BranchNews.selectShowNews();
            //bind(0);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            id++;
        }
    }
}