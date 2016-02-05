using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DAL
{
    public class TrainingNews
    {

        private static SqlConnection objConn;
        private static SqlCommand objCmd;


        public static DataTable LoadAll(string search)
        {
            try
            {
                string sqlString = "SELECT * FROM  Employee INNER JOIN TrainingNews ON Employee.Emp_ID = TrainingNews.Update_user ";
                if (!string.IsNullOrEmpty(search))
                {
                    sqlString += " WHERE Training_Name like '%" + search + "%'  ";
                }
                sqlString += "   order by Update_date DESC ";

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



        public static bool insertTrainingNews(Entity.TrainingNewsInfo train)
        {
            try
            {

                string sqlInsert = @"INSERT INTO TrainingNews(Training_Name,Training_Detail, Training_Path,Training_Status, Create_date, Date_End, Create_user,Update_date,Update_user)
                                   VALUES(@title,@Detail,@Path,'A',GetDate(),convert(datetime, @endDate, 103),@user,GetDate(),@userupdate)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = train.Training_Name.ToString();
                objCmd.Parameters.Add("@Detail", SqlDbType.NVarChar).Value = train.Training_Detail.ToString();
                objCmd.Parameters.Add("@Path", SqlDbType.NVarChar).Value = train.Training_Path.ToString();
                objCmd.Parameters.Add("@endDate", SqlDbType.NVarChar).Value = train.Date_End.ToString();
                objCmd.Parameters.Add("@user", SqlDbType.Int).Value = train.Create_user;
                objCmd.Parameters.Add("@userupdate", SqlDbType.Int).Value = train.Update_user;


                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }


        }

        public static Entity.TrainingNewsInfo selectShowPopup(string id)
        {
            try
            {
                SqlDataReader dtReader;
                Entity.TrainingNewsInfo train = new Entity.TrainingNewsInfo();
                string sqlString = "SELECT Training_Name,Training_Detail,Training_Path, Training_Status, convert(datetime, Date_End, 103) as date FROM TrainingNews where Training_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    train.Training_Name = dtReader["Training_Name"].ToString();
                    train.Training_Detail = dtReader["Training_Detail"].ToString();
                    train.Training_Path = dtReader["Training_Path"].ToString();
                    train.Training_status = dtReader["Training_Status"].ToString();
                    train.Date_End = dtReader["date"].ToString();

                }
                dtReader.Close();
                objConn.Close();
                return train;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool updateTraining(Entity.TrainingNewsInfo update)
        {
            try
            {
                string sqlUpdate = @"UPDATE TrainingNews SET Training_Name=@title, Training_Detail=@detail,
                                    Training_Path=@path,Training_Status=@status, Update_date =GetDate(), Update_user =@user, Date_End =convert(datetime, @endDate, 103) where  Training_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = update.Training_ID.ToString();
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = update.Training_Name.ToString();
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = update.Training_Detail.ToString();
                objCmd.Parameters.Add("@path", SqlDbType.NVarChar).Value = update.Training_Path.ToString();
                objCmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = update.Training_status.ToString();
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

        public static bool deleteTraining(string traingID)
        {
            try
            {
                string sqlUpdate = "DELETE FROM TrainingNews Where Training_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(traingID);

                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;

            }
            catch (Exception)
            {
                return false;
            }

        }

        public static string selectPicturePath(string setTrainIDdelete)
        {
            string path = "";

            try
            {

                SqlDataReader dtReader;
                string sqlString = "SELECT * FROM TrainingNews where Training_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(setTrainIDdelete);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    path = dtReader["Training_Path"].ToString();
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

        public static Entity.TrainingNewsInfo selectTrainingNewsShowDetailNewsPage(string query)
        {
            ClassConnectDB conn = new ClassConnectDB();
            Entity.TrainingNewsInfo train = new Entity.TrainingNewsInfo();
            try
            {
                string sql = "SELECT * FROM TrainingNews WHERE  Training_ID=@id";
                string Addvalue = "@id";
                string value = query;

                SqlDataReader drrShow = conn.SelectWhereSqlDataReader(sql, Addvalue, value);
                if (drrShow.Read())
                {
                    train.Training_Name = drrShow["Training_Name"].ToString();
                    train.Training_Detail = drrShow["Training_Detail"].ToString();
                    train.Update_date = drrShow["Update_date"].ToString();
                    train.Training_Path = drrShow["Training_Path"].ToString();
                }
                conn.Close();
                return train;
            }
            catch (Exception)
            {

                return null;
            }
        }
    }
}
