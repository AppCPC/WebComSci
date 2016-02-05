using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace DAL
{
    public class Employee
    {

        public static Entity.Employee checkRoleLogin(string username, string password)
        {

            try
            {
                Entity.Employee emp = new Entity.Employee();

                string sqlchekRole = "  SELECT * FROM Employee WHERE Emp_username=@user AND Emp_password=@pass";
                string Addvalue = "@user,@pass";
                string value = username + "," + password;

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader readCheckRole = conn.SelectWhereSqlDataReader(sqlchekRole, Addvalue, value);
                if (readCheckRole.Read())
                {
                    emp.Emp_ID = readCheckRole["Emp_ID"].ToString();
                    emp.Emp_Type = readCheckRole["Emp_Type"].ToString();
                    emp.Emp_LName = readCheckRole["Emp_LName"].ToString();
                    emp.Emp_FName = readCheckRole["Emp_FName"].ToString();
                    emp.Emp_username=readCheckRole["Emp_username"].ToString();
                    emp.Emp_password = readCheckRole["Emp_password"].ToString();
                }

                string iplog = Common.network.showIp();
                string logdate = "CONVERT(VARCHAR(10), GETDATE(), 104)";
                string logtime = "CONVERT(VARCHAR(8), GETDATE(), 108)";
                string tid = readCheckRole["Emp_ID"].ToString();
                string insertLog = "INSERT INTO LogLoginEmp(Log_IP, Log_Date, Log_timeStart, Emp_id) VALUES('" + iplog + "'," + logdate + "," + logtime + "," + tid + ")";
                conn.QueryExecuteNonQuery(insertLog);
             

                conn.Close();
                return emp;


            }
            catch (Exception)
            {

                return null;
            }
        }

        public static Entity.Employee checkForgotPassword(string username, string email)
        {

            try
            {
                string sqlforgot = "  SELECT * FROM Employee WHERE Emp_username=@user AND Emp_Email=@email";
                string Addvalue = "@user,@email";
                string value = username + "," + email;

                Entity.Employee empCheck = new Entity.Employee();

                ClassConnectDB conn = new ClassConnectDB();
                SqlDataReader readCheckRole = conn.SelectWhereSqlDataReader(sqlforgot, Addvalue, value);
                //SqlDataReader readCheckRole = conn.SelectSqlDataReader(sqlforgot);
                if (readCheckRole.Read())
                {
                    empCheck.Emp_FName = readCheckRole["Emp_FName"].ToString();
                    empCheck.Emp_LName = readCheckRole["Emp_LName"].ToString();
                    empCheck.Emp_username = readCheckRole["Emp_username"].ToString();
                    empCheck.Emp_password = readCheckRole["Emp_password"].ToString();
                    empCheck.Emp_Email = readCheckRole["Emp_Email"].ToString();
                }
                conn.Close();
                return empCheck;

            }
            catch (Exception)
            {

                return null;
            }

        }

        public static bool updateChangeNewsPasswordPage(string userID, string newPassword)
        {
            try
            {
                string sqlupdate = " UPDATE Employee SET Emp_password=@pass WHERE Emp_ID=@id";
                string Addvalue = "@pass,@id";
                string value = newPassword+","+userID;

                ClassConnectDB conn = new ClassConnectDB();
                conn.UpdateValue(sqlupdate, Addvalue, value);
                conn.Close();
                return true;

            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
