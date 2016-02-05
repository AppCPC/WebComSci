using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class Curriculum
    {
        public static bool insertSubject(Entity.CurriculumInfo subject)
        {
            try 
            {

            subject.Curri_Id = DAL.Curriculum.selectCuriID(subject.Curri_Year,subject.Curri_Course,subject.Curri_Group);

            return DAL.Curriculum.insertSubject(subject);

            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static string selectSubjectPass(string folloSubject)
        {
            return DAL.Curriculum.selectShowNameSubjectPass(folloSubject);
        }


        public static System.Data.DataTable LoadAll(Entity.CurriculumInfo subject)
        {
            try
            {
                    subject.Curri_Id = DAL.Curriculum.selectCuriID(subject.Curri_Year, subject.Curri_Course, subject.Curri_Group);
                    return DAL.Curriculum.LoadAll(subject);
     

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }





        public static bool deleteSubject(string code)
        {
           
            return DAL.Curriculum.deleteSubject(code);
        }

        
        public static Entity.CurriculumInfo selectLoadShowSubject(string code)
        {
            return DAL.Curriculum.selectLoadShowSubject(code);
        }



        public static Entity.CurriculumInfo loadShowGrideAddSubject(string code)
        {
            return DAL.Curriculum.selectLoadShowSubject(code);
        }

        //public static object LoadAllShowGridePageSubject(string code)
        public static System.Data.DataTable LoadAllShowGridePageSubject(string code)
        {
            return DAL.Curriculum.loadAllShowGridePageSubject(code);
        }


        public static bool checkSubjectCode(string code)
        {
            return DAL.Curriculum.checkSubjectCode(code);
        }

        public static bool deleteSubjectFollowSubject(string code,string codePass)
        {
            return DAL.Curriculum.deleteSubjectFollowSubject(code,codePass);
        }

        public static bool getInsertGridAddSubject(string code,string codePass)
        {
            return DAL.Curriculum.getInsertGridAddSubject(code,codePass);
        }

        public static bool updateSubject(Entity.CurriculumInfo subject)
        {
            return DAL.Curriculum.updateSubjectPage(subject);
        }


        public static System.Data.DataTable LoadAllShowManagePlanEducate(Entity.CurriculumInfo subject)
        {
            try
            {
                return DAL.Curriculum.LoadAllAllShowManagePlanEducate(subject);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static bool deletePlanEducate(string planid)
        {
            return DAL.Curriculum.deletePlanEducate(planid);
        }

        public static bool getInsertGridAddPlanEducate(string yearMod,string year, string semes, string code)
        {
            return DAL.Curriculum.getInsertGridAddPlanEducate(yearMod,year,semes,code);
        }

        public static bool deleteGvSubjectShowPlanEdcucatePage(string p, string p_2)
        {
            throw new NotImplementedException();
        }



        public static bool insertYearInManageCurriculumPage(string year)
        {
            return DAL.Curriculum.insertYearInManageCurriculumPage(year);
        }


        public static bool updateYearInManageCurriculumPage(string updyear,string year)
        {
            return DAL.Curriculum.updateInManageCurriculumPage(updyear,year);
        }

        public static bool deleteInManageCuriculumPage(string year)
        {
            return DAL.Curriculum.deleteInManageCurriculumPage(year);
        }

        public static string selectIDAddcurriculumPage(string year,string course,string group)
        {
            
            return DAL.Curriculum.selectIDAddcurriculumPage(year, course,group);
        }

        public static bool confirmSaveInAddcurriculum()
        {
            return DAL.Curriculum.confirmSaveInAddCurriculum();
        }

        public static System.Data.DataTable searchSubRecusiveTest(string p)
        {
            return DAL.Curriculum.searchSubjectRecusiveTest(p);
        }

        public static string reRecusive(string p)
        {
            return DAL.Curriculum.reSubject(p);
        }

        public static System.Data.DataTable searchSubject(string p)
        {
            return DAL.Curriculum.searchSubject(p);
        }

        public static string renameThai(string p)
        {
            return DAL.Curriculum.renamThai(p);
        }

        public static System.Data.DataTable selectShowMainDetailTeach(Entity.CurriculumInfo subject)
        {
            return DAL.Curriculum.selectShowMailDetailTeach(subject);
        }

        public static string getYearCurri(string yearedu)
        {
            return DAL.PlanEducate.selectCuriYear(yearedu);
        }

        public static string getMaxCredit(string year)
        {
            return DAL.Curriculum.selectMaxCredit(year);
        }

        public static System.Data.DataTable getCourse(string year)
        {
            return DAL.Curriculum.getCourse(year);
        }

        public static System.Data.DataTable getGroup(string year, string course)
        {
            return DAL.Curriculum.getGroup(year,course);
        }
    }
}
