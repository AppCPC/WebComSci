using System;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Webcomsci.WebPage.BackYard.ClassRoom
{
    public partial class checkNameSum : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e){

             if (!Page.IsPostBack) {
                 checkName();
             }
        }

        private void checkName() {


            string detailid = Request["deEduStd"].ToString();
                DataTable dt = new DataTable();
                DataTable dt3 = new DataTable();
                dt3.Columns.Add("no");
                dt3.Columns.Add("camCode");
                dt3.Columns.Add("Std_FName");
                dt3.Columns.Add("Std_LName");
                dt3.Columns.Add("student");
                dt3.Columns.Add("Late");
                dt3.Columns.Add("nostd");


                dt = BLL.ClassRoom.checkNameSum(detailid);

            int count=1;

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                         DataTable dt2 = new DataTable();
                        try
                        {
                               dt2.Rows.Clear();
                            dt2 = BLL.ClassRoom.checkNameSumShowDetail(row["enrollID"].ToString(),detailid);

                          

                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }


                        foreach (DataRow rows in dt2.Rows)
                        {
                            dt3.Rows.Add(count,rows["camCode"].ToString(), rows["Std_FName"].ToString(), rows["Std_LName"].ToString(), rows["student"].ToString(), rows["Late"].ToString(), rows["nostd"].ToString());
                        }
                        
                        count++;
                        }




                    ViewState["dtList"] = dt3;

                    gvdetails.DataSource = dt3;
                    gvdetails.DataBind();
   
                }


        }


        protected void btnExcel_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                DataTable dt1 = (DataTable)ViewState["dtList"];
                if (dt1 == null)
                {
                    throw new Exception("No Records to Export");
                }
                string Path = "D:\\TestExportExcell\\ExcelCheckNameStudent_" + DateTime.Now.Day.ToString() + "_" + DateTime.Now.Month.ToString() + ".xls";
                //string Path = "D:\\ImportExcelFromDatabase\\myexcelfile_" + DateTime.Now.Day.ToString() + "_" + DateTime.Now.Month.ToString() + ".xls";
                FileInfo FI = new FileInfo(Path);
                StringWriter stringWriter = new StringWriter();
                HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWriter);
                DataGrid DataGrd = new DataGrid();
                DataGrd.DataSource = dt1;
                DataGrd.DataBind();


                DataGrd.RenderControl(htmlWrite);
                string directory = Path.Substring(0, Path.LastIndexOf("\\"));// GetDirectory(Path);
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                System.IO.StreamWriter vw = new System.IO.StreamWriter(Path, true);
                stringWriter.ToString().Normalize();
                vw.Write(stringWriter.ToString());
                vw.Flush();
                vw.Close();
                WriteAttachment(FI.Name, "application/vnd.ms-excel", stringWriter.ToString());
            }
            catch (Exception ex)
            {
                //throw new Exception(ex.Message);
            }
        }
        public static void WriteAttachment(string FileName, string FileType, string content)
        {
            HttpResponse Response = System.Web.HttpContext.Current.Response;
            Response.ClearHeaders();
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + FileName);
            Response.ContentType = FileType;
            Response.Write(content);
            Response.End();

        }

        protected void gvdetails_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //    e.Row.CssClass = "row";

            if (e.Row.RowType == DataControlRowType.DataRow &&
                e.Row.RowState == DataControlRowState.Normal)
                e.Row.CssClass = "row";

            //Add CSS class on alternate row.
            if (e.Row.RowType == DataControlRowType.DataRow &&
            e.Row.RowState == DataControlRowState.Alternate)
                e.Row.CssClass = "alternate";
        }

    }
}