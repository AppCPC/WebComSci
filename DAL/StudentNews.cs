using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DAL
{
    public class StudentNews
    {

        private static SqlConnection objConn;
        private static SqlCommand objCmd;


        public static DataTable LoadAll(string search)
        {
            try
            {
                string sqlString = "SELECT * FROM  Employee INNER JOIN StudentNews ON Employee.Emp_ID = StudentNews.Update_user ";

                if (!string.IsNullOrEmpty(search))
                {
                    sqlString += " WHERE StudentNews_Name like '%" + search + "%'  ";
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



        public static bool insertStudent(Entity.StudentNewsInfo stdNews)
        {
            try
            {

                string sqlInsert = @"INSERT INTO StudentNews(StudentNews_Name,StudentNews_Detail, StudentNews_Path,Student_Status, Create_date, Date_End, Create_user,Update_date,Update_user)
                                   VALUES(@title,@Detail,@Path,'A',GetDate(),convert(datetime, @endDate, 103),@user,GetDate(),@userupdate)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = stdNews.StudentNews_Name.ToString();
                objCmd.Parameters.Add("@Detail", SqlDbType.NVarChar).Value = stdNews.StudentNews_Detail.ToString();
                objCmd.Parameters.Add("@Path", SqlDbType.NVarChar).Value = stdNews.StudentNews_Path.ToString();
                objCmd.Parameters.Add("@endDate", SqlDbType.NVarChar).Value =stdNews.Date_End.ToString();
                objCmd.Parameters.Add("@user", SqlDbType.Int).Value = stdNews.Create_user;
                objCmd.Parameters.Add("@userupdate", SqlDbType.Int).Value = stdNews.Update_user;

                objCmd.ExecuteNonQuery();
                 objConn.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
         

        }

        public static Entity.StudentNewsInfo selectShowPopup(string id)
        {
            try
            {
                SqlDataReader dtReader;
                Entity.StudentNewsInfo stdNews = new Entity.StudentNewsInfo();
                string sqlString = "SELECT StudentNews_Name, StudentNews_Detail, StudentNews_Path, Student_Status, convert(datetime, Date_End, 103) as date FROM StudentNews where StudentNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    stdNews.StudentNews_Name = dtReader["StudentNews_Name"].ToString();
                    stdNews.StudentNews_Detail = dtReader["StudentNews_Detail"].ToString();
                    stdNews.StudentNews_Path = dtReader["StudentNews_Path"].ToString();
                    stdNews.StudentNews_status = dtReader["Student_Status"].ToString();
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

        public static bool updateStudentNews(Entity.StudentNewsInfo update)
        {
            try
            {
                string sqlUpdate = @"UPDATE StudentNews SET StudentNews_Name=@title, StudentNews_Detail=@detail,
                                    StudentNews_Path=@path,Student_Status=@status, Update_date =GetDate(), Update_user =@user, Date_End =convert(datetime, @endDate, 103) where  StudentNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = update.StudentNews_ID.ToString();
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = update.StudentNews_Name.ToString();
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = update.StudentNews_Detail.ToString();
                objCmd.Parameters.Add("@path", SqlDbType.NVarChar).Value = update.StudentNews_Path.ToString();
                objCmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = update.StudentNews_status.ToString();
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

        public static bool deleteStdNews(string stdNewsID)
        {
            try
            {
                string sqlUpdate = "DELETE FROM StudentNews Where StudentNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(stdNewsID);

                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;

            }
            catch (Exception)
            {
                return false;
            }

        }

        public static string selectPicturePath(string setBranchIDdelete)
        {
            string path = "";

            try
            {

                SqlDataReader dtReader;
                string sqlString = "SELECT * FROM StudentNews where StudentNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(setBranchIDdelete);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    path = dtReader["StudentNews_Path"].ToString();
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

        public static Entity.StudentNewsInfo selectTrainingNewsShowDetailNewsPage(string query)
        {
            ClassConnectDB conn = new ClassConnectDB();
            Entity.StudentNewsInfo student = new Entity.StudentNewsInfo();
            try
            {
                string sql = "SELECT * FROM StudentNews WHERE  StudentNews_ID=@id";
                string Addvalue = "@id";
                string value = query;

                SqlDataReader drrShow = conn.SelectWhereSqlDataReader(sql, Addvalue, value);
                if (drrShow.Read())
                {
                    student.StudentNews_Name = drrShow["StudentNews_Name"].ToString();
                    student.StudentNews_Detail = drrShow["StudentNews_Detail"].ToString();
                    student.Update_date = drrShow["Update_date"].ToString();
                    student.StudentNews_Path = drrShow["StudentNews_Path"].ToString();
                }
                conn.Close();
                return student;
            }
            catch (Exception)
            {

                return null;
            }
        }
    }
}
