using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class mainManage
    {

        public static System.Data.DataTable selectUserPost(string userid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT  [Post_ID]
                          ,[Post_Detail]
                          ,[Create_date]
                          ,[Create_time]
                          ,[Create_user_id]
                          ,[Create_user_type]
                      FROM [Post]
                      where Create_user_id = '" + userid + "'  ORDER BY Create_date desc ,  Create_time desc ";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(drr);
                conn.Close();
                return dt;
            }
            catch (Exception ex) {
                return null;
            }
        }

        public static System.Data.DataTable selectUserAllPost()
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT  [Post_ID]
                          ,[Post_Detail]
                          ,[Create_date]
                          ,[Create_time]
                          ,[Create_user_id]
                          ,[Create_user_type]
                      FROM [Post]
                        ORDER BY Create_date desc ,  Create_time desc ";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(drr);
                conn.Close();
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }




        public static DataTable selectCommentPost(int postID)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" SELECT Top 1 [ComPost_ID]
                              ,[Post_ID]
                              ,[ComPost_Detail]
                              ,[Create_date]
                              ,[Create_time]
                              ,[Create_user_id]
                              ,[Create_user_type]
                            FROM [CommentPost]
                            where Post_ID = " + postID + " ORDER BY Create_date desc ,  Create_time desc";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static DataTable insertGetcoment(int clickPostID)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" SELECT   [ComPost_ID]
                              ,[Post_ID]
                              ,[ComPost_Detail]
                              ,[Create_date]
                              ,[Create_time]
                              ,[Create_user_id]
                              ,[Create_user_type]
                            FROM [CommentPost]
                            where Post_ID = " + clickPostID + " ORDER BY Create_date asc ,  Create_time asc";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }



        public static bool MyPost(string userid, string usertype, string post)
        {
            try
            {

                SqlConnection objConn;
                SqlCommand objCmd;

                string sqlInsert = @"INSERT INTO Post
                      (Post_Detail, Create_date, Create_time, Create_user_id,Create_user_type)
                        VALUES (@post,GetDate(),GetDate(),@userid,@usertype)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@post", SqlDbType.NVarChar).Value = post;
                objCmd.Parameters.Add("@userid", SqlDbType.NVarChar).Value = userid;
                objCmd.Parameters.Add("@usertype", SqlDbType.NVarChar).Value = usertype;
                objCmd.ExecuteNonQuery();

                objConn.Close();
                return true;

            }
            catch (Exception ex)
            {
                return false;

            }
        }

        public static bool insertComment(string id, string detail, string userid, string usertype)
        {

            try
            {

                SqlConnection objConn;
                SqlCommand objCmd;

                string sqlInsert = @"INSERT INTO CommentPost
                      (Post_ID, ComPost_Detail, Create_date, Create_time, Create_user_id,Create_user_type)
                        VALUES(@postID,@detail,GetDate(),GetDate(),@createuser,@createType)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = detail;
                objCmd.Parameters.Add("@createuser", SqlDbType.NVarChar).Value = userid;
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

        public static bool selectShowAllComment(string posid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"
                                    SELECT  ComPost_ID
                                      FROM CommentPost
                                     where Post_ID='" + posid + "'";
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

        public static bool cloasePost(string posid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();



                string deleteCommentsql = "  delete from CommentPost where  Post_ID='" + posid + "'";
                conn.QueryExecuteNonQuery(deleteCommentsql);

                string deletePostSql = "delete from Post  where Post_ID = '" + posid + "' ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }
        }




        public static bool closeComent(string commentid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = " delete from CommentPost where ComPost_ID='" + commentid + "'";
                conn.QueryExecuteNonQuery(sql);
                conn.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
