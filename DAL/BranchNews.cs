using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace DAL
{

    public class BranchNews
    {

        private static SqlConnection objConn;
        private static SqlCommand objCmd;
      
       
        public  static DataTable LoadAll(string search)
        {
            try
            {
                string sqlString = "SELECT * FROM BranchNews INNER JOIN Employee ON BranchNews.Update_user = Employee.Emp_ID ";
                if (!string.IsNullOrEmpty(search))
                {
                    sqlString += " WHERE BranchNews_Name like '%" + search + "%'  ";
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
                return dt;
                objConn.Close();
            }
            catch (Exception) {
                return null;
            }
        }

       

        public static bool insertBranch(Entity.BranchNewsInfo branch)
        {
            try
            {

                string sqlInsert = @"INSERT INTO BranchNews (BranchNews_Name, BranchNews_Detail, BranchNews_Path,BranchNews_Status, Create_date, Date_End, Create_user,Update_date,Update_user)
                                   VALUES(@title,@branchDetail,@branchPath,'A',GetDate(),convert(datetime, @endDate, 103),@user,GetDate(),@userupdate)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = branch.BranchNews_Name.ToString();
                // objCmd.Parameters.Add("@picture", SqlDbType.NVarChar).Value = branch.Branch_Picture.ToString();
                objCmd.Parameters.Add("@branchDetail", SqlDbType.NVarChar).Value = branch.Branch_Detail.ToString();
                objCmd.Parameters.Add("@branchPath", SqlDbType.NVarChar).Value = branch.Branch_Path.ToString();
               // objCmd.Parameters.Add("@branchNum", SqlDbType.Int).Value = branch.Branch_Num;
                objCmd.Parameters.Add("@endDate", SqlDbType.NVarChar).Value = branch.Date_End.ToString();
                objCmd.Parameters.Add("@user", SqlDbType.Int).Value = branch.Create_user;
                objCmd.Parameters.Add("@userupdate", SqlDbType.Int).Value = branch.Update_user;


                objCmd.ExecuteNonQuery();

               return true;
            }catch(Exception ex ){
                return false;
            }
               objConn.Close();

        }

        public static Entity.BranchNewsInfo selectShowPopup(string id)
        {
            try
            {
                SqlDataReader dtReader;
                Entity.BranchNewsInfo branch = new Entity.BranchNewsInfo();
                string sqlString = "SELECT  BranchNews_Name, BranchNews_Detail, BranchNews_Path, BranchNews_Status, convert(datetime, Date_End, 103) as date FROM BranchNews where BranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    branch.BranchNews_Name = dtReader["BranchNews_Name"].ToString();
                    branch.Branch_Detail = dtReader["BranchNews_Detail"].ToString();
                    branch.Branch_Path = dtReader["BranchNews_Path"].ToString();
                    branch.Branch_status = dtReader["BranchNews_Status"].ToString();
                    branch.Date_End = dtReader["date"].ToString();

                }
                dtReader.Close();
                objConn.Close();
                return branch;
            }catch(Exception ){
                return null;
            }
        }

        public static bool updateBranch(Entity.BranchNewsInfo update)
        {
            try
            {
                string sqlUpdate = @"UPDATE BranchNews SET BranchNews_Name =@title, BranchNews_Detail =@detail,
                                    BranchNews_Path =@path, BranchNews_Status =@status, Update_date =GetDate(), Update_user =@user, Date_End = convert(datetime,@endDate, 103)  where  BranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = update.BranchNews_ID.ToString();
                objCmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = update.BranchNews_Name.ToString();
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = update.Branch_Detail.ToString();

                objCmd.Parameters.Add("@path", SqlDbType.NVarChar).Value = update.Branch_Path.ToString();
                objCmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = update.Branch_status.ToString();
                objCmd.Parameters.AddWithValue("@endDate",update.Date_End.ToString());
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

        public static bool deleteBranch(string branchID)
        {
            try
            {
                string sqlUpdate = "DELETE FROM BranchNews Where BranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlUpdate, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(branchID);

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
            string path ="";

            try
            {
                
                SqlDataReader dtReader;
                string sqlString = "SELECT * FROM BranchNews where BranchNews_ID=@id";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
                objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(setBranchIDdelete);
                dtReader = objCmd.ExecuteReader();
                if (dtReader.Read())
                {
                    path= dtReader["BranchNews_Path"].ToString();
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

        public static Entity.BranchNewsInfo selectShowNews()
        {
            try
            {
                SqlDataReader dtReader;
                Entity.BranchNewsInfo branch = new Entity.BranchNewsInfo();
                string sqlString = "SELECT  BranchNews_Name, BranchNews_Detail, BranchNews_Path, BranchNews_Status, convert(datetime, Date_End, 103) as date FROM BranchNews ";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlString, objConn);
               // objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                dtReader = objCmd.ExecuteReader();
                while (dtReader.Read())
                {
                    branch.BranchNews_Name = dtReader["BranchNews_Name"].ToString();
                    branch.Branch_Detail = dtReader["BranchNews_Detail"].ToString();
                    branch.Branch_Path = dtReader["BranchNews_Path"].ToString();
                    branch.Branch_status = dtReader["BranchNews_Status"].ToString();
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


        public static Entity.BranchNewsInfo selectBranchNewsShowDetailNewsPage(string query)
        {
            ClassConnectDB conn = new ClassConnectDB();
            Entity.BranchNewsInfo branchnews = new Entity.BranchNewsInfo();
            try
            {
                string sql = "SELECT * FROM BranchNews WHERE  BranchNews_ID=@id";
                string Addvalue = "@id";
                string value = query;

                SqlDataReader drrShow = conn.SelectWhereSqlDataReader(sql, Addvalue, value);
                if (drrShow.Read())
                {
                    branchnews.BranchNews_Name = drrShow["BranchNews_Name"].ToString();
                    branchnews.Branch_Detail = drrShow["BranchNews_Detail"].ToString();
                    branchnews.Update_date = drrShow["Update_date"].ToString();
                    branchnews.Branch_Path = drrShow["BranchNews_Path"].ToString();
                }
                conn.Close();
                return branchnews;
            }
            catch (Exception)
            {

                return null;
            }
        }
    }
}

