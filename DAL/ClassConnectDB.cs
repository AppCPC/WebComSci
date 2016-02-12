using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using System.Web.UI;

namespace DAL
{
   public class ClassConnectDB
    {
        private SqlConnection objConn;
        private SqlCommand objCmd;
        private SqlTransaction Trans;
        private String strConnString;


        public ClassConnectDB()
        {
            #region ConnectWebApp
            //strConnString = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
            #endregion

            #region ConnectWinApp
         //   strConnString = "Data Source=POOM_MON-PC\\POOM;Initial Catalog=WebComSciDB;Integrated Security=True";

            ConnectDB connpath = new ConnectDB();
            objConn = new SqlConnection();
            strConnString = connpath.connectPath(); 
            #endregion

        }

        private void ConnectDB()
        {

            try
            {
                objConn = new SqlConnection();
                objConn.ConnectionString = strConnString;
                objConn.Open();

                if (objConn.State != ConnectionState.Open)
                {
                    MessageBox.Show("ไม่สามารถเชื่อต่อฐานข้อมูลได้ กรุณาเช็คอีกอีกครั้งครับ ! ");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("ไม่สามารถเชื่อมต่อฐานข้อมูลได้กรุณา ตรวจสอบ StrConnString ว่าเชื่อมต่อถูกต้องหรือไม่ !");

            }

        }

        public SqlDataReader SelectSqlDataReader(String strSQL)
        {
            SqlDataReader dtReader;
            ConnectDB();
            objCmd = new SqlCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();
            return dtReader;

        }

        public bool selectCheck(String strSQL, String Addva, String Va)
        {
            try
            {
                //char[] delimiterChars = { ' ', ',', '.', ':', '\t' };
                char[] delimiterChars = { ',' };
                string[] addvalue = Addva.Split(delimiterChars);
                string[] value = Va.Split(delimiterChars);

                int contA = 0;
                int contB = 0;
                for (int i = 0; i < addvalue.Length; i++) { contA++; }
                for (int j = 0; j < value.Length; j++) { contB++; }
                //MessageBox.Show("conA : " + contA.ToString() + "  countB: " + contB.ToString());


                ConnectDB();
                objCmd = new SqlCommand(strSQL, objConn);

                for (int i = 0; i < addvalue.Length; i++)
                {
                    objCmd.Parameters.AddWithValue(addvalue[i], value[i]);
                }

                objCmd.ExecuteNonQuery();
                return true; //*** Return DataReader ***//
            }
            catch (Exception)
            {
                MessageBox.Show("ค่าที่รับมาคือ :\n" + strSQL + "\n AddValue: " + Addva + "\n Value: " + Va + " \n ค่าที่โยนมาไม่ถูกต้องกรุณาเช็คข้อมูลอีกครั้งน่ะครับ! ");
                return false;
            }

        }

        public SqlDataReader SelectWhereSqlDataReader(String strSQL, String Addva, String Va)
        {

            try
            {
                //char[] delimiterChars = { ' ', ',', '.', ':', '\t' };
                char[] delimiterChars = { ',' };
                string[] addvalue = Addva.Split(delimiterChars);
                string[] value = Va.Split(delimiterChars);

                int contA = 0;
                int contB = 0;
                for (int i = 0; i < addvalue.Length; i++) { contA++; }
                for (int j = 0; j < value.Length; j++) { contB++; }
                //MessageBox.Show("conA : " + contA.ToString() + "  countB: " + contB.ToString());

                SqlDataReader dtReader;
                ConnectDB();
                objCmd = new SqlCommand(strSQL, objConn);

                for (int i = 0; i < addvalue.Length; i++)
                {
                    objCmd.Parameters.AddWithValue(addvalue[i], value[i]);
                }

                dtReader = objCmd.ExecuteReader();
                return dtReader; //*** Return DataReader ***//
            }
            catch (Exception)
            {
                MessageBox.Show("ค่าที่รับมาคือ :\n" + strSQL + "\n AddValue: " + Addva + "\n Value: " + Va + " \n ค่าที่โยนมาไม่ถูกต้องกรุณาเช็คข้อมูลอีกครั้งน่ะครับ! ");
                return null;
            }

        }

        public DataSet QueryDataSet(String strSQL)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter dtAdapter = new SqlDataAdapter();
            objConn = new SqlConnection();
            objConn.ConnectionString = strConnString;
            objConn.Open();

            objCmd = new SqlCommand();
            objCmd.Connection = objConn;
            objCmd.CommandText = strSQL;
            objCmd.CommandType = CommandType.Text;

            dtAdapter.SelectCommand = objCmd;
            dtAdapter.Fill(ds);
            return ds;   //*** Return DataSet ***//
        }

        public DataTable QueryDataTable(String strSQL)
        {
            SqlDataAdapter dtAdapter;
            DataTable dt = new DataTable();
            objConn = new SqlConnection();
            objConn.ConnectionString = strConnString;
            objConn.Open();

            dtAdapter = new SqlDataAdapter(strSQL, objConn);
            dtAdapter.Fill(dt);
            return dt; //*** Return DataTable ***//
        }



        public Boolean QueryExecuteNonQuery(String strSQL)
        {
            objConn = new SqlConnection();
            objConn.ConnectionString = strConnString;
            objConn.Open();

            try
            {
                objCmd = new SqlCommand();
                objCmd.Connection = objConn;
                objCmd.CommandType = CommandType.Text;
                objCmd.CommandText = strSQL;

                objCmd.ExecuteNonQuery();
                return true; //*** Return True ***//
            }
            catch (Exception)
            {
                return false; //*** Return False ***//
            }
        }


        public Boolean QueryExecuteNonQuery(String strSQL, String Addva, String Va)
        {
            //   char[] delimiterChars = { ' ', ',', '.', ':', '\t' };
            char[] delimiterChars = { ',' };
            string[] addvalue = Addva.Split(delimiterChars);
            string[] value = Va.Split(delimiterChars);

            /*
            objConn = new SqlConnection();
            objConn.ConnectionString = strConnString;
            objConn.Open();*/
            ConnectDB();

            int countA = 0;
            int countB = 0;
            for (int i = 0; i < addvalue.Length; i++) { countA++; }
            for (int j = 0; j < value.Length; j++) { countB++; }



            if (countA == countB)
            {

                try
                {
                    #region old code
                    /*
            objCmd = new SqlCommand();
            objCmd.Connection = objConn;
            objCmd.CommandType = CommandType.Text;
            objCmd.CommandText = strSQL;
            */
                    #endregion
                    /*
                objCmd = new SqlCommand(strSQL, objConn);

                for (int i = 0; i < addvalue.Length; i++)
                {
                    objCmd.Parameters.AddWithValue(addvalue[i], value[i]);
                }
                 */
                    objCmd = new SqlCommand();
                    objCmd.Connection = objConn;
                    objCmd.CommandType = CommandType.Text;
                    objCmd.CommandText = strSQL;

                    for (int i = 0; i < addvalue.Length; i++)
                    {
                        objCmd.Parameters.AddWithValue(addvalue[i], value[i]);
                    }


                    objCmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                    return false;
                }
            }
            else
            {
                MessageBox.Show("ค่าตัวแปรที่โยนเข้าไปไม่เท่ากันครับ  \n ค่า AddValue:  " + countA + "  ValueB : " + countB + "  \n กรุณาเช็คอีกครั้งน่ะครับ !");
                return false;
            }
        }


        public Boolean InsertValue(String strSQL, String Addva, String Va)
        {     /* call ExecuteNonQuery for Insert */
            Boolean result;
            if (result = QueryExecuteNonQuery(strSQL, Addva, Va))
                return true;
            else
                return false;
        }
        public Boolean UpdateValue(String strSQL, String Addva, String Va)
        {
            /* call ExecuteNonQuery for Update */
            Boolean result;
            if (result = QueryExecuteNonQuery(strSQL, Addva, Va))
                return true;
            else
                return false;
        }
        public Boolean DeleteValue(String strSQL, String Addva, String Va)
        {
            /* call ExecuteNonQuery for Delete */
            Boolean result;
            if (result = QueryExecuteNonQuery(strSQL, Addva, Va))
                return true;
            else
                return false;
        }

        public Object QueryExecuteScalar(String strSQL)
        {
            Object obj;
            objConn = new SqlConnection();
            objConn.ConnectionString = strConnString;
            objConn.Open();

            try
            {
                objCmd = new SqlCommand();
                objCmd.Connection = objConn;
                objCmd.CommandType = CommandType.Text;
                objCmd.CommandText = strSQL;

                obj = objCmd.ExecuteScalar();  //*** Return Scalar ***//
                return obj;
            }
            catch (Exception)
            {
                return null; //*** Return Nothing ***//
            }
        }


        public void TransStart()
        {
            objConn = new SqlConnection();
            objConn.ConnectionString = strConnString;
            objConn.Open();
            Trans = objConn.BeginTransaction(IsolationLevel.ReadCommitted);
        }

        public Boolean InsertTrans(String strSQL, String Addva, String Va)
        {     /* call ExecuteNonQuery for Insert */
            Boolean result;
            if (result = TransExecute(strSQL, Addva, Va))
                return true;
            else
                return false;
        }

        public Boolean updateTrans(String strSQL, String Addva, String Va)
        {     /* call ExecuteNonQuery for Update */
            Boolean result;
            if (result = TransExecute(strSQL, Addva, Va))
                return true;
            else
                return false;
        }

        public Boolean DeleteTrans(String strSQL, String Addva, String Va)
        {     /* call ExecuteNonQuery for Delete*/
            Boolean result;
            if (result = TransExecute(strSQL, Addva, Va))
                return true;
            else
                return false;
        }

        public bool TransExecute(String strSQL, String Addvalue, String va)
        {
            char[] delimiterChars = { ',' };
            string[] addvalue = Addvalue.Split(delimiterChars);
            string[] value = va.Split(delimiterChars);
            ConnectDB();

            int countA = 0;
            int countB = 0;
            for (int i = 0; i < addvalue.Length; i++) { countA++; }
            for (int j = 0; j < value.Length; j++) { countB++; }

           

            if (countA == countB)
            {

                    try
                    {
           
                            objCmd = new SqlCommand();
                            objCmd.Connection = objConn;
                            objCmd.Transaction = Trans;
                            objCmd.CommandType = CommandType.Text;
                            objCmd.CommandText = strSQL;

                            for (int i = 0; i < addvalue.Length; i++)
                            {
                                objCmd.Parameters.AddWithValue(addvalue[i], value[i]);
                            }


                            objCmd.ExecuteNonQuery();
                            return true;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.ToString());
                            return false;
                        }
                    }
                    else
                    {
                        MessageBox.Show("ค่าตัวแปรที่โยนเข้าไปไม่เท่ากันครับ  \n ค่า AddValue:  " + countA + "  ValueB : " + countB + "  \n กรุณาเช็คอีกครั้งน่ะครับ !");
                        return false;
                    }
        }


        public void TransExecute(String strSQL)
        {
            objCmd = new SqlCommand();
            objCmd.Connection = objConn;
            objCmd.Transaction = Trans;
            objCmd.CommandType = CommandType.Text;
            objCmd.CommandText = strSQL;


            objCmd.ExecuteNonQuery();
        }


        public void TransRollBack()
        {
            Trans.Rollback();
        }

        public void TransCommit()
        {
            Trans.Commit();
        }

        public void Close()
        {
            objConn.Close();
            objConn = null;
        }

        /*reference : http://www.thaicreate.com/asp.net/c-sharp-asp.net-sql-server-database-class.html*/
    }
}
