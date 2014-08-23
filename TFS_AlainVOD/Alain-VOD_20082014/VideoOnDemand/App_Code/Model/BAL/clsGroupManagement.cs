using System;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data.OleDb;

namespace VideoOnDemand.Model.BAL
{
    public class clsGroupManagement
    {


        public DataSet GetGroups()
        {
            DataSet ds;
            string strSql = "select GROUP_ID AS GroupID ,GROUP_NAME AS GroupName,DESCRIPTION from GROUPS";
            ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool InsertGroupDetails(string groupName, string description)
        {
            OleDbParameter[] p = new OleDbParameter[3];
            p[0] = new OleDbParameter("@GroupName", OleDbType.VarWChar);
            p[0].Value = groupName;
            p[1] = new OleDbParameter("@Description", OleDbType.VarWChar);
            p[1].Value = description;

            p[2] = new OleDbParameter("@CreatedDate", SqlDbType.DateTime);
            p[2].Value = DateTime.Now;


            string strSql = "INSERT INTO GROUPS(GROUP_NAME,DESCRIPTION,DATE_CREATED)VALUES(?,?,?)";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }


        public bool UpdateGroupDetails(int groupID, string groupName, string description)
        {
            OleDbParameter[] p = new OleDbParameter[3];
            p[0] = new OleDbParameter("@GroupName", OleDbType.VarWChar);
            p[0].Value = groupName;
            p[1] = new OleDbParameter("@Description", OleDbType.VarWChar);
            p[1].Value = description;
            p[2] = new OleDbParameter("@GROUPID", OleDbType.Integer);
            p[2].Value = groupID;


            string strSql = "UPDATE GROUPS SET GROUP_NAME=? ,DESCRIPTION=?,DATE_UPDATED=GETDATE() where GROUP_ID=?";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public bool DeleteGroup(int groupID)
        { 
            string strSql = "DELETE FROM GROUPS WHERE GROUP_ID=" + groupID;
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }


    }
}