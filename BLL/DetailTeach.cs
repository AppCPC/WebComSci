using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class DetailTeach
    {
        public static bool insertDetailTeachAfter(string year, string level, string term, string group, string subject, string userid)
        {

            int checkCredit = DAL.DetailTeach.checkCredit(year, level, term, group);
            int tt = Convert.ToInt32(term);
            if ((checkCredit >= 22 && tt == 1) || (checkCredit > 22 && tt == 2))
            {
                return false;

            }
            else if ((checkCredit >= 9 && tt == 3))
            {
                return false;
            }
            else
            {
                return DAL.DetailTeach.insertDetailTeachAfter(year, level, term, group, subject, userid);
            }

        }

        public static bool deleteDetailTeach(string dchID)
        {
            return DAL.DetailTeach.deleteDetailTeach(dchID);
        }

        public static System.Data.DataTable selectTestCode()
        {
            return DAL.DetailTeach.selectTestCode();
        }

        public static bool insertDetailTeach(string year, string level, string term, string group, string subject, string userid, string teacher)
        {
            string classid = DAL.DetailTeach.insertClassIDinDetailTeach(teacher, subject, level, term, year);
            return DAL.DetailTeach.insertDetailTeach(year, level, term, group, subject, userid, teacher, classid);
        }


        public static System.Data.DataTable selectShowDetailTeachInNewTerm(string yearEdu, string year, string level, string term)
        {
            //  string termStudy=DAL.DetailTeach.checkTerm(yearEdu);

            DataTable dt = BLL.PlanEducate.selectCheckCurriculumFromDetailTeach(yearEdu, year);

            return DAL.DetailTeach.selectShowDetailTeachAddDetailTeach(yearEdu, year, level, term, dt);
        }




        public static System.Data.DataTable selectShowGrideAddGradeStart(string year)
        {
            return DAL.DetailTeach.selectShowGrideAddGradeStart(year);
        }

        public static bool insertGradeStart(string year, string level, string term, string code, string resultGrade, string userid, string usertype)
        {
            return DAL.DetailTeach.insertGradeStart(year, level, term, code, resultGrade, userid, usertype);
        }

        public static System.Data.DataTable searchShowDetailTeach(string year, string level, string term)
        {
            return DAL.DetailTeach.searchShowDetailTeach(year, level, term);
        }

        public static bool checkDetailTeach()
        {
            return DAL.DetailTeach.checkDetailTeach();
        }

        public static System.Data.DataTable selectShowSubjectShowpoup(string year, string code, string nameThai)
        {
            return DAL.DetailTeach.selectShowSubjectShowpopup(year, code, nameThai);
        }

        public static bool checkValueDoubleShowgird(string year, string level, string term, string group, string subject, string userid, string teacher)
        {
            return DAL.DetailTeach.checkvalueDoubleShowgride(year, level, term, group, subject, userid, teacher);
        }

        public static bool insertGradeStart2(string detailTeachID, string grade, string userid, string usertype, string code)
        {
            return DAL.DetailTeach.insertGradeStart2(detailTeachID, grade, userid, usertype, code);
        }

        public static System.Data.DataTable selectSubjectWithPlan(string yearEdu, int level, int term)
        {
            string yearCurriEdu = DAL.PlanEducate.selectCuriYear(yearEdu);
            return DAL.DetailTeach.selectSubjectWithPlan(yearCurriEdu, level, term);
        }

        public static System.Data.DataTable selectShowSwap1(string yearEdu, string year, string level, string term, string curri)
        {
            return DAL.DetailTeach.selectShowSwap1(yearEdu, year, level, term, curri);
        }

        public static bool deleteDetailTeach(string subcode, string tchID)
        {
            return DAL.DetailTeach.deleteDetailTeach(subcode, tchID);
        }

        public static bool updateDetailTeach(string tchid, string classid, string dchid, string subcode, string subtha)
        {
            return DAL.DetailTeach.updateDetailTeach(tchid, classid, dchid, subcode, subtha);
        }

        public static void selectDtDatatableCase3(string yearEdu, string year, string level, string term)
        {
            DataTable dt = BLL.PlanEducate.selectCheckCurriculumFromDetailTeach(yearEdu, year);

            DAL.DetailTeach.selectDatatableCase3(yearEdu, year, level, term, dt);
        }

        public static DataTable selectDTShowGrideViewCase3(string year, string level, string term)
        {
            return DAL.DetailTeach.selectDtShowGrideViewCase3(year, level, term);
        }

        public static DataTable selectShowSubjectSwap(string yearEdu, int year, int level, int term, string curri)
        {
            DataTable dtt = BLL.PlanEducate.selectCheckCurriculumFromDetailTeach(yearEdu, year.ToString());

            return DAL.DetailTeach.selectshowSwap(yearEdu, year, level, term, dtt, curri);
        }

        public static bool updateDetailTeach(string detailTeach, string code , string codeOld,string year)
        {
            return DAL.DetailTeach.updateDetailTeach(detailTeach, code,codeOld,year);
        }

        public static DataTable searchSubject(string year, string course, string group, string code, string yearEdu, string term)
        {
           // DataTable dtt = BLL.PlanEducate.selectCheckCurriculumFromDetailTeach(yearEdu, year.ToString());

            return DAL.DetailTeach.searchSubject(year, course, group, code, yearEdu, term);

        }


        public static string selectYear(string year)
        {
            return DAL.PlanEducate.selectCuriYear(year);
        }

        public static bool insertDetailTeachMdlSub(string code, string yearCurri, string level, string term)
        {
            return DAL.DetailTeach.insertDetailTeachMdlSub(code,yearCurri,level,term);
        }

        public static bool checkSubjectAdd(string yearCurri, string level, string term,string code)
        {
            return DAL.DetailTeach.checksubjectAdd(yearCurri,level,term,code);
        }

        public static int selectNumClass(string yearEdu)
        {
            return DAL.DetailTeach.selectNumClass(yearEdu);
        }

        public static DataTable searhShowdchOpenSubjectPopup(string code, int year, string term)
        {
            return DAL.DetailTeach.searchShowdchOpenSubjectPopup(code,year,term);
        }

        public static DataTable selectShowstdChoose(string value)
        {
            return DAL.DetailTeach.selectShowStdChoose(value);
        }

        public static string selectDetailConsoul(string dchid)
        {
            return DAL.DetailTeach.selectDetailConsoul(dchid);
        }

        public static bool insertEnroll(string userid, string detailTeach)
        {
            return DAL.DetailTeach.insertEnroll(userid,detailTeach);
        }

        public static bool deleteEnroll(string dchid, string userid)
        {
            return DAL.DetailTeach.deleteEnroll(dchid,userid);
        }

        public static DataTable searchShowDetailTeach(string year)
        {
            return DAL.DetailTeach.searchShowDetailTeach(year);
        }

        public static DataTable getCurrentMonth()
        {
            return DAL.DetailTeach.getCurrentMonth();
        }

        public static DataTable selectDTShowGrideViewOpenSubjec(string year, string level, string term)
        {
            return DAL.DetailTeach.selectDtShowGrideViewOpenSubjec(year,level,term);
        }

        public static bool insertNewSubjectStd(string year, string yearcurri,string userid)
        {
            return DAL.DetailTeach.insertNewSubjectStd(year,yearcurri,userid);
        }

        public static bool checkBtnOpenNewEducationPage(string year)
        {
            return DAL.DetailTeach.checkBtnOpenNewEducationPage(year);
        }

        public static DataTable swapSubject(string yearEdu, int year, int level, int term, string code,string NameThai)
        {
            return DAL.DetailTeach.swapSubject(yearEdu,year,level,term,code,NameThai);
        }
    }
}
