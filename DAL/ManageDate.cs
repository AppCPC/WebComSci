using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class ManageDate
    {
        public static System.Data.DataTable manateYear()
        {
            string sql = "select YEAR(getdate())+542 as passYear,YEAR(getdate())+543 as curYear,YEAR(getdate())+544 as fuYear";

            ClassConnectDB conn = new ClassConnectDB();
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
           
        }
    }
}
