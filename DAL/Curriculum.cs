using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace DAL
{
    public class Curriculum
    {
        private static string subcode = "";
        private static string subNameTha = "";
        private static string subNameEn = "";
        private static string detail = "";
        private static string subCre = "";
        private static string curID = "";
        private static string subCodePass = "";


        public static bool insertSubject(Entity.CurriculumInfo subject)
        {
            
             subcode=subject.StructSub_Code.ToString();
            subNameTha=subject.StructSub_NameTha.ToString();
            subNameEn=subject.StructSub_NameEn.ToString();
             detail=subject.StructSub_Detail.ToString();
            subCre=subject.StructSub_Credit.ToString();
            curID=subject.Curri_Id.ToString();

            ClassConnectDB conn = new ClassConnectDB();
            //conn.TransStart();
            try
            {

                string insertSubject = "INSERT INTO StructSubject(StructSub_Code, StructSub_NameTha, StructSub_NameEn, StructSub_Detail, StructSub_Credit, Curri_Id)VALUES(@code,@nameTha,@nameEn,@detail,@struCre,@curiID)";
                string AddvalueSubject = "@code,@nameTha,@nameEn,@detail,@struCre,@curiID";
                string value = subcode + "," + subNameTha + "," + subNameEn + "," + detail + "," + subCre + "," + curID;
                conn.InsertValue(insertSubject,AddvalueSubject,value);

                return true;

            }
            catch (Exception)
            {
                return true;
            }
            conn.Close();

            
        }

        public static string selectCuriID(string curYear, string curCourse, string curGroup)
        {
                    ClassConnectDB con=new ClassConnectDB();
            string reid="";
            try
            {
            string sqlSelect=@"SELECT Curri_Id
                                FROM Curriculum Where Curri_Year=@year AND Curri_Course=@co AND Curri_Group=@group";
            string Addvalue="@year,@co,@group";
            string value=curYear+","+curCourse+","+curGroup;
           SqlDataReader dr= con.SelectWhereSqlDataReader(sqlSelect,Addvalue,value);
           if (dr.Read())
           {
               reid = dr["Curri_Id"].ToString();
           }


            return reid;

            }
            catch (Exception)
            {

                return "";
            }
            con.Close();
            
        }

        public static string selectShowNameSubjectPass(string folloSubject)
        {
            string name;
            ClassConnectDB conn = new ClassConnectDB();
            try
            {
                string sql="SELECT StructSub_NameTha FROM StructSubject WHERE StructSub_Code='"+folloSubject+"'";
               SqlDataReader drr= conn.SelectSqlDataReader(sql);
               if (drr.Read()) {
                   name = drr["StructSub_NameTha"].ToString();
                   return name;
               }
               else
                   return null ;
            }
            catch (Exception)
            {
                return null;
            }


        }

        public static System.Data.DataTable LoadAll(Entity.CurriculumInfo subject)
        {
            string sqlString = "";
            string code = subject.StructSub_Code.ToString();
            string nameThai = subject.StructSub_NameTha.ToString();
            string nameEn = subject.StructSub_NameEn.ToString();
            string curr_id = subject.Curri_Id.ToString();
            try
            {
             
                    sqlString = @"SELECT * FROM Curriculum INNER JOIN
                      StructSubject ON Curriculum.Curri_Id = StructSubject.Curri_Id
                       Where 1=1";
              
                   if (! curr_id.Equals(""))
                    {
                        sqlString += " AND  Curriculum.Curri_Id = " + subject.Curri_Id ;
                    }
                    if (! code.Equals(""))
                    {
                        sqlString += " AND  StructSubject.StructSub_Code like '" + subject.StructSub_Code + "%'  ";
                    }
                    if (! nameThai.Equals(""))
                    {
                        sqlString += " AND StructSubject.StructSub_NameTha like '%" + subject.StructSub_NameTha + "%'  ";
                    }
                    if (! nameEn.Equals(""))
                    {
                        sqlString += " AND StructSubject.StructSub_NameEn like '%" + subject.StructSub_NameEn + "%'  ";
                    }
                
                ClassConnectDB conn = new ClassConnectDB();
              SqlDataReader dr= conn.SelectSqlDataReader(sqlString);

                DataTable dt=new DataTable();
                dt.Load(dr);
              
                return dt; 
                conn.Close();

            }
            catch (Exception)
            {
                return null;
            }
        }



        public static bool deleteSubject(string code)
        {
            try
            {
                string sql = "DELETE FROM StructSubject Where  StructSub_Code = @code";
                string Addvalue = "@code";
                string value = code;

                string sqlDeleteFollowsubject = "DELETE FROM FollowSubject where StructSub_Code = @code";
                ClassConnectDB conn = new ClassConnectDB();
                conn.DeleteValue(sql,Addvalue,value);

                conn.DeleteValue(sqlDeleteFollowsubject,Addvalue,value);

                return true;
            }
            catch (Exception)
            {
                return false;
               
            }
        }

        

        public static Entity.CurriculumInfo selectLoadShowSubject(string code)
        {
            try
            {
                string sql = "SELECT * FROM StructSubject Where StructSub_Code=@code";
                string Addvalue = "@code";
                string value = code;
                Entity.CurriculumInfo sub = new Entity.CurriculumInfo();
                ClassConnectDB conn=new ClassConnectDB();
                SqlDataReader read = conn.SelectWhereSqlDataReader(sql,Addvalue,value);
                if (read.Read()) {
                    sub.StructSub_Code = read["StructSub_Code"].ToString();
                    sub.StructSub_NameTha=read["StructSub_NameTha"].ToString();
                    sub.StructSub_NameEn=read["StructSub_NameEn"].ToString();
                    sub.StructSub_Detail=read["StructSub_Detail"].ToString();
                    sub.StructSub_Credit = read["StructSub_Credit"].ToString();

                   // sub.Curri_Year = read["Curri_Id"].ToString();
                }

                string sqlCurri = "SELECT * FROM Curriculum Where Curri_Id=@curid";
                string addCurri = "@curid";
                string valueCurri = read["Curri_Id"].ToString();
                SqlDataReader readCurri = conn.SelectWhereSqlDataReader(sqlCurri,addCurri,valueCurri);
                if (readCurri.Read()) {
                    sub.Curri_Year = readCurri["Curri_Year"].ToString();
                    sub.Curri_Course = readCurri["Curri_Course"].ToString();
                    sub.Curri_Group = readCurri["Curri_Group"].ToString();
                }



                return sub;
            }
            catch (Exception)
            {
                return null;
               
            }
        }

        


        public static DataTable loadAllShowGridePageSubject(string code)
        {
            if (!code.Equals(""))
            {
                

                                    SqlDataReader drrsub;
                                    string sqlString = "";
                                    ClassConnectDB conn = new ClassConnectDB();

                                    try
                                    {
                                        string sqlfollowSubject = "SELECT  DISTINCT  StructSub_CodePass FROM FollowSubject WHERE StructSub_Code=@code";
                                        string Addvalue = "@code";
                                        string value = code;
                                        SqlDataReader drr = conn.SelectWhereSqlDataReader(sqlfollowSubject, Addvalue, value);


                                        sqlString = @"SELECT *
                                                  FROM StructSubject 
                                                  where   ";
                
                                        int i = 1;
                                        while (drr.Read())
                                        {
                                            if (i == 1)
                                            {
                                                sqlString += "  StructSub_Code='" + drr["StructSub_CodePass"].ToString() + "'";
                                            }
                                            else
                                            {
                                                sqlString += " or StructSub_Code='" + drr["StructSub_CodePass"].ToString() + "'";
                                            }
                                            i++;
                                           
                                        }

                          
 
                                        drrsub = conn.SelectSqlDataReader(sqlString);
                                        DataTable dt = new DataTable();
                                        dt.Load(drrsub);

                                        return dt;
                                        conn.Close();

                }
                catch (Exception)
                {

                    return null;
                }

            }
            else
            {
                return null;
            }
        }



        public static bool checkSubjectCode(string code)
        {
            try{
            ClassConnectDB conn= new ClassConnectDB();
            string sql = "SELECT * FROM    StructSubject Where  StructSub_Code='" + code + "'";
            SqlDataReader check=conn.SelectSqlDataReader(sql);

            if(check.HasRows){

                    return false;
            }
            else
                return true;

            }catch(Exception){
                return false;
            }

        }

        public static bool deleteSubjectFollowSubject(string code,string codePass)
        {
            try
            {
                string sql = "DELETE FROM FollowSubject Where  StructSub_Code = @code AND StructSub_CodePass=@codepass";
                string Addvalue = "@code,@codepass";
                string value = code+","+codePass;

                ClassConnectDB conn = new ClassConnectDB();
                conn.DeleteValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }

        public static bool getInsertGridAddSubject(string code,string codepass)
        {
            try
            {
                string sql = "INSERT INTO FollowSubject(StructSub_Code, StructSub_CodePass)VALUES(@code,@codepass)";
                string Addvalue = "@code,@codepass";
                string value = code + "," + codepass;

                ClassConnectDB conn = new ClassConnectDB();
                conn.InsertValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
            
        }

        public static bool updateSubjectPage(Entity.CurriculumInfo subject)
        {
            try
            {
                string code = subject.StructSub_Code;
                string nameTha = subject.StructSub_NameTha;
                string nameEn = subject.StructSub_NameEn;
                string detail = subject.StructSub_Detail;
                string credit = subject.StructSub_Credit;

                string sql = @"UPDATE    StructSubject 
                    SET  StructSub_NameTha =@nametha, StructSub_NameEn =@nameEn, StructSub_Detail =@nameDe, StructSub_Credit =@nameCre
                    Where   StructSub_Code =@code ";
                string Addvalue = "@nametha,@nameEn,@nameDe,@nameCre,@code";
                string value = nameTha + "," + nameEn + "," + detail + "," + credit + "," + code;

                ClassConnectDB conn = new ClassConnectDB();
                conn.UpdateValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }

       
        public static System.Data.DataTable LoadAllAllShowManagePlanEducate(Entity.CurriculumInfo subject)
        {

            string yearMod = subject.ShowPlan_YearUpdate.ToString();
            string year = subject.ShowPlan_Year.ToString();
            string semis = subject.ShowPlan_Semester.ToString();
            string code = subject.StructSub_Code.ToString();
            string nameThai = subject.StructSub_NameTha.ToString();

            try
            {
                string sqlString = "SELECT * FROM VW_SubjectPlan Where ShowPlan_YearUpdate ='"+yearMod+"'";

                if (!year.Equals("--กรุณาเลือก--"))
                {
                    sqlString += " AND   ShowPlan_Year = " + subject.ShowPlan_Year;
                }
                if (!code.Equals(""))
                {
                    sqlString += " AND  StructSub_Code like '" + subject.StructSub_Code + "%'  ";
                }
                if (!nameThai.Equals(""))
                {
                    sqlString += " AND StructSub_NameTha like '%" + subject.StructSub_NameTha + "%'  ";
                }
                if (!semis.Equals("--กรุณาเลือก--"))
                {
                    sqlString += " AND  ShowPlan_Semester like '%" + subject.ShowPlan_Semester + "%'  ";
                }

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader dr = conn.SelectSqlDataReader(sqlString);

                DataTable dt = new DataTable();
                dt.Load(dr);

                return dt;
                conn.Close();

            }
            catch (Exception)
            {
                return null;
            }
        }

        public static bool deletePlanEducate(string planid)
        {

            try
            {
                string sql = "DELETE FROM ShowPlanEducate Where  ShowPlan_Id = @id";
                string Addvalue = "@id";
                string value = planid;

                ClassConnectDB conn = new ClassConnectDB();
                conn.DeleteValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
            

        }

        public static bool getInsertGridAddPlanEducate(string yearMod, string year, string semes, string code)
        {

            try
            {
                string sql = @"INSERT INTO ShowPlanEducate (ShowPlan_YearUpdate,ShowPlan_Year, ShowPlan_Semester, StructSub_Code) 
                                VALUES(@yearMod,@year,@sem,@code)";
                string Addvalue = "@yearMod,@year,@sem,@code";
                string value = yearMod+","+ year + "," + semes+","+code;

                ClassConnectDB conn = new ClassConnectDB();
                conn.InsertValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }


      /// Manage Data in ManageCuluculum Page
      /// 
        public static bool insertYearInManageCurriculumPage(string year)
        {

            try
            {
                string sql = "INSERT INTO Curriculum (Curri_Year)VALUES(@year)";
                string Addvalue = "@year";
                string value =year;

                ClassConnectDB conn = new ClassConnectDB();
                conn.InsertValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool updateInManageCurriculumPage(string updyear, string year)
        {
            try
            {
                string sql = "UPDATE Curriculum SET Curri_Year =@updyear Where Curri_Year=@year";
                string Addvalue = "@year,@updyear";
                string value = year+","+updyear;

                ClassConnectDB conn = new ClassConnectDB();
                conn.InsertValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }



        public static bool deleteInManageCurriculumPage(string year)
        {

            try
            {
                string sql = "DELETE FROM Curriculum Where  Curri_Year = @year";
                string Addvalue = "@year";
                string value = year;

                ClassConnectDB conn = new ClassConnectDB();
                conn.DeleteValue(sql, Addvalue, value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
            
        }

        public static string selectIDAddcurriculumPage(string year, string course,string group)
        {
            string reID;
            string sql = "SELECT Curri_Id FROM Curriculum WHERE Curri_Year='" + year + "'";
            
            if(!course.Equals("")){
                sql += " AND   Curri_Course ='"+course+"'" ;

            }
            else if(!group.Equals("")){
            
                sql +=" AND Curri_Group='"+group+ "'" ;
            }

            ClassConnectDB conn = new ClassConnectDB();
            SqlDataReader readID = conn.SelectSqlDataReader(sql);
            if (readID.Read())
            {
                reID = readID["Curri_Id"].ToString();
            }
            else reID = "";

            conn.Close();
            return reID;


        }

        public static bool confirmSaveInAddCurriculum()
        {
            try
            {
                string checkID = " SELECT Curri_Id FROM Curriculum WHERE Curri_Year='' OR Curri_Course='' OR Curri_Group='' ";

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader readID = conn.SelectSqlDataReader(checkID);

                while (readID.Read()) {
                    string id = readID["Curri_Id"].ToString();
                    string delete = "DELETE FROM Curriculum WHERE Curri_Id=@id";
                    string Addvalue = "@id";
                    string value = id;
                     conn.DeleteValue(delete,Addvalue,value);
                }

                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        private static SqlDataReader subsearch(string sub)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sqlloop = "SELECT * FROM FollowSubject  WHERE StructSub_CodePass='" + sub + "' ";
            int i = 1;

            SqlDataReader dr = conn.SelectSqlDataReader(sqlloop);
            if (dr.Read())
            {
                return dr;
            }
            else
                return null;

        }

     //   private SqlDataReader sub(string sub)
        public static String reSubject(string subject)
        {
            string allSubject = "";
            ClassConnectDB conn = new ClassConnectDB();
            string sqlloop = "SELECT * FROM FollowSubject  WHERE StructSub_CodePass='" + subject + "' ";
            SqlDataReader read = conn.SelectSqlDataReader(sqlloop);
            
                while (read.Read())
                {
                    allSubject +=  read["StructSub_Code"].ToString()+",";
                    //allSubject += reSubject(read["StructSub_Code"].ToString()) + ",";
                }
            

            return allSubject;

        }

        private static SqlDataReader drrSearch;
        public static DataTable searchSubjectRecusiveTest(string p)
        {
           
            try
            {
                string sql = @"SELECT * 
                              FROM [WEBCSDB].[dbo].[StructSubject]
                                    where StructSub_Code='"+p+"'";
                string Addvalue = "@p";
                string value = p;
                
                ClassConnectDB conn=new ClassConnectDB();
                SqlDataReader dr = conn.SelectWhereSqlDataReader(sql,Addvalue,value);

                DataTable dt = new DataTable();
                dt.Load(dr);

                return dt; 

            }
            catch (Exception)
            {

               return null;
            }
        }

        public static DataTable searchSubject(string p)
        {
            try
            {
            // string sql="  select StructSub_Code,(select count(*) FROM FollowSubject WHERE FollowSubject_ID=sc.FollowSubject_ID) childnodecount FROM FollowSubject sc where StructSub_CodePass='" + p + "'";
             // string sql = "SELECT StructSub_Code,(select count(*) FROM FollowSubject WHERE StructSub_CodePass='" + p + "') childnodecount FROM FollowSubject Where StructSub_CodePass='" + p + "'";
               string sql = "SELECT  *  FROM FollowSubject Where StructSub_CodePass='" + p + "'";

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader dr = conn.SelectSqlDataReader(sql);
                DataTable dt = new DataTable();
                dt.Load(dr);
                return dt;
            }
            catch
            {
                return null;
            }

        }


        public static string renamThai(string p)
        {
            string a="";
            try
            {
                    string sql = @"SELECT *   FROM StructSubject  where StructSub_Code='" + p + "'";
          

                    ClassConnectDB conn = new ClassConnectDB();
                    SqlDataReader dr = conn.SelectSqlDataReader(sql);
                    if (dr.Read())
                    {
                       a = dr["StructSub_NameTha"].ToString();
                    }
                    conn.Close();
                    return a;
            }
            catch (Exception)
            {

                throw;
            }
        }


        public static DataTable selectShowMailDetailTeach(Entity.CurriculumInfo subject)
        {
            try
            {

                
                  string term =  subject.ShowPlan_Semester;
                   string code =  subject.StructSub_Code;
                  string nameEn =  subject.StructSub_NameEn;
                  string nameTha =  subject.StructSub_NameTha ;
                  string Yearupdate =   subject.ShowPlan_YearUpdate ;
                  string year =   subject.ShowPlan_Year ;

               ClassConnectDB conn = new ClassConnectDB();
               string sql = @"SELECT     ShowPlanEducate.StructSub_Code, StructSubject.StructSub_NameTha, StructSubject.StructSub_NameEn, StructSubject.StructSub_Credit,ShowPlanEducate.ShowPlan_Id
                        FROM  StructSubject INNER JOIN
                      ShowPlanEducate ON StructSubject.StructSub_Code = ShowPlanEducate.StructSub_Code INNER JOIN
                      Curriculum ON StructSubject.Curri_Id = Curriculum.Curri_Id
                       where 1=1 ";
                if (!term.Equals("N"))
                {
                    sql += " AND ShowPlanEducate.ShowPlan_Semester =  "+term;
                }
                if (!year.Equals("N"))
                {
                    sql += " AND ShowPlanEducate.ShowPlan_Year = "+year;
                }
                if (!Yearupdate.Equals("")) {
                    sql += " AND   ShowPlanEducate.ShowPlan_YearUpdate = " + Yearupdate;
                }
                if (!code.Equals("")) {
                    sql += " AND   ShowPlanEducate.StructSub_Code = '" + code.ToString()+"'" ;
                }
                if(! nameTha.Equals("")){
                    sql += " AND   StructSubject.StructSub_NameTha = " + nameTha;
                }
                if (!subNameEn.Equals("")) {
                    sql += " AND   StructSubject.StructSub_NameEn = " + nameEn;
                }

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

        public static string selectMaxCredit(string year)
        {
            try
            {
                string credit = "";
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "  select  sum(Curri_Credit) as crecit FROM [Curriculum] where [Curri_Year]='"+year+"'";
                SqlDataReader drr = conn.SelectSqlDataReader(sql);
                while (drr.Read()) {
                    credit = drr["crecit"].ToString();
                }
                return credit;
            }
            catch (Exception)
            {
                return "";
            }
        }



        public static DataTable getCourse(string year)
        {
            try
            {
                ClassConnectDB conn = new ClassConnectDB();
                string sql = "  SELECT distinct [Curri_Course] FROM [Curriculum] where Curri_Year='"+year+"'";
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

        public static DataTable getGroup(string year, string course)
        {
            ClassConnectDB conn = new ClassConnectDB();
            string sql = "  SELECT distinct [Curri_Group],[Curri_Credit]  ,(select SUM([Curri_Credit]) from  [Curriculum]  where Curri_Year='"+year+"' and   [Curri_Course]='"+course+"' ) FROM [Curriculum]  where Curri_Year='" + year + "' and [Curri_Course]='" + course + "'";
            SqlDataReader drr = conn.SelectSqlDataReader(sql);
            DataTable dt = new DataTable();
            dt.Load(drr);
            return dt;


        }
    }
}
