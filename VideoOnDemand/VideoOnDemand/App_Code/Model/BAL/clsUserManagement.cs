using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;

namespace VideoOnDemand.App_Code.Model.BAL
{
    public class clsUserManagement
    {
        public DataSet GetUsersList()
        {
            string strSql = string.Empty;
            strSql = "SELECT USER_ID,NAME,DOMAIN,FULL_NAME,GROUP_ID,DATE_CREATED,DATE_UPDATED FROM USERS";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }


    }
}