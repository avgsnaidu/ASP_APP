using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
//using VideoOnDemand.Model;
//using VideoOnDemand.Model.DAL;

namespace VideoOnDemand.Model.BAL
{
    public class clsDBSetup
    {

        public String IPAddress { get; set; }
        public string Port { get; set; }
        public string DatabaseName { get; set; }
        public string UserID { get; set; }
        public string Password { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ConfigId { get; set; }


        public bool AddDBDetails()
        {
            string strSql = string.Empty;

            OleDbParameter[] p = new OleDbParameter[5];
            p[0] = new OleDbParameter("@Ip", OleDbType.VarWChar);
            p[0].Value = IPAddress;
            p[1] = new OleDbParameter("@Port", OleDbType.VarWChar);
            p[1].Value = Port;
            p[2] = new OleDbParameter("@Name", OleDbType.VarWChar);
            p[2].Value = DatabaseName;
            p[3] = new OleDbParameter("@Userid", OleDbType.VarWChar);
            p[3].Value = UserID;
            p[4] = new OleDbParameter("@pwd", OleDbType.VarWChar);
            p[4].Value = Password;


            strSql = string.Format("INSERT INTO DB_DETAILS (IP,PORT,NAME,USERID,PASSWORD,DATE_CREATED,DATE_UPDATED)VALUES(?,?,?,?,?,GetDate(),GETDATE())");
                 //IPAddress, Port, DatabaseName, UserID, Password, DateTime.Now, (DateTime?)null);
            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql,p);
            if (returnVal > 0)
                return true;
            else
                return false;
        }
        public bool UpdateDBDetails(int configid, string Ip, int Port, string Name, string Userid, string pwd)
        {
            OleDbParameter[] p = new OleDbParameter[6];
            p[0] = new OleDbParameter("@Ip", OleDbType.VarWChar);
            p[0].Value = Ip;
            p[1] = new OleDbParameter("@Port", OleDbType.Integer);
            p[1].Value = Port;
            p[2] = new OleDbParameter("@Name", OleDbType.VarWChar);
            p[2].Value = Name;
            p[3] = new OleDbParameter("@Userid", OleDbType.VarWChar);
            p[3].Value = Userid;
            p[4] = new OleDbParameter("@pwd", OleDbType.VarWChar);
            p[4].Value = pwd;
            p[5] = new OleDbParameter("@configid", OleDbType.Integer);
            p[5].Value = configid;

            string strSql = "UPDATE DB_DETAILS SET IP=? ,PORT=?, NAME=?, USERID=?, PASSWORD=?, DATE_UPDATED=GETDATE() where CONFIG_ID=?";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }


        public DataSet GetDBDetails()
        {
            try
            {
                string strSql = string.Empty;
                strSql = string.Format("SELECT top 1 CONFIG_ID,IP,PORT,NAME,USERID,PASSWORD FROM DB_DETAILS order by date_Created desc ");
                DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public string GetValidConnectionString(string serverName, string Database, string port, string userId, string password)
        {
            clsConnectionStringBuilder clsObj = new clsConnectionStringBuilder();
            clsObj.Password = password;
            clsObj.Port = port;
            clsObj.ServerName = serverName;
            clsObj.UserID = userId;
            clsObj.DatabaseName = Database;
            string connectionString = clsObj.GetConnectionString();

            if (OledbHelper.IsValidConnectionSting(connectionString))
                return connectionString;
            else return string.Empty;

        }


        public string GetValidConnectionString(string connectionString)
        {
            if (OledbHelper.IsValidConnectionSting(connectionString))
                return connectionString;
            else return string.Empty;

        }

    }
}