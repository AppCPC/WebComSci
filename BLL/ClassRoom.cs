using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data;

namespace BLL
{
    public class ClassRoom
    {
        public static System.Data.DataTable showSubjectMainPage(string iduser, string type)
        {
            return DAL.ClassRoom.showSubjectMainPage(iduser, type);
        }

        public static System.Data.DataTable showRoomMemberInClassCheckNamePage(string userId, string classroom)
        {
            return DAL.ClassRoom.showRoomMemberInClassCheckNamePage(userId, classroom);
        }

        public static bool checkNameStudent(string checkType, string code, string deid)
        {
            return DAL.ClassRoom.checkNameStudent(checkType, code, deid);
        }

        public static System.Data.DataTable checkNameSum(string detailid)
        {
            return DAL.ClassRoom.checkNameSum(detailid);
        }

        public static System.Data.DataTable checkNameSumShowDetail(string enrollId, string detailid)
        {
            return DAL.ClassRoom.checkNameSumShowDetail(enrollId, detailid);
        }

        public static object selectDetailTeachID(string classID, string group)
        {
            return DAL.ClassRoom.selectDetailTeachID(classID, group);
        }

        public static bool deleteTeach(string detailID)
        {
            return DAL.ClassRoom.deleteDeatilTeach(detailID);
        }

        public static bool CreateDeatilTeach(string year, string level, string group, string term, string showPlanId, string teacherid, string createUser)
        {
            bool re;
            string checkCreateRoom = DAL.ClassRoom.checkCreateRoom(showPlanId, teacherid);

            re = DAL.ClassRoom.createDetailTeach(year, level, group, term, showPlanId, teacherid, checkCreateRoom, createUser);

            return re;
        }

        public static bool insertStudentInclass(string id, string dchID)
        {
            return DAL.ClassRoom.insertStudentInclass(id, dchID);
        }

        public static bool deleteStudentInclass(string id, string dchID)
        {
            return DAL.ClassRoom.deleteStudentInclass(id, dchID);
        }

        public static bool insertStudentExcellInclass(string code, string detilID)
        {
            string id = DAL.Student.selectIDStudent(code);
            return DAL.ClassRoom.insertStudentInclass(id, detilID);
        }

        public static bool insertGrade(string codesubject, string codestd, string grade, string deatailID)
        {
            return DAL.ClassRoom.insertGrade(codesubject, codestd, grade, deatailID);
        }

        public static bool insertInstruction(string classid, string namefile, string type, string path, string des, string filetype)
        {
            return DAL.ClassRoom.insertInstructionMedia(classid, namefile, type, path, des, filetype);
        }

        public static System.Data.DataTable selectShowListViewFileMediaTeacher(string classroomid)
        {
            return DAL.ClassRoom.selectShowListViewFileMediaTeacher(classroomid);
        }

        public static bool deleteFileMedia(string id)
        {
            return DAL.ClassRoom.deleteFileMedia(id);
        }

        public static bool insertHomeWorkfileName(string homeworkname, string classid, string tchid)
        {
            return DAL.ClassRoom.insertHomeworkFileName(homeworkname, classid, tchid);
        }



        public static System.Data.DataTable selectShowListViewMainHomework(string classid, string dechid)
        {
            return DAL.ClassRoom.selectShowListViewMainHomeWork(classid, dechid);
        }

        public static System.Data.DataTable showStudentSendHomeWork(string detailTeachid, string numhomework)
        {
            return DAL.ClassRoom.showStudentSendHomeWork(detailTeachid, numhomework);
        }

        public static bool showStudentSendHomeWork(string homeworkid, string enroolid, string path)
        {
            return DAL.ClassRoom.showStudentSendHomeWork(homeworkid, enroolid, path);
        }

        public static bool deleteHomeWorkByTeacher(string id, string tchid)
        {
            return DAL.ClassRoom.deleteHomeWorkByTeacher(id, tchid);
        }

        private static double sdFunction(ArrayList allScore)
        {
            /*********************************************
             * ฟังก์ชันหาค่า SD
             * sd=root(sum((value-avg)*(value-avg))/num)
             *  
             *********************************************/

            double[] someDoubles = allScore.ToArray(typeof(double)) as double[];
            double average = someDoubles.Average();
            double sumOfSquaresOfDifferences = someDoubles.Select(val => (val - average) * (val - average)).Sum();
            double sd = Math.Sqrt(sumOfSquaresOfDifferences / someDoubles.Length);
            return sd;

        }

        private static double Grade_T_Score(double score, ArrayList allScore)
        {
            /*******************
             * ฟังก์ชันหาค่า T-Score
             * T-Score =50+10z;
             * z=(value-avg)/sd
             * 
             * ****************/
            double[] value = allScore.ToArray(typeof(double)) as double[];
            double average = value.Average();
            double sd = sdFunction(allScore);

            double z = (score - average) / sd;
            double t_score = 50 + (10 * z);
            return t_score;
        }

        public static System.Data.DataTable calGradeGroup(System.Collections.ArrayList allScore)
        {
            /*****************************
              * 
              * คำนวนผลการเรียนอิงกลุ่ม
              * 
              * *************************/
            double gradeA = 0.0;
            double gradeBp = 0.0;
            double gradeB = 0.0;
            double gradeCp = 0.0;
            double gradeC = 0.0;
            double gradeDp = 0.0;
            double gradeD = 0.0;
            double gradeF = 0.0;

            double[] value = allScore.ToArray(typeof(double)) as double[];
            double average = value.Average();
            double sd = sdFunction(allScore);

            double halfSd = sd / 2;
            gradeC = (average - halfSd);
            gradeB = (average + halfSd) + halfSd;
            gradeCp = gradeC + ((gradeB - gradeC) / 2);
            gradeA = gradeB + halfSd;
            gradeBp = gradeB + ((gradeA - gradeB) / 2);
            gradeD = gradeC - halfSd;
            gradeDp = gradeD + ((gradeC - gradeD) / 2);
            gradeF = gradeD - 1;


            DataTable dtgrade = new DataTable();
            dtgrade.Columns.Add("id");
            dtgrade.Columns.Add("grade");
            dtgrade.Columns.Add("status");
            dtgrade.Columns.Add("range");
            dtgrade.Columns.Add("type");

            dtgrade.Rows.Add("1", "A", ">= ", gradeA.ToString("0.00"), " คะแนน");
            dtgrade.Rows.Add("2", "B+", ">= ", gradeBp.ToString("0.00"), " คะแนน");
            dtgrade.Rows.Add("3", "B", ">= ", gradeB.ToString("0.00"), " คะแนน");
            dtgrade.Rows.Add("4", "C+", ">= ", gradeCp.ToString("0.00"), " คะแนน");
            dtgrade.Rows.Add("5", "C", ">= ", gradeC.ToString("0.00"), " คะแนน");
            dtgrade.Rows.Add("6", "D+", ">= ", gradeDp.ToString("0.00"), " คะแนน");
            dtgrade.Rows.Add("7", "D", ">= ", gradeD.ToString("0.00"), " คะแนน");
            dtgrade.Rows.Add("8", "F", "<= ", gradeF.ToString("0.00"), " คะแนน");

            return dtgrade;

        }

        public static string calGradeForStudent(double valueGrade, System.Data.DataTable mainGradedt)
        {
            string grade = "";
            double gradeA = 0.0;
            double gradeBp = 0.0;
            double gradeB = 0.0;
            double gradeCp = 0.0;
            double gradeC = 0.0;
            double gradeDp = 0.0;
            double gradeD = 0.0;
            double gradeF = 0.0;
            double score = valueGrade;

            foreach (System.Data.DataRow rows in mainGradedt.Rows)
            {
                if (rows[1].ToString().Equals("A")) { gradeA = Convert.ToDouble(rows[3].ToString()); }
                else if (rows[1].ToString().Equals("B+")) { gradeBp = Convert.ToDouble(rows[3].ToString()); }
                else if (rows[1].ToString().Equals("B")) { gradeB = Convert.ToDouble(rows[3].ToString()); }
                else if (rows[1].ToString().Equals("C+")) { gradeCp = Convert.ToDouble(rows[3].ToString()); }
                else if (rows[1].ToString().Equals("C")) { gradeC = Convert.ToDouble(rows[3].ToString()); }
                else if (rows[1].ToString().Equals("D+")) { gradeDp = Convert.ToDouble(rows[3].ToString()); }
                else if (rows[1].ToString().Equals("D")) { gradeD = Convert.ToDouble(rows[3].ToString()); }
                else if (rows[1].ToString().Equals("F")) { gradeF = Convert.ToDouble(rows[3].ToString()); }
            }


            if (score >= gradeA && score <= 100) { grade = "A"; }
            else if (score >= gradeBp) { grade = "B+"; }
            else if (score >= gradeB) { grade = "B"; }
            else if (score >= gradeCp) { grade = "C+"; }
            else if (score >= gradeC) { grade = "C"; }
            else if (score >= gradeDp) { grade = "D+"; }
            else if (score >= gradeD) { grade = "D"; }
            else
            {
                grade = "F";
            }
            // else if (score <= gradeF) { grade = "F"; }



            return grade;
        }

        public static DataTable selectShowListStudentPageAddEducate(string dchID, string status, string late, string percentValueCheckname, DataTable dtscopeScore)
        {
            DataTable dtans = new DataTable();
            dtans.Columns.Add("Enroll_ID");
            dtans.Columns.Add("Std_Campus_Code");
            dtans.Columns.Add("Std_FName");
            dtans.Columns.Add("Std_LName");
            dtans.Columns.Add("check_name_num");

              dtans.Columns.Add("AllScoreCheckName");
              dtans.Columns.Add("AllSaveSore");
              dtans.Columns.Add("AllScoreMidterm");
              dtans.Columns.Add("AllFinal");
              dtans.Columns.Add("AllScore");
            // dtans.Rows.Add(row[0], row[2], row[3], row[4], "N");

            DataTable dt = DAL.ClassRoom.selectShowListStudentPageAddEducate(dchID, status,dtscopeScore);
            double countStd;
            double countLate;
            double countNoStd;
            double countAll;

          string  AllScoreCheckName="";
          string  AllSaveSore="";
          string  AllScoreMidterm="";
          string   AllFinal="";
           string AllScore="";


           foreach (DataRow item in dtscopeScore.Rows)
           {
                AllScoreCheckName =item[0].ToString();
               AllSaveSore = item[1].ToString();
               AllScoreMidterm = item[2].ToString();
               AllFinal = item[3].ToString();
               AllScore = "/100";
           }


            if (status.Equals("N"))
            {
                return dt;
            }
            else
            {


                foreach (DataRow checkRow in dt.Rows)
                {
                    string codeStd = checkRow[2].ToString();
                    string enrollid = checkRow[0].ToString();
                    string fname = checkRow[3].ToString();
                    string lname = checkRow[4].ToString();


                    DataTable dtt = DAL.ClassRoom.selectShowStdCheckNameSum(dchID, codeStd);

                    foreach (DataRow item in dtt.Rows)
                    {
                        countStd = Convert.ToInt32(item[1].ToString());
                        countLate = Convert.ToInt32(item[3].ToString());
                        countNoStd = Convert.ToInt32(item[5].ToString());
                        countAll = Convert.ToInt32(item[6].ToString());
                        int percentCheck;



                        if (status.Equals("A"))
                        {
                            /*************เงือนไข เรียน .. นับเป็นขาด... ครั้ง .***************/
                            double count=0.0;
                            double num = 0.0;
                            double ans = 0.0;
                            if(countLate > 0 ){
                                count = countLate % Convert.ToInt32(late);
                            }

                            if (countStd > 0)
                            {
                                 num = countStd + count;
                            }


                            if (num > 0)
                            {
                                ans = (num / countAll) * Convert.ToInt32(percentValueCheckname);
                            }

                            dtans.Rows.Add(enrollid, codeStd, fname, lname, ans.ToString("0.00"), AllScoreCheckName, AllSaveSore, AllScoreMidterm, AllFinal, AllScore);

                        }
                        else if (status.Equals("B"))
                        {
                            /****************เงือนไขนับเฉพาะที่เข้าเรียน.************************/

                            double ans = (countStd / countAll) * Convert.ToInt32(percentValueCheckname);
                            dtans.Rows.Add(enrollid, codeStd, fname, lname, ans.ToString("0.00"), AllScoreCheckName, AllSaveSore, AllScoreMidterm, AllFinal, AllScore);

                        }
                        else if (status.Equals("C"))
                        {

                            /********************นับหมด*******************************/

                            double coAll = countStd + countLate;
                            double ans = (coAll / countAll) * Convert.ToInt32(percentValueCheckname);
                            dtans.Rows.Add(enrollid, codeStd, fname, lname, ans.ToString("0.00"), AllScoreCheckName, AllSaveSore, AllScoreMidterm, AllFinal, AllScore);

                        }

                    }
                }
            }


            return dtans;

        }

        public static bool postInClassRoom(string userid, string usertype, string post, int classid)
        {
            return DAL.ClassRoom.postInClassRoom(userid, usertype, post, classid);
        }

        //private static string functionCheckDatePostComment(string ddate,string dtime){

        //     DateTime dob = Convert.ToDateTime(ddate);
        //     string time=dtime;
        //     int year = Convert.ToInt32(dob.Year)+543;
        //     string ddt = dob.Day + "/" + dob.Month + "/" +year+ " " + time;
        //     DateTime date = Convert.ToDateTime(ddt);
        //    string da = CommonClass.timeFun.ToTimeSinceString(date);
        //    return da;

        //}

        public static DataTable selectCommentPostClassRoom(string usertype, string userid, int classid)
        {

            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("PostClassRoom_ID");
            resultdt.Columns.Add("PostClassRoom_Detail");
            resultdt.Columns.Add("datepost");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("userid");
            resultdt.Columns.Add("picuserpath");
            resultdt.Columns.Add("usertype");
            resultdt.Columns.Add("useridOwer");
            resultdt.Columns.Add("userpath");


            string path = BLL.mainManage.selectPathPictureUser(userid, usertype);


            DataTable post = new DataTable();
            post = DAL.ClassRoom.selectClassRoomPost(classid);

            foreach (DataRow rowpost in post.Rows)
            {
                string type = rowpost[6].ToString();



                if (type.Equals("ST") || type.Equals("AL"))
                {
                    DataTable dtstudent = DAL.Student.selectStudentForPostComment(rowpost[4].ToString());

                    foreach (DataRow rowcomstd in dtstudent.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[2].ToString(), rowpost[3].ToString());

                        resultdt.Rows.Add(rowpost[0], rowpost[1], date, rowcomstd[1], rowcomstd[0], rowcomstd[2], rowcomstd[3], userid, path);

                    }
                }
                else if (type.Equals("TE") || type.Equals("TS"))
                {

                    DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(rowpost[4].ToString());
                    foreach (DataRow rowcomTch in dtteacher.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[2].ToString(), rowpost[3].ToString());

                        resultdt.Rows.Add(rowpost[0], rowpost[1], date, rowcomTch[1], rowcomTch[0], rowcomTch[2], rowcomTch[3], userid, path);
                    }

                }



            }

            return resultdt;
        }

        public static System.Data.DataTable getCommentsForPost(int thePost, int clickPostID)
        {

            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("ComPostClass_ID");
            resultdt.Columns.Add("PostClassRoom_ID");
            resultdt.Columns.Add("ComPostClass_Detail");
            resultdt.Columns.Add("datecomment");
            resultdt.Columns.Add("userid");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("picuserpath");
            resultdt.Columns.Add("usertype");


            DataTable post = new DataTable();
            if (clickPostID <= 0)
            {
                post = DAL.ClassRoom.selectClassRoomCommentPost(thePost);
            }
            else
            {
                post = DAL.ClassRoom.insertGetcoment(clickPostID); ;
            }

            foreach (DataRow rowpost in post.Rows)
            {
                string type = rowpost[6].ToString();

                if (type.Equals("ST") || type.Equals("AL"))
                {
                    DataTable dtstudent = DAL.Student.selectStudentForPostComment(rowpost[3].ToString());

                    foreach (DataRow rowcomstd in dtstudent.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[4].ToString(), rowpost[5].ToString());
                        resultdt.Rows.Add(rowpost[0], rowpost[2], rowpost[1], date, rowcomstd[0], rowcomstd[1], rowcomstd[2], rowcomstd[3]);

                    }
                }
                else if (type.Equals("TE") || type.Equals("TS"))
                {

                    DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(rowpost[3].ToString());
                    foreach (DataRow rowcomTch in dtteacher.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[4].ToString(), rowpost[5].ToString());
                        resultdt.Rows.Add(rowpost[0], rowpost[2], rowpost[1], date, rowcomTch[0], rowcomTch[1], rowcomTch[2], rowcomTch[3]);
                    }

                }
            }

            return resultdt;

        }


        public static bool insertComment(string id, string commentDetail, string userid, string usertype)
        {
            return DAL.ClassRoom.insertComment(id, commentDetail, userid, usertype);
        }

        public static DataTable testGetcomment(int p)
        {


            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("ComPostClass_ID");
            resultdt.Columns.Add("PostClassRoom_ID");
            resultdt.Columns.Add("ComPostClass_Detail");
            resultdt.Columns.Add("datecomment");
            resultdt.Columns.Add("userid");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("picuserpath");
            resultdt.Columns.Add("usertype");


            DataTable post = new DataTable();
            post = DAL.ClassRoom.insertGetcoment(p);

            foreach (DataRow rowpost in post.Rows)
            {
                string type = rowpost[6].ToString();

                if (type.Equals("ST") || type.Equals("AL"))
                {
                    DataTable dtstudent = DAL.Student.selectStudentForPostComment(rowpost[3].ToString());

                    foreach (DataRow rowcomstd in dtstudent.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[4].ToString(), rowpost[5].ToString());
                        resultdt.Rows.Add(rowpost[0], rowpost[2], rowpost[1], date, rowcomstd[0], rowcomstd[1], rowcomstd[2], rowcomstd[3]);

                    }
                }
                else if (type.Equals("TE") || type.Equals("TS"))
                {

                    DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(rowpost[3].ToString());
                    foreach (DataRow rowcomTch in dtteacher.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[4].ToString(), rowpost[5].ToString());
                        resultdt.Rows.Add(rowpost[0], rowpost[2], rowpost[1], date, rowcomTch[0], rowcomTch[1], rowcomTch[2], rowcomTch[3]);
                    }

                }
            }

            return resultdt;

        }

        public static string selectAdminUseridClassRoom(int classid)
        {
            return DAL.ClassRoom.selectAdminUserIDClassRoom(classid);
        }

        public static bool closePost(string posid)
        {
            return DAL.ClassRoom.deleteClosePost(posid);
        }

        public static bool closeComment(string commentid)
        {
            return DAL.ClassRoom.closeComent(commentid);
        }



        public static bool selectShowAllComment(string posid)
        {
            return DAL.ClassRoom.selectShowAllComment(posid);
        }

        public static bool insertSchoolRecord(string year, string level, string term, string codesubject, string resultGrade, string code, string userid, string userType)
        {
            return DAL.ClassRoom.insertSchoolRecord(year, level, term, codesubject, resultGrade, code, userid, userType);
        }

        public static bool deleteCommentInClass(string classRoomid)
        {
            return DAL.ClassRoom.deleteCommentPostInclass(classRoomid);
        }

        public static bool deleteInStructionMedia(string classRoomid)
        {
            return DAL.ClassRoom.deleteInStructionMedia(classRoomid);
        }

        public static bool deleteHomework(string detailTeach)
        {
            return DAL.ClassRoom.deleteHomeworkd(detailTeach);
        }

        public static bool delCheckName(string detailTeach)
        {
            return DAL.ClassRoom.deleteCheckName(detailTeach);
        }

        public static bool Delenroll(string detailTeach)
        {
            return DAL.ClassRoom.deleteRoll(detailTeach);
        }

        public static bool deleteDetailTeach(string detailTeach)
        {
            return DAL.ClassRoom.deleteDetailTeach(detailTeach);
        }

        public static bool deleteClassRoom(string classRoomid)
        {
            return DAL.ClassRoom.deletClassRoom(classRoomid);
        }

        public static void AppoveStudentInclass(string id, string dchID,string status)
        {
             DAL.ClassRoom.appoveStudentInclass(id, dchID,status);
        }

        public static void updateDetailEducationStudent(string detailTeach)
        {
            DAL.ClassRoom.updateDetailTeach(detailTeach);
        }

    
        public static DataTable selectDetail(string detailTeach)
        {
            return DAL.ClassRoom.selectDetail(detailTeach);
        }

        public static int countCheckName(string EduStdID)
        {
            return DAL.ClassRoom.countCheckName(EduStdID);
        }

        public static bool checkClassDelete()
        {
            return DAL.ClassRoom.checkClassDelete();
        }
    }
}
