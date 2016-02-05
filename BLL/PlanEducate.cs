using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BLL
{
    public class PlanEducate
    {
        public static System.Data.DataTable selectShowAllPlanTree(string yearedu) /*ค้นหารายวิชาทั้งหมดตามหลักสูตร แสดงใน Tree แผนการศึกษา*/
        {
            string yearCurriEdu = DAL.PlanEducate.getYearPlan(yearedu);
            return DAL.PlanEducate.getAllSubjectAllPlan(yearCurriEdu);
        }

        private static DataTable dtReturnchild = new DataTable();

        public static DataTable SelectDistinct(string[] pColumnNames, DataTable pOriginalTable) /*เมธอดที่ใช้ในการกำจัดค่าซ้ำ*/
        {
            DataTable distinctTable = new DataTable();

            int numColumns = pColumnNames.Length;

            for (int i = 0; i < numColumns; i++)
            {
                distinctTable.Columns.Add(pColumnNames[i], pOriginalTable.Columns[pColumnNames[i]].DataType);
            }

            Hashtable trackData = new Hashtable();

            foreach (DataRow currentOriginalRow in pOriginalTable.Rows)
            {
                StringBuilder hashData = new StringBuilder();

                DataRow newRow = distinctTable.NewRow();

                for (int i = 0; i < numColumns; i++)
                {
                    hashData.Append(currentOriginalRow[pColumnNames[i]].ToString());

                    newRow[pColumnNames[i]] = currentOriginalRow[pColumnNames[i]];
                }

                if (!trackData.ContainsKey(hashData.ToString()))
                {
                    trackData.Add(hashData.ToString(), null);

                    distinctTable.Rows.Add(newRow);
                }
            }

            return distinctTable;
        }

        public static System.Data.DataTable selectShowPlanTreeForUser(string userid, string yearedu)
        {
            try
            {
                DataTable dtSubjectAll = new DataTable();
                DataTable dtResult = new DataTable();
                dtResult.Columns.Add("year");
                dtResult.Columns.Add("term");
                dtResult.Columns.Add("code");
                dtResult.Columns.Add("namethai");
                dtResult.Columns.Add("grade");
                dtResult.Columns.Add("status");

                DataTable dtF = new DataTable();
                dtF.Columns.Add("code");
                DataTable dtSubjectF = new DataTable();
                dtSubjectF.Columns.Add("year");
                dtSubjectF.Columns.Add("term");
                dtSubjectF.Columns.Add("code");
                dtSubjectF.Columns.Add("namethai");
                dtSubjectF.Columns.Add("grade");
                dtSubjectF.Columns.Add("status");

                DataTable dtW = new DataTable();
                dtW.Columns.Add("code");
                DataTable dtSubjectW = new DataTable();
                dtSubjectW.Columns.Add("year");
                dtSubjectW.Columns.Add("term");
                dtSubjectW.Columns.Add("code");
                dtSubjectW.Columns.Add("namethai");
                dtSubjectW.Columns.Add("grade");
                dtSubjectW.Columns.Add("status");

                // DataTable dtStudySubject = DAL.PlanEducate.selectShowDatatableStudentUser(userid);
                DataTable dtStudySubject = DAL.PlanEducate.getSubjectShowPlanByID(userid);
                int countGradeF = 0;
                int countGradeW = 0;

                foreach (DataRow rowstd in dtStudySubject.Rows)
                {
                    if ((rowstd[4].ToString()).Equals("F") || (rowstd[4].ToString()).Equals("f"))
                    {
                        dtResult.Rows.Add(rowstd[0], rowstd[1], rowstd[2], rowstd[3], rowstd[4], "N");
                        dtF.Rows.Add(rowstd[2].ToString());
                        countGradeF++;
                    }
                    else if ((rowstd[4].ToString()).Equals("W") || (rowstd[4].ToString()).Equals("w"))
                    {
                        dtResult.Rows.Add(rowstd[0], rowstd[1], rowstd[2], rowstd[3], rowstd[4], "N");
                        dtW.Rows.Add(rowstd[2].ToString());
                        countGradeW++;
                    }
                    else
                    {
                        dtResult.Rows.Add(rowstd[0], rowstd[1], rowstd[2], rowstd[3], "P", "Y");
                    }
                }

                /************* ตรวจสอบปีการศึกษา *******************/
                string year = DAL.PlanEducate.selectCuriYear(yearedu);

                /******************** ถ้าติด F ให้ไปหาโนดลูกแล้วเซ็ท เป็น FN ************************/
                //if (countGradeF > 0)
                //{
                //    DataTable dtchildF = getSubjectRecusive(dtF, yearedu);
                //    foreach (DataRow rowsChlidF in dtchildF.Rows)
                //    {
                //        DataTable dtt = DAL.PlanEducate.selectNameSubjectChildNode(rowsChlidF[0].ToString(), year);
                //        foreach (DataRow rowAllsubjectF in dtt.Rows)
                //        {
                //            int maxyearEdu=DAL.PlanEducate.selectMaxYearEdu(userid);
                //            string yearResult=((Convert.ToInt32(rowAllsubjectF[0].ToString()))+ maxyearEdu).ToString();
                //            dtResult.Rows.Add(yearResult, rowAllsubjectF[1], rowAllsubjectF[2], rowAllsubjectF[3], "FN", "N");
                //        }
                //    }

                //}

                /****************** ถ้าถอนเอา w ไปหาโหนดลูก ***********************************************/
                //if (countGradeW > 0)
                //{
                DataTable dtchildW = getSubjectRecusive(dtW, yearedu);
                //    foreach (DataRow rowsChlidW in dtchildW.Rows)
                //    {
                //   DataTable dtt = DAL.PlanEducate.selectNameSubjectChildNode(rowsChlidW[0].ToString(), year);
                //        foreach (DataRow rowAllsubjectW in dtt.Rows)
                //        {
                //            int maxyearEdu = DAL.PlanEducate.selectMaxYearEdu(userid);
                //            string yearResult = ((Convert.ToInt32(rowAllsubjectW[0].ToString())) + maxyearEdu).ToString();
                //            dtResult.Rows.Add(yearResult, rowAllsubjectW[1], rowAllsubjectW[2], rowAllsubjectW[3], "WN", "N");
                //        }
                //    }

                //}

                return dtResult;
            }
            catch (Exception ex)
            {
                //Console.WriteLine(ex.ToString());
                return null;

                //return null;
            }
        }

        private static DataTable getChild(string thisNode)        /* Recursive Method get Child Node subject Pass*/
        {
            DataTable dt = new DataTable();
            dt = DAL.PlanEducate.searchSubject(thisNode);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    try
                    {
                        DataTable dtChild = new DataTable();
                        dtChild.Rows.Clear();
                        dtChild = DAL.PlanEducate.searchSubject(row["StructSub_Code"].ToString());
                        if (dtChild.Rows.Count > 0)
                        {
                            getChild(row["StructSub_Code"].ToString());
                        }
                    }
                    catch (Exception)
                    {
                    }
                    string subCode = row["StructSub_Code"].ToString();
                    string subCodePass = row["StructSub_CodePass"].ToString();

                    dtReturnchild.Rows.Add(row["StructSub_Code"].ToString(), row["StructSub_CodePass"].ToString());
                }
            }

            return dtReturnchild;
        }

        public static DataTable searchSubject(string code, List<string> listSubject)
        {
            return DAL.PlanEducate.searchShowPlanTree(code, listSubject);
        }

        public static DataTable selectShowStudentSuject(string sub, string userid)
        {
            return DAL.PlanEducate.selectShowStudentSuject(sub, userid);
        }

        public static DataTable ShowSubjectChildNodeConsult(DataTable dt2, string year) /*Datatable ตรวจสอบรายวิชาตัวต่อ ที่โยนเข้ามา*/
        {
            try
            {
                dtReturnchild.Columns.Clear();

                dtReturnchild.Columns.Add("StructSub_Code");
                dtReturnchild.Columns.Add("StructSub_CodePass");

                DataTable ddt = new DataTable();

                foreach (DataRow row in dt2.Rows)
                {
                    string code = row[2].ToString();

                    if ((row[4].ToString()).Equals("F"))
                    {
                        ddt = getChild(row[2].ToString());
                    }
                }

                /*select childe node subject Pass*/
                string[] distCol = { "StructSub_Code" };
                DataTable recive = new DataTable();
                recive.Columns.Add("year");
                recive.Columns.Add("term");
                recive.Columns.Add("code");
                recive.Columns.Add("namethai");
                recive.Columns.Add("grade");
                recive.Columns.Add("status");

                /*select NameThai Chai node Subject ADD Datatable recive */
                DataTable re = new DataTable();
                DataTable re2 = new DataTable();
                re = SelectDistinct(distCol, ddt);
                foreach (DataRow roww in re.Rows)
                {
                    string yearCurriEdu = DAL.PlanEducate.selectCuriYear(year);
                    re2 = DAL.PlanEducate.selectNameSubjectChildNode(roww[0].ToString(), yearCurriEdu);

                    foreach (DataRow roo in re2.Rows)
                    {
                        recive.Rows.Add(roo[0], roo[1], roo[2], roo[3], "N", "Y");
                    }
                }

                return re2;
            }
            catch (Exception)
            {
                return null;
                //throw;
            }
        }

        public static DataTable getSubjectRecusive(DataTable datatabesubject, string yearEducate) /*Datatable รายวิชาตัวต่อ */
        {
            try
            {
                dtReturnchild.Columns.Clear();
                dtReturnchild.Columns.Add("StructSub_Code");
                dtReturnchild.Columns.Add("StructSub_CodePass");

                DataTable ddt = new DataTable();

                foreach (DataRow row in datatabesubject.Rows)
                {
                    ddt = getChild(row[0].ToString());
                }

                /*select childe node subject Pass*/
                string[] distCol = { "StructSub_Code" };
                DataTable recive = new DataTable();
                recive.Columns.Add("code");
                recive.Columns.Add("namethai");

                /*select NameThai Chai node Subject ADD Datatable recive */
                DataTable re = new DataTable();
                DataTable showsubjectdt = new DataTable();
                re = SelectDistinct(distCol, ddt);
                foreach (DataRow roww in re.Rows)
                {
                    string showsubject = DAL.PlanEducate.selectCuriYear(yearEducate);
                    showsubjectdt = DAL.PlanEducate.searchSubjectWhereYear(roww[0].ToString(), showsubject);

                    foreach (DataRow roo in showsubjectdt.Rows)
                    {
                        recive.Rows.Add(roo[0], roo[1]);
                    }
                }

                return recive;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataSet selecttestlistBox()
        {
            return DAL.PlanEducate.selecttestListbox();
        }

        public static DataTable userStudyCompareInCurriculum(string userid, string yearedu)
        {
            return DAL.PlanEducate.userStudyCompareInCurriculum(userid, yearedu);
        }

        public static DataTable selectCheckCurriculumFromUser(string userid, string yearedu)
        {
            /*******ตรวจสอบว่านักศึกษาคนนี้เรียนได้กี่หน่วยกิต*******/
            DataTable dtCurriuser = new DataTable();
            dtCurriuser.Columns.Add("curri_id");
            dtCurriuser.Columns.Add("curri_year");
            dtCurriuser.Columns.Add("Curri_Course");
            dtCurriuser.Columns.Add("Curri_Group");
            dtCurriuser.Columns.Add("Allcredit");
            dtCurriuser.Columns.Add("creditUser");

            string year = DAL.PlanEducate.selectCuriYear(yearedu);
            DataTable dtculiculum = DAL.PlanEducate.selectAllCurriculum(year);

            foreach (DataRow rowsCuri in dtculiculum.Rows)
            {
                DataTable ddtCurriuser = DAL.PlanEducate.selectCurriUser(userid, rowsCuri[0].ToString());
                foreach (DataRow rr in ddtCurriuser.Rows)
                {
                    string sumcurri = rr[5].ToString();
                    if (rr[5].ToString().Equals(""))
                    {
                        dtCurriuser.Rows.Add(rr[0], rr[1], rr[2], rr[3], rr[4], "0");
                    }
                    else
                    {
                        dtCurriuser.Rows.Add(rr[0], rr[1], rr[2], rr[3], rr[4], rr[5]);
                    }
                }
            }

            return dtCurriuser;
        }

        public static DataTable selectCheckCurriculumFromDetailTeach(string yearedu, string yearCurrent)
        {
            /*******ตรวจสอบว่านักศึกษาคนนี้เรียนได้กี่หน่วยกิต*******/
            DataTable dtCurriuser = new DataTable();
            dtCurriuser.Columns.Add("curri_id");
            dtCurriuser.Columns.Add("curri_year");
            dtCurriuser.Columns.Add("Curri_Course");
            dtCurriuser.Columns.Add("Curri_Group");
            dtCurriuser.Columns.Add("Allcredit");
            dtCurriuser.Columns.Add("creditUser");

            string year = DAL.PlanEducate.selectCuriYear(yearedu);
            DataTable dtculiculum = DAL.PlanEducate.selectAllCurriculum(year);

            foreach (DataRow rowsCuri in dtculiculum.Rows)
            {
                DataTable ddtCurriuser = DAL.PlanEducate.selectCurriInDetailTeach(rowsCuri[0].ToString(), yearedu, yearCurrent);
                foreach (DataRow rr in ddtCurriuser.Rows)
                {
                    string sumcurri = rr[5].ToString();
                    if (rr[5].ToString().Equals(""))
                    {
                        dtCurriuser.Rows.Add(rr[0], rr[1], rr[2], rr[3], rr[4], "0");
                    }
                    else
                    {
                        dtCurriuser.Rows.Add(rr[0], rr[1], rr[2], rr[3], rr[4], rr[5]);
                    }
                }
            }

            return dtCurriuser;
        }

        public static DataTable selectSubjectWhereCurriculum(string userid, string yearedu)
        {
            /***********ตรวจสอบว่านักศึกษาเรียนไปเหลือวิชาอะไร***************/
            DataTable dtsubject = new DataTable();
            dtsubject.Columns.Add("curri_id");
            dtsubject.Columns.Add("curri_year");
            dtsubject.Columns.Add("Curri_Course");
            dtsubject.Columns.Add("Curri_Group");
            dtsubject.Columns.Add("Allcredit");
            dtsubject.Columns.Add("creditUser");
            dtsubject.Columns.Add("subjectCode");
            dtsubject.Columns.Add("subjectNameThai");
            DataTable dtShowCurriculum = selectCheckCurriculumFromUser(userid, yearedu);

            foreach (DataRow row in dtShowCurriculum.Rows)
            {
                int crediteAll = Convert.ToInt32(row[4].ToString());
                int credite = Convert.ToInt32(row[5].ToString());
                if (credite < crediteAll)
                {
                    DataTable subjectdt = DAL.PlanEducate.selectCurriUser(row[0].ToString());
                    foreach (DataRow rr in subjectdt.Rows)
                    {
                        dtsubject.Rows.Add(row[0], row[1], row[2], row[3], row[4], row[5], rr[0], rr[1]);
                    }
                }
            }

            return dtsubject;
        }

        public static DataTable selectShowListboxAllsubject(string userid, string yearedu)
        {
            /***********ตรวจสอบรายวิชาและเพิ่มรายวิชาให้ DataTable ***************/

            DataTable dtsubject = new DataTable();
            dtsubject.Columns.Add("code");
            dtsubject.Columns.Add("namethai");
            dtsubject.Columns.Add("grade");
            dtsubject.Columns.Add("status");

            DataTable dtShowCurriculum = selectSubjectWhereCurriculum(userid, yearedu);
            DataTable dtcheckCurri = BLL.PlanEducate.selectShowPlanTreeForUser(userid, yearedu);

            foreach (DataRow rows in dtShowCurriculum.Rows)
            {
                foreach (DataRow rowsub in dtcheckCurri.Rows)
                {
                    /*รายวิชาที่นักศึกษาเรียน และรายวิชาที่เหลือจากการเช็คหลักสูตรต้องไม่เท่ากัน ถึงจะเพิ่มลง DataTable*/
                    if (!(rows[6].Equals(rows[2])))
                    {
                        dtsubject.Rows.Add(rows[6], rows[7], "N", "Y");
                        break;
                    }
                }
            }

            DataRow[] result = dtcheckCurri.Select("grade = 'F' OR grade = 'W' OR grade = 'FN'  OR  grade = 'WN' ");
            foreach (DataRow rowsub in result)
            {
                /**เพิมรายวิชาที่ติด F ลงใน datatable dtsubject*/
                dtsubject.Rows.Add(rowsub[2], rowsub[3], rowsub[4], rowsub[5]);
            }
            return dtsubject;
        }

        public static int selectCrediteSubject(string subject)
        {
            return DAL.PlanEducate.selectCrediteSubject(subject);
        }

        public static string YearEducate(string p)
        {
            return DAL.PlanEducate.selectCuriYear(p);
        }

        public static DataTable selectShowListboxSubject(string userid, string yearedu)
        {
            /***********/
            DataTable dtt = selectCheckCurriculumFromUser(userid, yearedu);

            return DAL.PlanEducate.selectShowListboxSubject(userid, yearedu, dtt);
        }

        public static int selectTerm()
        {
            return DAL.PlanEducate.selectTerm();
        }

        public static void insertEnrolStd(string codeStdRegis, string userid, string year)
        {
            DAL.PlanEducate.insertEnrollStd(codeStdRegis, userid, year);
        }

        public static DataTable selectCheckFW(string userid, string year)
        {
            string yeared = DAL.PlanEducate.selectCuriYear(year);
            DataTable dt = DAL.PlanEducate.selectCheckFw(userid, yeared);

            DataTable getrecusive = getSubjectRecusive(dt, year);

            return dt;
        }

        public static bool checkbtn(string userid)
        {
            return DAL.PlanEducate.checkbtn(userid);
        }

        public static DataTable LoadListBoxCounsel(string studentCode)
        {
            return DAL.PlanEducate.LoadListBoxCounsel(studentCode);
        }

        public static DataTable LoadAllLisbox(string studentCode)
        {
            return DAL.PlanEducate.LoadAllListbox(studentCode);
        }
    }
}