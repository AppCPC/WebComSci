using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;


namespace DAL
{
    public class Teacher
    {
        public static Entity.Teacher checkRoleLogin(string username, string password)
        {
            Entity.Teacher tch = new Entity.Teacher();
            try
            {
                string sqlchekRole = "  SELECT * FROM Teacher WHERE   Tch_username=@user AND Tch_password=@pass";
                string Addvalue = "@user,@pass";
                string value = username + "," + password;

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader readCheckRole = conn.SelectWhereSqlDataReader(sqlchekRole, Addvalue, value);
                if (readCheckRole.Read())
                {
                    tch.Tch_ID = readCheckRole["Tch_ID"].ToString();
                    tch.Tch_Type = readCheckRole["Tch_Type"].ToString();
                    tch.Tch_FName = readCheckRole["Tch_FName"].ToString();
                    tch.Tch_LName = readCheckRole["Tch_LName"].ToString();
                    tch.Tch_username = readCheckRole["Tch_username"].ToString();
                    tch.Tch_password = readCheckRole["Tch_password"].ToString();
                    tch.Tch_picturepath = readCheckRole["Tch_picturepath"].ToString();

                }

                string iplog = Common.network.showIp();
                string logdate = "CONVERT(VARCHAR(10), GETDATE(), 104)";
                string logtime = "CONVERT(VARCHAR(8), GETDATE(), 108)";
                string tid = readCheckRole["Tch_ID"].ToString();
                string insertLog = "INSERT INTO LogLoginTeach(Log_IP, Log_Date, Log_timeStart, Tch_ID) VALUES('" + iplog + "'," + logdate + "," + logtime + "," + tid + ")";
                conn.QueryExecuteNonQuery(insertLog);
                conn.Close();

                return tch;



            }
            catch (Exception)
            {

                return null;
            }

        }

        public static Entity.Teacher checkForgotPassword(string username, string email)
        {
            try
            {
                string sqlforgot = "  SELECT * FROM Teacher WHERE Tch_username=@user AND Tch_email=@email";
                string Addvalue = "@user,@email";
                string value = username + "," + email;

                Entity.Teacher tchCheck = new Entity.Teacher();

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader readCheckRole = conn.SelectWhereSqlDataReader(sqlforgot, Addvalue, value);
                //SqlDataReader readCheckRole = conn.SelectSqlDataReader(sqlforgot);
                if (readCheckRole.Read())
                {
                    tchCheck.Tch_FName = readCheckRole["Tch_FName"].ToString();
                    tchCheck.Tch_LName = readCheckRole["Tch_LName"].ToString();
                    tchCheck.Tch_username = readCheckRole["Tch_username"].ToString();
                    tchCheck.Tch_password = readCheckRole["Tch_password"].ToString();
                    tchCheck.Tch_email = readCheckRole["Tch_email"].ToString();
                }
                conn.Close();
                return tchCheck;

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
                string sqlupdate = "UPDATE Teacher SET Tch_password=@pass WHERE Tch_ID=@id";
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

        public static bool insertUserTeacherPageAdmin(Entity.Teacher teacher)
        {

            ClassConnectDB conn = new ClassConnectDB();

           // string code = teacher.Tch_Campus_code.ToString();
            string fname = teacher.Tch_FName.ToString();
            string lname = teacher.Tch_LName.ToString();
            string nickname = teacher.Tch_Nickname.ToString();
            string sex = teacher.Tch_Sex.ToString();
            //string birth = teacher.Tch_Birth.ToString();
            string address = teacher.Tch_Address.ToString();
            string tel = teacher.Tch_Tel.ToString();
            string type = teacher.Tch_Type.ToString();
            string email = teacher.Tch_email.ToString();
            string fnameEn = teacher.Tch_FNameEn.ToString();
            string lnameEn = teacher.Tch_LNameEn.ToString();
            string username = teacher.Tch_username.ToString();
            string password = teacher.Tch_password.ToString();
            string typeTea = teacher.Tch_TypeInSch.ToString();

            try
            {
                string sqlInsert = @"INSERT INTO Teacher
                        (Tch_FName, Tch_LName,Tch_FNameEn,Tch_LNameEn, Tch_Nickname, Tch_Sex, Tch_Address, Tch_Tel, Tch_Type, Tch_email,Tch_username, Tch_password,Tch_TypeInSch)
                        VALUES (@fname,@lname,@fnameEn,@lnameEn,@nickname,@sex,@address,@tel,@type,@email,@user,@pass,@typeSch)";
                string Addvalue = "@fname,@lname,@fnameEn,@lnameEn,@nickname,@sex,@address,@tel,@type,@email,@user,@pass,@typeSch";
                string value = fname + "," + lname + "," + fnameEn + "," + lnameEn + "," + nickname + "," + sex + "," + address + "," + tel + "," + type + "," + email + "," + username + "," + password+","+typeTea;

                conn.InsertValue(sqlInsert, Addvalue, value);
                conn.Close();

                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }



        public static bool deleteUserDelete(string id)
        {
            try
            {
                string sqldelete = "DELETE FROM Teacher Where Tch_ID=@id ";
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

        public static System.Data.DataTable searchShowPageTchAdmin(string code, string fname, string lname, string type)
        {
            try
            {
                string sqlString = "";

                if (type.Equals("N") && code.Equals("") && fname.Equals("") && lname.Equals(""))
                {

                    sqlString = "SELECT * FROM Teacher WHERE 1=1 ";

                }
                else
                {

                    sqlString = "SELECT * FROM Teacher WHERE 1=1 ";

                    if (!string.IsNullOrEmpty(code))
                    {
                        sqlString += " AND Tch_Campus_code like '" + code + "%'  ";
                    }
                    if (!string.IsNullOrEmpty(fname))
                    {
                        sqlString += " AND Tch_FName like '%" + fname + "%'  ";
                    }
                    if (!string.IsNullOrEmpty(lname))
                    {
                        sqlString += " AND Tch_LName like '%" + lname + "%'  ";
                    }
                    if (!type.Equals("N"))
                    {
                        sqlString += " AND Tch_Type ='" + type + "'  ";
                    }
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


        public static DataTable selectShowDetailTeacher()
        {
            try
            {
                string sql = "SELECT * FROM Teacher";
                ClassConnectDB conn = new ClassConnectDB();
                DataTable dt = new DataTable();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);

                dt.Load(drr);

                conn.Close();
                return dt;



            }
            catch (Exception)
            {
                return null;
            }
        }


        public static DataTable selectTeacherForPostComment(string tchid) /*search detail Teacher*/
        {
            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("tchid");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("picpath");
            resultdt.Columns.Add("usertype");
            ClassConnectDB conn = new ClassConnectDB();
            try
            {


                string sql = @"   SELECT     Tch_ID, (Tch_FName+'  '+  Tch_LName) as name  , Tch_picturepath, Tch_Type
                                    FROM         Teacher  Where Tch_ID = '" + tchid + "'";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
               

                    dt.Load(drr);
                    string picpath = "~/image/km/user_default.ico";
                    foreach (DataRow rows in dt.Rows)
                    {
                        string path = rows[2].ToString();
                        if (path.Length > 0)
                        {
                            resultdt.Rows.Add(rows[0], rows[1], rows[2], rows[3]);
                        }
                        else
                        {
                            resultdt.Rows.Add(rows[0], rows[1], picpath, rows[3]);
                        }
                    }

               

                conn.Close();

                return resultdt;
            }
            catch (Exception)
            {

                string picpath = "~/image/km/user_default.ico";
                //string picpath = "~/image/km/user_default.ico";

                string sqltea = "  SELECT     Tch_ID, ('อาจารย์ '+Tch_FName  +'  '+  Tch_LName) as name ,Tch_Type  FROM  Teacher where Tch_ID='" + tchid + "'";
                SqlDataReader drrtea = conn.SelectSqlDataReader(sqltea);
                DataTable dttea = new DataTable();
                dttea.Load(drrtea);

                foreach (DataRow row in dttea.Rows)
                {
                    resultdt.Rows.Add(row[0], row[1], picpath, row[2]);
                }


                return resultdt;
                conn.Close();


            }


        }


        public static DataTable selectShowAllStudent()
        {
            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("tchid");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("picpath");
            resultdt.Columns.Add("usertype");

            ClassConnectDB conn = new ClassConnectDB();


            try
            {
                string sql = @"   SELECT     Teacher.Tch_ID, ('อาจารย์ '+ Teacher.Tch_FName +'  '+ Teacher.Tch_LName) as name, Picture.Picture_Path, Picture.Picture_Status ,Tch_Type
                        FROM   Picture INNER JOIN AlbumPicture ON Picture.Album_ID = AlbumPicture.Album_ID INNER JOIN
                      Teacher ON AlbumPicture.Create_User = Teacher.Tch_ID  ";
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

                    string sqltea = "  SELECT     Tch_ID, ('อาจารย์ '+Tch_FName  +'  '+  Tch_LName) as name ,Tch_Type  FROM  Teacher ";
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

                string sqltea = "  SELECT     Tch_ID, ('อาจารย์ '+Tch_FName  +'  '+  Tch_LName) as name ,Tch_Type  FROM  Teacher ";
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




        public static Entity.Teacher selectShowProfileTch(string userid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "select * FROM Teacher where Tch_ID='" + userid + "'";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                Entity.Teacher tch = new Entity.Teacher();
                if (drr.Read())
                {
                    tch.Tch_FName = drr["Tch_FName"].ToString();
                    tch.Tch_LName = drr["Tch_LName"].ToString();
                    tch.Tch_FNameEn = drr["Tch_FNameEn"].ToString();
                    tch.Tch_LNameEn = drr["Tch_LNameEn"].ToString(); 
                    tch.Tch_Nickname = drr["Tch_Nickname"].ToString();
                    tch.Tch_Sex = drr["Tch_Sex"].ToString(); ;
                   // tch.Tch_Birth = drr["Tch_Birth"].ToString();
                    tch.Tch_Tel = drr["Tch_Tel"].ToString();
                    tch.Tch_email = drr["Tch_email"].ToString();

                    tch.Tch_Type = drr["Tch_Type"].ToString();
                    tch.Tch_email = drr["Tch_email"].ToString();
                    tch.Tch_username = drr["Tch_username"].ToString();
                    tch.Tch_password = drr["Tch_password"].ToString();
                    tch.Tch_picturepath = drr["Tch_picturepath"].ToString();


                }
                return tch;


            }
            catch (Exception)
            {
                return null;
            }


        }

        public static bool updateTeacher(Entity.Teacher tch)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string id = tch.Tch_ID.ToString();
                string fname = tch.Tch_FName.ToString();
                string fnameEn = tch.Tch_FNameEn.ToString();
                string lname = tch.Tch_LName.ToString();
                string lnameEn = tch.Tch_LNameEn.ToString();
                string nickname = tch.Tch_Nickname.ToString();
                string sex = tch.Tch_Sex.ToString();
               // string birth = tch.Tch_Birth.ToString();
                string address = tch.Tch_Address.ToString();
                string tel = tch.Tch_Tel.ToString();
                string type = tch.Tch_Type.ToString();
                string email = tch.Tch_email.ToString();
                string username = tch.Tch_username.ToString();
                string password = tch.Tch_password.ToString();
                string picturepath = tch.Tch_picturepath.ToString();
                string typeTch = tch.Tch_TypeInSch.ToString();

                string sqlupdate = "";
                string Adddvalue = "";
                string value = "";
                if (username == "1")
                {
                    //************************ ไมอัพเดท username password
                    sqlupdate = @"UPDATE  Teacher SET Tch_FName =@fname, Tch_LName =@lname, Tch_FNameEn =@fnameEn, Tch_LNameEn =@lnameEn, Tch_Nickname =@nickName, Tch_Sex =@sex, Tch_Address =@address, Tch_Tel =@tel, Tch_Type =@type, Tch_email =@email, 
                      Tch_picturepath=@pic ,Tch_TypeInSch=@tchtype where Tch_ID=@id";

                    Adddvalue = "@fname,@lname,@fnameEn,@lnameEn,@nickName,@sex,@address,@tel,@type,@email,@id,@pic,@tchtype";
                    value = fname + "," + lname + "," + fnameEn + "," + lnameEn + "," + nickname + "," + sex + "," + address + "," + tel + "," + type + "," + email + ","+ id + "," + picturepath+","+typeTch;
                }
                else
                {
                     sqlupdate = @"UPDATE  Teacher SET Tch_FName =@fname, Tch_LName =@lname, Tch_FNameEn =@fnameEn, Tch_LNameEn =@lnameEn, Tch_Nickname =@nickName, Tch_Sex =@sex, Tch_Address =@address, Tch_Tel =@tel, Tch_Type =@type, Tch_email =@email, 
                      Tch_username =@username, Tch_password =@pass , Tch_picturepath=@pic ,Tch_TypeInSch=@tchtype where Tch_ID=@id";

                     Adddvalue = "@fname,@lname,@fnameEn,@lnameEn,@nickName,@sex,@address,@tel,@type,@email,@username,@pass,@id,@pic,@tchtype";
                     value = fname + "," + lname + "," + fnameEn + "," + lnameEn + "," + nickname + "," + sex + "," + address + "," + tel + "," + type + "," + email + "," + username + "," + password + "," + id + "," + picturepath+","+typeTch;

                }
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

        public static string checkTeacher()
        {
            string detail = "";
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "  SELECT *  FROM Teacher  where Tch_TypeInSch='A' ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            if (drr.Read())
            {
                detail = "อาจารย์  " + drr["Tch_FName"].ToString() + "  " + drr["Tch_LName"].ToString();
                conn.Close();
                return detail;
            }
            else {
                conn.Close();
                return "";
            }


        }
    }
}
