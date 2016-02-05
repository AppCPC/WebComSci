using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace Webcomsci.WebPage.BackYard.Admin
{
    public partial class ManageUseStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                this.btnSearch_Click(null,null);
            }
        }
        private void bind(int pageindex)
        {
            this.gvList.DataSource = this.Session["studentShowGride"];
            this.gvList.PageIndex = pageindex;
            this.gvList.DataBind();
        }


        protected void gvListStd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bind(e.NewPageIndex);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
          
            string code=txtstdCode.Text.Trim();
            string fname=txtName.Text.Trim();
            string lname=txtLname.Text.Trim();
            string year = txtyearEducate.Text.Trim();

            Session["studentShowGride"] = BLL.Student.searchShowPageStdAdmin(code, fname, lname, year);
            bind(0);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
        public void ShowMessageWeb(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);

        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = "";
            try
            {

                if (e.CommandName == "stdEdit")
                {
                    id = e.CommandArgument.ToString();
                //    Session["stdid"] = id;

                //    modalEditStudent.Show();
                    Response.Redirect("UpdateUserStudent.aspx?idupdate="+id);
                    

                    
                }
                else if (e.CommandName == "stdDelete") {

                    id = e.CommandArgument.ToString();
                    
                    bool del=BLL.Student.deleteUserDelete(id);
                    if (del) {
                        ShowMessageWeb("ลบข้อมูลเรียบร้อย ");

                        this.btnSearch_Click(null, null);
                    }

                }
                }catch(Exception){
                
                
                }

        }
    }
}