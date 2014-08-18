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
            strSql = "SELECT V.VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.StatusName AS STATUS,Community_TAG_ENG+' , '+District_TAG_ENG+' , '+ROAD_TAG_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Statuscode ";
            if (status == '0')
            {
                if (groupId > 0)
                {
                    strSql = strSql + " INNER JOIN VOD_GROUP VG ON v.VOD_ID= vg.VOD_ID where VG.GROUP_ID=" + groupId;
                }
            }
            else
            {
                if (status != '0' && groupId > 0)
                    strSql = strSql + " INNER JOIN VOD_GROUP VG ON v.VOD_ID= vg.VOD_ID where VG.GROUP_ID=" + groupId + " " + " AND v.Status='" + status + "'";

                else if (status != '0' && groupId == 0)
                    strSql = strSql + " where v.Status='" + status + "'";

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

        public bool UpdateVideoTags(int videoID, string Community_Tag, string Dist_Tag, string Road_Tag)
        {

            SqlParameter[] paramList = new SqlParameter[4];
            paramList[0] = new SqlParameter("@VideoId", SqlDbType.Int);
            paramList[0].Value = videoID;
            paramList[1] = new SqlParameter("@Commuity_Tag", SqlDbType.NVarChar);
            paramList[1].Value = Community_Tag;
            paramList[2] = new SqlParameter("@Dist_Tag", SqlDbType.NVarChar);
            paramList[2].Value = Dist_Tag;
            paramList[3] = new SqlParameter("@Road_Tag", SqlDbType.NVarChar);
            paramList[3].Value = Road_Tag;

            string strSql = "UPDATE VOD_VIDEOS SET COMMUNITY_TAG_ENG =@Commuity_Tag,DISTRICT_TAG_ENG=@Dist_Tag,ROAD_TAG_ENG =@Road_Tag WHERE VOD_ID=@VideoId";

            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            if (value > 0)
                return true;
            else
                return false;

        }

    }
}