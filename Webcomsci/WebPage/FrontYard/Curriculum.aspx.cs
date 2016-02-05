using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Webcomsci
{
    public partial class Curriculum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {

                DateTime datetime = DateTime.Now;
                string yy = (datetime.Year+543).ToString();
                string year = BLL.Curriculum.getYearCurri(yy);
                lblyear.Text = year.ToString();

                string maxCredit = BLL.Curriculum.getMaxCredit(year);
                lblCrediteAll.Text = maxCredit;

                DataTable dtCouse = BLL.Curriculum.getCourse(year);
                if (dtCouse.Rows.Count > 0)
                {
                    string content="";
                    int i = 1;

                    foreach (DataRow row in dtCouse.Rows)
                    {
                    
                        content += "<p class='fontnumber'>"+"&nbsp;"+i+") " + row[0].ToString()+" </p>";
                        DataTable dtgroup = BLL.Curriculum.getGroup(year,row[0].ToString());
                        if (dtgroup.Rows.Count > 0)
                        {
                            int j = 1;
                            foreach (DataRow rr in dtgroup.Rows)
                            {
                                if (j == 1)
                                {
                                    content += " <p class='fontnumber4'>"+rr[2].ToString()+" หน่วยกิต</p>";
                                }
                                content += "<p class='fontnumber3'>" + i + "." + j + "  " + rr[0].ToString() + "</p>";
                                content += "<p class='fontnumber4'>" + rr[1].ToString() + " หน่วยกิต</p>";
                                j++;
                            }

                        }
                        i++;
                        
                    }

                    contentCurri.InnerHtml = content;
                }
                

            }

        }
    }
}