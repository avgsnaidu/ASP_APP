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
        public DataSet GetVideosList(char status, int groupId)
        {


            string strSql = string.Empty;
            strSql = "SELECT VIDEOID ,VIDEONAME AS FILENAME,VD.STATUS AS STATUS,COMMUNITY+' , '+DISTRICT+' , '+ROAD AS TAG FROM VW_VIDEOS_WITH_TAGS VD";
           
            if (status == '0')
            {
                if (groupId > 0)
                {
                    strSql = strSql + " INNER JOIN VOD_GROUP VG ON VD.VIDEOID= VG.VIDEOID where VG.GROUP_ID=" + groupId;
                }
            }
            else
            {
                if (status != '0' && groupId > 0)
                    strSql = strSql + " INNER JOIN VOD_GROUP VG ON VD.VIDEOID= vg.VOD_ID where VG.GROUP_ID=" + groupId + " " +" AND VD.STATUSCODE='" + status + "'";

                else if (status != '0' && groupId == 0)
                    strSql = strSql + " where VD.STATUSCODE='" + status + "'";

            }

            //strSql = "SELECT VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.StatusName AS STATUS,TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Statuscode where v.Status='" + status + "'";
            //SELECT V.VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.StatusName AS STATUS,
            //     TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Statuscode
            //  INNER JOIN VOD_GROUP VG ON v.VOD_ID= vg.VOD_ID where VG.GROUP_ID=


            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool AssignVideosToGroup(int groupId, string videosListWithSemiColonSeparated)
        {

            SqlParameter[] paramList = new SqlParameter[2];
            paramList[0] = new SqlParameter("@GroupId", SqlDbType.Int);
            paramList[0].Value = groupId;
            paramList[1] = new SqlParameter("@Videos", SqlDbType.NVarChar);
            paramList[1].Value = videosListWithSemiColonSeparated;

            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_UpdateVideoGroup", paramList);
            if (value > 0)
                return true;
            else
                return false;

        }


        public DataSet GetVideoStatus()
        {
            string strSql = string.Empty;
            strSql = " Select Statuscode,statusName from VideoStatus";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public DataSet GetVideoTagDetails(int videoID)
        {
            string strSql = string.Empty;
            strSql = "SELECT VOD_ID AS VIDEOID,FILE_NAME AS VIDEONAME,COMMUNITY_TAG_ENG AS COMMUNITY_TAG,DISTRICT_TAG_ENG DISTRICT_TAG,ROAD_TAG_ENG AS ROAD_TAG FROM VOD_VIDEOS WHERE VOD_ID=" + videoID;
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;

        }

    }
}