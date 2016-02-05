using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace DAL
{
    public class Knowledge
    {


        public static DataTable getCommentForPost(int thePost)
        {
            try
                {
                    string sql = @"SELECT   TOP 1  [KmComPost_ID]
                                  ,[KmPost_ID]
                                  ,[ComPost_Detail]
                                  ,REPLACE(CONVERT(VARCHAR(11), Create_date, 106), ' ', '-') AS datepostkm
                                  ,CONVERT(VARCHAR(12),Create_time ,114) as timepostkm
                                  ,[Create_user_id]
								  ,[Create_user_type]
                                  FROM KmCommentPost where KmPost_ID='" + thePost + "'order by [Create_date]  asc ";

                    ClassConnectDB conn = new ClassConnectDB();
                    SqlDataReader drr = conn.SelectSqlDataReader(sql);
                    DataTable dt = new DataTable();
                    dt.Load(drr);

                    conn.Close();
                    return dt;
                }
                catch (Exception)
                {
                    return null;
                }


        }

        public static bool insertComment(string id, string comment, string createUser,string usertype)
        {


            try
            {

                SqlConnection objConn;
                SqlCommand objCmd;

                string sqlInsert = @"INSERT INTO KmCommentPost
                              (KmPost_ID, ComPost_Detail, Create_date, Create_time, Create_user_id,Create_user_type)
                        VALUES(@postID,@detail,GetDate(),GetDate(),@createuser,@createType)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = comment;
                objCmd.Parameters.Add("@createuser", SqlDbType.NVarChar).Value = createUser;
                objCmd.Parameters.Add("@postID", SqlDbType.Int).Value = id;
                objCmd.Parameters.Add("@createType", SqlDbType.NVarChar).Value = usertype;
                objCmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;

            }

        }

        public static DataTable testCheckCode(string code)
        {
            try
            {


                string sql = @"  SELECT  StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, ShowPlanEducate.ShowPlan_Year, ShowPlanEducate.ShowPlan_Semester 
                      
                                FROM ShowPlanEducate INNER JOIN
                                                      StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
                                  where ShowPlanEducate.ShowPlan_YearUpdate='2550' AND  StructSubject.StructSub_Code='"+code+"'";

                ClassConnectDB conn = new ClassConnectDB();
                DataTable dt = new DataTable();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                dt.Load(drr);
                conn.Close();
                return dt;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static DataTable testDataTable()
        {
            try
            {
//                string sql = @"SELECT     DetailResultStudent.StructSub_Code, DetailResultStudent.DeStudent_Grade, SchoolRecord.SchoolRecord_Level, SchoolRecord.SchoolRecord_Term, 
//                      StructSubject.StructSub_NameTha
//                        FROM         SchoolRecord INNER JOIN
//                                              DetailResultStudent ON SchoolRecord.SchoolRecord_ID = DetailResultStudent.SchoolRecord_ID INNER JOIN
//                                              StructSubject ON DetailResultStudent.StructSub_Code = StructSubject.StructSub_Code  
//                                where SchoolRecord.Std_Campus_Code='111'     ";


                string sql = @"SELECT  StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, ShowPlanEducate.ShowPlan_Year, ShowPlanEducate.ShowPlan_Semester 
                      
                                FROM ShowPlanEducate INNER JOIN
                                                      StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
                                  where ShowPlanEducate.ShowPlan_YearUpdate='2550'";

                ClassConnectDB conn = new ClassConnectDB();
                DataTable dt = new DataTable();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                dt.Load(drr);
                conn.Close();
                return dt;
            }
            catch (Exception)
            {
                
                throw;
            }
        }


        public static DataTable testDataSelectShowPlan(string p)
        {

            try
            {
//                string sql = @" SELECT ShowPlanEducate.ShowPlan_Year, ShowPlanEducate.ShowPlan_Semester, StructSubject.StructSub_Code,StructSubject.StructSub_NameTha
//                                    FROM ShowPlanEducate INNER JOIN
//                                              StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
//                                     where ShowPlanEducate.StructSub_Code='" +p+"'";


                string sql = @"SELECT     DetailResultStudent.StructSub_Code, DetailResultStudent.DeStudent_Grade, SchoolRecord.SchoolRecord_Level, SchoolRecord.SchoolRecord_Term, 
                                      StructSubject.StructSub_NameTha
                                        FROM         SchoolRecord INNER JOIN
                                                              DetailResultStudent ON SchoolRecord.SchoolRecord_ID = DetailResultStudent.SchoolRecord_ID INNER JOIN
                                                              StructSubject ON DetailResultStudent.StructSub_Code = StructSubject.StructSub_Code  
                                                where SchoolRecord.Std_Campus_Code='118'  AND DetailResultStudent.StructSub_Code='"+p+"' ";


                ClassConnectDB conn = new ClassConnectDB();
                DataTable dt = new DataTable();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                dt.Load(drr);
                conn.Close();
                return dt;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static DataTable selectKmpost()
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"SELECT  [KmPost_ID]
                          ,[KmPost_Name]
                          ,[KmPost_Detail]
                          ,[KmPost_Link]
                          ,[KmPost_date]
                          ,[KmPost_time]
                          ,[KmPost_Status]
                          ,[Create_user_id]
                          ,[Create_user_type]
                      FROM [KmPost] where KmPost_Status='Y'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
            
        }





        public static DataTable selectGetCommentUser(int clickPostID)
        {
            try
            {
                string sql = @"SELECT    [KmComPost_ID]
                                  ,[KmPost_ID]
                                  ,[ComPost_Detail]
                                  ,REPLACE(CONVERT(VARCHAR(11), Create_date, 106), ' ', '-') AS datepostkm
                                  ,CONVERT(VARCHAR(12),Create_time ,114) as timepostkm
                                  ,[Create_user_id]
								  ,[Create_user_type]
                                  FROM KmCommentPost where KmPost_ID='" + clickPostID + "'order by [Create_date]  asc ";

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(drr);

                conn.Close();
                return dt;
            }
            catch (Exception)
            {
                return null;
            }

        }

        public static bool selectShowAllComment(string postID)
        {

            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"
                                    SELECT  KmComPost_ID
                                      FROM KmCommentPost
                                     where KmPost_ID='" + postID + "'";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                int count = 0;
                while (drr.Read())
                {
                    count++;
                }

                if (count > 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception)
            {

                return false;
            }

        }




        public static bool closePost(string posid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();



                string deleteCommentsql = "  delete from KmCommentPost where  KmPost_ID='" + posid + "'";
                conn.QueryExecuteNonQuery(deleteCommentsql);

                string deletePostSql = "delete from KmPost  where KmPost_ID = '" + posid + "' ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }
        }



        public static bool closeComment(string commentid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = " delete from KmPost where KmComPost_ID='" + commentid + "'";
                conn.QueryExecuteNonQuery(sql);
                conn.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool insertPostKm(string title, string detail, string link,string user,string type)
        {
            try
            {

                SqlConnection objConn;
                SqlCommand objCmd;

                string sqlInsert = @"INSERT INTO KmPost
                      (KmPost_Name, KmPost_Detail, KmPost_Link, KmPost_date, KmPost_time, KmPost_Status, Create_user_id, Create_user_type)
                       VALUES(@name,@detail ,@link,GetDate(),GetDate(),'N',@user,@type)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@name", SqlDbType.NVarChar).Value = title;
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value =detail;
                //objCmd.Parameters.Add("@pic", SqlDbType.NVarChar).Value = picturPath;
                objCmd.Parameters.Add("@link", SqlDbType.NVarChar).Value = link;
                objCmd.Parameters.Add("@user", SqlDbType.NVarChar).Value = user;
                objCmd.Parameters.Add("@type", SqlDbType.NVarChar).Value = type;
                objCmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;

            }

        }



        public static DataTable showSearch(string title, string status, string ddtstart)
        {
            try
            {


                ClassConnectDB conn = new ClassConnectDB();
                string sql = "select * from KmPost where 1=1 ";
                if (!title.Equals("")) { sql += " AND  KmPost_Name LIKE '%"+title+"%'"; }
                if (!status.Equals("")) { sql += " AND  KmPost_Status = '" + status + "'"; }
                if (!ddtstart.Equals("")) { sql += "  AND (  convert(datetime,'" + ddtstart + "' , 120) > KmPost_date or   convert(datetime,'" + ddtstart + "', 120) = KmPost_date )"; }

                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(drr);
                conn.Close();
                return dt;

            }
            catch (Exception)
            {
                return null;
            }
        }



        public static DataTable selectShowKm(string idkm)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = " select * from KmPost where KmPost_ID = '"+idkm+"'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
        }

        public static bool deleteKm(string id)
        {
            try
            {

                ClassConnectDB conn = new ClassConnectDB();
                string sql = " delete   FROM [KmPost] where KmPost_ID='"+id+"'";
                bool insert = conn.QueryExecuteNonQuery(sql);
                conn.Close();
                return insert;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool apppoveKm(string id)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "UPDATE KmPost SET KmPost_Status ='Y' WHERE KmPost_ID= '"+id+"'";
                bool del = conn.QueryExecuteNonQuery(sql);
                if (del)
                {
                    return true;
                }
                else return false;

            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
