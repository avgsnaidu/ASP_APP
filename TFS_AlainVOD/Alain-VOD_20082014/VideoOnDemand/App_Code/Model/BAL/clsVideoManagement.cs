using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsVideoManagement
    {
        public DataSet GetVideosList(char status, int groupId, char lanugage)
        { 

            string strSql = string.Empty;

            if (lanugage == 'A')
                strSql = "SELECT VIDEOID ,VIDEONAME AS FILENAME,VD.STATUS AS STATUS,STATUSCODE, Case " +
                        "WHEN (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) " +
                        "LIKE '%,'  THEN LEFT((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) , LEN((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')))-1) " +
                         "ELSE  (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) END AS TAG  " +
                          "FROM VW_VIDEOS_WITH_TAGS_ARB VD";
            else
                strSql = "SELECT VIDEOID ,VIDEONAME AS FILENAME,VD.STATUS AS STATUS,STATUSCODE, Case " +
                        "WHEN (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) " +
                        "LIKE '%,'  THEN LEFT((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) , LEN((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')))-1) " +
                         "ELSE  (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) END AS TAG  " +
                          "FROM VW_VIDEOS_WITH_TAGS VD ";

            if (status == '0')
            {
                if (groupId > 0)
                {
                    strSql = strSql + " INNER JOIN VOD_GROUP VG ON VD.VIDEOID= VG.VOD_ID where VG.GROUP_ID=" + groupId;
                }
            }
            else
            {
                if (status != '0' && groupId > 0)
                    strSql = strSql + " INNER JOIN VOD_GROUP VG ON VD.VIDEOID= vg.VOD_ID where VG.GROUP_ID=" + groupId + " " + " AND VD.STATUSCODE='" + status + "'";

                else if (status != '0' && groupId == 0)
                    strSql = strSql + " where VD.STATUSCODE='" + status + "'";
            }

            //strSql = "SELECT VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.StatusName AS STATUS,TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Statuscode where v.Status='" + status + "'";
            //SELECT V.VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.StatusName AS STATUS,
            //     TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Statuscode
            //  INNER JOIN VOD_GROUP VG ON v.VOD_ID= vg.VOD_ID where VG.GROUP_ID=


            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        
        }

        public DataSet GetVideosListBasedOnGroup(int groupId, char lanugage,string loginName)
        { 
            string strSql = string.Empty;

            if (lanugage == 'A')
                strSql = "SELECT VIDEOID ,VIDEONAME AS FILENAME,VD.STATUS AS STATUS,STATUSCODE, Case " +
                        "WHEN (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) " +
                        "LIKE '%,'  THEN LEFT((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) , LEN((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')))-1) " +
                         "ELSE  (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) END AS TAG  " +
                          "FROM VW_VIDEOS_WITH_TAGS_ARB VD" +
                          " INNER JOIN VOD_GROUP VG on VD.VIDEOID=VG.VOD_ID " +
                          " INNER JOIN USERS UR on VG.GROUP_ID=UR.GROUP_ID " +
                          " WHERE VD.STATUSCODE='D' " +
                          "AND UR.NAME='" + loginName + "'";
            else
                strSql = "SELECT VIDEOID ,VIDEONAME AS FILENAME,VD.STATUS AS STATUS,STATUSCODE, Case "+
                         "WHEN (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) "+
                         "LIKE '%,'  THEN LEFT((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) , LEN((ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')))-1)"+
                         " ELSE  (ISNULL(COMMUNITY+' , ','')+ISNULL(DISTRICT+',','')+ISNULL(ROAD,'')) END AS TAG  "+
                          " FROM VW_VIDEOS_WITH_TAGS VD "+
                          " INNER JOIN VOD_GROUP VG on VD.VIDEOID=VG.VOD_ID "+
                          " INNER JOIN USERS UR on VG.GROUP_ID=UR.GROUP_ID "+
                          " WHERE VD.STATUSCODE='D' "+
                          "AND UR.NAME='"+loginName+"'";

            //if (status == '0')
            //{
            //    if (groupId > 0)
            //    {
            //        strSql = strSql + " INNER JOIN VOD_GROUP VG ON VD.VIDEOID= VG.VOD_ID where VG.GROUP_ID=" + groupId;
            //    }
            //}
            //else
            //{
            //    if (status != '0' && groupId > 0)
            //        strSql = strSql + " INNER JOIN VOD_GROUP VG ON VD.VIDEOID= vg.VOD_ID where VG.GROUP_ID=" + groupId + " " + " AND VD.STATUSCODE='" + status + "'";

            //    else if (status != '0' && groupId == 0)
            //        strSql = strSql + " where VD.STATUSCODE='" + status + "'";
            //}

            //strSql = "SELECT VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.StatusName AS STATUS,TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Statuscode where v.Status='" + status + "'";
            //SELECT V.VOD_ID AS VIDEOID ,FILE_NAME AS FILENAME,vs.StatusName AS STATUS,
            //     TAGS_ENG AS TAG FROM VOD_VIDEOS v LEFT JOIN VideoStatus vs On v.STATUS=vs.Statuscode
            //  INNER JOIN VOD_GROUP VG ON v.VOD_ID= vg.VOD_ID where VG.GROUP_ID=


            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;

        }

         

        public bool AssignVideosToGroup(int groupId, string videosListWithSemiColonSeparated)
        {

            OleDbParameter[] paramList = new OleDbParameter[2];
            paramList[0] = new OleDbParameter("@GroupId", OleDbType.Integer);
            paramList[0].Value = groupId;
            paramList[1] = new OleDbParameter("@Videos", OleDbType.VarWChar);
            paramList[1].Value = videosListWithSemiColonSeparated;

            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_UpdateVideoGroup", paramList);
            if (value > 0)
                return true;
            else
                return false;

        }


        public DataSet GetVideoStatus()
        {
            OleDbParameter[] paramList = new OleDbParameter[2];
            paramList[0] = new OleDbParameter("@Lang", OleDbType.Char);
            paramList[0].Value = BasePage.CurrentLanguage;
            paramList[1] = new OleDbParameter("@Lang1", OleDbType.Char);
            paramList[1].Value = BasePage.CurrentLanguage;

            string strSql = string.Empty;
            strSql = "Select Statuscode,case when ?='A' then STATUSNAME_ARB when ?='E' then STATUSNAME END STATUSNAME from VideoStatus";
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }

        public DataSet GetVideoTagDetails(int videoID, char language)
        {
            //OleDbParameter[] paramList = new OleDbParameter[1];
            //paramList[0] = new OleDbParameter("@Lang", OleDbType.Char);
            //paramList[0].Value = language;

            string strSql = string.Empty;
            strSql = "SELECT VIDEOID,VIDEONAME,COMMUNITY_TAG,DISTRICT_TAG,ROAD_TAG FROM VW_VIDEOS_WITH_TAGS WHERE VIDEOID=" + videoID;
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;

        }



    }
}