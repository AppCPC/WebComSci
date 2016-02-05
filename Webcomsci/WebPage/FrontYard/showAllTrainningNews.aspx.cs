using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.FrontYard
{
    public partial class showAllTrainningNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string search = "";


            lbltitle.Text = "รวมข่าวฝึกอบรม";
            this.ListViewNews.DataSource = BLL.TrainingNews.LoadAll(search);

            this.ListViewNews.DataBind();
        }

        protected void DataPagerNews_PreRender(object sender, EventArgs e)
        {

        }

      
    }
}