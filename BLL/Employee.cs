using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
   public class Employee
    {
       
        public static Entity.Employee checkRoleLogin(string username, string password)
        {
            return DAL.Employee.checkRoleLogin(username, password);
        }

        public static Entity.Employee checkForgotPassword(string username, string email)
        {
            return DAL.Employee.checkForgotPassword(username, email);
        }

        public static bool updateChangeNewsPasswordPage(string userID, string newPassword)
        {
            return DAL.Employee.updateChangeNewsPasswordPage(userID,newPassword);
        }
    }
}
