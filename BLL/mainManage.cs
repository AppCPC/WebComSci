using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class mainManage
    {

        public static System.Data.DataTable selectShowAllUserSearch()
        {
            try
            {
                DataTable resultdt = new DataTable();
                resultdt.Columns.Add("userID");
                resultdt.Columns.Add("name");
                resultdt.Columns.Add("picturePath");
                resultdt.Columns.Add("UserType");



                /*****INSERT CELL 0*********/

                resultdt.Rows.Add("N", "..ค้นหาชื่ออาจารย์ ชื่อเพื่อนในสาขา..", "N", "N");
                /**************************/

                DataTable dtstudent = DAL.Student.selectShowAllStudent();

                foreach (DataRow rowcomstd in dtstudent.Rows)
                {
                    resultdt.Rows.Add(rowcomstd[0], rowcomstd[1], rowcomstd[2], rowcomstd[3]);
                }

                DataTable dtteacher = DAL.Teacher.selectShowAllStudent();
                foreach (DataRow rowcomTch in dtteacher.Rows)
                {
                    resultdt.Rows.Add(rowcomTch[0], rowcomTch[1], rowcomTch[2], rowcomTch[3]);
                }

                return resultdt;
            }
            catch (Exception ex) {
                return null;
            }

            }



        public static string selectPathPictureUser(string userid, string usertype)
        {
            string picturePath = "";

             if (usertype.Equals("TS") || usertype.Equals("TE"))
            {
                DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(userid);
                foreach (DataRow rowtch in dtteacher.Rows)
                {
                    picturePath = rowtch[2].ToString();
                }

            }
            else if (usertype.Equals("ST") || usertype.Equals("AL"))
            {
                DataTable dtstudent = DAL.Student.selectStudentForPostComment(userid);

                foreach (DataRow rowstd in dtstudent.Rows)
                {
                    picturePath=rowstd[2].ToString();
                }
            }
           return   picturePath;
        }

        public static DataTable selectCommentMyPost(string usertype, string userid ,string status)
        {

            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("Post_ID");
            resultdt.Columns.Add("Post_Detail");
            resultdt.Columns.Add("datepost");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("userid");
            resultdt.Columns.Add("picuserpath");
            resultdt.Columns.Add("usertype");

            DataTable post = new DataTable();
            if (status.Equals("ALL"))
            {

                post = DAL.mainManage.selectUserAllPost();
            }
            else {
                post = DAL.mainManage.selectUserPost(userid);
            }
        

            foreach (DataRow rowpost in post.Rows)
            {

                string type = "";
                if (status.Equals("ALL"))
                {
                    type = rowpost[5].ToString();
                }
                else
                {
                   type=usertype;
                }

                if (type.Equals("ST") || type.Equals("AL"))
                {
                    DataTable dtstudent = DAL.Student.selectStudentForPostComment(rowpost[4].ToString());

                    foreach (DataRow rowcomstd in dtstudent.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[2].ToString(), rowpost[3].ToString());

                        resultdt.Rows.Add(rowpost[0], rowpost[1], date, rowcomstd[1], rowcomstd[0], rowcomstd[2], rowcomstd[3]);

                    }
                }
                else if (type.Equals("TE") || type.Equals("TS"))
                {

                    DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(rowpost[4].ToString());
                    foreach (DataRow rowcomTch in dtteacher.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[2].ToString(), rowpost[3].ToString());

                        resultdt.Rows.Add(rowpost[0], rowpost[1], date, rowcomTch[1], rowcomTch[0], rowcomTch[2], rowcomTch[3]);
                    }

                }
            }

            return resultdt;
        }

        public static DataTable getCommentsForPost(int postID, int clickPostID)
        {
            DataTable resultdt = new DataTable();
            resultdt.Columns.Add("ComPost_ID");
            resultdt.Columns.Add("Post_ID");
            resultdt.Columns.Add("ComPost_Detail");
            resultdt.Columns.Add("datecomment");
            resultdt.Columns.Add("userid");
            resultdt.Columns.Add("name");
            resultdt.Columns.Add("picuserpath");
            resultdt.Columns.Add("usertype");


            DataTable post = new DataTable();
            if (clickPostID <= 0)
            {
                post = DAL.mainManage.selectCommentPost(postID);
            }
            else
            {
                post = DAL.mainManage.insertGetcoment(clickPostID); ;
            }

            foreach (DataRow rowpost in post.Rows)
            {
                string type = rowpost[6].ToString();

                if (type.Equals("ST") || type.Equals("AL"))
                {
                    DataTable dtstudent = DAL.Student.selectStudentForPostComment(rowpost[5].ToString());

                    foreach (DataRow rowcomstd in dtstudent.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[3].ToString(), rowpost[4].ToString());
                        resultdt.Rows.Add(rowpost[0], rowpost[1], rowpost[2], date, rowcomstd[0], rowcomstd[1], rowcomstd[2], rowcomstd[3]);

                    }
                }
                else if (type.Equals("TE") || type.Equals("TS"))
                {

                    DataTable dtteacher = DAL.Teacher.selectTeacherForPostComment(rowpost[5].ToString());
                    foreach (DataRow rowcomTch in dtteacher.Rows)
                    {
                        string date = CommonClass.timeFun.functionCheckDatePostComment(rowpost[3].ToString(), rowpost[4].ToString());
                        resultdt.Rows.Add(rowpost[0], rowpost[1], rowpost[2], date, rowcomTch[0], rowcomTch[1], rowcomTch[2], rowcomTch[3]);
                    }

                }
            }

            return resultdt;

        }

        public static bool MyPost(string userid, string usertype, string post)
        {
            return DAL.mainManage.MyPost(userid,usertype,post);
        }

        public static bool insertComment(string id, string detail, string userid, string usertype)
        {
            return DAL.mainManage.insertComment(id,detail,userid,usertype);
        }

        public static bool selectShowAllComment(string posid)
        {
            return DAL.mainManage.selectShowAllComment(posid);
        }

        public static bool closePost(string posid)
        {
            return DAL.mainManage.cloasePost(posid);
        }

        public static bool closeComment(string commentid)
        {
            return DAL.mainManage.closeComent(commentid);
        }

     
    }
}
