using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.FrontYard
{
    public partial class showAllStudentNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string search = "";


            lbltitle.Text = "รวมข่าวกิจกรรมนักศึกษา";
            this.ListViewNews.DataSource = BLL.StudentNews.LoadAll(search);

            this.ListViewNews.DataBind();
        }

        protected void DataPagerNews_PreRender(object sender, EventArgs e)
        {

        }
    }
}