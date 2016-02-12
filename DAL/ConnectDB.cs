using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;

namespace DAL
{
     public class ConnectDB
    {  
         public string connectPath() {
             return WebConfigurationManager.ConnectionStrings["WEBCSDBConnectionString"].ConnectionString;  
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
