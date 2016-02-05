using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webcomsci.WebPage.test
{
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmdrtLoad = new SqlCommand();
            cmdrtLoad.Parameters.Add(new SqlParameter("@codename", "025230461072-5"));
            Response.Write(CommonClass.AccessSqlDb.GetData_Store("SP_ManageRole_TabLeftBlackEnd", cmdrtLoad).Tables[0].Rows[0][0].ToString());
        }
    }
}