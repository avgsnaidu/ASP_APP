using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data;
using System.Data.SqlClient;
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
            strSql = string.Format("INSERT INTO DB_DETAILS (IP,PORT,NAME,USERID,PASSWORD,DATE_CREATED,DATE_UPDATED)VALUES('{0}',{1},'{2}','{3}','{4}','{5}','{6}')",
                 IPAddress, Port, DatabaseName, UserID, Password, DateTime.Now, (DateTime?)null);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;
        }
        public bool UpdateDBDetails(int configid, string Ip, int Port, string Name, string Userid, string pwd)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Ip", SqlDbType.NVarChar);
            p[0].Value = Ip;
            p[1] = new SqlParameter("@Port", SqlDbType.Int);
            p[1].Value = Port;
            p[2] = new SqlParameter("@Name", SqlDbType.NVarChar);
            p[2].Value = Name;
            p[3] = new SqlParameter("@Userid", SqlDbType.NVarChar);
            p[3].Value = Userid;
            p[4] = new SqlParameter("@pwd", SqlDbType.NVarChar);
            p[4].Value = pwd;
            p[5] = new SqlParameter("@configid", SqlDbType.Int);
            p[5].Value = configid;

            string strSql = "UPDATE DB_DETAILS SET IP=@Ip ,PORT=@Port, NAME=@Name, USERID=@Userid, PASSWORD=@pwd, DATE_UPDATED=GETDATE() where CONFIG_ID=@configid";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }


        public DataSet GetDBDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1 CONFIG_ID,IP,PORT,NAME,USERID,PASSWORD FROM DB_DETAILS order by date_Created desc ");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
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

            if (SqlHelper.IsValidConnectionSting(connectionString))
                return connectionString;
            else return string.Empty;

        }


        public string GetValidConnectionString(string connectionString)
        { 
            if (SqlHelper.IsValidConnectionSting(connectionString))
                return connectionString;
            else return string.Empty;

        }

    }
}