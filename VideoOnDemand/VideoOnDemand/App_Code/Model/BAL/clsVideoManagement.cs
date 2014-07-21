using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsVideoManagement
    {
        public DataSet GetVideosList(char status)
        {
            string strSql = string.Empty;
            strSql = "SELECT VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.Text AS STATUS,TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Code where v.Status='" + status + "'";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool AssignVideosToGroup(int groupId, string videosListWithSemiColonSeparated)
        {

            SqlParameter[] paramList = new SqlParameter[2];
            paramList[0] = new SqlParameter("@GroupId", SqlDbType.Int);
            paramList[0].Value = groupId;
            paramList[1] = new SqlParameter("@Videos", SqlDbType.VarChar);
            paramList[1].Value = videosListWithSemiColonSeparated;

            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_UpdateVideoGroup", paramList);
            if (value > 0)
                return true;
            else
                return false;

        }

    }
}