using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class Student
    {

        public static Entity.Student checkRoleLogin(string username, string password)
        {
            return DAL.Student.checkRoleLogin(username, password);
        }
        public static Entity.Student checkForgotPassword(string username, string email)
        {
            return DAL.Student.checkForgotPassword(username, email);
        }

        public static bool updateChangeNewsPasswordPage(string userID, string newPassword)
        {
            return DAL.Student.updateChangeNewsPasswordPage(userID, newPassword);
        }

        public static bool insertUserStudentPageAdmin(Entity.Student student)
        {
            string sub = (student.Std_Campus_Code.ToString().Substring(2, 2));
            string year = (2500 + Convert.ToInt32(sub)).ToString();

            student.Std_YearEducate = year;

            if (!student.Std_Sex.Equals("N") || !student.Std_Type.Equals("N"))
            {
                return DAL.Student.insertUserStudentPageAdmin(student);
            }
            else
                return false;

        }

        public static bool updateUserStudent(Entity.Student student)
        {
            return DAL.Student.updateUserStudent(student);
        }

        public static System.Data.DataTable searchShowPageStdAdmin(string code, string fname, string lname, string year)
        {
            return DAL.Student.searchShowPageStdAdmin(code, fname, lname, year);
        }

        public static Entity.Student selectShowText(string p)
        {
            return DAL.Student.selectShowText(p);
        }

        public static bool deleteUserDelete(string id)
        {
            return DAL.Student.deleteUserStudent(id);
        }

        public static bool InsertStudentInclass(string code, string name, string group, string classID)
        {
            return DAL.Student.InsertStudentInclass(code, name, group, classID);
        }

        public static Entity.Student selectShowProfileStd(string userid)
        {

            return DAL.Student.selectShowText(userid);
        }

        public static System.Data.DataTable appoveStudentInclass(string dchID)
        {
            return DAL.Student.appoveStudentInclass(dchID);
        }
    }
}
