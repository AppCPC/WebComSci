using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class PlanEducate
    {
        public static string selectCuriYear(string yearedu)
        {
            string year = "";
            try
            {
                string sql = @"SELECT max( [Curri_Year]) as yearEducate
                              FROM [Curriculum]
                              where  curri_year <= '" + yearedu + "' ";
                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                if (drr.Read())
                {
                    year = drr["yearEducate"].ToString();
                }
                conn.Close();
                return year;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static System.Data.DataTable selectShowAllPlanTree(string yearCurriEdu)
        {
            DataTable dt = new DataTable();
            try
            {
                string sql = @"SELECT     ShowPlanEducate.ShowPlan_Year, ShowPlanEducate.ShowPlan_Semester, ShowPlanEducate.StructSub_Code, StructSubject.StructSub_NameTha
                                    FROM  ShowPlanEducate INNER JOIN
                                     StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
                                    where ShowPlanEducate.showplan_yearupdate='" + yearCurriEdu + "'";

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                dt.Load(drr);

                return dt;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable selectShowStudentSuject(string code, string user)
        {
            try
            {
                string sql = @"SELECT     SchoolRecord.SchoolRecord_Level, SchoolRecord.SchoolRecord_Term, SchoolRecord.StructSub_Code, StructSubject.StructSub_NameTha,
                                           SchoolRecord.SchoolRecord_Grade   FROM         SchoolRecord INNER JOIN
                                                StructSubject ON SchoolRecord.StructSub_Code = StructSubject.StructSub_Code
                                                where SchoolRecord.Std_Campus_Code='" + user + "'  AND SchoolRecord.StructSub_Code='" + code + "' ";

                ClassConnectDB conn = new ClassConnectDB();
                DataTable dt = new DataTable();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                dt.Load(drr);
                conn.Close();
                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                //return null;
                throw;
            }
        }

        public static DataTable showSubject(string code)
        {
            try
            {
                string sql = "SELECT  *  FROM StructSubject Where StructSub_Code='" + code + "'";
                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader dr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                throw;
                // return null;
            }
        }

        public static DataTable searchSubject(string code)
        {
            try
            {
                string sql = "SELECT  *  FROM FollowSubject Where StructSub_CodePass='" + code + "'";
                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader dr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                throw;
                // return null;
            }
        }

        public static DataTable searchSubjectWhereYear(string code, string year)
        {
            try
            {
                string sql = @" SELECT StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, StructSubject.StructSub_NameEn
                              FROM         Curriculum INNER JOIN  StructSubject ON Curriculum.Curri_Id = StructSubject.Curri_Id
                              WHERE     Curriculum.Curri_Year ='" + year + "' AND  StructSubject.StructSub_Code = '" + code + "' ";
                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader dr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static DataTable selectNameSubjectChildNode(string code, string year)
        {
            try
            {
                //   string sql = @"  SELECT  StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, ShowPlanEducate.ShowPlan_Year, ShowPlanEducate.ShowPlan_Semester
                string sql = @"  SELECT ShowPlanEducate.ShowPlan_Year,ShowPlanEducate.ShowPlan_Semester, StructSubject.StructSub_Code,StructSubject.StructSub_NameTha
                                FROM ShowPlanEducate INNER JOIN
                                                      StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
                                  where ShowPlanEducate.ShowPlan_YearUpdate='" + year + "' AND  StructSubject.StructSub_Code='" + code + "'";

                ClassConnectDB conn = new ClassConnectDB();
                DataTable dt = new DataTable();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                dt.Load(drr);
                conn.Close();
                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                throw;

                //   throw;
            }
        }

        public static DataTable selectShowDatatableStudentUser(string userid)
        {
            try
            {
                DataTable dt = new DataTable();
                string sql = @" SELECT     DetailTech.DetailTech_Level, DetailTech.DetailTech_Term, DetailTech.StructSub_Code, StructSubject.StructSub_NameTha, SchoolRecord.SchoolRecord_Grade
                        FROM         DetailTech INNER JOIN
                      SchoolRecord ON DetailTech.DetailTech_ID = SchoolRecord.DetailTech_ID INNER JOIN
                      StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                         where SchoolRecord.Std_Campus_Code='" + userid + "'";

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader drr = conn.SelectSqlDataReader(sql);

                dt.Load(drr);
                conn.Close();

                return dt;
            }
            catch (Exception ex)
            {
                //return null;
                //Console.WriteLine(ex.ToString());
                throw;
            }
        }

        public static DataTable searchShowPlanTree(string code)
        {
            try
            {
                //string sql="  select StructSub_Code,(select count(*) FROM FollowSubject WHERE FollowSubject_ID=sc.FollowSubject_ID) childnodecount FROM FollowSubject sc where StructSub_CodePass='" + code + "'";

                string sql = @"select DISTINCT FollowSubject.StructSub_Code,1 as  childnodecount
                             FROM ShowPlanEducate INNER JOIN FollowSubject  ON ShowPlanEducate.StructSub_Code=FollowSubject.StructSub_Code
                             where FollowSubject.StructSub_CodePass='" + code + "' ";
                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader dr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(dr);

                conn.Close();

                return dt;
            }
            catch
            {
                return null;
            }
        }

        public static DataSet selecttestListbox()
        {
            DataSet set = new DataSet();
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = " SELECT * FROM [StructSubject] ";
                set = conn.QueryDataSet(sql);
                return set;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable userStudyCompareInCurriculum(string userid, string yearedu)
        {
            /**
             *
             *  method แสดงผลรวมรายวิชาที่นักศึกษาเรียนไปว่าเรียนวิชาในหมวดนี้(curriculum)คิดเป็น กี่หน่วยแล้ว
             *
             **/

            try
            {
                string sql = "";
                return null;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataTable selectAllCurriculum(string yearedu)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "SELECT * FROM Curriculum Where Curri_Year='" + yearedu + "'";
            DataTable dt = new DataTable();
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static DataTable selectCurriUser(string userid, string currid)
        {
            /*ค้นหารายวิชาในหลักสูตรทั้งหมด โดยไม่นับรวมรายวิชาที่ติด F และ W */
            ClassConnectDB conn = new ClassConnectDB();
            DataTable dt = new DataTable();
            string sql = @" SELECT  [Curri_Id] ,[Curri_Year],[Curri_Course],[Curri_Group],[Curri_Credit] as Allcredit
                          ,( SELECT  sum(CAST((substring(sub.[StructSub_Credit],1,1))as int)) as crediteuser
						                   FROM         StructSubject sub INNER JOIN
                                          Curriculum ON sub.Curri_Id = Curriculum.Curri_Id INNER JOIN
                                          EducationOfStudents edu ON sub.StructSub_Code=edu.StructSub_Code INNER JOIN
                                          DetailEducationOfStudent dedu ON edu.EduStdID=dedu.EduStdID INNER JOIN
                                          SchoolRecord ON dedu.DeEduStd = SchoolRecord.DeEduStd
		                    where (Curriculum.Curri_Id='" + currid + "') AND (SchoolRecord.Std_Campus_Code='" + userid + "') and (SchoolRecord.SchoolRecord_Grade <> 'F') and (SchoolRecord.SchoolRecord_Grade <> 'W') )as creditUser  FROM Curriculum where Curri_Id='" + currid + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static DataTable selectCurriInDetailTeach(string currid, string yearA, string yearB)
        {
            /*ค้นหารายวิชาในหลักสูตรทั้งหมด โดยไม่นับรวมรายวิชาที่ติด F และ W */
            ClassConnectDB conn = new ClassConnectDB();
            DataTable dt = new DataTable();
            string sql = @" SELECT  [Curri_Id] ,[Curri_Year],[Curri_Course],[Curri_Group],[Curri_Credit] as Allcredit
                          ,( SELECT  sum(CAST((substring(StructSubject.[StructSub_Credit],1,1))as int)) as crediteuser
						                   FROM         StructSubject INNER JOIN
                                          Curriculum ON StructSubject.Curri_Id = Curriculum.Curri_Id INNER JOIN
                                          DetailTech ON StructSubject.StructSub_Code = DetailTech.StructSub_Code INNER JOIN
                                          SchoolRecord ON DetailTech.DetailTech_ID = SchoolRecord.DetailTech_ID ";

            int yearStart = Convert.ToInt32(yearA);
            int yearEnd = Convert.ToInt32(yearB);

            int level = 1;
            for (int i = yearStart; i <= yearEnd; i++)
            {
                if (level == 1)
                {
                    sql += "   where  ( Curriculum.Curri_Id='" + currid + "' and [DetailTeach_Year] = '" + i + "' and  [DetailTech_Level] =" + level + "   and [DetailTech_Class]='1' ) ";
                }
                else
                {
                    sql += " or ( Curriculum.Curri_Id='" + currid + "' and [DetailTeach_Year] = '" + i + "' and  [DetailTech_Level] =" + level + "  and [DetailTech_Class]='1' )  ";
                }
                level++;
            }

            sql += "  )as creditUser  FROM Curriculum where Curri_Id='" + currid + "'";

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static DataTable selectCurriUser(string curriID)
        {
            ClassConnectDB conn = new ClassConnectDB();
            DataTable dt = new DataTable();
            string sql = @" SELECT     StructSubject.StructSub_Code, StructSubject.StructSub_NameTha
                            FROM   StructSubject INNER JOIN    Curriculum ON StructSubject.Curri_Id = Curriculum.Curri_Id
                              where     Curriculum.Curri_Id='" + curriID + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static int selectMaxYearEdu(string userid)
        {
            int yearedu = 0;
            ClassConnectDB conn = new ClassConnectDB();
            DataTable dt = new DataTable();
            string sql = @"   SELECT  max([SchoolRecord_Level]) as yearedu
                              FROM SchoolRecord   where Std_Campus_Code='" + userid + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            while (drr.Read())
            {
                yearedu = Convert.ToInt32(drr["yearedu"].ToString());
            }

            conn.Close();
            return yearedu;
        }

        public static int selectCrediteSubject(string subject)
        {
            int credit = 0;
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT  sum(CAST((substring(StructSubject.[StructSub_Credit],1,1))as int)) as crediteuser
                                FROM  StructSubject where StructSub_Code='" + subject + "'";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                while (drr.Read())
                {
                    credit = Convert.ToInt32(drr["crediteuser"].ToString());
                }
            }
            catch (Exception)
            {
            }
            return credit;
        }

        public static DataTable selectShowListboxSubject(string userid, string yearedu, DataTable datatableUser)
        {
            /*******************แสดงรายวิชาในห้องเรียนที่มีการเปิดสอน เพือให้นักศึกษาได้ลงทะเบียน*******************/
            ClassConnectDB conn = new ClassConnectDB();

            string sql = @"  SELECT     edu.StructSub_Code, scs.SchoolRecord_Grade   FROM
                           SchoolRecord scs INNER JOIN
		                    DetailEducationOfStudent deu ON  scs.DeEduStd=deu.DeEduStd INNER JOIN
		                    EducationOfStudents edu ON edu.EduStdID=deu.EduStdID
                      where [Std_Campus_Code]='" + userid + "'";
            SqlDataReader drrb = conn.SelectSqlDataReader(sql);
            DataTable dt2 = new DataTable();
            dt2.Load(drrb);

            //getSubjectRecusive();

            //       string sql1 = @" SELECT     distinct StructSubject.StructSub_Code as code,StructSubject.StructSub_NameTha as namethai ,'N' as grade,'Y' as status
            //                         FROM         DetailTech INNER JOIN
            //                      StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
            //                          where DetailTech.DetailTeach_Status='A'   "; //and  EnrollIn.Std_Campus_Code='" + userid + "'

            string sql1 = @"SELECT     distinct scs.StructSub_Code as code,scs.StructSub_NameTha as namethai ,'N' as grade,'Y' as status
             FROM      StructSubject scs INNER JOIN   EducationOfStudents edu ON scs.StructSub_Code=edu.StructSub_Code
          INNER JOIN DetailEducationOfStudent deu ON edu.EduStdID=deu.EduStdID
          where deu.EduStdStatus='A'  ";

            /**ตรวจสอบการลงทะเบียนว่ามีการลงทะเบียนวิชานี้หรือไม่*/
            //       string sqlSelectEnroll = @" SELECT     DetailTech.StructSub_Code  FROM         DetailTech INNER JOIN
            //                      EnrollIn ON DetailTech.DetailTech_ID = EnrollIn.DetailTech_ID where EnrollIn.Std_Campus_Code='"+userid+"'";
            string sqlSelectEnroll = @"  SELECT  distinct   edu.StructSub_Code  FROM
                                     EnrollIn en INNER JOIN
                                     DetailEducationOfStudent dedu ON (en.DeEduStd=dedu.DeEduStd) INNER JOIN
                                     EducationOfStudents edu ON (dedu.EduStdID=edu.EduStdID)
                                    where  en.Std_Campus_Code='" + userid + "'";
            SqlDataReader drrEnroll = conn.SelectSqlDataReader(sqlSelectEnroll);
            DataTable dtt = new DataTable();
            dtt.Load(drrEnroll);

            foreach (DataRow rr in datatableUser.Rows)
            {
                int totalcredit = Convert.ToInt32(rr[4].ToString());
                int totalUsetstd = Convert.ToInt32(rr[5].ToString());
                if (totalUsetstd >= totalcredit)
                {
                    sql1 += "  and Curri_Id <> '" + rr[0].ToString() + "' ";
                }
            }

            if (dt2.Rows.Count > 0)
            {
                foreach (DataRow item in dt2.Rows)
                {
                    if (!item[1].ToString().Equals("F"))
                    {
                        sql1 += " AND  ( scs.StructSub_Code <> '" + item[0].ToString() + "' ) ";
                    }
                }
            }

            if (dtt.Rows.Count > 0)
            {
                foreach (DataRow rrdtt in dtt.Rows)
                {
                    sql1 += " AND  ( scs.StructSub_Code <> '" + rrdtt[0].ToString() + "' ) ";
                }
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql1);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
        }

        public static int selectTerm()
        {
            int term = 0;
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "  SELECT distinct [DetailTech_Term] as term FROM  [DetailTech] where [DetailTeach_Status]='A'  ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            while (drr.Read())
            {
                term = Convert.ToInt32(drr["term"].ToString());
            }
            return term;
        }

        public static void insertEnrollStd(string codeStdRegis, string userid, string year)
        {
            ClassConnectDB conn = new ClassConnectDB();

            /*** SELECT TOP 1000 [DetailTech_ID]
              ,[DetailTech_Level]
              ,[DetailTech_Class]
              ,[DetailTeach_Year]
              ,[DetailTech_Term]
              ,[Tch_ID]
              ,[ClassRoom_ID]
              ,[StructSub_Code]
              ,[Create_user]
              ,[CreateDate]
              ,[DetailTeach_Status]
          FROM [WEBCSDB].[dbo].[DetailTech]
          where [StructSub_Code]='0032001' and [DetailTech_Class]='1' and [DetailTeach_Status]='A'
         *
         * **/
            string selectDchId = "  SELECT  [DetailTech_ID] FROM [DetailTech] where [StructSub_Code]='" + codeStdRegis + "' and [DetailTeach_Status]='A'   and [DetailTech_Class] = (  select [Std_Group] from [Student] where [Std_Campus_Code]='" + userid + "')";
            SqlDataReader drr = conn.SelectSqlDataReader(selectDchId);
            string dchid = "";
            while (drr.Read())
            {
                dchid = drr["DetailTech_ID"].ToString();
            }
            string sql = @"INSERT INTO EnrollIn (DetailTech_ID, Std_Campus_Code, Enroll_Status)
                        VALUES('" + dchid + "','" + userid + "','N')";
            conn.QueryExecuteNonQuery(sql);
            conn.Close();
        }

        public static DataTable selectCheckFw(string userid, string yeared)
        {
            DataTable ddt = new DataTable();
            ddt.Columns.Add("subcode");
            ddt.Columns.Add("grade");
            ddt.Columns.Add("status");

            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"  SELECT     StructSubject.StructSub_Code, SchoolRecord.SchoolRecord_Grade FROM  SchoolRecord INNER JOIN DetailTech ON SchoolRecord.DetailTech_ID = DetailTech.DetailTech_ID INNER JOIN
                      StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                        where [Std_Campus_Code]='" + userid + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);

            while (drr.Read())
            {
                string code = drr["StructSub_Code"].ToString();
                string grade = drr["SchoolRecord_Grade"].ToString();
                if (grade.Equals("F"))
                {
                    ddt.Rows.Add(code, grade, "N");
                }
            }
            return ddt;
        }

        public static bool checkbtn(string userid)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"  SELECT      DetailTech.DetailTech_Level
                            FROM   DetailTech INNER JOIN  EnrollIn ON DetailTech.DetailTech_ID = EnrollIn.DetailTech_ID
                                   where EnrollIn.Std_Campus_Code='" + userid + "' and DetailTech.DetailTeach_Status='A'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            if (drr.HasRows)
            {
                return false;
            }
            else
                return true;
        }

        //-------------------------------------------
        public static System.Data.DataTable getAllSubjectAllPlan(string yearCurriEdu)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@yearEdu", yearCurriEdu));
            return CommonClass.AccessSqlDb.GetData_Store("SP_BackYard_Plan_GetSubjectAllPlan", cmd).Tables[0];
        }

        public static string getYearPlan(string yearedu)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT max( [Curri_Year]) as yearEducate  FROM [Curriculum] ");
            sb.Append("  where  curri_year <= '" + yearedu + "' ");
            return CommonClass.AccessSqlDb.GetData(sb.ToString()).Tables[0].Rows[0][0].ToString();
        }

        public static DataTable getSubjectShowPlanByID(string userid)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@userID", userid));
            return CommonClass.AccessSqlDb.GetData_Store("SP_BackYard_Plan_GetSubjectByUserID", cmd).Tables[0];
        }

        public static DataTable searchShowPlanTree(string code, List<string> subject)
        {
            StringBuilder sbsubject = new StringBuilder();
            sbsubject.Append(" select DISTINCT FollowSubject.StructSub_Code,1 as  childnodecount ");
            sbsubject.Append("  FROM ShowPlanEducate INNER JOIN FollowSubject  ON ShowPlanEducate.StructSub_Code=FollowSubject.StructSub_Code ");
            sbsubject.Append(" where FollowSubject.StructSub_CodePass=" + code);
            if (subject.Count > 0)
            {
                foreach (string item in subject)
                {
                    sbsubject.Append(" AND FollowSubject.[StructSub_Code] <> " + item);
                }
            }
            return CommonClass.AccessSqlDb.GetData(sbsubject.ToString()).Tables[0];
        }

        public static DataTable LoadListBoxCounsel(string studentCode)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@stdCode", studentCode));
            return CommonClass.AccessSqlDb.GetData_Store("SP_LoadDataTo_ListBoxPlanEducate", cmd).Tables[0];
        }

        public static DataTable LoadAllListbox(string studentCode)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@stdCode", studentCode));
            return CommonClass.AccessSqlDb.GetData_Store("SP_LoadAllDataStudy_ListBoxPlanEducate", cmd).Tables[0];
        }
    }
}