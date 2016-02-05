using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DAL
{
     public class ConnectDB
    { 
           //   public string connectString = "Data Source=122.155.0.74\\MSSQLSERVER2008,49173;Initial Catalog=WEBCSDB;Persist Security Info=True;User ID=sa;Password=@mkspwd1";
       //public string connectString = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];

   //public string connectString = "Data Source=POOM_MON-PC\\POOM;Initial Catalog=WEBCSDB;Integrated Security=True";

         //public string connectString = "Data Source=LEN0002;Initial Catalog=WEBCSDB;Persist Security Info=True;User ID=sa;Password=pass@word1";
        public string connectString = "Data Source=.;Initial Catalog=WEBCSDB;Persist Security Info=True;User ID=sa;Password=pass@word1";

         
         public string connectPath() { 
             return connectString;
         }


         #region Format insert/update/delete
         //case : 1
         /*
         public void excuteNonQuery(string query)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.Add("@x",SqlDbType.NVarChar)="x";
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
         */

         //case: 2


            #endregion

    }



 }
