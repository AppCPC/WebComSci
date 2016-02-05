using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DAL
{
   public class Assurance
    {

        private static SqlConnection objConn;
        private static SqlCommand objCmd;


        public static DataTable LoadAll(string search)
        {
            try
            {
                string sqlString = "SELECT * FROM   Assurance INNER JOIN Employee ON Assurance.Update_user = Employee.Emp_ID ";
                if (!string.IsNullOrEmpty(search))
                {
                    sqlString += " WHERE Assurance_Name like '%" + search + "%'  ";
                }
                sqlString += "   order by Update_date DESC";

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



        public static bool insertAssurance(Entity.AssuranceInfo assurance)
        {
            try
            {

                string sqlInsert = @"INSERT INTO Assurance(Assurance_Name,Assurance_Detail,Assurance_Path,Assurance_Status, Create_date, Date_End, Create_user,Update_date,Update_user)
                                   VALUES(@title,@Detail,@Path,'A',GetDate(),convert(datetime, @endDate, 103),@user,convert(datetime, @endDate, 103),@userupdate)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = assurance.Assurance_Name.ToString();
                objCmd.Parameters.Add("@Detail", SqlDbType.NVarChar).Value = assurance.Assurance_Detail.ToString();
                objCmd.Parameters.Add("@Path", SqlDbType.NVarChar).Value = assurance.Assurance_Path.ToString();
                objCmd.Parameters.Add("@endDate", SqlDbType.NVarChar).Value = assurance.Date_End.ToString();
                objCmd.Parameters.Add("@user", SqlDbType.Int).Value = assurance.Create_user;
                objCmd.Parameters.Add("@@userupdate", SqlDbType.Int).Value = assurance.Update_user;



                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }


        }

        public static Entity.AssuranceInfo selectShowPopup(string id)
        {
            try
            {
                SqlDataReader dtReader;
                Entity.AssuranceInfo stdNews = new Entity.AssuranceInfo();
                string sqlString = "SELECT Assurance_Name, Assurance_Detail, Assurance_Path, Assurance_Status, convert(datetime, Date_End, 103) as date FROM Assurance where Assurance_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    stdNews.Assurance_Name = dtReader["Assurance_Name"].ToString();
                    stdNews.Assurance_Detail = dtReader["Assurance_Detail"].ToString();
                    stdNews.Assurance_Path = dtReader["Assurance_Path"].ToString();
                    stdNews.Assurance_status = dtReader["Assurance_Status"].ToString();
                    stdNews.Date_End = dtReader["date"].ToString();

                }
                dtReader.Close();
                objConn.Close();
                return stdNews;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool updateAssurance(Entity.AssuranceInfo update)
        {
            try
            {
                string sqlUpdate = @"UPDATE Assurance SET Assurance_Name=@title, Assurance_Detail=@detail,
                                    Assurance_Path=@path,Assurance_Status=@status, Update_date =GetDate(), Update_user =@user, Date_End =convert(datetime, @endDate, 103) where  Assurance_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = update.Assurance_ID.ToString();
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = update.Assurance_Name.ToString();
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = update.Assurance_Detail.ToString();
                objCmd.Parameters.Add("@path", SqlDbType.NVarChar).Value = update.Assurance_Path.ToString();
                objCmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = update.Assurance_status.ToString();
                objCmd.Parameters.Add("@endDate", SqlDbType.NVarChar).Value = update.Date_End.ToString();
                objCmd.Parameters.Add("@user", SqlDbType.Int).Value = update.Update_user;

                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;

            }
            catch (Exception)
            {

                return false;
            }


        }

        public static bool deleteAssurance(string AssuranceID)
        {
            try
            {
                string sqlUpdate = "DELETE FROM Assurance Where Assurance_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(AssuranceID);

                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;

            }
            catch (Exception)
            {
                return false;
            }

        }

        public static string selectPicturePath(string setAssurance)
        {
            string path = "";

            try
            {

                SqlDataReader dtReader;
                string sqlString = "SELECT * FROM Assurance where Assurance_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(setAssurance);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    path = dtReader["Assurance_Path"].ToString();
                }
                dtReader.Close();
                objConn.Close();
                return path;
            }
            catch (Exception)
            {
                return null;
            }

        }
    }
}
