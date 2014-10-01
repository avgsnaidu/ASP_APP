using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsLogin
    {

        public bool IsValidSuperAdmin(string userName, ref DataSet adminSet)
        {
            try
            {
                string strSql = string.Empty;

                SqlParameter[] paramList = new SqlParameter[1];
                paramList[0] = new SqlParameter("@UserName", SqlDbType.NVarChar);
                paramList[0].Value = userName;

                //paramList[1] = new SqlParameter("@Password", SqlDbType.NVarChar);
                //paramList[1].Value = password;
                strSql = "SELECT USERID AS USERNAME,PASSWORD,EMAIL FROM SUPER_ADMIN WHERE USERID=@UserName";

                DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
                if (ds.Tables[0].Rows.Count > 0)
                    adminSet = ds;
                else
                    return false;

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}