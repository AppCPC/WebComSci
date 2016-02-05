using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Text;
namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class DetailHoneWorkTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("id");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("level");
            resultdt.Columns.Add("roomid");
            resultdt.Columns.Add("num");
            resultdt.Columns.Add("Homework_Path");
            resultdt.Columns.Add("senddate");
            resultdt.Columns.Add("sendtime");
            
            string numhomework=Request.QueryString["numhom"];
            string detailTeachid = Request.QueryString["dchID"];

            DataTable dt = BLL.ClassRoom.showStudentSendHomeWork(detailTeachid,numhomework);
            if (dt != null)
            {
                int i = 1;
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {

                        resultdt.Rows.Add(i, row[0].ToString() + "  " + row[1].ToString(), row[2], row[3], row[4], row[5], row[6], row[7]);
                        i++;
                    }
                }
            }

            dgvShowGrade.DataSource = dt;
            dgvShowGrade.DataBind();

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

        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }
        protected void linkimage_Click(object sender, EventArgs e)
        {
            LinkButton objImage = (LinkButton)sender;
            string[] commandArgs = objImage.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0];
            if (id.Length > 0)
            {
                DownloadFile(id);
            }
            else {

                ShowMessageWeb("นักศึกษาคนนี้ยังไม่ได้ส่งการบ้านไม่สามารถดาว์โหลดไฟล์นี้ได้ ! ");
            }
        }

        protected void dgvShowGrade_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               // e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#E56E94'");
                //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#D3D3D3'");
                string data = e.Row.Cells[5].Text;
                if (data.Length < 0 || data.Equals("&nbsp;"))
                {
                    e.Row.Cells[7].Text = "นักศึกษายังไม่ได้ส่งการบ้าน..";
                   e.Row.BackColor = Color.FromName("#E56E94");
                  //  e.Row.Cells[7].BackColor = System.Drawing.Color.BlanchedAlmond;

                }
            } 
        }
    }
}