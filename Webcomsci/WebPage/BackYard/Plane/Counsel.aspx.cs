using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.BackYard.Plane
{
    public partial class Counsel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string userId = "";
            //if (Session["userid"].ToString() != null)
            //{
            //    HiddenFieldStudentCode.Value = Session["userid"].ToString();
            //    userId = Session["userid"].ToString();
            //}
            //if (!Page.IsPostBack)
            //{
            //    LoadAllStudy(userId);
            //}
        }

        [WebMethod()]
        public static string getSelect(string studentCode)
        {
            DataTable dt = BLL.PlanEducate.LoadListBoxCounsel(studentCode);

            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("Detail", typeof(string));
            dt.Columns.Add("Grade", typeof(string));

            StringBuilder sb = new StringBuilder();
            foreach (DataRow item in dt.Rows)
            {
                string classCss = "";
                if ((item[3].ToString()).Equals("N"))
                {
                    classCss = "myListBox-red";
                }
                else
                {
                    classCss = "myListBox-green";
                }
                sb.Append("<option class='" + classCss + "' value='" + item[1] + "' data-status='" + item[3] + "' data-Credit='" + item[4] + "' >" + item[2] + "</option>");
            }
            return sb.ToString();
        }

        public void LoadAllStudy(string studentCode)
        {
            DataTable dt = BLL.PlanEducate.LoadAllLisbox(studentCode);

            ListBoxShowAllItem.DataSource = dt;
            ListBoxShowAllItem.DataTextField = "subThai";
            ListBoxShowAllItem.DataValueField = "subcode";
            ListBoxShowAllItem.DataBind();
        }
    }
}