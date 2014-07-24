using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data;
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
        public DataSet GetDBDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1  IP,PORT,NAME,USERID,PASSWORD FROM DB_DETAILS order by date_Created desc ");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool IsValidConnectionString()
        {
            clsConnectionStringBuilder clsObj = new clsConnectionStringBuilder();
            clsObj.Password = Password;
            clsObj.Port = Port;
            clsObj.ServerName = IPAddress;
            clsObj.UserID = UserID;
            clsObj.DatabaseName = DatabaseName;
            string connectionString = clsObj.GetConnectionString();

            if (SqlHelper.IsValidConnectionSting(connectionString))
                return true;
            else return false;

        }
    }
}