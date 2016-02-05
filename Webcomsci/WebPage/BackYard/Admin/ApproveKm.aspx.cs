using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;


namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ApproveKm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAppove_Click(object sender, EventArgs e)
        {
            string id=lblid.Text;
            
            bool app = BLL.Knowledge.appoveKm(id);
            if (app) {
                ShowMessageWeb("อนุมัติองค์ความรู้เรียบร้อย ! ");
                this.ImageButton1_Click(null, null);
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
        }

        private void bind(int pageindex)
        {
            this.gvAppoveKm.DataSource = this.Session["kmsearch"];
            this.gvAppoveKm.PageIndex = pageindex;
            this.gvAppoveKm.DataBind();
        }
   


        protected void gvAppoveKm_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }

        protected void gvAppoveKm_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName == "showDetail")
                {
                    string idkm = e.CommandArgument.ToString();
                   DataTable dt = BLL.Knowledge.selectShowKm(idkm);

                   lblid.Text = dt.Rows[0]["KmPost_ID"].ToString();
                   lbltitle.Text = dt.Rows[0]["KmPost_Name"].ToString();
                  // lbldetail.Text = 
                   editor.Content = dt.Rows[0]["KmPost_Detail"].ToString();
                   lbllink.Text = dt.Rows[0]["KmPost_Link"].ToString();
               
                   lblcreateDate.Text = dt.Rows[0]["KmPost_date"].ToString();

                 string status= dt.Rows[0]["KmPost_Status"].ToString();

                 if (status.Equals("Y")) { btnAppove.Visible = false; }
                 else { btnAppove.Visible = true; }
                    mdlpopup.Show();

                }
                else if (e.CommandName == "deleteKm")
                {
                    string id = e.CommandArgument.ToString();
                    bool del = BLL.Knowledge.deleteKm(id);
                    if (del) {
                        ShowMessageWeb("ลบข้อมูลเสร็จสิ้น ! ");
                    }
                   
                }

                this.ImageButton1_Click(null,null);


            }
            catch (Exception ex)
            {

                ShowMessageWeb("เกิดข้อผิดพลาด : " + ex);
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


        protected void gvAppoveKm_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string title = txttitle.Text.ToString();
            string status = ddlStatus.SelectedValue.ToString();
            string ddtstart = txtdateStart.Text;
            this.Session["kmsearch"] = BLL.Knowledge.showSearch(title,status,ddtstart);
            bind(0);
        }

        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {
            mdlpopup.Hide();
        }

        protected void ContentChanged(object sender, EventArgs e)
        {

        }
    }
}