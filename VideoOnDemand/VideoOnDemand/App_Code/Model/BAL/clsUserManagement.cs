using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;

namespace VideoOnDemand.Model.BAL
{
    public class clsUserManagement
    {
        //public int SelectedGroupId { get; set; }
        //public string SelectedUsersList { get; set; }

        public DataSet GetUsersList()
        {
            string strSql = string.Empty;

            //strSql = "SELECT USER_ID,NAME,DOMAIN,FULL_NAME,GROUP_ID,DATE_CREATED,DATE_UPDATED FROM USERS";
            //DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);

            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_GetUserDetails");
            return ds;
        }

        public bool AssignUsersToGroup(int groupId, string userListWithSemiColonSeparated)
        {

            SqlParameter[] paramList = new SqlParameter[2];
            paramList[0] = new SqlParameter("@GroupId", SqlDbType.Int);
            paramList[0].Value = groupId;
            paramList[1] = new SqlParameter("@Users", SqlDbType.VarChar);
            paramList[1].Value = userListWithSemiColonSeparated;

            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_UpdateUserGroup", paramList);
            if (value > 0)
                return true;
            else
                return false;

        }

        public bool UpdateUserGroup(int groupId, int userId)
        {
            string strSql = string.Empty;

            SqlParameter[] paramList = new SqlParameter[2];
            paramList[0] = new SqlParameter("@GroupId", SqlDbType.Int);
            paramList[0].Value = groupId;
            paramList[1] = new SqlParameter("@UserId", SqlDbType.VarChar);
            paramList[1].Value = userId;
            if (groupId == 0)
                strSql = "UPDATE USERS SET GROUP_ID=NULL WHERE USER_ID=@UserId";
            else
                strSql = "UPDATE USERS SET GROUP_ID=@GroupId WHERE USER_ID=@UserId";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            if (value > 0)
                return true;
            else
                return false;

        }




    }
}