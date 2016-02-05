using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Text;
using System.IO;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class AddExcellStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "Please select an excel file first";
            lblMessage.Visible = false;
        }


        protected object filepath
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {


                if ((txtFilePath.HasFile))
                {

                    OleDbConnection conn = new OleDbConnection();
                    OleDbCommand cmd = new OleDbCommand();
                    OleDbDataAdapter da = new OleDbDataAdapter();
                    DataSet ds = new DataSet();
                    string query = null;
                    string connString = "";
                    string strFileName = DateTime.Now.ToString("ddMMyyyy_HHmmss");
                    string strFileType = System.IO.Path.GetExtension(txtFilePath.FileName).ToString().ToLower();

                    //Check file type
                    if (strFileType == ".xls" || strFileType == ".xlsx")
                    {
                        txtFilePath.SaveAs(Server.MapPath("~/tempExcel/" + strFileName + strFileType));
                    }
                    else
                    {
                        lblMessage.Text = "Only excel files allowed";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Visible = true;
                        return;
                    }

                    string path = "~/tempExcel/" + strFileName + strFileType;
                    string strNewPath = Server.MapPath(path);

                    filepath = path;


                    //Connection String to Excel Workbook
                    if (strFileType.Trim() == ".xls")
                    {
                        connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strNewPath + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (strFileType.Trim() == ".xlsx")
                    {
                        connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strNewPath + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                    }


                    query = "SELECT * FROM [Sheet1$]";
             
                    conn = new OleDbConnection(connString);
                    //Open connection
                    if (conn.State == ConnectionState.Closed) conn.Open();
                    //Create the command object
                    cmd = new OleDbCommand(query, conn);
                    da = new OleDbDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds);

                    grvExcelData.DataSource = ds.Tables[0];
                    grvExcelData.DataBind();

                    lblMessage.Text = "Data retrieved successfully! Total Recodes:" + ds.Tables[0].Rows.Count;
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Visible = true;

                    da.Dispose();
                    conn.Close();
                    conn.Dispose();
                }
                else
                {
                    lblMessage.Text = "Please select an excel file first";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                }

            }
            catch (Exception ex)
            {

                Response.Write(ex.ToString());
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

        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (grvExcelData.Rows.Count > 0)
            {
                foreach (GridViewRow row in grvExcelData.Rows)
                {

                    string code = row.Cells[1].Text;
                    //  string name = row.Cells[2].Text;
                    //string group = txtgroup.Text;
                  //  string classId = Session["classid"].ToString();
                    string detilID = Request.QueryString["dchID"].ToString();
                    bool insert = BLL.ClassRoom.insertStudentExcellInclass(code,detilID);

                    if (insert)
                    {

                        // System.IO.File.Delete(Server.MapPath(filepath.ToString()));
                        if (filepath.ToString().Length > 0)
                        {
                            FileInfo MyFile = new FileInfo(Server.MapPath(filepath.ToString()));
                            if (MyFile.Exists)
                            {
                                MyFile.Delete();
                            }
                        }

                        ShowMessageWeb("บันทึกข้อมูลเสร็จสิ้น ! ");

                        grvExcelData.DataSource = null;
                        grvExcelData.DataBind();

                    }
                    


                }
            }
        }

        protected void imgback_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SubmenuDetailteach.aspx?detailTeachID=" + Request.QueryString["dchID"] + "&subjectcode=" + Request.QueryString["subjectcode"] + "&ShowPlan_Id=" + Request.QueryString["ShowPlan_Id"]);
        }
    }
}