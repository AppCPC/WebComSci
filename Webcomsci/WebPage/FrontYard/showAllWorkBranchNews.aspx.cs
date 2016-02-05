using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.FrontYard
{
    public partial class showAllWorkBranchNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string search ="";

            
                lbltitle.Text = "รวมข่าวผลงานสาขา";
                this.ListViewProducts.DataSource = BLL.WorkBranchNews.LoadAll(search);
           

          //   this.ListViewProducts.DataSource = BLL.WorkBranchNews.LoadAll(search);

            this.ListViewProducts.DataBind();
        }

        protected void DataPagerProducts_PreRender(object sender, EventArgs e)
        {

        }
    }
}