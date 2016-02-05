using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace DAL
{
    public class Album
    {

        private static SqlConnection objConn;
        private static SqlCommand objCmd;

        public static DataTable LoadAlbum(string search)
        {
            try
            {
                string sqlString = "SELECT * FROM  AlbumPicture WHERE Create_User = '" + search + "'";
              
                ConnectDB connja = new ConnectDB();
                SqlDataAdapter dtAdapter;
                DataTable dt = new DataTable();
                objConn = new SqlConnection();
                objConn.ConnectionString = connja.connectPath();
                objConn.Open();

                dtAdapter = new SqlDataAdapter(sqlString, objConn);
                dtAdapter.Fill(dt);
                objConn.Close();

                return dt;

            }
            catch (Exception)
            {
                return null;
            }
        }
        public static DataTable CountAlbum()
        {
            try
            {
                string sqlString = "SELECT COUNT(Album_ID) + 1 AS COUNT_ID FROM  AlbumPicture";

                ConnectDB connja = new ConnectDB();
                SqlDataAdapter dtAdapter;
                DataTable dt = new DataTable();
                objConn = new SqlConnection();
                objConn.ConnectionString = connja.connectPath();
                objConn.Open();

                dtAdapter = new SqlDataAdapter(sqlString, objConn);
                dtAdapter.Fill(dt);
                objConn.Close();

                return dt;

            }
            catch (Exception)
            {
                return null;
            }
        }



        public static bool insertAlbum(Entity.AlbumPicture album)
        {
            try
            {

                string sqlInsert = @"INSERT INTO AlbumPicture(Album_Name,Create_User,Create_date)
                                   VALUES(@albumName,@createUser,getdate())";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@albumName", SqlDbType.NVarChar).Value = album.Album_Name.ToString();
                objCmd.Parameters.Add("@createUser", SqlDbType.NVarChar).Value = album.Create_User.ToString();



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
