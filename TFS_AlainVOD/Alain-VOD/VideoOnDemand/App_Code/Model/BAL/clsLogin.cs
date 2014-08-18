using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsLogin
    {

        public bool IsValidSuperAdmin(string userName, string password, ref DataSet adminSet)
        {
            try
            {
                string strSql = string.Empty;

                OleDbParameter[] paramList = new OleDbParameter[2];
                paramList[0] = new OleDbParameter("@UserName", OleDbType.VarWChar);
                paramList[0].Value = userName;

                paramList[1] = new OleDbParameter("@Password", OleDbType.VarWChar);
                paramList[1].Value = password;
                strSql = "SELECT USERID AS USERNAME,EMAIL FROM SUPER_ADMIN WHERE USERID=? AND PASSWORD=? collate SQL_Latin1_General_Cp1_CS_AS";

                DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
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