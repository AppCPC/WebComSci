using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DAL
{
    public class Picture
    {
        private static SqlConnection objConn;
        private static SqlCommand objCmd;
        public static bool insertPicture(Entity.Picture picture)
        {
            try
            {

                string sqlInsert = @"INSERT INTO Picture(Album_ID,Picture_Name,Picture_Detail,Picture_Path, Picture_Status, Create_date)
                                   VALUES(@albunID,@pictureName,@pictureDetail,@picturePath,'A',GetDate())";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@albunID", SqlDbType.Int).Value = picture.Album_ID;
                objCmd.Parameters.Add("@pictureName", SqlDbType.NVarChar).Value = picture.Picture_Name.ToString();
                objCmd.Parameters.Add("@pictureDetail", SqlDbType.NVarChar).Value = picture.Picture_Detail.ToString();
                objCmd.Parameters.Add("@picturePath", SqlDbType.NVarChar).Value = picture.Picture_Path.ToString();

                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }


        }
    }
}
