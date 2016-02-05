using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace BLL
{
    public class Knowledge
    {
        public static System.Data.DataTable selectComment(string usertype) /* post function **/
        {

            try
            {
                DataTable resultdt = new DataTable();
                resultdt.Columns.Add("KmPost_ID");
                resultdt.Columns.Add("title");
                resultdt.Columns.Add("detail");
                resultdt.Columns.Add("link");
                resultdt.Columns.Add("datepost");
                resultdt.Columns.Add("name");
                resultdt.Columns.Add("userid");
                resultdt.Columns.Add("picuserpath");
                resultdt.Columns.Add("usertype");


                DataTable kmPostdt = new DataTable();
                kmPostdt = DAL.Knowledge.selectKmpost();


                foreach (DataRow rowkm in kmPostdt.Rows)
                {
                    string type = rowkm[8].ToString();

                    if (type.Equals("ST") || type.Equals("AL"))
                    {
                        DataTable dtstudent = DAL.Student.selectStudentForPostComment(rowkm[7].ToString());

                        foreach (DataRow rowkmstd in dtstudent.Rows)
                        {
                            string id = rowkm[0].ToString();
                            string date = CommonClass.timeFun.functionCheckDatePostComment(rowkm[4].ToString(), rowkm[5].ToString());
                            resultdt.Rows.Add(rowkm[0], rowkm[1], rowkm[2], rowkm[3], date, rowkmstd[1], rowkmstd[0], rowkmstd[2],type);

                        }
                    }
                    else if (type.Equals("TE") || type.Equals("TS"))
                    {

                        DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(rowkm[7].ToString());
                        foreach (DataRow rowkmtch in dtteacher.Rows)
                        {
                            string date = CommonClass.timeFun.functionCheckDatePostComment(rowkm[4].ToString(), rowkm[5].ToString());
                            resultdt.Rows.Add(rowkm[0], rowkm[1], rowkm[2], rowkm[3], date, rowkmtch[1], rowkmtch[0], rowkmtch[2], type);

                        }

                    }
                }

                return resultdt;
            }
            catch (Exception ex) {

                return null;
            }
        }

        public static System.Data.DataTable getCommentsForPost(int thePost, int clickPostID)
        {
           // return DAL.Knowledge.getCommentForPost(thePost);
            try
            {
                DataTable resultdt = new DataTable();
                resultdt.Columns.Add("KmComPost_ID");
                resultdt.Columns.Add("KmPost_ID");
                resultdt.Columns.Add("ComPost_Detail");
                resultdt.Columns.Add("datecomment");
                // resultdt.Columns.Add("timepostkm");

                resultdt.Columns.Add("name");
                resultdt.Columns.Add("userid");
                resultdt.Columns.Add("picuserpath");
                resultdt.Columns.Add("usertype");


                DataTable kmPostdt = new DataTable();
                if (clickPostID <= 0)
                {
                    kmPostdt = DAL.Knowledge.getCommentForPost(thePost);
                }
                else
                {
                    kmPostdt = DAL.Knowledge.selectGetCommentUser(clickPostID); ;
                }


                foreach (DataRow rowkm in kmPostdt.Rows)
                {
                    string type = rowkm[6].ToString();

                    if (type.Equals("ST") || type.Equals("AL"))
                    {
                        DataTable dtstudent = DAL.Student.selectStudentForPostComment(rowkm[5].ToString());

                        foreach (DataRow rowkmstd in dtstudent.Rows)
                        {
                            string id = rowkm[0].ToString();
                            string date = CommonClass.timeFun.functionCheckDatePostComment(rowkm[3].ToString(), rowkm[4].ToString());
                            resultdt.Rows.Add(rowkm[0], rowkm[1], rowkm[2], date, rowkmstd[1], rowkmstd[0], rowkmstd[2], rowkm[6]);

                        }
                    }
                    else if (type.Equals("TE") || type.Equals("TS"))
                    {

                        DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(rowkm[5].ToString());
                        foreach (DataRow rowkmtch in dtteacher.Rows)
                        {
                            string date = CommonClass.timeFun.functionCheckDatePostComment(rowkm[3].ToString(), rowkm[4].ToString());
                            resultdt.Rows.Add(rowkm[0], rowkm[1], rowkm[2], date, rowkmtch[1], rowkmtch[0], rowkmtch[2], rowkm[6]);

                        }

                    }
                }

                return resultdt;
            }catch(Exception ex){
              return null;
            }

        }



        public static bool insertComment(string id, string comment, string createUser, string usertype)
        {
            return DAL.Knowledge.insertComment(id, comment, createUser, usertype);
        }


        public static System.Data.DataTable testDataTable()
        {
            return DAL.Knowledge.testDataTable();
        }

        public static System.Data.DataTable testDatselectShowPlan(string p)
        {
            return DAL.Knowledge.testDataSelectShowPlan(p);
        }

        public static System.Data.DataTable testCheckCode(string p)
        {
            return DAL.Knowledge.testCheckCode(p);
        }

        public static bool selectShowAllComment(string postID)
        {
            return DAL.Knowledge.selectShowAllComment(postID);
        }

        public static bool closePost(string posid)
        {
            return DAL.Knowledge.closePost(posid);
        }

        public static bool closeComment(string commentid)
        {
            return DAL.Knowledge.closeComment(commentid);
        }

        public static bool insertPostKm(string title, string detail, string link,string user,string type)
        {
            return DAL.Knowledge.insertPostKm(title,detail,link,user,type);
        }

        public static DataTable showSearch(string title, string status, string ddtstart )
        {
            return DAL.Knowledge.showSearch(title,status,ddtstart);
        }

        public static DataTable selectShowKm(string idkm)
        {
            return DAL.Knowledge.selectShowKm(idkm);
        }

        public static bool deleteKm(string id)
        {
            return DAL.Knowledge.deleteKm(id);
        }

        public static bool appoveKm(string id)
        {
            return DAL.Knowledge.apppoveKm(id);
        }
    }
}
