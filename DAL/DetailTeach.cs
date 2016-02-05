using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class DetailTeach
    {
        public static bool insertDetailTeachAfter(string year, string level, string term, string group, string subject, string userid)
        {
            ClassConnectDB conn = new ClassConnectDB();

            string sqlcheckvalue = "SELECT  DetailTech_ID FROM  DetailTech WHERE DetailTech_Level=@level and DetailTech_Class=@class and DetailTeach_Year =@year and DetailTech_Term=@term and  StructSub_Code=@code";
            string addvaluecheck = "@level,@class,@year,@term,@code";
            string valuecheck = level + "," + group + "," + year + "," + term + "," + subject;
            SqlDataReader drrcheck = conn.SelectWhereSqlDataReader(sqlcheckvalue, addvaluecheck, valuecheck);
            if (!drrcheck.HasRows)
            {
                string sql = @"INSERT INTO DetailTech
                      (DetailTech_Level, DetailTech_Class, DetailTeach_Year, DetailTech_Term, StructSub_Code, Create_user, CreateDate)
                        VALUES(@level,@class,@year,@term,@code,@user,getDate())";

                string addvalue = "@level,@class,@year,@term,@code,@user";
                string value = level + "," + group + "," + year + "," + term + "," + subject + "," + userid;
                bool insert = conn.InsertValue(sql, addvalue, value);
                conn.Close();
                if (insert) { return true; }
                else { return false; }
            }
            else
            {
                return false;
            }
        }

        public static bool deleteDetailTeach(string dchID)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "DELETE FROM DetailTech WHERE DetailTech_ID='" + dchID + "'";
            bool del = conn.QueryExecuteNonQuery(sql);
            conn.Close();
            return del;
        }

        public static int checkCredit(string year, string level, string term, string group)
        {
            try
            {
                /****************************
                 * function ตรวจสอบหน่วยกิตทั้งหมด
                 *
                 * **************************/
                int creditAll = 0;
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT sum (CONVERT(int,(SUBSTRING([StructSub_Credit], 1 , 1 )) ))as credit
                          FROM [WEBCSDB].[dbo].[StructSubject]
                          where StructSub_Code in (
                          SELECT TOP 1000 [StructSub_Code]
                          FROM  [DetailTech]
                          where [DetailTech_Level]='" + level + "' and [DetailTech_Class]='" + group + "' and [DetailTeach_Year]='" + year + "' and [DetailTech_Term]='" + term + "' )";

                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                if (drr.Read())
                {
                    creditAll = Convert.ToInt32(drr["credit"].ToString());
                }
                return creditAll;
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static DataTable selectTestCode()
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "  SELECT *  FROM [WEBCSDB].[dbo].[Teacher] ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
        }

        public static bool insertDetailTeach(string yeare, string level, string term, string group, string subject, string userid, string teacher, string classid)
        {
            /*********************************
          *
          * บันทึกรายละเอียดห้องเรียน
          *
          * *******************************/

            string year = (Convert.ToInt32(yeare) + 543).ToString();

            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"INSERT INTO DetailTech
                      (DetailTech_Level, DetailTech_Class, DetailTeach_Year, DetailTech_Term, Tch_ID, ClassRoom_ID, StructSub_Code, Create_user, CreateDate, DetailTeach_Status)
                        VALUES('" + level + "','" + group + "'," + year + ",'" + term + "','" + teacher + "','" + classid + "','" + subject + "','" + userid + "',getDate(),'A')";

            //string addvalue = "@level,@class,@year,@term,@tchid,@classid,@code,@user,";
            //string value = level + "," + group + "," + year + "," + term  +","+teacher+","+classid+","+subject+ "," + userid;
            // bool insert = conn.InsertValue(sql, addvalue, value);
            bool insert = conn.QueryExecuteNonQuery(sql);
            conn.Close();
            if (insert) { return true; }
            else { return false; }
        }

        public static string insertClassIDinDetailTeach(string tchid, string subcode, string level, string term, string yearEdu)
        {
            /*********************************
             *
             * ตรวจสอบห้องเรียนรหัสห้องเรียนว่ามีอยู่หรือไม่
             *
             * *******************************/
            string year = (Convert.ToInt32(yearEdu) + 543).ToString();
            string classid = "";
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"  SELECT     ClassRoom.ClassRoom_ID as classid
                         FROM         ClassRoom INNER JOIN  DetailTech ON ClassRoom.ClassRoom_ID = DetailTech.ClassRoom_ID
                        where  DetailTech.Tch_ID=@tch and DetailTech.StructSub_Code=@subcode  and
                         DetailTech.DetailTech_Term=@term and DetailTech.DetailTeach_Year=@yearEdu";
            string addvalue = "@tch,@subcode,@level,@term,@yearEdu";
            string value = tchid + "," + subcode + "," + level + "," + term + "," + year;
            SqlDataReader drr = conn.SelectWhereSqlDataReader(sql, addvalue, value);
            if (!drr.Read())
            {
                string sqlInsert = @"INSERT INTO ClassRoom(ClassRoom_Name, Create_date)
                                  VALUES( (SELECT   StructSub_NameTha FROM StructSubject where StructSub_Code='" + subcode + "'),getDate())";
                bool insert = conn.QueryExecuteNonQuery(sqlInsert);
                if (insert)
                {
                    string sqlSelectMaxClassid = " SELECT MAX([ClassRoom_ID]) as mx  FROM [WEBCSDB].[dbo].[ClassRoom] ";
                    SqlDataReader drrread = conn.SelectSqlDataReader(sqlSelectMaxClassid);
                    if (drrread.Read())
                    {
                        classid = drrread["mx"].ToString();
                    }
                    drrread.Close();
                }
            }
            else
            {
                classid = drr["classid"].ToString();
                drr.Close();
            }
            conn.Close();
            return classid;
        }

        public static string checkTerm(string yearEdu)
        {
            string term = "";
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" SELECT max ([DetailTech_Term]) as term
                          FROM  [DetailTech]
                          where DetailTeach_Year = " + yearEdu + "";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            if (drr.Read())
            {
                term = drr["term"].ToString();
            }
            conn.Close();
            return term;
        }

        public static DataTable selectShowDetailTechInTerm(string yearEdu, string yearcurri, string termStudy)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"  SELECT [StructSub_Code]
                      FROM [DetailTech]
                      where 1=1 ";

            int yearStart = Convert.ToInt32(yearEdu);
            int yearEnd = Convert.ToInt32(yearcurri);

            int level = 1;
            for (int i = yearStart; i <= yearEnd; i++)
            {
                if (level == 1)
                {
                    sql += " AND (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + "and DetailTech_Class='1' )";
                }
                else
                {
                    sql += " OR (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + " and DetailTech_Class='1' )";
                }

                level++;
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
        }

        public static DataTable selectShowDetailTechInTerm1111(string yearEdu)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"  SELECT [StructSub_Code]
                      FROM [DetailTech]
                      where Year_code = '" + yearEdu + "'";

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
        }

        public static DataTable selectShowDetailTechInPlan(DataTable dtDetailTeach, string yearPlan, string yearEdu, string yearCurrent, string term, DataTable dtcurri)
        {
            ClassConnectDB conn = new ClassConnectDB();

            int yearStart = Convert.ToInt32(yearEdu);
            int yearEnd = Convert.ToInt32(yearCurrent);
            int year = 0;
            int range = yearEnd - yearStart;
            if (range <= 0)
            {
                year = 1;
            }
            else
            {
                year = range;
            }

            string sql = @"  SELECT distinct ShowPlanEducate.StructSub_Code
                          FROM         ShowPlanEducate INNER JOIN
                                 StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
                          where ( ShowPlan_YearUpdate='" + yearPlan + "'  and ( ShowPlan_Year BETWEEN 1 AND " + year + " )";// and [ShowPlan_Semester]="+term+"";
            if (year > 0)
            {
                // ตรวจสอบเทอมในเทเบิลแผนการศึกษา
                int y = year + 1;
                if (term.Equals("1"))
                {
                    sql += " or  ( ShowPlan_YearUpdate='" + yearPlan + "' and ShowPlan_Year = " + y + " and ShowPlan_Semester='1' ) )";
                }
                else
                {
                    sql += " or  ( ShowPlan_YearUpdate='" + yearPlan + "' and ShowPlan_Year = " + y + "  and ( ShowPlan_Semester BETWEEN 1 AND " + term + " )))";
                }
            }

            if (dtDetailTeach.Rows.Count > 0)
            {
                foreach (DataRow rows in dtDetailTeach.Rows)
                {
                    sql += " AND ShowPlanEducate.StructSub_Code <> '" + rows[0] + "'";
                }
            }

            foreach (DataRow curri in dtcurri.Rows)
            {
                int curriuser = Convert.ToInt32(curri[5].ToString());
                int curriAll = Convert.ToInt32(curri[4].ToString());
                if (curriuser >= curriAll)
                {
                    sql += " AND StructSubject.Curri_Id <> " + curri[0].ToString();
                }
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
        }

        private static DataTable selectSubjectXX(string yearEdu, string yearcuri, string code)
        {
            /*****************ตรวจสอบตัวเป็นรายวิชา xxxx **************************/
            DataTable dtt = new DataTable();

            ClassConnectDB conn = new ClassConnectDB();
            string sql = "SELECT     Curri_Id  FROM  StructSubject   where StructSub_Code='" + code + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            if (drr.Read())
            {
                string curID = drr["Curri_Id"].ToString();
                bool check = countDtch(yearEdu, yearcuri, curID);
                if (check)
                {
                    /*******************ถ้ารายวิชานั้นครบ **********************/
                    return null;
                }
                else
                {
                    string sqlselect = @"  SELECT     StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, StructSubject.StructSub_Credit, StructSubject.Curri_Id
                                        FROM         Curriculum INNER JOIN  StructSubject ON Curriculum.Curri_Id = StructSubject.Curri_Id INNER JOIN
                                                              DetailTech ON StructSubject.StructSub_Code = DetailTech.StructSub_Code
                                                          where  StructSubject.Curri_Id='" + curID + "'  ";

                    int yearStart = Convert.ToInt32(yearEdu);
                    int yearEnd = Convert.ToInt32(yearcuri);

                    int level = 1;
                    for (int i = yearStart; i <= yearEnd; i++)
                    {
                        if (level == 1)
                        {
                            sqlselect += "  AND (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + " and DetailTech_Class='1' )";
                        }
                        else
                        {
                            sqlselect += "  OR (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + " and DetailTech_Class='1' )";
                        }

                        level++;
                    }

                    SqlDataReader drrselect = conn.SelectSqlDataReader(sqlselect);

                    dtt.Load(drrselect);
                }
            }

            return dtt;
        }

        private static DataTable selectSubjectXY(string yearEdu, string yearcuri, string code, DataTable dtDetailTeach, DataTable checkCurri)
        {
            /*****************ตรวจสอบตัวเป็นรายวิชา xxxx **************************/
            DataTable dtt = new DataTable();

            ClassConnectDB conn = new ClassConnectDB();
            string sql = "SELECT     Curri_Id  FROM  StructSubject   where StructSub_Code='" + code + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            if (drr.Read())
            {
                string curID = drr["Curri_Id"].ToString();
                bool check = countDtch(yearEdu, yearcuri, curID);
                if (check)
                {
                    /*******************ถ้ารายวิชานั้นครบ **********************/
                    return null;
                }
                else
                {
                    string sqlselect = @"  SELECT     StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, StructSubject.StructSub_Credit, StructSubject.Curri_Id
                                        FROM         Curriculum INNER JOIN  StructSubject ON Curriculum.Curri_Id = StructSubject.Curri_Id INNER JOIN
                                                              DetailTech ON StructSubject.StructSub_Code = DetailTech.StructSub_Code
                                                          where  StructSubject.Curri_Id='" + curID + "'  ";

                    foreach (DataRow rrr in dtDetailTeach.Rows)
                    {
                        sqlselect += " AND StructSubject.StructSub_Code <> '" + rrr[0].ToString() + "' ";
                    }

                    foreach (DataRow curri in checkCurri.Rows)
                    {
                        int curriuser = Convert.ToInt32(curri[5].ToString());
                        int curriAll = Convert.ToInt32(curri[4].ToString());
                        if (curriuser >= curriAll)
                        {
                            sqlselect += " AND StructSubject.Curri_Id <> " + curri[0].ToString();
                        }
                    }

                    ////int yearStart = Convert.ToInt32(yearEdu);
                    ////int yearEnd = Convert.ToInt32(yearcuri);

                    ////int level = 1;
                    ////for (int i = yearStart; i <= yearEnd; i++)
                    ////{
                    ////    if (level == 1)
                    ////    {
                    ////        sqlselect += "  AND (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + " and DetailTech_Class='1' )";
                    ////    }
                    ////    else
                    ////    {
                    ////        sqlselect += "  OR (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + " and DetailTech_Class='1' )";
                    ////    }

                    ////    level++;
                    ////}

                    SqlDataReader drrselect = conn.SelectSqlDataReader(sqlselect);

                    dtt.Load(drrselect);
                }
            }

            return dtt;
        }

        public static bool countDtch(string yearEdu, string yearcurri, string curID)
        {
            /*************** ตรวจสอบจำนวนหน่วยกิตในระบบ ***********************/
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"   SELECT (SUM(  CONVERT(int, substring(StructSubject.StructSub_Credit,0,2)) ))  as ccount
                            FROM         DetailTech INNER JOIN
                             StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                              where  (Curri_Id='" + curID + "')  ";

            int yearStart = Convert.ToInt32(yearEdu);
            int yearEnd = Convert.ToInt32(yearcurri);

            int level = 1;
            for (int i = yearStart; i <= yearEnd; i++)
            {
                if (level == 1)
                {
                    sql += "  AND (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + " and DetailTech_Class='1' )";
                }
                else
                {
                    sql += "  OR (DetailTeach_Year = " + i + " and DetailTech_Level=" + level + " and DetailTech_Class='1' )";
                }

                level++;
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            int countA = 0;
            if (drr.Read())
            {
                string value = drr["ccount"].ToString();
                if (value.Length > 0)
                {
                    countA = Convert.ToInt32(value);
                }
            }

            int countB = 0;
            string sqlAllcredit = "SELECT [Curri_Credit] FROM [WEBCSDB].[dbo].[Curriculum] where [Curri_Id]='" + curID + "'";
            SqlDataReader drrr = conn.SelectSqlDataReader(sqlAllcredit);
            if (drrr.Read())
            {
                countB = Convert.ToInt32(drrr["Curri_Credit"].ToString());
            }

            if (countA >= countB) { return true; }
            else return false;
        }

        public static bool checkSubjectCurri(string code, string cur)
        {
            string selec = "  SELECT [Curri_Id] FROM [WEBCSDB].[dbo].[StructSubject]  where [StructSub_Code]='" + code + "'  and [Curri_Id]='" + cur + "' ";
            ClassConnectDB conn = new ClassConnectDB();
            SqlDataReader drr = conn.SelectSqlDataReader(selec);
            string curri = "";
            //if (drr.Read())
            //{
            //     curri = drr["Curri_Id"].ToString();
            //}
            if (drr.HasRows)
            {
                return true;
            }
            else return false;
        }

        public static DataTable selectShowDetailTeachAddDetailTeach(string yearEdu, string yearCurrent, string level, string termStudy, DataTable dttt)
        {
            string yearPlan = DAL.PlanEducate.selectCuriYear(yearEdu); //ตรวจสอบว่าเรียนหลักสูตรไหน

            DataTable dtDetailTeach = selectShowDetailTechInTerm(yearEdu, yearCurrent, termStudy); // ตรวจสอบว่าช่วงที่เรียนปี 1-ปี N

            //DataTable dtcurri = selectShowDetailTechInTerm1111(yearEdu);

            DataTable dtPlan = selectShowDetailTechInPlan(dtDetailTeach, yearPlan, yearEdu, yearCurrent, termStudy, dttt);

            ClassConnectDB conn = new ClassConnectDB();
            DataTable dt = new DataTable();
            dt.Columns.Add("no");
            dt.Columns.Add("subcode");
            dt.Columns.Add("subThai");
            dt.Columns.Add("credite");
            dt.Columns.Add("curi");

            if (dtPlan.Rows.Count > 0)
            {
                int i = 1;
                foreach (DataRow rowsubject in dtPlan.Rows)
                {
                    string code = rowsubject[0].ToString();

                    if (code.Substring(0, 1).Equals("x"))
                    {
                        DataTable dtx = selectSubjectXY(yearEdu, yearCurrent, code, dtDetailTeach, dttt);
                        try
                        {
                            if (dtx.Rows.Count > 0)
                            {
                                foreach (DataRow rowdtt in dtx.Rows)
                                {
                                    dt.Rows.Add(i, rowdtt[0], rowdtt[1], rowdtt[2], rowdtt[3]);
                                }
                            }
                        }
                        catch (Exception) { }
                    }
                    else
                    {
                        DataTable dtt = selectDetailSubject(rowsubject[0].ToString(), dtDetailTeach, dttt);

                        foreach (DataRow rowdtt in dtt.Rows)
                        {
                            dt.Rows.Add(i, rowdtt[0], rowdtt[1], rowdtt[2], rowdtt[3]);
                        }
                    }

                    i++;

                    //    }
                    //}

                    //dt.Rows.Add(i,dtt.Rows.cell);
                    //string code = rowsubject[0].ToString();
                    //if (code.Substring(0, 1).Equals("x"))
                    //{
                    //}
                    //else {
                    //}
                }
            }
            else
            {
                dt = null;
            }

            //DataTable dtsub = new DataTable();
            //dtsub.Columns.Add("no");
            //dtsub.Columns.Add("subcode");
            //dtsub.Columns.Add("subThai");
            //dtsub.Columns.Add("credite");
            //dtsub.Columns.Add("curi");

            //foreach (DataRow rowcheck in dttt.Rows)
            //{
            //    int curriuser = Convert.ToInt32(rowcheck[5].ToString());
            //    int curriAll = Convert.ToInt32(rowcheck[4].ToString());
            //    string curr = rowcheck[0].ToString();
            //    if (curriuser < curriAll)
            //    {
            //        foreach (DataRow rr in dt.Rows)
            //        {
            //            if (rr[0].Equals(rowcheck[0]))
            //            {
            //                dtsub.Rows.Add(rr[0], rr[1], rr[2], rr[3], rr[4]);
            //            }
            //        }
            //    }
            // }

            return dt;
        }

        private static DataTable selectDetailSubject(string subject, DataTable dttsub, DataTable curriDt)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "SELECT     StructSub_Code, StructSub_NameTha, StructSub_Credit, Curri_Id FROM StructSubject WHERE StructSub_Code='" + subject + "'";

                //foreach (DataRow rrr in dttsub.Rows)
                //{
                //    sql += " AND StructSub_Code = '" + rrr[0].ToString() + "' ";
                //}

                //foreach (DataRow curri in curriDt.Rows)
                //{
                //    int curriuser = Convert.ToInt32(curri[5].ToString());
                //    int curriAll = Convert.ToInt32(curri[4].ToString());
                //    if (curriuser >= curriAll)
                //    {
                //        sql += " AND Curri_Id <> " + curri[0].ToString();

                //    }
                //}

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

        public static DataTable selectShowGrideAddGradeStart(string year)
        {
            try
            {
                DateTime datetime = DateTime.Now;
                int yearCurrent = (datetime.Year + 543);

                int yearEdu = Convert.ToInt32(year);

                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"SELECT   DetailTech_ID,  DetailTech.DetailTeach_Year, DetailTech.DetailTech_Level, DetailTech.DetailTech_Term, StructSubject.StructSub_Code, StructSubject.StructSub_NameTha
                                FROM  StructSubject INNER JOIN  DetailTech ON StructSubject.StructSub_Code = DetailTech.StructSub_Code  WHERE DetailTeach_Status='N'  ";

                int count = 1;
                for (int i = yearEdu; i < yearCurrent; i++)
                {
                    if (count == 1)
                    {
                        sql += " AND (DetailTech.DetailTeach_Year='" + i + "'  and DetailTech_Class='1'   and [DetailTech_Level]='" + count + "' )  ";
                    }
                    else
                    {
                        sql += " OR (DetailTech.DetailTeach_Year='" + i + "'  and DetailTech_Class='1'  and [DetailTech_Level]='" + count + "') ";
                    }
                    count++;
                }

                sql += "  order by DetailTech.DetailTeach_Year ";
                DataTable dtt = new DataTable();
                SqlDataReader drrread = conn.SelectSqlDataReader(sql);

                dtt.Load(drrread);
                conn.Close();
                return dtt;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool insertGradeStart(string year, string level, string term, string code, string resultGrade, string userid, string usertype)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"INSERT INTO SchoolRecord
                      (SchoolRecord_Year, SchoolRecord_Level, SchoolRecord_Term, StructSub_Code, SchoolRecord_Grade, Std_Campus_Code, Create_User, Create_Type, Create_Date)
                       VALUES (@year,@level,@term,@code,@grade,@stdcode,@stdcode,@createtpe,getDate())";

            string addvalue = "@year,@level,@term,@code,@grade,@stdcode,@createtpe";
            string value = year + "," + level + "," + term + "," + code + "," + resultGrade + "," + userid + "," + usertype;
            bool insert = conn.InsertValue(sql, addvalue, value);
            conn.Close();
            if (insert) { return true; }
            else { return false; };
        }

        public static DataTable searchShowDetailTeach(string year, string level, string term)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"SELECT     (DetailTech.DetailTeach_Year) as DetailTeach_Year, (DetailTech.DetailTech_Level) as DetailTech_Level , (DetailTech.DetailTech_Term) as DetailTech_Term, ( StructSubject.StructSub_Code) as  StructSub_Code,( StructSubject.StructSub_NameTha) as StructSub_NameTha,
                      (StructSubject.StructSub_NameEn ) as StructSub_NameEn  , (StructSubject.StructSub_Credit ) as StructSub_Credit  FROM         DetailTech INNER JOIN
                      StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code WHERE 1=1 ";
            if (!year.Equals("N"))
            {
                sql += "  AND [DetailTeach_Year]='" + year + "' ";
            }
            if (!level.Equals("0"))
            {
                sql += " AND  [DetailTech_Level]= '" + level + "'";
            }
            if (!term.Equals("0"))
            {
                sql += " AND [DetailTech_Term] ='" + term + "'";
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static bool checkDetailTeach()
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "SELECT     DetailTech_ID FROM  DetailTech where DetailTeach_Status='A' ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            if (drr.HasRows)
            {
                return false;
            }
            else
                return true;
        }

        public static DataTable selectShowSubjectShowpopup(string year, string code, string nameThai)
        {
            ClassConnectDB conn = new ClassConnectDB();

            string sql = "Select *   FROM  [StructSubject] where 1=1  ";
            if (!string.IsNullOrEmpty(code))
            {
                sql += " and [StructSub_Code]='" + code + "'";
            }
            if (!string.IsNullOrEmpty(nameThai))
            {
                sql += " and [StructSub_NameTha] LIKE '%" + nameThai + "%'";
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static bool checkvalueDoubleShowgride(string ye, string level, string term, string group, string subject, string userid, string teacher)
        {
            /****
             *
             * ตรวจสอบข้อมูลก่อนจะเพิ่มเข้ารายละเอียดการสอนว่ามี ข้อมูลหรือไม่
             *
             * ***************/
            string year = (Convert.ToInt32(ye) + 543).ToString();

            ClassConnectDB conn = new ClassConnectDB();
            string sql = @" select * FROM [DetailTech]
                    where DetailTeach_Year='" + year + "' and DetailTech_Level='" + level + "' and DetailTech_Term='" + term + "' and DetailTech_Class='" + group + "' and StructSub_Code ='" + subject + "' and DetailTeach_Status='A' ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);

            if (drr.HasRows)
            {
                conn.Close();
                return false;
            }
            else
            {
                conn.Close();
                return true;
            }
        }

        public static bool insertGradeStart2(string detailTeachID, string grade, string userid, string usertype, string code)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"INSERT INTO SchoolRecord
                      (DeEduStd, SchoolRecord_Grade, Std_Campus_Code, Create_User, Create_Type, Create_Date)
                       VALUES ('" + detailTeachID + "','" + grade + "','" + code + "','" + userid + "','" + usertype + "',getDate())";
            bool insert = conn.QueryExecuteNonQuery(sql);
            conn.Close();
            if (insert) { return true; }
            else { return false; };
        }

        public static DataTable selectSubjectWithPlan(string yearEdu, int level, int term)
        {
            ClassConnectDB conn = new ClassConnectDB();
            DataTable dt = new DataTable();
            dt.Columns.Add("no");
            dt.Columns.Add("subcode");
            dt.Columns.Add("subThai");
            dt.Columns.Add("credite");
            dt.Columns.Add("curi");

            string sql = @"
                      SELECT     StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, StructSubject.StructSub_Credit, StructSubject.Curri_Id
                     FROM         ShowPlanEducate INNER JOIN
                                          StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
                     where  ShowPlanEducate.ShowPlan_YearUpdate='" + yearEdu + "' and    ShowPlanEducate.ShowPlan_Year='" + level + "' and  ShowPlanEducate.ShowPlan_Semester='" + term + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dtt = new DataTable();
            dtt.Load(drr);
            int i = 1;
            foreach (DataRow item in dtt.Rows)
            {
                dt.Rows.Add(i, item[0], item[1], item[2], item[3]);
                i++;
            }
            return dt;
        }

        public static DataTable selectShowSwap1(string yearEdu, string year, string level, string term, string curri)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string yearPlan = DAL.PlanEducate.selectCuriYear(yearEdu); //ตรวจสอบว่าเรียนหลักสูตรไหน

            DataTable dttt = new DataTable();
            dttt.Columns.Add("code");

            int lev = Convert.ToInt32(level);
            for (int i = 1; i <= lev; i++)
            {
                DataTable dtDetailTeach = selectShowDetailTechInTerm(yearEdu, year, i.ToString()); // ตรวจสอบว่าช่วงที่เรียนปี 1-ปี N
                foreach (DataRow rr in dtDetailTeach.Rows)
                {
                    dttt.Rows.Add(rr[0].ToString());
                }
            }

            string sql = @"SELECT  StructSubject.StructSub_Code as code, StructSubject.StructSub_NameTha as nameTha, StructSubject.StructSub_Credit as credit
                            FROM         Curriculum INNER JOIN   StructSubject ON Curriculum.Curri_Id = StructSubject.Curri_Id
                              where  Curriculum.Curri_Id='" + curri + "' ";

            foreach (DataRow item in dttt.Rows)
            {
                sql += "  and  StructSubject.StructSub_Code <> '" + item[0].ToString() + "' ";
            }

            DataTable dtt = new DataTable();
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            dtt.Load(drr);
            return dtt;
        }

        public static bool deleteDetailTeach(string subcode, string tchID)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "DELETE FROM DetailTech  WHERE  StructSub_Code ='" + subcode + "' AND  Tch_ID='" + tchID + "'";
            bool del = conn.QueryExecuteNonQuery(sql);
            conn.Close();
            return del;
        }

        public static bool updateDetailTeach(string tchid, string classid, string dchid, string subcode, string subThai)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sqlupdateDetailTeach = "UPDATE  DetailTech SET  StructSub_Code='" + subcode + "' where  DetailTech_ID='" + dchid + "' and  Tch_ID='" + tchid + "'";
            bool update = conn.QueryExecuteNonQuery(sqlupdateDetailTeach);

            string sql = "UPDATE    ClassRoom SET ClassRoom_Name='" + subThai + "'  where ClassRoom_ID ='" + classid + "'";
            bool upd = conn.QueryExecuteNonQuery(sql);

            conn.Close();

            return upd;
        }

        public static DataTable selectShowDetailTechInPlanCase3(DataTable dtDetailTeach, string yearPlan, string yearEdu, string yearCurrent, string term, DataTable dtcurri)
        {
            ClassConnectDB conn = new ClassConnectDB();

            int yearStart = Convert.ToInt32(yearEdu);
            int yearEnd = Convert.ToInt32(yearCurrent);
            int year = 0;
            int range = yearEnd - yearStart;
            if (range <= 0)
            {
                year = 1;
            }
            else
            {
                year = range + 1;
            }

            string sql = @" Select distinct ShowPlanEducate.StructSub_Code ,StructSub_NameTha,StructSub_Credit,Curri_Id
                          FROM         ShowPlanEducate INNER JOIN
                                 StructSubject ON ShowPlanEducate.StructSub_Code = StructSubject.StructSub_Code
                          where ( ShowPlan_YearUpdate='" + yearPlan + "'  and ShowPlan_Year = " + year + " and ShowPlan_Semester='" + term + "' )";

            if (dtDetailTeach.Rows.Count > 0)
            {
                foreach (DataRow rows in dtDetailTeach.Rows)
                {
                    sql += " AND ShowPlanEducate.StructSub_Code <> '" + rows[0] + "'";
                }
            }

            foreach (DataRow curri in dtcurri.Rows)
            {
                int curriuser = Convert.ToInt32(curri[5].ToString());
                int curriAll = Convert.ToInt32(curri[4].ToString());
                if (curriuser >= curriAll)
                {
                    sql += " AND StructSubject.Curri_Id <> " + curri[0].ToString();
                }
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;
        }

        public static void selectDatatableCase3(string yearEdu, string yearCurrent, string level, string termStudy, DataTable dttt)
        {
            string yearPlan = DAL.PlanEducate.selectCuriYear(yearEdu); //ตรวจสอบว่าเรียนหลักสูตรไหน

            DataTable dtDetailTeach = selectShowDetailTechInTerm(yearEdu, yearCurrent, termStudy); // ตรวจสอบว่าช่วงที่เรียนปี 1-ปี N

            DataTable dtPlan = selectShowDetailTechInPlanCase3(dtDetailTeach, yearPlan, yearEdu, yearCurrent, termStudy, dttt);

            ClassConnectDB conn = new ClassConnectDB();
            //DataTable dt = new DataTable();
            //dt.Columns.Add("no");
            //dt.Columns.Add("subcode");
            //dt.Columns.Add("subThai");
            //dt.Columns.Add("credite");
            //dt.Columns.Add("curi");

            //int i = 1;
            //if (dtPlan.Rows.Count > 0)
            //{
            //    foreach (DataRow item in dtPlan.Rows)
            //    {
            //        dt.Rows.Add(i,item[0],item[1],item[2],item[3]);
            //        i++;
            //    }
            //}

            foreach (DataRow item in dtPlan.Rows)
            {
                string insert = @"INSERT INTO DetailTech
                                 (DetailTech_Level, DetailTeach_Year, DetailTech_Term, StructSub_Code, DetailTeach_Status,[DetailTech_Class])
                                VALUES('" + level + "','" + yearCurrent + "','" + termStudy + "','" + item[0].ToString() + "','u','1')";
                conn.QueryExecuteNonQuery(insert);
            }

            conn.Close();
            // return dt;
        }

        public static DataTable selectDtShowGrideViewCase3(string year, string level, string term)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"SELECT     StructSubject.StructSub_Code, StructSubject.StructSub_NameTha, StructSubject.StructSub_Credit, StructSubject.Curri_Id,DetailTech_ID
                       FROM DetailTech INNER JOIN
                      StructSubject ON DetailTech.StructSub_Code = StructSubject.StructSub_Code
                      where  DetailTech.DetailTeach_Year='" + year + "' AND DetailTech.DetailTech_Level='" + level + "' AND   DetailTech.DetailTech_Term='" + term + "' AND DetailTech.DetailTeach_Status='u'  ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dtt = new DataTable();
            dtt.Load(drr);

            DataTable dt = new DataTable();
            dt.Columns.Add("no");
            dt.Columns.Add("subcode");
            dt.Columns.Add("subThai");
            dt.Columns.Add("credite");
            dt.Columns.Add("curi");
            dt.Columns.Add("dchid");

            int i = 1;
            if (dtt.Rows.Count > 0)
            {
                foreach (DataRow item in dtt.Rows)
                {
                    dt.Rows.Add(i, item[0], item[1], item[2], item[3], item[4]);
                    i++;
                }
            }

            return dt;
        }

        public static DataTable selectshowSwap(string yearEdu, int year, int level, int term, DataTable dtt, string curr)
        {
            string yearPlan = DAL.PlanEducate.selectCuriYear(yearEdu); //ตรวจสอบว่าเรียนหลักสูตรไหน

            DataTable dtDetailTeach = selectShowDetailTechInTerm(yearEdu, year.ToString(), term.ToString()); // ตรวจสอบว่าช่วงที่เรียนปี 1-ปี N

            ClassConnectDB conn = new ClassConnectDB();
            string sql = "SELECT     StructSub_Code, StructSub_NameTha, StructSub_Credit   FROM   StructSubject  where Curri_Id='" + curr + "'";
            foreach (DataRow rrsubject in dtDetailTeach.Rows)
            {
                sql += " AND  StructSub_Code <> '" + rrsubject[0].ToString() + "' ";
            }

            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dtselect = new DataTable();
            dtselect.Load(drr);

            DataTable dt = new DataTable();
            dt.Columns.Add("no");
            dt.Columns.Add("subcode");
            dt.Columns.Add("subThai");
            dt.Columns.Add("credite");

            int i = 1;
            if (dtselect.Rows.Count > 0)
            {
                foreach (DataRow item in dtselect.Rows)
                {
                    string code = item[0].ToString();
                    if (!code.Substring(0, 1).Equals("x"))
                    {
                        dt.Rows.Add(i, item[0], item[1], item[2]);
                    }

                    i++;
                }
            }

            conn.Close();
            return dt;
        }

        public static bool updateDetailTeach(string ecuID, string code, string codeOld, string year)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                //string sql = "UPDATE    DetailTech SET  StructSub_Code='" + code + "' where DetailTech_ID='" + detailTeach + "'";
                string sql = "UPDATE  EducationOfStudents set StructSub_Code='" + code + "' where EduStdYearEdu=" + year + " and StructSub_Code='" + codeOld + "'";
                string sql2 = "UPDATE    EducationOfStudents  SET  StructSub_Code='" + codeOld + "'  where EduStdID='" + ecuID + "'";
                bool update = conn.QueryExecuteNonQuery(sql);
                bool upd = conn.QueryExecuteNonQuery(sql2);
                conn.Close();
                return update;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static DataTable searchSubject(string year, string course, string group, string code, string yearEdu, string term)
        {
            try
            {
                string yyy = DAL.PlanEducate.selectCuriYear(year);
                string yearPlan = DAL.PlanEducate.selectCuriYear(year); //ตรวจสอบว่าเรียนหลักสูตรไหน
                DataTable dtDetailTeach = selectShowDetailTechInTerm(yearEdu, year.ToString(), term.ToString()); // ตรวจสอบว่าช่วงที่เรียนปี 1-ปี N

                ClassConnectDB conn = new ClassConnectDB();
                string sql = @"  SELECT     StructSubject.StructSub_Code as subcode, StructSubject.StructSub_NameTha as subThai, StructSubject.StructSub_NameEn, StructSubject.StructSub_Credit as credite
                    FROM  StructSubject INNER JOIN
                      Curriculum ON StructSubject.Curri_Id = Curriculum.Curri_Id WHERE Curriculum.Curri_Year='" + yyy + "' AND Curriculum.Curri_Course='" + course + "' AND Curriculum.Curri_Group='" + group + "' ";

                if (!code.Equals(""))
                {
                    sql += " AND StructSubject.StructSub_NameTha LIKE '%" + code + "%' ";
                }

                if (dtDetailTeach.Rows.Count > 0)
                {
                    foreach (DataRow rr in dtDetailTeach.Rows)
                    {
                        sql += " AND StructSubject.StructSub_Code <> '" + rr[0].ToString() + "' ";
                    }
                }

                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(drr);
                conn.Close();

                DataTable dtt = new DataTable();
                dtt.Columns.Add("subcode");
                dtt.Columns.Add("subThai");
                dtt.Columns.Add("credite");
                foreach (DataRow item in dt.Rows)
                {
                    string ccode = item[0].ToString();
                    if (!ccode.Substring(0, 1).Equals("x"))
                    {
                        dtt.Rows.Add(item[0], item[1], item[3]);
                    }
                }

                return dtt;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool insertDetailTeachMdlSub(string code, string yearcurri, string level, string term)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string insert = @"INSERT INTO DetailTech
                                 (DetailTech_Level, DetailTeach_Year, DetailTech_Term, StructSub_Code, DetailTeach_Status,[DetailTech_Class])
                                VALUES('" + level + "','" + yearcurri + "','" + term + "','" + code + "','u','1')";
            bool ins = conn.QueryExecuteNonQuery(insert);
            conn.Close();
            return ins;
        }

        public static bool checksubjectAdd(string yearCurri, string level, string term, string code)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = @" SELECT sum (CONVERT(int,(SUBSTRING([StructSub_Credit], 1 , 1 )) ))as credit
                          FROM [WEBCSDB].[dbo].[StructSubject]
                          where StructSub_Code in (
                          SELECT TOP 1000 [StructSub_Code]
                          FROM  [DetailTech]
                          where [StructSub_Code]='" + code + "')";
                int cre = 0;
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                while (drr.Read())
                {
                    try
                    {
                        cre = Convert.ToInt32(drr["credit"].ToString());
                    }
                    catch (Exception) { cre = 0; }
                }
                conn.Close();

                int check = checkCredit(yearCurri, level, term, "1") + cre;
                if (term.Equals("1") || term.Equals("2"))
                {
                    if (check <= 22) { return true; }
                    else return false;
                }
                else
                {
                    if (check > 9) { return false; }
                    else { return true; }
                }
            }
            catch (Exception) { return false; }
        }

        public static int selectNumClass(string yearEdu)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "SELECT   max ( distinct Std_Group) as mxstd FROM Student where   Std_YearEducate='" + yearEdu + "'";
                int numClass = 0;
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                while (drr.Read())
                {
                    numClass = Convert.ToInt32(drr["mxstd"].ToString());
                }
                conn.Close();
                return numClass;
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public static DataTable searchShowdchOpenSubjectPopup(string code, int year, string term)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"SELECT     DetailTech.DetailTech_ID as dchid, DetailTech.DetailTeach_Year as dchyear, DetailTech.DetailTech_Class as dchgroup, DetailTech.StructSub_Code as codeSub, (Teacher.Tch_FName+'  '+ Teacher.Tch_LName)as tchname
                            FROM  DetailTech INNER JOIN  Teacher ON DetailTech.Tch_ID = Teacher.Tch_ID
                            where  DetailTech.DetailTech_Term='" + term + "' and DetailTech.StructSub_Code='" + code + "' and  DetailTech.DetailTeach_Year='" + year + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static DataTable selectShowStdChoose(string value)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = " select [DetailTech_ID] as dchid , [DetailTech_Class] as grou From DetailTech where  StructSub_Code='" + value + "' and DetailTeach_Status='A' and DetailTeach_Year=(select MAX(DetailTeach_Year) from DetailTech) ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static string selectDetailConsoul(string dchid)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"   SELECT    ('วคท. ชั้นปีที่ '+  CONVERT(varchar(20),DetailTech_Level) + 'ปีการศึกษา '+ DetailTeach_Year+' อาจารย์ผู้สอน '+Teacher.Tch_FName+'   '+Teacher.Tch_LName) as detail
                          FROM   DetailTech INNER JOIN    Teacher ON DetailTech.Tch_ID = Teacher.Tch_ID where DetailTech.DetailTech_ID='" + dchid + "' ";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            string detail = "";
            if (drr.Read())
            {
                detail = drr["detail"].ToString();
            }
            conn.Close();
            return detail;
        }

        public static bool insertEnroll(string userid, string detailTeach)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = @"INSERT INTO EnrollIn (DetailTech_ID, Std_Campus_Code, Enroll_Status)
                       VALUES('" + detailTeach + "','" + userid + "','N')";
            bool inesrt = conn.QueryExecuteNonQuery(sql);
            conn.Close();
            return inesrt;
        }

        public static bool deleteEnroll(string dchid, string userid)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = " delete  FROM [EnrollIn] where Enroll_ID=(select  max (Enroll_ID) from EnrollIn where DetailTech_ID='" + dchid + "' and Std_Campus_Code='" + userid + "' )";
            bool del = conn.QueryExecuteNonQuery(sql);
            conn.Close();
            return del;
        }

        public static DataTable searchShowDetailTeach(string year)
        {
            string sql = "";
            if (year.Equals("N") || year == "N")
            {
                sql = "SELECT  DISTINCT [EduStdYear] as edu FROM [EducationOfStudents]";
            }
            else
            {
                sql = "SELECT  DISTINCT [EduStdYear] as edu FROM [EducationOfStudents] where EduStdYear ='" + year + "'";
            }
            ClassConnectDB conn = new ClassConnectDB();
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();

            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static DataTable getCurrentMonth()
        {
            string sql = @"select
                          datepart(month,getdate()) as currentMonth
                        ,datepart(year,getdate())+543 as curentYear ";

            ClassConnectDB conn = new ClassConnectDB();
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();

            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static DataTable selectDtShowGrideViewOpenSubjec(string year, string level, string term)
        {
            string sql = @"      SELECT ROW_NUMBER()
                            OVER (ORDER BY edu.EduStdID) AS no,stu.StructSub_Code as subcode, stu.StructSub_NameTha as subThai, stu.StructSub_Credit as credite, stu.Curri_Id as curi, edu.EduStdID as dchid
                           FROM         EducationOfStudents edu INNER JOIN
                          StructSubject stu ON edu.StructSub_Code = stu.StructSub_Code
                 where  edu.EduStdYearEdu='" + year + "' AND edu.EduStdLevel=" + level + " AND   edu.EduStdTerm=" + term + "";
            ClassConnectDB conn = new ClassConnectDB();
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();

            dt.Load(drr);
            conn.Close();
            return dt;
        }

        public static bool insertNewSubjectStd(string year, string yearcurri, string userid)
        {
            string sqlinsert = @"  insert into EducationOfStudents (
                                  [EduStdLevel],[EduStdTerm] ,[StructSub_Code],[Create_user],[CreateDate],[EduStdYearEdu],[EduStdYearCurri])
                               SELECT [ShowPlan_Year],[ShowPlan_Semester],[StructSub_Code] ,'" + userid + "' ,GETDATE() ,'" + year + "','" + yearcurri + "'  FROM [WEBCSDB].[dbo].[ShowPlanEducate]  where ShowPlan_YearUpdate='" + yearcurri + "'";
            ClassConnectDB conn = new ClassConnectDB();
            bool insert = conn.QueryExecuteNonQuery(sqlinsert);
            conn.Close();
            return insert;
        }

        public static bool checkBtnOpenNewEducationPage(string year)
        {
            string sql = @"  select * from EducationOfStudents  where EduStdYearEdu='" + year + "'";
            ClassConnectDB conn = new ClassConnectDB();
            SqlDataReader drr = conn.SelectSqlDataReader(sql);

            bool check;
            if (drr.HasRows)
            {
                check = true;
            }
            else { check = false; }
            drr.Close();
            conn.Close();
            return check;
        }

        public static DataTable swapSubject(string yearEdu, int year, int level, int term, string code, string namethai)
        {
            ClassConnectDB conn = new ClassConnectDB();

            string sql = "select distinct  StructSub_Code ,EduStdYearCurri from EducationOfStudents where EduStdYearEdu='" + yearEdu + "' ";

            for (int i = 1; i <= level; i++)
            {
                for (int j = 1; j <= term; j++)
                {
                    sql += "  and ( EduStdLevel=" + i + " and EduStdTerm = " + j + ") ";
                }
            }

            DataTable dt = new DataTable();
            SqlDataReader dr = conn.SelectSqlDataReader(sql);
            dt.Load(dr);

            string sql2 = @"  select ROW_NUMBER() over (order by StructSub_Code ) as no,
                             StructSub_Code as subcode,  StructSub_NameTha as subThai ,  StructSubject.Curri_Id as curi ,  StructSub_Credit as credite
                            FROM         StructSubject INNER JOIN  Curriculum ON StructSubject.Curri_Id = Curriculum.Curri_Id  where 1=1 ";
            int m = 1;
            foreach (DataRow item in dt.Rows)
            {
                if (m == 1)
                {
                    sql2 += " and Curriculum.Curri_Year='" + item[1] + "' ";
                }

                sql2 += "   and StructSubject.StructSub_Code <> '" + item[0] + "' ";
            }

            if (code != "")
            {
                sql2 += " AND StructSubject.StructSub_Code = '" + code + "'";
            }
            if (namethai != "")
            {
                sql2 += " AND StructSubject.StructSub_NameTha LIKE '%" + namethai + "%'";
            }

            DataTable dtt = new DataTable();
            SqlDataReader drr = conn.SelectSqlDataReader(sql2);
            dtt.Load(drr);

            return dtt;
        }
    }
}