﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsActiveDirectory
    {

        public string IP { get; set; }
        public string Userid { get; set; }
        public string Password { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddADDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("INSERT INTO ADS_DETAILS (IP,USERID,PASSWORD,DATE_CREATED,DATE_UPDATED)VALUES('{0}','{1}','{2}','{3}','{4}')",
                IP, Userid, Password, DateTime.Now, (DateTime?)null);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }
        public bool GetADDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("Select * from ADS_DETAILS");
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }
    }
}