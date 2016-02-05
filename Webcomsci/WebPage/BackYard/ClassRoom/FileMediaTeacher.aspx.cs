using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class FileMediaTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                string usertype=Session["userType"].ToString();

                if (usertype.Equals("ST"))
                { 
                   string classid=Request["classid"].ToString();
                   string dchID=Request["dchID"].ToString();
                  string subjectcode=Request["subjectcode"].ToString();
                  string ShowPlan_Id=Request["ShowPlan_Id"].ToString();
                  Response.Redirect("FileMediaStudent.aspx?classid=" + classid + "&dchID=" + dchID + "&subjectcode=" + subjectcode + "&ShowPlan_Id=" + subjectcode);
                }

                DataTable resultdt = new DataTable();
                resultdt.Columns.Add("InstMedia_ID");
                resultdt.Columns.Add("InstMedia_Name");
                resultdt.Columns.Add("InstMedia_Type");
                resultdt.Columns.Add("InstMedia_Size");
                resultdt.Columns.Add("InstMedia_Path");
                resultdt.Columns.Add("InstMedia_Description");
                resultdt.Columns.Add("Create_date");
                resultdt.Columns.Add("DetailTech_ID");
                resultdt.Columns.Add("image");
                string classroomid = Request.QueryString["classid"];
                DataTable dt=new DataTable();
                dt = BLL.ClassRoom.selectShowListViewFileMediaTeacher(classroomid);

                foreach (DataRow roo in dt.Rows)
                {
                    string image;
                    if (roo[2].Equals("txt")) { image = "../../../image/Back/Classroom/notepad.png"; }
                    else if(roo[2].Equals("doc") || roo[2].Equals("docx")){image="../../../image/Back/Classroom/ms_word_2.png";}
                    else if(roo[2].Equals("ppt") || roo[2].Equals("pptx")){image="../../../image/Back/Classroom/powerpoint.png";}
                    else if(roo[2].Equals("xls") || roo[2].Equals("xlsx")){image="../../../image/Back/Classroom/excel.png";}
                    else if(roo[2].Equals("zip") || roo[2].Equals("rar")){image="../../../image/Back/Classroom/winrar.png";}
                    else if(roo[2].Equals("pdf")){image="../../../image/Back/Classroom/filetype_pdf.png";}
                    else {
                        image="../../../image/Back/Classroom/Other.png";
                    }

                    string filesize;
                    if (Convert.ToDouble(roo[3].ToString()) > 1048576)
                    {
                        double mfile = Convert.ToDouble(roo[3].ToString());
                        filesize = ((mfile / 1024 / 1024)).ToString("0.00") + " MB";

                    }
                    else if (Convert.ToDouble(roo[3].ToString()) > 1024) {
                        double mfile = Convert.ToDouble(roo[3].ToString());
                        filesize = ((mfile / 1024)).ToString("0.00") + " KB";
                    }
                    else {
                        filesize = roo[3].ToString() + " Byte";
                    }

                    resultdt.Rows.Add(roo[0],roo[1],roo[2],filesize,roo[4],roo[5],roo[6],roo[7],image);
                }

                if (resultdt.Rows.Count > 0) { DataPager.Visible = true; }

                ListViewShowfileMedia.DataSource = resultdt;
                ListViewShowfileMedia.DataBind();
                
            }
            catch (Exception)
            {

            }

        }

        protected void DataPagershowMediafile_PreRender(object sender, EventArgs e)
        {
        //    ProductList db = new ProductList();
        //    this.ListViewProducts.DataSource = db.GellAll();
        //    this.ListViewProducts.DataBind();
        }


        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        static public void DownloadFile(string filePath)
        {
            try
            {
                HttpContext.Current.Response.ContentType =
                            "application/octet-stream";
                HttpContext.Current.Response.AddHeader("Content-Disposition",
                  "attachment; filename=" + System.IO.Path.GetFileName(filePath));
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.WriteFile(filePath);
                HttpContext.Current.Response.End();
               
            }
            catch (Exception ex)
            {
               
            }
        }
     
        protected void lnkbtndownload_Click(object sender, EventArgs e)
        {
            LinkButton objImage = (LinkButton)sender;
            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0];
            DownloadFile(id);
            
        }

        protected void lnkbtnDelete_Click(object sender, EventArgs e)
        {
            LinkButton objImage = (LinkButton)sender;
            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0];
            string path = commandArgs[1];
            

            if (path.Length > 0)
            {
                System.IO.File.Delete(Server.MapPath(path));
            }


            bool delete = BLL.ClassRoom.deleteFileMedia(id);

            if (delete)
            {
                ShowMessageWeb("ลบข้อมูลเสร็จสิ้น! ");

                ListViewShowfileMedia.DataBind();
           

            }
            else
            {
                ShowMessageWeb("เกิดข้อผิดพลาดไม่สามารถลบข้อมูลได้ ! ");

            }

            
        }

    }
}