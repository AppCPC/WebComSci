using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DAL
{
    public class WorkBranchNews
    {

        private static SqlConnection objConn;
        private static SqlCommand objCmd;


        public static DataTable LoadAll(string search)
        {
            try
            {
                string sqlString = "SELECT * FROM   Employee INNER JOIN WorkBranchNews ON Employee.Emp_ID = WorkBranchNews.Update_user";
                if (!string.IsNullOrEmpty(search))
                {
                    sqlString += " WHERE WorkBranchNews_Name like '%" + search + "%'  ";
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



        public static bool insertWorkBranchNews(Entity.WorkBranchNewsInfo work)
        {
            try
            {

                string sqlInsert = @"INSERT INTO WorkBranchNews(WorkBranchNews_Name,WorkBranchNews_Detail,WorkBranchNews_Path,WorkBranchNews_Status, Create_date, Date_End, Create_user,Update_date,Update_user)
                                   VALUES(@title,@Detail,@Path,'A',GetDate(),convert(datetime, @endDate, 103),@user,GetDate(),@userupdate)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = work.WorkBranchNews_Name.ToString();
                objCmd.Parameters.Add("@Detail", SqlDbType.NVarChar).Value = work.WorkBranchNews_Detail.ToString();
                objCmd.Parameters.Add("@Path", SqlDbType.NVarChar).Value = work.WorkBranchNews_Path.ToString();
                objCmd.Parameters.Add("@endDate", SqlDbType.NVarChar).Value = work.Date_End.ToString();
                objCmd.Parameters.Add("@user", SqlDbType.Int).Value =work.Create_user;
                objCmd.Parameters.Add("@userupdate", SqlDbType.Int).Value = work.Update_user;


                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }


        }

        public static Entity.WorkBranchNewsInfo selectShowPopup(string id)
        {
            try
            {
                SqlDataReader dtReader;
                Entity.WorkBranchNewsInfo branch = new Entity.WorkBranchNewsInfo();
                string sqlString = "SELECT WorkBranchNews_Name, WorkBranchNews_Detail, WorkBranchNews_Path,WorkBranchNews_Status, convert(datetime, Date_End, 103) as date FROM WorkBranchNews where WorkBranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    branch.WorkBranchNews_Name = dtReader["WorkBranchNews_Name"].ToString();
                    branch.WorkBranchNews_Detail = dtReader["WorkBranchNews_Detail"].ToString();
                    branch.WorkBranchNews_Path = dtReader["WorkBranchNews_Path"].ToString();
                    branch.WorkBranchNews_status = dtReader["WorkBranchNews_Status"].ToString();
                    branch.Date_End = dtReader["date"].ToString();

                }
                dtReader.Close();
                objConn.Close();
                return branch;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool updateWorkBranchNews(Entity.WorkBranchNewsInfo update)
        {
            try
            {
                string sqlUpdate = @"UPDATE WorkBranchNews SET WorkBranchNews_Name=@title, WorkBranchNews_Detail=@detail,
                                   WorkBranchNews_Path=@path,WorkBranchNews_Status=@status, Update_date =GetDate(), Update_user =@user, Date_End =convert(datetime, @endDate, 103) where  WorkBranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = update.WorkBranchNews_ID.ToString();
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = update.WorkBranchNews_Name.ToString();
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = update.WorkBranchNews_Detail.ToString();
                objCmd.Parameters.Add("@path", SqlDbType.NVarChar).Value = update.WorkBranchNews_Path.ToString();
                objCmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = update.WorkBranchNews_status.ToString();
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

        public static bool deleteWorkBranchNews(string WorkBranchNewsID)
        {
            try
            {
                string sqlUpdate = "DELETE FROM WorkBranchNews Where WorkBranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(WorkBranchNewsID);

                objCmd.ExecuteNonQuery();
                objConn.Close();
                return true;

            }
            catch (Exception)
            {
                return false;
            }

        }

        public static string selectPicturePath(string setBranch)
        {
            string path = "";

            try
            {

                SqlDataReader dtReader;
                string sqlString = "SELECT * FROM WorkBranchNews where WorkBranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(setBranch);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    path = dtReader["WorkBranchNews_Path"].ToString();
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

        public static Entity.WorkBranchNewsInfo selectTrainingNewsShowDetailNewsPage(string query)
        {
            ClassConnectDB conn = new ClassConnectDB();
            Entity.WorkBranchNewsInfo workbranch = new Entity.WorkBranchNewsInfo();
            try
            {
                string sql = "SELECT * FROM WorkBranchNews WHERE  WorkBranchNews_ID=@id";
                string Addvalue = "@id";
                string value = query;

                SqlDataReader drrShow = conn.SelectWhereSqlDataReader(sql, Addvalue, value);
                if (drrShow.Read())
                {
                    workbranch.WorkBranchNews_Name = drrShow["WorkBranchNews_Name"].ToString();
                    workbranch.WorkBranchNews_Detail = drrShow["WorkBranchNews_Detail"].ToString();
                    workbranch.Update_date = drrShow["Update_date"].ToString();
                    workbranch.WorkBranchNews_Path = drrShow["WorkBranchNews_Path"].ToString();
                }
                conn.Close();
                return workbranch;
            }
            catch (Exception)
            {

                return null;
            }
        }
    }
}
