using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class Student
    {

        public static Entity.Student checkRoleLogin(string username, string password)
        {
            try
            {
                Entity.Student stdlog = new Entity.Student();

                string sqlchekRole = " SELECT * FROM Student WHERE (Std_Username = @user) AND (Std_Password = @pass)";
                string Addvalue = "@user,@pass";
                string value = username + "," + password;

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader readCheckRole = conn.SelectWhereSqlDataReader(sqlchekRole, Addvalue, value);
                if (readCheckRole.Read())
                {

                    stdlog.Std_Type = readCheckRole["Std_Type"].ToString();
                    stdlog.Std_FName = readCheckRole["Std_FName"].ToString();
                    stdlog.Std_LName = readCheckRole["Std_LName"].ToString();
                    stdlog.Std_Campus_Code = readCheckRole["Std_Campus_Code"].ToString();
                    stdlog.Std_YearEducate = readCheckRole["Std_YearEducate"].ToString();
                    stdlog.Std_Username = readCheckRole["Std_Username"].ToString();
                    stdlog.Std_Password = readCheckRole["Std_Password"].ToString();
                    stdlog.std_picturepath = readCheckRole["Std_picturepath"].ToString();
                }

                string iplog = Common.network.showIp();
                string logdate = "CONVERT(VARCHAR(10), GETDATE(), 104)";
                string logtime = "CONVERT(VARCHAR(8), GETDATE(), 108)";
                string tid = readCheckRole["Std_Campus_Code"].ToString();
                string insertLog = "INSERT INTO LogLogInStd(Log_IP, Log_Date, Log_timeStart, Std_Campus_Code) VALUES('" + iplog + "'," + logdate + "," + logtime + "," + tid + ")";
                conn.QueryExecuteNonQuery(insertLog);


                conn.Close();
                return stdlog;


            }
            catch (Exception)
            {

                return null;
            }
        }

        public static Entity.Student checkForgotPassword(string username, string email)
        {
            try
            {
                string sqlforgot = "  SELECT * FROM Student WHERE Std_Username=@user AND Std_email=@email";
                string Addvalue = "@user,@email";
                string value = username + "," + email;

                Entity.Student stdCheck = new Entity.Student();

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader readCheckRole = conn.SelectWhereSqlDataReader(sqlforgot, Addvalue, value);
                //SqlDataReader readCheckRole = conn.SelectSqlDataReader(sqlforgot);
                if (readCheckRole.Read())
                {
                    stdCheck.Std_FName = readCheckRole["Std_FName"].ToString();
                    stdCheck.Std_LName = readCheckRole["Std_LName"].ToString();
                    stdCheck.Std_Username = readCheckRole["Std_Username"].ToString();
                    stdCheck.Std_Password = readCheckRole["Std_Password"].ToString();
                    stdCheck.Std_email = readCheckRole["Std_email"].ToString();
                }
                conn.Close();
                return stdCheck;

            }
            catch (Exception)
            {

                return null;
            }
        }

        public static bool updateChangeNewsPasswordPage(string userID, string newPassword)
        {
            try
            {
                string sqlupdate = "UPDATE Student SET  Std_Password=@pass Where Std_Campus_Code=@id";
                string Addvalue = "@pass,@id";
                string value = newPassword + "," + userID;

                ClassConnectDB conn = new ClassConnectDB();
                conn.UpdateValue(sqlupdate, Addvalue, value);
                conn.Close();
                return true;

            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool insertUserStudentPageAdmin(Entity.Student student)
        {
            ClassConnectDB conn = new ClassConnectDB();

            string code = student.Std_Campus_Code.ToString();
            string fname = student.Std_FName.ToString();
            string lname = student.Std_LName.ToString();
            string nickname = student.Std_Nickname.ToString();
            string sex = student.Std_Sex.ToString();
            string birth = student.Std_Birth.ToString();
            string address = student.Std_Address.ToString();
            string tel = student.Std_Tel.ToString();
            string type = student.Std_Type.ToString();
            string email = student.Std_email.ToString();
            string username = student.Std_Campus_Code.ToString();
            string password = student.Std_Campus_Code.ToString();
            string group = student.Std_Group.ToString();
            string year = student.Std_YearEducate.ToString();

            try
            {
                string sqlInsert = @"INSERT INTO Student
                      (Std_FName, Std_LName, Std_Nickname, Std_Campus_Code, Std_Sex, Std_Birth, Std_Address, Std_Tel, Std_Type, Std_email,Std_Username, Std_Password,Std_Group, Std_YearEducate)
                        VALUES (@fname,@lname,@nickname,@code,@sex,@birth,@address,@tel,@type,@email,@user,@pass,@group,@year)";
                string Addvalue = "@fname,@lname,@nickname,@code,@sex,@birth,@address,@tel,@type,@email,@user,@pass,@group,@year";
                string value = fname + "," + lname + "," + nickname + "," + code + "," + sex + "," + birth + "," + address + "," + tel + "," + type + "," + email + "," + username + "," + password + "," + group + "," + year;

                conn.InsertValue(sqlInsert, Addvalue, value);
                conn.Close();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }



        public static Entity.Student selectShowText(string p)
        {
            try
            {
                Entity.Student std = new Entity.Student();
                string sql = " select *  FROM Student where Std_Campus_Code = '" + p + "'";
                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                if (drr.Read())
                {

                    std.Std_FName = drr["Std_FName"].ToString();
                    std.Std_LName = drr["Std_LName"].ToString();
                    std.Std_FNameEn = drr["Std_FNameEn"].ToString();
                    std.Std_LNameEn = drr["Std_LNameEn"].ToString();
                    std.Std_Nickname = drr["Std_Nickname"].ToString();
                    std.Std_Campus_Code = drr["Std_Campus_Code"].ToString();
                    std.Std_Sex = drr["Std_Sex"].ToString();
                    std.Std_Birth = drr["Std_Birth"].ToString();
                    std.Std_Address = drr["Std_Address"].ToString();
                    std.Std_Tel = drr["Std_Tel"].ToString();
                    std.Std_Type = drr["Std_Type"].ToString();
                    std.Std_YearEducate = drr["Std_YearEducate"].ToString();
                    std.Std_Group = drr["Std_Group"].ToString();
                    std.Std_email = drr["Std_email"].ToString();
                    std.Std_Username = drr["Std_Username"].ToString();
                    std.Std_Password = drr["Std_Password"].ToString();
                    std.std_picturepath = drr["Std_picturepath"].ToString();
                    conn.Close();
                }
                return std;
            }
            catch (Exception)
            {

                return null;
            }
        }

        public static bool updateUserStudent(Entity.Student student)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string id = student.Std_Campus_Code.ToString();
                string code = student.Std_Campus_Code.ToString();
                string fname = student.Std_FName.ToString();
                string fnameEn = student.Std_FNameEn.ToString();
                string lname = student.Std_LName.ToString();
                string lnameEn = student.Std_LNameEn.ToString();
                string nickname = student.Std_Nickname.ToString();
                string sex = student.Std_Sex.ToString();
                string birth = student.Std_Birth.ToString();
                string address = student.Std_Address.ToString();
                string tel = student.Std_Tel.ToString();
                string type = student.Std_Type.ToString();
                string email = student.Std_email.ToString();
                string username = student.Std_Campus_Code.ToString();
                string password = student.Std_Password.ToString();
                string group = student.Std_Group.ToString();
                string year = student.Std_YearEducate.ToString();
                string picturepath = student.std_picturepath.ToString();

                string sqlupdate = @"UPDATE Student SET Std_FName=@name, Std_LName =@lname, Std_FNameEn =@fnameEn, Std_LNameEn =@LnameEn,
                                         Std_Nickname =@nickname, Std_Campus_Code =@code, Std_Sex =@sex, Std_Birth =@birth, Std_Address =@address, Std_Tel =@tel, Std_Type =@type, 
                                         Std_YearEducate =@year, Std_Group =@group, Std_email =@email, Std_Username =@username, Std_Password =@pass ,Std_picturepath=@picpath where Std_Campus_Code=@id";

                string Adddvalue = "@name,@lname,@fnameEn,@LnameEn,@nickname,@code,@sex,@birth,@address,@tel,@type,@year,@group,@email,@username,@pass,@picpath,@id";
                string value = fname + "," + lname + "," + fnameEn + "," + lnameEn + "," + nickname + "," + code + "," + sex + "," + birth + "," + address + "," + tel + "," + type + "," + year + "," + group + "," + email + "," + username + "," + password + "," + picturepath + "," + id;

                bool update = conn.UpdateValue(sqlupdate, Adddvalue, value);

                conn.Close();
                if (update)
                {
                    return true;
                }
                else
                    return false;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public static System.Data.DataTable searchShowPageStdAdmin(string code, string fname, string lname, string year)
        {
            try
            {
                string sqlString = "SELECT * FROM Student WHERE 1=1 ";
                if (!string.IsNullOrEmpty(code))
                {
                    sqlString += " AND Std_Campus_Code like '" + code + "%'  ";
                }
                if (!string.IsNullOrEmpty(fname))
                {
                    sqlString += " AND Std_FName like '%" + fname + "%'  ";
                }
                if (!string.IsNullOrEmpty(lname))
                {
                    sqlString += " AND Std_LName like '%" + lname + "%'  ";
                }
                if (!string.IsNullOrEmpty(year))
                {
                    sqlString += " AND Std_YearEducate ='" + year + "'  ";
                }


                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader drr = conn.SelectSqlDataReader(sqlString);
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

        public static bool deleteUserStudent(string id)
        {
            try
            {
                string sqldelete = "DELETE FROM Student Where Std_Campus_Code=@id ";
                string Addvalue = "@id";
                string value = id;

                ClassConnectDB conn = new ClassConnectDB();
                conn.DeleteValue(sqldelete, Addvalue, value);
                conn.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool InsertStudentInclass(string code, string name, string group, string classID)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"  INSERT INTO EnrollIn  ( DetailTech_ID, Std_Campus_Code) VALUES     (
                                    ( SELECT     DetailTech_ID FROM         DetailTech   WHERE     (ClassRoom_ID = @classID) AND (DetailTech_Class = @group) ), 
                                    (SELECT     Std_Campus_Code  FROM  Student WHERE     (Std_Campus_Code = @codestd)))";

                string Addvalue = "@classID,@group,@codestd";
                string value = classID + "," + group + "," + code;
                bool insert = conn.InsertValue(sql, Addvalue, value);

                return insert;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static string selectIDStudent(string code)
        {
            try
            {
                string sql = "SELECT Std_Campus_Code  FROM Student WHERE Std_Campus_Code='" + code + "'";
                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                if (drr.Read())
                {

                    return drr["Std_Campus_Code"].ToString();
                }
                else
                    return null;
            }
            catch (Exception)
            {
                return null;

            }
        }

        public static DataTable selectStudentForPostComment(string codestd) /*search detail Student*/
        {
            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("stdid");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("picpath");
            resultdt.Columns.Add("usertype");


            ClassConnectDB conn = new ClassConnectDB();

            try
            {
                string sql = @" 
                                SELECT Std_Campus_Code,( Std_FName+'  '+ Std_LName)  as name , Std_picturepath, Std_Type
                             FROM  Student Where Std_Campus_Code = '" + codestd + "' ";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();   dt.Load(drr);
                        string picpath = "~/image/km/user_default.ico";
                        foreach (DataRow rows in dt.Rows)
                        {
                            string path = rows[2].ToString();

                             if (path.Length > 0){
                                 resultdt.Rows.Add(rows[0], rows[1], rows[2], rows[3]);
                             }else{
                                resultdt.Rows.Add(rows[0], rows[1], picpath, rows[3]);
                             }

                        }
               



                conn.Close();
                return resultdt;
            }
            catch (Exception)
            {

                string picpath = "~/image/km/user_default.ico";
                // string picpath = "~/image/km/user_default.ico";
                string sqltea = "  SELECT     Std_Campus_Code , (Std_FName +'  '+ Std_LName) as name , Std_Type FROM  Student where Std_Campus_Code='" + codestd + "'";
                SqlDataReader drrtea = conn.SelectSqlDataReader(sqltea);
                DataTable dttea = new DataTable();
                dttea.Load(drrtea);

                foreach (DataRow row in dttea.Rows)
                {
                    resultdt.Rows.Add(row[0], row[1], picpath, row[2]);
                }

                return resultdt;

            }

        }

        public static DataTable selectShowAllStudent()
        {
            /******************************
             * 
             * select show นักศึกษาทั้งหมด
             * 
             * ***************************/
            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("stdid");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("picpath");
            resultdt.Columns.Add("usertype");


            ClassConnectDB conn = new ClassConnectDB();

            try
            {
                string sql = @"  SELECT     Student.Std_Campus_Code,  (Student.Std_FName+'  '+ Student.Std_LName) as name, Picture.Picture_Path, Picture.Picture_Status , Std_Type
                             FROM    Picture INNER JOIN AlbumPicture ON Picture.Album_ID = AlbumPicture.Album_ID INNER JOIN
                      Student ON AlbumPicture.Create_User = Student.Std_Campus_Code  ";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(drr);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow rows in dt.Rows)
                    {
                        resultdt.Rows.Add(rows[0], rows[1], rows[2], rows[4]);
                    }

                }
                else
                {
                    string picpath = "~/image/km/user_default.ico";
                    string sqltea = "  SELECT     Std_Campus_Code , (Std_FName +' '+ Std_LName) as name ,Std_Type  FROM  Student ";
                    SqlDataReader drrtea = conn.SelectSqlDataReader(sqltea);
                    DataTable dttea = new DataTable();
                    dttea.Load(drrtea);

                    foreach (DataRow row in dttea.Rows)
                    {
                        resultdt.Rows.Add(row[0], row[1], picpath, row[2]);
                    }


                }


                conn.Close();
                return resultdt;
            }
            catch (Exception)
            {

                string picpath = "~/image/km/user_default.ico";
                string sqltea = "  SELECT     Std_Campus_Code , (Std_FName +' '+ Std_LName) as name ,Std_Type  FROM  Student ";
                SqlDataReader drrtea = conn.SelectSqlDataReader(sqltea);
                DataTable dttea = new DataTable();
                dttea.Load(drrtea);

                foreach (DataRow row in dttea.Rows)
                {
                    resultdt.Rows.Add(row[0], row[1], picpath, row[2]);
                }
                conn.Close();
                return resultdt;

            }

        }


        //public static Entity.Student selectShowProfileStd(string userid)
        //{
        //    try
        //    {

        //        /*
        //        SELECT TOP 1000 [Std_Campus_Code]
        //              ,[Std_FName]
        //              ,[Std_LName]
        //              ,[Std_FNameEn]
        //              ,[Std_LNameEn]
        //              ,[Std_Nickname]
        //              ,[Std_Sex]
        //              ,[Std_Birth]
        //              ,[Std_Address]
        //              ,[Std_Tel]
        //              ,[Std_Type]
        //              ,[Std_YearEducate]
        //              ,[Std_Group]
        //              ,[Std_email]
        //              ,[Std_Username]
        //              ,[Std_Password]
        //              ,[Std_picturepath]
        //          FROM [WEBCSDB].[dbo].[Student]

        //         */
        //        ClassConnectDB conn = new ClassConnectDB();
        //        string sql = "select * from Student where Std_Campus_Code = " + userid;
        //        SqlDataReader drr = conn.SelectSqlDataReader(sql);
        //        Entity.Student std = new Entity.Student();
        //        if (drr.Read()) {

        //            std.Std_Campus_Code = drr["Std_Campus_Code"].ToString();
        //            std.Std_FName = drr["Std_FName"].ToString();
        //            std.Std_LName = drr["Std_LName"].ToString();
        //            std.Std_FNameEn = drr["Std_FNameEn"].ToString();
        //            std.Std_LNameEn = drr["Std_LNameEn"].ToString();
        //            std.Std_Nickname = drr["Std_Nickname"].ToString();
        //            std.Std_Sex = drr["Std_Sex"].ToString();
        //            std.Std_Birth = drr["Std_Birth"].ToString();
        //            std.Std_Address = drr["Std_Address"].ToString();
        //            std.Std_Tel = drr["Std_Tel"].ToString();
        //            std.Std_Type = drr["Std_Type"].ToString();
        //            std.Std_YearEducate = drr["Std_YearEducate"].ToString();
        //            std.Std_Group = drr["Std_Group"].ToString();
        //            std.Std_email = drr["Std_email"].ToString();
        //            std.Std_Username = drr["Std_Username"].ToString();
        //            std.Std_Password = drr["Std_Password"].ToString();
        //            std.std_picturepath = drr["Std_picturepath"].ToString();

        //        }
        //        drr.Close();
        //        conn.Close();
        //        return std;

        //    }
        //    catch (Exception)
        //    {
        //        return null;
        //    }


        //}

        public static DataTable appoveStudentInclass(string dchID)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" SELECT  Student.* FROM         Student INNER JOIN
                      EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code  
                     where EnrollIn.DeEduStd='" + dchID + "' and  EnrollIn.Enroll_Status='N'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;

        }
    }

}
