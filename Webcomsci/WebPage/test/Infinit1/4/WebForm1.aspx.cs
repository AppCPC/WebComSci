using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.test.Infinit1._4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //stringbuider sb =new stringbuider();
            string sb = "";

            // $country_select = mysql_query("SELECT * FROM `countries` ORDER BY country_id DESC LIMIT 10");
            for (int i = 0; i < 10; i++)
            {
                sb += "<div class='as_country_container' id=" + i + "> <!-- set the mysql row id or primary key value as div id here -->";
                sb += "   <table>";
                sb += "    <tr>";
                sb += "       <td style='width:300px;'>" + i + "</td>";
                sb += "      <td><img src='zw.png'  alt='" + i + "' title='" + i + "' /></td>";
                sb += "  </tr>";
                sb += "  </table>";
                sb += " </div>";
            }
            ltlRolad.Text = sb;
        }
    }
}