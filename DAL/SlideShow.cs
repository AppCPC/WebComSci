using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
   public  class SlideShow
    {
        private static SqlConnection objConn;
        private static SqlCommand objCmd;


        public static DataTable LoadAll(string search)
        {
            try
            {
                string sqlString = "SELECT * FROM SlideShow INNER JOIN Employee ON SlideShow.Update_user = Employee.Emp_ID ";
                if (!string.IsNullOrEmpty(search))
                {
                    sqlString += " WHERE SlideShow_Name like '%" + search + "%'  ";
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



        public static bool insertBranch(Entity.SlideShow branch)
        {
            try
            {

                string sqlInsert = @"INSERT INTO SlideShow (SlideShow_Name, SlideShow_Detail,SlideShow_Path,SlideShow_Status, Create_date, Date_End, Create_user,Update_date,Update_user)
                                   VALUES(@title,@branchDetail,@branchPath,'A',GetDate(),convert(datetime, @endDate, 103),@user,GetDate(),@userupdate)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = branch.SlideShow_Name.ToString();
                // objCmd.Parameters.Add("@picture", SqlDbType.NVarChar).Value = branch.Branch_Picture.ToString();
                objCmd.Parameters.Add("@branchDetail", SqlDbType.NVarChar).Value = branch.SlideShow_Detail.ToString();
                objCmd.Parameters.Add("@branchPath", SqlDbType.NVarChar).Value = branch.SlideShow_Path.ToString();
                // objCmd.Parameters.Add("@branchNum", SqlDbType.Int).Value = branch.Branch_Num;
                objCmd.Parameters.Add("@endDate", SqlDbType.NVarChar).Value = branch.Date_End.ToString();
                objCmd.Parameters.Add("@user", SqlDbType.Int).Value = branch.Create_user;
                objCmd.Parameters.Add("@userupdate", SqlDbType.Int).Value = branch.Update_user;


                objCmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            objConn.Close();

        }

        public static Entity.SlideShow selectShowPopup(string id)
        {
            try
            {
                SqlDataReader dtReader;
                Entity.SlideShow branch = new Entity.SlideShow();
                string sqlString = "SELECT  SlideShow_Name, SlideShow_Detail, SlideShow_Path,SlideShow_Status, convert(datetime, Date_End, 103) as date FROM SlideShow where SlideShow_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    branch.SlideShow_Name = dtReader["SlideShow_Name"].ToString();
                    branch.SlideShow_Detail = dtReader["SlideShow_Detail"].ToString();
                    branch.SlideShow_Path = dtReader["SlideShow_Path"].ToString();
                    branch.SlideShow_status = dtReader["SlideShow_Status"].ToString();
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

        public static bool updateBranch(Entity.SlideShow update)
        {
            try
            {
                string sqlUpdate = @"UPDATE SlideShow SET SlideShow_Name =@title, SlideShow_Detail=@detail,
                                    SlideShow_Path =@path, SlideShow_Status =@status, Update_date =GetDate(), Update_user =@user, Date_End = convert(datetime,@endDate, 103)  where  SlideShow_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = update.SlideShow_ID.ToString();
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = update.SlideShow_Name.ToString();
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = update.SlideShow_Detail.ToString();

                objCmd.Parameters.Add("@path", SqlDbType.NVarChar).Value = update.SlideShow_Path.ToString();
                objCmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = update.SlideShow_status.ToString();
                objCmd.Parameters.AddWithValue("@endDate", update.Date_End.ToString());
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

        public static bool deleteBranch(string SlideShowID)
        {
            try
            {
                string sqlUpdate = "DELETE FROM SlideShow Where SlideShow_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(SlideShowID);

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
                string sqlString = "SELECT * FROM SlideShow where SlideShow_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(setBranchIDdelete);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    path = dtReader["SlideShow_Path"].ToString();
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

        public static Entity.SlideShow selectShowNews()
        {
            try
            {
                SqlDataReader dtReader;
                Entity.SlideShow branch = new Entity.SlideShow();
                string sqlString = "SELECT  SlideShow_Name, SlideShow_Detail, SlideShow_Path, SlideShow_Status, convert(datetime, Date_End, 103) as date FROM SlideShow ";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                // objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                while (dtReader.Read())
                {
                    branch.SlideShow_Name = dtReader["SlideShow_Name"].ToString();
                    branch.SlideShow_Detail = dtReader["SlideShow_Detail"].ToString();
                    branch.SlideShow_Path = dtReader["SlideShow_Path"].ToString();
                    branch.SlideShow_status = dtReader["SlideShow_Status"].ToString();
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


        public static Entity.SlideShow selectBranchNewsShowDetailNewsPage(string query)
        {
            ClassConnectDB conn = new ClassConnectDB();
            Entity.SlideShow branchnews = new Entity.SlideShow();
            try
            {
                string sql = "SELECT * FROM SlideShow WHERE  SlideShow_ID=@id";
                string Addvalue = "@id";
                string value = query;

                SqlDataReader drrShow = conn.SelectWhereSqlDataReader(sql, Addvalue, value);
                if (drrShow.Read())
                {
                    branchnews.SlideShow_Name = drrShow["SlideShow_Name"].ToString();
                    branchnews.SlideShow_Detail = drrShow["SlideShow_Detail"].ToString();
                    branchnews.Update_date = drrShow["Update_date"].ToString();
                    branchnews.SlideShow_Path = drrShow["SlideShow_Path"].ToString();
                }
                conn.Close();
                return branchnews;
            }
            catch (Exception)
            {

                return null;
            }
        }

        public static DataTable selectShowSlideShowHomePage()
        {
            DataTable dt = new DataTable();
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "SELECT  TOP (9) SlideShow_ID AS id, SlideShow_Path AS path FROM   SlideShow WHERE   (SlideShow_Status = 'A')  order by Update_date desc ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            dt.Load(drr);
            return dt;
        }
    }
}

