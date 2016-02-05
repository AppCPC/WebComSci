using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class ClassRoom
    {

//        public static System.Data.DataTable showSubjectMainPage(string iduser, string type)
//        {
//            ClassConnectDB conn = new ClassConnectDB();
//            DataTable resultdt = new DataTable();
//            resultdt.Columns.Add("subcode");
//            resultdt.Columns.Add("subThai");
//            resultdt.Columns.Add("ClassRoom_ID");
//            resultdt.Columns.Add("DetailTech_ID");
//           // resultdt.Columns.Add("ShowPlan_Id");
//            resultdt.Columns.Add("Curri_Group");

//            try
//            {

//                if (type.Equals("teacher"))
//                {
//                    string sql = @" select distinct  sub.StructSub_Code as subcode , sub.StructSub_NameTha as subThai ,dedu.ClassRoom_ID as ClassRoom_ID,edu.EduStdID as DetailTeach_ID,cur.Curri_Group
//                                  from StructSubject sub INNER JOIN
//                                      Curriculum cur ON sub.Curri_Id=cur.Curri_Id
//                                      INNER JOIN EducationOfStudents edu ON sub.StructSub_Code=edu.StructSub_Code
//                                      INNER JOIN DetailEducationOfStudent dedu ON edu.EduStdID=dedu.EduStdID
//                                      where dedu.EduStdStatus='A' and dedu.DeEduStdTch='" +iduser+"'";

//                    SqlDataReader drrsub = conn.SelectSqlDataReader(sql);
//                    resultdt.Load(drrsub);


////                    DataTable dtsub = new DataTable();
////                    string sqlsub = "    SELECT DISTINCT [StructSub_Code]  FROM [DetailTech] where [Tch_ID]='" + iduser + "' and [DetailTeach_Status]='A'";
////                    SqlDataReader drrsub = conn.SelectSqlDataReader(sqlsub);
////                    dtsub.Load(drrsub);

////                    foreach (DataRow roo in dtsub.Rows)
////                    {

////                        string sqltea = @"SELECT  StructSubject.StructSub_Code as subcode, StructSubject.StructSub_NameTha as subThai,DetailTech.ClassRoom_ID ,DetailTech.DetailTech_ID,Curriculum.Curri_Group        
////                                FROM         DetailTech INNER JOIN
////                                StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code INNER JOIN
////                                Curriculum ON StructSubject.Curri_Id = Curriculum.Curri_Id 
////                                 WHERE   (DetailTech.Tch_ID = '" + iduser + "') AND  (DetailTech.StructSub_Code = '" + roo[0].ToString() + "') ";
////                        SqlDataReader readtea = conn.SelectSqlDataReader(sqltea);
////                        if (readtea.Read())
////                        {
////                            resultdt.Rows.Add(readtea[0], readtea[1], readtea[2], readtea[3], readtea[4]);

////                        }
////                    }

//                }
//                else if (type.Equals("student"))
//                {
//                    string sql = @"  select distinct sub.StructSub_Code as subcode , sub.StructSub_NameTha as subThai ,dedu.ClassRoom_ID as ClassRoom_ID,edu.EduStdID as DetailTeach_ID,cur.Curri_Group
//                                  from StructSubject sub INNER JOIN
//                                      Curriculum cur ON sub.Curri_Id=cur.Curri_Id
//                                      INNER JOIN EducationOfStudents edu ON sub.StructSub_Code=edu.StructSub_Code
//                                      INNER JOIN DetailEducationOfStudent dedu ON edu.EduStdID=dedu.EduStdID
//                                      INNER JOIN EnrollIn en ON edu.EduStdID=en.EduStdID
//                                      where dedu.EduStdStatus='A' and en.Std_Campus_Code='" +iduser+"'";
//                    SqlDataReader drr = conn.SelectSqlDataReader(sql);
//                    resultdt.Load(drr);

////                    DataTable dtsub = new DataTable();
////                    string sqlsub = @"    SELECT     DetailTech.StructSub_Code, EnrollIn.DetailTech_ID, EnrollIn.Enroll_Status
////                                        FROM   DetailTech INNER JOIN  EnrollIn ON DetailTech.DetailTech_ID = EnrollIn.DetailTech_ID
////                                        where  Std_Campus_Code='" + iduser + "' and Enroll_Status='A'";
////                    SqlDataReader drrsub = conn.SelectSqlDataReader(sqlsub);
////                    dtsub.Load(drrsub);

////                    foreach (DataRow roo in dtsub.Rows)
////                    {

////                        string sqltea = @"
////                                    SELECT  StructSubject.StructSub_Code as subcode, StructSubject.StructSub_NameTha as subThai,ClassRoom_ID ,DetailTech.DetailTech_ID,Curri_Group
////                                    FROM         StructSubject INNER JOIN
////                                      Curriculum ON StructSubject.Curri_Id = Curriculum.Curri_Id INNER JOIN
////                                                          DetailTech ON StructSubject.StructSub_Code = DetailTech.StructSub_Code INNER JOIN
////                                                          EnrollIn ON DetailTech.DetailTech_ID = EnrollIn.DetailTech_ID
////                           WHERE  (Std_Campus_Code = '" + iduser + "') AND  (StructSubject.StructSub_Code = '" + roo[0].ToString() + "')  ";

////                        SqlDataReader readtea = conn.SelectSqlDataReader(sqltea);
////                        if (readtea.Read())
////                        {
////                            resultdt.Rows.Add(readtea[0], readtea[1], readtea[2], readtea[3], readtea[4]);

////                        }
////                    }

//                }
//                return resultdt;
//            }
//            catch (Exception)
//            {

//                return null;
//            }
//        }


        public static DataTable showRoomMemberInClassCheckNamePage(string userId, string classroom)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

//                string sql = @"  SELECT * FROM DetailTech
//                            WHERE Tch_ID=" + userId + " AND ClassRoom_ID=" + classroom;

                string sql = @"select  edu.EduStdLevel as stdlevel ,dedu.DeEduStdClass as stdClass , edu.EduStdID as eduStdID ,dedu.DeEduStd as DeEduStd
                            from EducationOfStudents edu INNER JOIN
                            DetailEducationOfStudent dedu ON edu.EduStdID=dedu.EduStdID
                            where dedu.DeEduStdTch='" +userId+"' AND dedu.ClassRoom_ID='"+classroom+"'";
                DataTable dt = new DataTable();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);

                dt.Load(drr);

                return dt;

            }
            catch (Exception)
            {
                return null;
            }

        }

        public static bool checkNameStudent(string checkType, string code, string deid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string sqlinsert = @"insert into CheckName(CheckName_Num,CheckName_Status,Create_date,Enroll_ID)
                                  values( (select count(CheckName_Num)+1 from CheckName where Enroll_ID in (SELECT DISTINCT EnrollIn.Enroll_ID
		                                FROM EnrollIn INNER JOIN  Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code
		                                WHERE (Student.Std_Campus_Code =  @code)AND(DeEduStd=@deid) ) )
                                        , @type ,getDate() , 
                                        (SELECT DISTINCT EnrollIn.Enroll_ID
		                                FROM EnrollIn INNER JOIN  Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code
		                                WHERE (Student.Std_Campus_Code = @code)AND(DeEduStd=@deid)))";
                string Addvalue = "@code,@type,@deid";

                string value = code + "," + checkType + "," + deid;
                conn.InsertValue(sqlinsert, Addvalue, value);


                return true;

            }
            catch (Exception)
            {

                return false;
            }
        }


        public static DataTable checkNameSum(string detailid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT DISTINCT EnrollIn.Enroll_ID AS enrollID
                                FROM EnrollIn INNER JOIN
                               Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code 
                              WHERE     (EnrollIn.DeEduStd = '" + detailid + "')";

                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(drr);

                return dt;

            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable checkNameSumShowDetail(string enrollId, string detailid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"select  DISTINCT(Student.Std_Campus_Code) as camCode, Student.Std_FName, Student.Std_LName,
                    (select count(checkName_Status)  from CheckName where CheckName_Status='S' and Enroll_ID=@enroll  ) as student ,
                    (select count(checkName_Status)   from CheckName where CheckName_Status='L' and Enroll_ID=@enroll ) as Late ,
                    (select count(checkName_Status) from CheckName where CheckName_Status='N' and Enroll_ID=@enroll ) as nostd 
                    FROM  CheckName INNER JOIN
                                          EnrollIn ON CheckName.Enroll_ID = EnrollIn.Enroll_ID INNER JOIN
                                          Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code
                    where  EnrollIn.DeEduStd=@detailID and   EnrollIn.Enroll_ID=@enroll ";

                string Addvalue = "@enroll,@detailID";
                string value = enrollId + "," + detailid;
                SqlDataReader drr = conn.SelectWhereSqlDataReader(sql, Addvalue, value);
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



        public static object selectDetailTeachID(string classID, string Group)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "SELECT DetailTech_ID FROM  DetailTech WHERE  (ClassRoom_ID = '" + classID + "') AND (DetailTech_Class = '" + Group + "')";
                string DetailID = "";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                if (drr.Read())
                {
                    DetailID = drr["DetailTech_ID"].ToString();
                }

                return DetailID;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool delectClassRoom(string ClassRoomID)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string delete = "DELETE FROM ClassRoom WHERE ClassRoom_ID=@classid";
                string Addvalue = "@classid";
                string value = ClassRoomID;

                bool checkdel = conn.DeleteValue(delete, Addvalue, value);
                if (checkdel)
                {
                    return true;
                }
                return false;

            }
            catch (Exception)
            {
                return false;
            }

        }


        public static bool deleteDeatilTeach(string detailID)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string delClassroom = "";

                string check = "select count( ClassRoom_ID ) as countRoom  FROM DetailTech Where ( ShowPlan_ID in ( select ShowPlan_ID From DetailTech Where DetailTech_ID = (" + detailID + "))  and Tch_ID = ( select Tch_ID From DetailTech Where DetailTech_ID in (" + detailID + ")))";
                SqlDataReader dr = conn.SelectSqlDataReader(check); ;
                int count = 0;
                while (dr.Read())
                {
                    count = Convert.ToInt32(dr["countRoom"].ToString());
                }


                string selectClassRoom_ID = "select  distinct ClassRoom_ID as id  FROM DetailTech Where ShowPlan_ID in ( select ShowPlan_ID From DetailTech Where DetailTech_ID in (" + detailID + "))";
                SqlDataReader ddr = conn.SelectSqlDataReader(selectClassRoom_ID);
                while (ddr.Read())
                {
                    delClassroom = ddr["id"].ToString();
                }


                string sql = "DELETE FROM DetailTech Where  DetailTech_ID=@id";
                string Addvalue = "@id";
                string value = detailID;
                bool del = conn.DeleteValue(sql, Addvalue, value);

                if (count == 1)
                {
                    delectClassRoom(delClassroom);
                }



                conn.Close();
                return true;
            }

            catch (Exception)
            {
                return false;
            }
        }

        public static string checkCreateRoom(string showPlanId, string teacherid)
        {
            try
            {
                string classid = "";

                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT ClassRoom.ClassRoom_ID AS classid
                                FROM  DetailTech INNER JOIN ClassRoom ON DetailTech.ClassRoom_ID = ClassRoom.ClassRoom_ID
                                WHERE DetailTech.ShowPlan_Id = '" + showPlanId + "' AND DetailTech.Tch_ID = '" + teacherid + "'";

                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                if (drr.Read())
                {
                    classid = drr["classid"].ToString();
                }
                else
                {

                    string createRoom = @"INSERT INTO ClassRoom (ClassRoom_Name, Create_date) VALUES( (SELECT StructSubject.StructSub_NameTha
                                            FROM ShowPlanEducate INNER JOIN   StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code WHERE ShowPlanEducate.ShowPlan_Id=@planID),getdate())";
                    string Addvalue = "@planID";
                    string value = showPlanId;

                    bool insertRoom = conn.InsertValue(createRoom, Addvalue, value);

                    if (insertRoom)
                    {

                        string sqlselectClassMax = "SELECT MAX(ClassRoom_ID) AS idclass FROM ClassRoom";
                        SqlDataReader read = conn.SelectSqlDataReader(sqlselectClassMax);
                        if (read.Read())
                        {

                            classid = read["idclass"].ToString();
                        }
                    }

                }
                conn.Close();
                return classid;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public static bool createDetailTeach(string year, string level, string group, string term, string showPlanId, string teacher, string checkCreateRoom, string createUser)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"INSERT INTO DetailTech
                      (DetailTeach_Year,DetailTech_Level, DetailTech_Class, DetailTech_Term, ShowPlan_Id, Tch_ID, ClassRoom_ID, Create_user, CreateDate)
                        VALUES (@year,@level,@group,@term,@planId,@tchID,@classID,@user,getdate())";
                string Addvalue = "@year,@level,@group,@term,@planId,@tchID,@classID,@user";
                string value = year + "," + level + "," + group + "," + term + "," + showPlanId + "," + teacher + "," + checkCreateRoom + "," + createUser;

                bool insert = conn.InsertValue(sql, Addvalue, value);
                if (insert)
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

        public static bool insertStudentInclass(string id, string dchID)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string sql = "SELECT  DetailTech_ID FROM  EnrollIn WHERE Std_Campus_Code='" + id + "' AND  DetailTech_ID ='" + dchID + "'";
                SqlDataReader ddr = conn.SelectSqlDataReader(sql);//chechk detailTeach has Roww
                if (!ddr.HasRows)
                {

                    string sqlinsert = "INSERT INTO EnrollIn ( DetailTech_ID, Std_Campus_Code) VALUES (@dchId,@stdCode)";
                    string addvalue = "@dchId,@stdCode";
                    string value = dchID + "," + id;
                    conn.InsertValue(sqlinsert, addvalue, value);

                    string sqlSelectCheckname = @"SELECT max(CheckName.CheckName_Num)As numCheck  FROM EnrollIn INNER JOIN
                      CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID WHERE ([DetailTech_ID] = '" + dchID + "')";
                    string colum = "numCheck";
                    int countid = Convert.ToInt32(selectMaxIDValue(sqlSelectCheckname, colum));
                    for (int i = 1; i <= countid; i++)
                    {
                        string sqlinsertChechname = @"INSERT INTO CheckName (CheckName_Num,Create_date,Enroll_ID)VALUES(@num,(SELECT  distinct CheckName.Create_date
                                                            FROM EnrollIn INNER JOIN CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID
                                                             WHERE EnrollIn.DetailTech_ID=@deid AND CheckName.CheckName_Num=@num),( select max(Enroll_ID) FROM EnrollIN))";
                        string addvalueinsert = "@num,@deid";
                        string valueinsert = i.ToString() + "," + dchID;
                        conn.InsertValue(sqlinsertChechname, addvalueinsert, valueinsert);

                    }


                }
                conn.Close();
                return true;


            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool deleteStudentInclass(string id, string dchID)
        {

            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string sqlcheckEnrollInCheckname = @"SELECT  CheckName.CheckName_ID  FROM  CheckName INNER JOIN
                      EnrollIn ON CheckName.Enroll_ID = EnrollIn.Enroll_ID WHERE(EnrollIn.DetailTech_ID = '" + dchID + "') AND (EnrollIn.Std_Campus_Code = '" + id + "')";

                SqlDataReader drrcheckNameinroll = conn.SelectSqlDataReader(sqlcheckEnrollInCheckname);
                if (drrcheckNameinroll.HasRows)
                {

                    string deleteCheckName = @"DELETE FROM CheckName WHERE CheckName_ID  in ( SELECT  CheckName.CheckName_ID  FROM  CheckName INNER JOIN
                      EnrollIn ON CheckName.Enroll_ID = EnrollIn.Enroll_ID WHERE(EnrollIn.DetailTech_ID = @deid) AND (EnrollIn.Std_Campus_Code = @id))";
                    string addvalueDelete = "@deid,@id";
                    string valuedelete = dchID + "," + id;
                    conn.DeleteValue(deleteCheckName, addvalueDelete, valuedelete);

                    string sqlinsert = "DELETE FROM EnrollIn WHERE Std_Campus_Code=@id AND  DetailTech_ID=@dchID";
                    string addvalue = "@id,@dchID";
                    string value = id + "," + dchID;
                    conn.InsertValue(sqlinsert, addvalue, value);

                }
                conn.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool insertGrade(string codesubject, string codestd, string grade, string detailID)
        {
            try
            {

                ClassConnectDB conn = new ClassConnectDB();

                string selectCheck = @"SELECT    DetailTech.DetailTech_Term  FROM  EnrollIn INNER JOIN DetailTech ON EnrollIn.DetailTech_ID = DetailTech.DetailTech_ID
                                            where DetailTech.DetailTech_ID='" + detailID + "'";
                SqlDataReader drr = conn.SelectSqlDataReader(selectCheck);
                if (!drr.HasRows)
                {

                    string sqlSchoolRecord = @"  INSERT INTO SchoolRecord
                                          (SchoolRecord_Level, SchoolRecord_Ter, SchoolRecord_Year, Std_Campus_Code)
                                        SELECT  DetailTech.DetailTech_Level, DemtailTech.DetailTech_Term, DetailTech.DetailTeach_Year, EnrollIn.Std_Campus_Code
                                        FROM         EnrollIn INNER JOIN DetailTech ON EnrollIn.DetailTech_ID = DetailTech.DetailTech_ID
                                        where DetailTech.DetailTech_ID=@deid ";
                    string Addvalue = "@deid";
                    string value = detailID;
                    conn.InsertValue(sqlSchoolRecord, Addvalue, value);
                }

                /*join enrool  ; if not Enrolln your can't check*/
                string sqlInserDetailTeach = @"INSERT INTO DetailResultStudent (StructSub_Code, DeStudent_Grade, SchoolRecord_ID)
                                            VALUES (@code,@grade,(
                                            SELECT     SchoolRecord_ID FROM SchoolRecord where  SchoolRecord_Year=
                                            (SELECT      DetailTech.DetailTeach_Year  FROM         EnrollIn INNER JOIN  DetailTech ON EnrollIn.DetailTech_ID = DetailTech.DetailTech_ID where DetailTech.DetailTech_ID=@detailID )
                                            AND  SchoolRecord_Term =
                                            (SELECT    DetailTech.DetailTech_Term  FROM  EnrollIn INNER JOIN DetailTech ON EnrollIn.DetailTech_ID = DetailTech.DetailTech_ID
                                            where DetailTech.DetailTech_ID=@detailID ))) ";
                string AddvalueDE = "@code,@grade,@detailID";
                string valueDe = codesubject + "," + grade + "," + detailID;
                conn.InsertValue(sqlInserDetailTeach, AddvalueDE, valueDe);


                conn.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool insertInstructionMedia(string classID, string namefile, string type, string path, string des, string filesize)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"INSERT INTO InstructionMedia
                      (InstMedia_Name, InstMedia_Type, InstMedia_Path, InstMedia_Description, Create_date, ClassRoom_ID,InstMedia_Size)
                        VALUES(@name,@type,@path,@des,getdate(),@classID,@filetype)";
                string addvalue = "@name,@type,@path,@des,@classID,@filetype";
                string value = namefile + "," + type + "," + path + "," + des + "," + classID + "," + filesize;

                bool insert = conn.InsertValue(sql, addvalue, value);
                if (insert)
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

        public static DataTable selectShowListViewFileMediaTeacher(string classRoomID)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT [InstMedia_ID]
                              ,[InstMedia_Name]
                              ,[InstMedia_Type]
                              ,[InstMedia_Size]
                              ,[InstMedia_Path]
                              ,[InstMedia_Description]
                              ,REPLACE(CONVERT(VARCHAR(11), Create_date, 106), ' ', '-') AS Create_date
                              ,[ClassRoom_ID]
                          FROM InstructionMedia
                          where ClassRoom_ID='" + classRoomID + "'";
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

        public static bool deleteFileMedia(string id)
        {
            string sql = "DELETE FROM InstructionMedia Where  InstMedia_ID=@id";
            string Addvalue = "@id";
            string value = id;
            ClassConnectDB conn = new ClassConnectDB();
            return conn.DeleteValue(sql, Addvalue, value);

        }

//        public static bool insertHomeworkFileName(string homeworkname, string classid, string tchid)
//        {
//            try
//            {
//                bool insert = false;
//                ClassConnectDB conn = new ClassConnectDB();

//                string sqlselectEnrolID = @"    SELECT distinct en.Enroll_ID FROM DetailEducationOfStudent dedu 
//                                             INNER JOIN EnrollIn en ON dedu.DeEduStd = en.DeEduStd   
//                                             WHERE  dedu.ClassRoom_ID='" +classid+"'";
//                SqlDataReader drrread = conn.SelectSqlDataReader(sqlselectEnrolID);
//                DataTable dt = new DataTable();
//                dt.Load(drrread);

//                string sqlmaxid = "SELECT max([Homework_Num]) + 1  as num FROM [Homework]";
//                string columnMaxid = "num";
//                string maxhomeworkID = selectMaxIDValue(sqlmaxid, columnMaxid);

//                foreach (DataRow roo in dt.Rows)
//                {


//                    string sqlinsert = @"INSERT INTO Homework(Homework_Name, Homework_Num, Enroll_ID, Tch_Create, Create_date,Homework_Status)
//                      VALUES     (@homeworkName,@maxhomworkID,@enroll,@tchid,getdate(),'N')";
//                    string addvalue = "@homeworkName,@classid,@tchid,@enroll,@maxhomworkID";
//                    string value = homeworkname + "," + classid + "," + tchid + "," + roo[0].ToString() + "," + maxhomeworkID;

//                    insert = conn.InsertValue(sqlinsert, addvalue, value);

//                }
//                if (insert)
//                {
//                    return true;
//                }
//                else
//                {
//                    return false;
//                }


//            }
//            catch (Exception)
//            {
//                return false;
//                throw;
//            }
//        }

        public static string selectMaxIDValue(string sql, string column)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string maxid = "";
                SqlDataReader read = conn.SelectSqlDataReader(sql);
                while (read.Read())
                {
                    try
                    {

                        maxid = (Convert.ToInt32(read[column].ToString())).ToString();

                    }
                    catch (Exception)
                    {
                        maxid = "1";
                    }
                }
                return maxid;
            }
            catch (Exception)
            {

                throw;
            }

        }

        public static DataTable selectShowListViewMainHomeWork(string classid, string dchid)
        {
            try
            {

                DataTable resultdt = new DataTable();
                resultdt.Columns.Add("Homework_Name");
                resultdt.Columns.Add("Create_date");
                resultdt.Columns.Add("Create_time");
                resultdt.Columns.Add("countuser");
                resultdt.Columns.Add("Homework_Num");
                resultdt.Columns.Add("Tch_Create");


                string sqlselectNumcheckname = @" SELECT distinct  hw.[Homework_Num] from  Homework  hw INNER JOIN
                                                  EnrollIn en ON hw.Enroll_ID = en.Enroll_ID INNER JOIN
                                                  DetailEducationOfStudent deu ON  deu.DeEduStd=en.DeEduStd
                                                    where     deu.EduStdID       = '" + dchid + "'";

                ClassConnectDB con = new ClassConnectDB();
                SqlDataReader drrselectNumcheck = con.SelectSqlDataReader(sqlselectNumcheckname);
                DataTable selectdt = new DataTable();
                selectdt.Load(drrselectNumcheck);

                if (selectdt.Rows.Count > 0)
                {
                    foreach (DataRow roww in selectdt.Rows)
                    {
                        string num = roww[0].ToString();
                        string sqlselecthowork = @"  SELECT distinct [Homework_Name]
	                             ,(  SELECT distinct CONVERT(VARCHAR(12),Create_date, 106)    FROM Homework  INNER JOIN   EnrollIn ON Homework.Enroll_ID = EnrollIn.Enroll_ID INNER JOIN
                                        DetailEducationOfStudent dedu ON  EnrollIn.DeEduStd= dedu.DeEduStd  where (dedu.ClassRoom_ID = @classid ) AND (Homework.Homework_Num=@num))AS Create_date
                                ,(SELECT distinct( CONVERT(CHAR(5), Create_date, 114)) FROM   Homework  INNER JOIN      EnrollIn ON Homework.Enroll_ID = EnrollIn.Enroll_ID INNER JOIN
                                           DetailEducationOfStudent dedu ON  EnrollIn.DeEduStd= dedu.DeEduStd  where (dedu.ClassRoom_ID = @classid) AND (Homework.Homework_Num=@num))as Create_time 
                                ,( SELECT count(Homework.Enroll_ID)   FROM         Homework  INNER JOIN   EnrollIn ON Homework.Enroll_ID = EnrollIn.Enroll_ID INNER JOIN
                                            DetailEducationOfStudent dedu ON  EnrollIn.DeEduStd= dedu.DeEduStd  where (dedu.ClassRoom_ID =  @classid) AND (Homework.Homework_Num=@num) AND (Homework_Status='Y')) AS countuser
                              ,[Homework_Num]
                              ,[Tch_Create]
                          FROM [Homework]     where Homework_Num = @num ";
                        string addvalue = "@classid,@num";
                        string value = classid + "," + num;

                        SqlDataReader drr = con.SelectWhereSqlDataReader(sqlselecthowork, addvalue, value);
                        DataTable dtt = new DataTable();
                        dtt.Load(drr);
                        foreach (DataRow roo in dtt.Rows)
                        {
                            resultdt.Rows.Add(roo[0].ToString(), roo[1].ToString(), roo[2].ToString(), roo[3].ToString(), roo[4].ToString(), roo[5].ToString());
                        }
                    }
                }

                return resultdt;

            }
            catch (Exception)
            {
                return null;
            }
        }

//        public static DataTable showStudentSendHomeWork(string detailTeachid, string numhomework)
//        {
//            try
//            {
//                ClassConnectDB conn = new ClassConnectDB();
//                string sql = @"SELECT     Student.Std_FName, Student.Std_LName, edu.EduStdLevel, dedu.DeEduStdClass,
//                        Homework.Homework_Num, Homework.Homework_Path,   
//                        CONVERT(VARCHAR(11),Homework.Update_date, 106) 
//                        , CONVERT(VARCHAR(8),Homework.Update_date, 108)
//                        FROM    EnrollIn INNER JOIN
//                      Homework ON EnrollIn.Enroll_ID = Homework.Enroll_ID INNER JOIN
//                      Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code INNER JOIN
//                      DetailEducationOfStudent dedu ON EnrollIn.DeEduStd = dedu.DeEduStd INNER JOIN
//                      EducationOfStudents edu ON dedu.EduStdID=edu.EduStdID 
//                      Where (Homework.Homework_Num='" + numhomework + "') AND  ( edu.EduStdID  = '" + detailTeachid + "') ";

//                SqlDataReader drr = conn.SelectSqlDataReader(sql);
//                DataTable dt = new DataTable();
//                dt.Load(drr);

//                return dt;

//            }
//            catch (Exception)
//            {
//                return null;
//            }
//        }

        public static bool showStudentSendHomeWork(string homeworkid, string enroolid, string path)
        {

            try
            {
                string sqlupdate = "UPDATE Homework SET   Update_date =getdate(), Homework_Status ='Y', Homework_Path =@path  WHERE Homework_ID=@hwid";
                string addvalue = "@path,@hwid";
                string value = path + "," + homeworkid;

                ClassConnectDB conn = new ClassConnectDB();
                bool update = conn.UpdateValue(sqlupdate, addvalue, value);
                conn.Close();
                if (update)
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

        public static bool deleteHomeWorkByTeacher(string num, string tchid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "DELETE FROM Homework Where (Homework_Num=@num) AND  (Tch_Create=@tchid)";
                string addvalue = "@num,@tchid";
                string value = num + "," + tchid;
                bool delete = conn.DeleteValue(sql, addvalue, value);
                if (delete) { return true; }
                else { return false; }

            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable selectShowListStudentPageAddEducate(string dchID, string status,DataTable dtScopScore)
        {
            try
            {
                DataTable dt = new DataTable();

                string AllScoreCheckName = "";
                string AllSaveSore = "";
                string AllScoreMidterm = "";
                string AllFinal = "";
                string AllScore = "/100";


                foreach (DataRow item in dtScopScore.Rows)
                {
                    AllScoreCheckName = item[0].ToString();
                    AllSaveSore = item[1].ToString();
                    AllScoreMidterm = item[2].ToString();
                    AllFinal = item[3].ToString();
             
                }

                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT     EnrollIn.Enroll_ID, EnrollIn.DeEduStd, EnrollIn.Std_Campus_Code, Student.Std_FName, Student.Std_LName,Student.Std_Campus_Code, Student.Std_YearEducate, Student.Std_Group,'N' as check_name_num , '/" + AllScoreCheckName + "'  AS AllScoreCheckName ,'/" + AllSaveSore + "'  AS AllSaveSore ,'/" + AllScoreMidterm + "'  AS AllScoreMidterm ,'/" + AllFinal + "'  AS AllFinal ,'" + AllScore + "' AS AllScore FROM  Student INNER JOIN EnrollIn ON Student.Std_Campus_Code = EnrollIn.Std_Campus_Code WHERE ([DeEduStd] ='" + dchID + "')";
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


        public static DataTable selectShowStdCheckNameSum(string dchID, string stdCode)
        {
            try
            {
                DataTable dt = new DataTable();

                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT 'STUDENT' , 
                            ( SELECT   COUNT(CheckName_Num) as coou   FROM         EnrollIn INNER JOIN Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code INNER JOIN
                             CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID where Student.Std_Campus_Code=@stdCode and EnrollIn.DeEduStd=@dchid and CheckName_Status='S') as numSTD
		                      ,'LATE',
	                           ( SELECT   COUNT(CheckName_Num) as coou   FROM         EnrollIn INNER JOIN    Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code INNER JOIN
                                    CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID  where Student.Std_Campus_Code=@stdCode and EnrollIn.DeEduStd=@dchid and CheckName_Status='L') as numLate                                 
		                       ,'NO_STD',
	                            (SELECT   COUNT(CheckName_Num) as coou   FROM         EnrollIn INNER JOIN  Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code INNER JOIN
                                  CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID  where Student.Std_Campus_Code=@stdCode and EnrollIn.DeEduStd=@dchid and CheckName_Status='N') as numNosTd
                                ,(SELECT   COUNT(CheckName_Num) as coou   FROM         EnrollIn INNER JOIN  Student ON EnrollIn.Std_Campus_Code = Student.Std_Campus_Code INNER JOIN
                                  CheckName ON EnrollIn.Enroll_ID = CheckName.Enroll_ID  where Student.Std_Campus_Code=@stdCode and EnrollIn.DeEduStd=@dchid ) as numall";
                string addvalue = "@stdCode ,@dchid";
                string value = stdCode + "," + dchID;

                SqlDataReader drr = conn.SelectWhereSqlDataReader(sql, addvalue, value);

                dt.Load(drr);
                conn.Close();

                return dt;
            }
            catch (Exception)
            {
                return null;
            }
        }




        public static bool postInClassRoom(string userid, string usertype, string post, int classid)
        {
            try
            {

                SqlConnection objConn;
                SqlCommand objCmd;

                string sqlInsert = @"INSERT INTO PostClassRoom
                      (PostClassRoom_Detail, Create_date, Create_time, Create_User, ClassRoom_ID, Create_user_type)
                        VALUES (@post,GetDate(),GetDate(),@userid,@classid,@usertype)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@post", SqlDbType.NVarChar).Value = post;
                objCmd.Parameters.Add("@userid", SqlDbType.NVarChar).Value = userid;
                objCmd.Parameters.Add("@classid", SqlDbType.Int).Value = classid;
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

        public static DataTable selectClassRoomPost(int classid)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"SELECT  [PostClassRoom_ID]
                          ,[PostClassRoom_Detail]
                          ,[Create_date]
                          ,[Create_time]
                          ,[Create_User]
                          ,[ClassRoom_ID]
                          ,[Create_user_type]
                      FROM PostClassRoom
                      where ClassRoom_ID = " + classid + " ORDER BY Create_date desc ,  Create_time desc";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }



        public static DataTable selectClassRoomCommentPost(int thePost)
        {

            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" SELECT Top 1 [ComPostClass_ID]
                              ,[ComPostClass_Detail]
                              ,[PostClassRoom_ID]
                              ,[Create_user]
                              ,[Create_date]
                              ,[Create_time]
                                ,[Create_user_type]
                          FROM CommentPostClass 
                            where PostClassRoom_ID = " + thePost + " ORDER BY Create_date desc ,  Create_time desc";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static bool insertComment(string id, string commentDetail, string userid, string usertype)
        {
            try
            {

                SqlConnection objConn;
                SqlCommand objCmd;

                string sqlInsert = @"INSERT INTO CommentPostClass
                      (ComPostClass_Detail, PostClassRoom_ID, Create_user, Create_date, Create_time, Create_user_type)
                        VALUES(@detail,@postID,@createuser,GetDate(),GetDate(),@createType)";
                ConnectDB connpath = new ConnectDB();
                objConn = new SqlConnection();
                objConn.ConnectionString = connpath.connectPath();
                objConn.Open();
                objCmd = new SqlCommand(sqlInsert, objConn);
                objCmd.Parameters.Add("@detail", SqlDbType.NVarChar).Value = commentDetail;
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

        public static DataTable insertGetcoment(int p)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" SELECT   [ComPostClass_ID]
                              ,[ComPostClass_Detail]
                              ,[PostClassRoom_ID]
                              ,[Create_user]
                              ,[Create_date]
                              ,[Create_time]
                                ,[Create_user_type]
                          FROM CommentPostClass 
                            where PostClassRoom_ID = " + p + " ORDER BY Create_date asc ,  Create_time asc";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static string selectAdminUserIDClassRoom(int classid)
        {
            try
            {
                string userid = "";
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "SELECT distinct [Tch_ID] FROM [DetailTech]  where [ClassRoom_ID]='" + classid + "'";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                if (drr.Read())
                {
                    userid = drr["Tch_ID"].ToString();
                }
                conn.Close();
                return userid;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool deleteClosePost(string posid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();



                string deleteCommentsql = "  delete from CommentPostClass where (ComPostClass_ID in (  select ComPostClass_ID  FROM CommentPostClass where PostClassRoom_ID='" + posid + "'))";
                conn.QueryExecuteNonQuery(deleteCommentsql);

                string deletePostSql = "delete from PostClassRoom  where PostClassRoom_ID = '" + posid + "' ";
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
                string sql = " delete from CommentPostClass where ComPostClass_ID='" + commentid + "'";
                conn.QueryExecuteNonQuery(sql);
                conn.Close();
                return true;
            }
            catch (Exception)
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
                                    SELECT  ComPostClass_ID
                                      FROM CommentPostClass
                                     where PostClassRoom_ID='" + posid + "'";
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


        public static bool insertSchoolRecord(string year, string level, string term, string codesubject, string resultGrade, string code, string userid, string userType)
        {
            try
            {
                string sql = @"INSERT INTO SchoolRecord
                      (SchoolRecord_Year, SchoolRecord_Level, SchoolRecord_Term, StructSub_Code, SchoolRecord_Grade, Std_Campus_Code, Create_User, Create_Type, Create_Date, 
                      Update_User, Update_Type, Update_Date)
                    VALUES (@year,@level,@term,@subcode,@grade,@stdcode,@createuser,@createType,getDate(),@updUser,@updType,getDate())";
                string Addvalue = "@year,@level,@term,@subcode,@grade,@stdcode,@createuser,@createType,@updUser,@updType";
                string value = year + "," + level + "," + term + "," + codesubject + "," + resultGrade + "," + code + "," + userid + "," + userType + "," + userid + "," + userType;

                ClassConnectDB conn = new ClassConnectDB();

                bool inert = conn.InsertValue(sql, Addvalue, value);
                if (inert)
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

        public static bool deleteCommentPostInclass(string classRoomid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();



                string deleteCommentsql = "  delete from CommentPostClass where (ComPostClass_ID in (  select ComPostClass_ID  FROM CommentPostClass where ClassRoom_ID='" + classRoomid + "'))";
                conn.QueryExecuteNonQuery(deleteCommentsql);

                string deletePostSql = "delete from PostClassRoom  where ClassRoom_ID = '" + classRoomid + "' ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }


        }



        public static bool deleteInStructionMedia(string classRoomid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string deletePostSql = " DELETE FROM InstructionMedia  where ClassRoom_ID = '" + classRoomid + "' ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }


        }

        public static bool deleteHomeworkd(string detailTeach)
        {

            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string deletePostSql = " DELETE FROM Homework  where Enroll_ID in ( SELECT  Enroll_ID FROM EnrollIn WHERE DeEduStd='" + detailTeach + "' ) ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }


        }

        public static bool deleteCheckName(string detailTeach)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string deletePostSql = " DELETE FROM CheckName  where Enroll_ID in ( SELECT  Enroll_ID FROM EnrollIn WHERE DeEduStd='" + detailTeach + "' ) ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }

        }

        public static bool deleteRoll(string detailTeach)
        {

            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string deletePostSql = " DELETE FROM  EnrollIn  where Enroll_ID in ( SELECT  Enroll_ID FROM EnrollIn WHERE DeEduStd='" + detailTeach + "' ) ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }

        }

        public static bool deleteDetailTeach(string detailTeach)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string deletePostSql = " DELETE FROM  DetailTech  where DetailTech_ID = '" + detailTeach + "' ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }
        }

        public static bool deletClassRoom(string classRoomid)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();

                string deletePostSql = " DELETE FROM  ClassRoom  where ClassRoom_ID = '" + classRoomid + "' ";
                conn.QueryExecuteNonQuery(deletePostSql);

                conn.Close();
                return true;
            }
            catch (Exception) { return false; }
        }

        public static object appoveStudentInclass(string id, string dchID,string status)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "update EnrollIn set Enroll_Status='" + status + "' where Std_Campus_Code='" + id + "' and  DeEduStd='" + dchID + "'";
            bool a = conn.QueryExecuteNonQuery(sql);
            conn.Close();
            return a;

        }

        public static void updateDetailTeach(string detailTeach)
        {
            ClassConnectDB conn = new ClassConnectDB();
            //string sql = "  update  [DetailTech] set [DetailTeach_Status]='N' where [DetailTech_ID]='" + detailTeach + "'";
            string sql = "  update  [DetailEducationOfStudent] set [EduStdStatus]='N' where [DeEduStd]='" + detailTeach + "'";
            bool re = conn.QueryExecuteNonQuery(sql);
            conn.Close();
          //  return re;
        }

       

        public static DataTable selectDetail(string detailTeach)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"  SELECT [DetailTeach_Year],[DetailTech_Level],[DetailTech_Term]
                             FROM [DetailTech]
                             where [DetailTech_ID]='"+detailTeach+"' ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            conn.Close();
            dt.Load(drr);
            return dt;
        }

        public static int countCheckName(string EduStdID)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" select COUNT(chk.CheckName_ID) as countEdu 
                        from CheckName chk INNER JOIN 
                        EnrollIn enrol ON (chk.Enroll_ID=enrol.Enroll_ID)
                         where enrol.DeEduStd='" + EduStdID + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            int count=0;
            while (drr.Read())
            {
                count = Convert.ToInt32(drr["countEdu"].ToString());
            }
            drr.Close();
            conn.Close();
            return count;
        }

        public static bool checkClassDelete()
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" select * FROM   DetailEducationOfStudent where EduStdStatus='A'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            int count = 0;
            DataTable dt = new DataTable();
            dt.Load(drr);
            if (dt.Rows.Count == 1)
            {
                return true;
            }
            else {
                return false;
            }
            conn.Close();
        }

        ////////////// new
        public static System.Data.DataTable showSubjectMainPage(string iduser, string type)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@userId", iduser));
            cmd.Parameters.Add(new SqlParameter("@userType", type));
            return CommonClass.AccessSqlDb.GetData_Store("SP_BackYard_ClassRoom_MainClassRoom", cmd).Tables[0];
        }
        public static bool insertHomeworkFileName(string homeworkname, string dchId, string tchid)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@homeworkname", homeworkname));
            cmd.Parameters.Add(new SqlParameter("@dtchID", dchId));
            cmd.Parameters.Add(new SqlParameter("@tchid", tchid));
                
             return CommonClass.AccessSqlDb.ExecuteData_Store("SP_BackYard_ClassRoom_CreateHomework", cmd);
        }
        public static DataTable showStudentSendHomeWork(string detailTeachid, string numhomework)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@homeworkNum", numhomework));
            cmd.Parameters.Add(new SqlParameter("@detailTeachId", detailTeachid));
            return CommonClass.AccessSqlDb.GetData_Store("SP_BackYard_ClassRoom_ShowStudentSendHomeWork", cmd).Tables[0];
        }
    }

}
