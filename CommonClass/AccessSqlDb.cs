using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommonClass
{
    public class AccessSqlDb
    {
        public static string sqlstring = WebConfigurationManager.ConnectionStrings["WEBCSDBConnectionString"].ConnectionString;

        public static String GetConnStr()
        {
            string tConnStr;

            try
            {
                tConnStr = WebConfigurationManager.ConnectionStrings["WEBCSDBConnectionString"].ConnectionString;

                return tConnStr;
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        public static Boolean ExecuteData(string queryString)
        {
            SqlTransaction oDB_trn;
            SqlCommand oDB_Cmd = new SqlCommand();
            SqlConnection oDB_Conn = new SqlConnection(GetConnStr());

            if (queryString == "") return false;

            if (oDB_Conn.State == ConnectionState.Closed) oDB_Conn.Open();

            oDB_Cmd.Connection = oDB_Conn;
            oDB_Cmd.CommandType = CommandType.Text;
            oDB_Cmd.CommandText = queryString;
            oDB_trn = oDB_Conn.BeginTransaction();
            oDB_Cmd.Transaction = oDB_trn;

            try
            {
                oDB_Cmd.ExecuteNonQuery();
                oDB_trn.Commit();
                oDB_Conn.Close();
                return true;
            }
            catch (Exception ex)
            {
                oDB_trn.Rollback();
                oDB_Conn.Close();
                //MessageBox.Show(ex.Message);
                return false;
            }
        }

        public static Boolean ExecuteData(string queryString, SqlCommand Comm)
        {
            SqlTransaction oDB_trn;
            SqlConnection oDB_Conn = new SqlConnection(GetConnStr());

            if (queryString == "") return false;

            if (oDB_Conn.State == ConnectionState.Closed) oDB_Conn.Open();

            Comm.Connection = oDB_Conn;
            Comm.CommandType = CommandType.Text;
            Comm.CommandText = queryString;
            oDB_trn = oDB_Conn.BeginTransaction();
            Comm.Transaction = oDB_trn;

            try
            {
                Comm.ExecuteNonQuery();
                oDB_trn.Commit();
                oDB_Conn.Close();
                return true;
            }
            catch (Exception ex)
            {
                oDB_trn.Rollback();
                oDB_Conn.Close();
                return false;
            }
        }

        public static Boolean ExecuteData(string queryString, SqlCommand Comm, SqlConnection Conn)
        {
            SqlTransaction oDB_trn;

            if (queryString == "") return false;

            Comm.Connection = Conn;
            Comm.CommandType = CommandType.Text;
            Comm.CommandText = queryString;
            oDB_trn = Conn.BeginTransaction();
            Comm.Transaction = oDB_trn;

            try
            {
                Comm.ExecuteNonQuery();
                oDB_trn.Commit();
                Conn.Close();
                return true;
            }
            catch (Exception ex)
            {
                oDB_trn.Rollback();
                Conn.Close();
                return false;
            }
        }

        public static Boolean ExecuteData_Store(string storeName, SqlCommand Comm)
        {
            SqlTransaction oDB_trn;
            SqlConnection oDB_Conn = new SqlConnection(GetConnStr());

            if (storeName == "") return false;

            if (oDB_Conn.State == ConnectionState.Closed) oDB_Conn.Open();

            Comm.Connection = oDB_Conn;
            Comm.CommandType = CommandType.StoredProcedure;
            Comm.CommandText = storeName;
            oDB_trn = oDB_Conn.BeginTransaction();
            Comm.Transaction = oDB_trn;

            try
            {
                Comm.ExecuteNonQuery();
                oDB_trn.Commit();
                oDB_Conn.Close();
                return true;
            }
            catch (Exception ex)
            {
                oDB_trn.Rollback();
                oDB_Conn.Close();
                return false;
            }
        }

        public static DataSet GetData(String queryString, SqlCommand Comm)
        {
            // Retrieve the connection string in cSourceData.GetConnStr()
            String connectionString = GetConnStr();
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            try
            {
                // Connect to the database and run the query.

                if (connection.State == ConnectionState.Closed) connection.Open();

                Comm.Connection = connection;
                Comm.CommandText = queryString;
                adapter.SelectCommand = Comm;

                // Fill the DataSet.
                adapter.Fill(ds);
                connection.Close();
            }
            catch (Exception ex)
            {
                // The connection failed. Display an error message.
                connection.Close();
                // MessageBox.Show(ex.Message);
                return null;
            }

            return ds;
        }

        public static DataSet GetData(String queryString, SqlCommand Comm, SqlConnection Conn)
        {
            // Retrieve the connection string in cSourceData.GetConnStr()
            //String connectionString = cSourceData.GetConnStr();

            DataSet ds = new DataSet();

            try
            {
                // Connect to the database and run the query.

                SqlDataAdapter adapter = new SqlDataAdapter();
                if (Conn.State == ConnectionState.Closed) Conn.Open();
                Comm.Connection = Conn;
                Comm.CommandText = queryString;
                adapter.SelectCommand = Comm;

                // Fill the DataSet.
                adapter.Fill(ds);
                Conn.Close();
            }
            catch (Exception ex)
            {
                // The connection failed. Display an error message.
                Conn.Close();
                // MessageBox.Show(ex.Message);
                return null;
            }

            return ds;
        }

        public static DataSet GetData(String queryString)
        {
            // Retrieve the connection string in cSourceData.GetConnStr()
            String connectionString = GetConnStr();
            SqlConnection connection = new SqlConnection(connectionString);
            DataSet ds = new DataSet();

            try
            {
                // Connect to the database and run the query.
                SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);

                // Fill the DataSet.
                adapter.Fill(ds);
                connection.Close();
            }
            catch (Exception ex)
            {
                connection.Close();
                // The connection failed. Display an error message.
                //MessageBox.Show(ex.Message);
                return null;
            }

            return ds;
        }

        public static DataSet GetData_Store(String StoredProcedureName, SqlCommand Comm)
        {
            // Retrieve the connection string in cSourceData.GetConnStr()
            String connectionString = GetConnStr();
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();

            try
            {
                // Connect to the database and run the query.

                if (connection.State == ConnectionState.Closed) connection.Open();

                Comm.Connection = connection;
                Comm.CommandText = StoredProcedureName;
                Comm.CommandType = CommandType.StoredProcedure;
                Comm.CommandTimeout = 360;
                adapter.SelectCommand = Comm;

                // Fill the DataSet.
                adapter.Fill(ds);
                connection.Close();
            }
            catch (Exception ex)
            {
                // The connection failed. Display an error message.
                connection.Close();
                return null;
            }

            return ds;
        }
    }
}