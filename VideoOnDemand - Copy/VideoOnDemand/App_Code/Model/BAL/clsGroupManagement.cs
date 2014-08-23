using System;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;

namespace VideoOnDemand.Model.BAL
{
    public class clsGroupManagement
    {


        public DataSet GetGroups()
        {
            DataSet ds;
            string strSql = "select GROUP_ID AS GroupID ,GROUP_NAME AS GroupName,DESCRIPTION from GROUPS";
            ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool InsertGroupDetails(string groupName, string description)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@GroupName", SqlDbType.VarChar);
            p[0].Value = groupName;
            p[1] = new SqlParameter("@Description", SqlDbType.VarChar);
            p[1].Value = description;

            p[2] = new SqlParameter("@CreatedDate", SqlDbType.VarChar);
            p[2].Value = DateTime.Now;


            string strSql = "INSERT INTO VODWEB.dbo.GROUPS(GROUP_NAME,DESCRIPTION,DATE_CREATED)VALUES(@GroupName,@Description,@CreatedDate)";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }


        public bool UpdateGroupDetails(int groupID, string groupName, string description)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@GroupName", SqlDbType.VarChar);
            p[0].Value = groupName;
            p[1] = new SqlParameter("@Description", SqlDbType.VarChar);
            p[1].Value = description;
            p[2] = new SqlParameter("@GROUPID", SqlDbType.Int);
            p[2].Value = groupID;


            string strSql = "UPDATE GROUPS SET GROUP_NAME=@GroupName ,DESCRIPTION=@Description,DATE_UPDATED=GETDATE() where GROUP_ID=@GROUPID";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public bool DeleteGroup(int groupID)
        { 
            string strSql = "DELETE FROM GROUPS WHERE GROUP_ID=" + groupID;
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }


    }
}