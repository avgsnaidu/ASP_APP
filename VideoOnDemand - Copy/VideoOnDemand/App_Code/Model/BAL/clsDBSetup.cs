using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
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
        public bool GetDBDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("Select * from DB_DETAILS");
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

    }
}