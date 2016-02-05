using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class Teacher
    {
        public static Entity.Teacher checkRoleLogin(string username, string password)
        {
            return DAL.Teacher.checkRoleLogin(username, password);
        }

        public static Entity.Teacher checkForgotPassword(string username, string email)
        {
            return DAL.Teacher.checkForgotPassword(username, email);
        }

        public static bool updateChangeNewsPasswordPage(string userID, string newPassword)
        {
            return DAL.Teacher.updateChangeNewsPasswordPage(userID, newPassword);
        }

        public static bool insertUserTeacherPageAdmin(Entity.Teacher teacher)
        {
            string fnameEn = teacher.Tch_FNameEn.ToString();
            string lnameEn = teacher.Tch_LNameEn.ToString();
            if (lnameEn.Length > 3)
            {
                teacher.Tch_username = fnameEn + "." + lnameEn.Substring(0, 3);
                teacher.Tch_password = fnameEn + "." + lnameEn.Substring(0, 3);
            }
            else
            {
                teacher.Tch_username = fnameEn + "." + lnameEn;
                teacher.Tch_password = fnameEn + "." + lnameEn;
            }

            return DAL.Teacher.insertUserTeacherPageAdmin(teacher);
        }

        public static bool deleteUserDelete(string id)
        {
            return DAL.Teacher.deleteUserDelete(id);
        }

        public static System.Data.DataTable searchShowPageTchAdmin(string code, string fname, string lname, string type)
        {
            return DAL.Teacher.searchShowPageTchAdmin(code, fname, lname, type);
        }

        public static System.Data.DataTable selectShowDetailTeacher()
        {
            return DAL.Teacher.selectShowDetailTeacher();
        }



        public static Entity.Teacher selectShowProfileTch(string userid)
        {
            return DAL.Teacher.selectShowProfileTch(userid);
        }

        public static bool updateUserTeacher(Entity.Teacher tch)
        {
            return DAL.Teacher.updateTeacher(tch);
        }



        public static string checkTeacher()
        {
            return DAL.Teacher.checkTeacher();
        }
    }
}
