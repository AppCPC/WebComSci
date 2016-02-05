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
    public partial class CreateDetailTeacherTeach : System.Web.UI.Page
    {

        private string idTch
        {
            get { return ViewState["idTch"].ToString(); }
            set { ViewState["idTch"] = value; }
       
        }

        


        protected void Page_Load(object sender, EventArgs e)
        {
             PopupGetTeacher.RowselectedProType += new BackYard.Admin.ucGetTeacher.RowselectedEventHandler(PopupGetTeacher_RowselectedProType);

            
        }
        private void PopupGetTeacher_RowselectedProType(object sender, string e)
        {
            
            if (!String.IsNullOrEmpty(e))
            {

                    this.txtTchName.Text = e;
                  
                        idTch = e;
                       //modalTeacher.Hide();
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

        protected void gvShowAllDetailSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvShowSubject_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void butSearchSubject_Click(object sender, ImageClickEventArgs e)
        {
           
        }

        protected void butSearchTeacher_Click(object sender, ImageClickEventArgs e)
        {
            modalTeacher.Show();
        }
    }
}