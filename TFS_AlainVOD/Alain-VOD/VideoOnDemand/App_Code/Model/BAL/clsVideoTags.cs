using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsVideoTags
    {

        public DataSet GetCommunityList(char language)
        {
            OleDbParameter[] paramList = new OleDbParameter[4];
            paramList[0] = new OleDbParameter("@Lang", OleDbType.Char);
            paramList[0].Value = language;
            paramList[1] = new OleDbParameter("@Lang1", OleDbType.Char);
            paramList[1].Value = language;
            paramList[2] = new OleDbParameter("@Lang2", OleDbType.Char);
            paramList[2].Value = language;
            paramList[3] = new OleDbParameter("@Lang3", OleDbType.Char);
            paramList[3].Value = language;

            string strSql = string.Empty;
            strSql = "SELECT [COMMUNITY_NO] COMMUNITYNO,Case when ?='A' then C.[NAME_ARB] when ?='E' then C.[NAME_ENG] END COMMUNITYNAME, " +
                " D.[DISTRICT_NO] DISTRICTNO,Case when ?='A' then D.[NAME_ARB] when ?='E' then D.[NAME_ENG] END DISTRICTNAME " +
                "FROM [COMMUNITY] C JOIN DISTRICT D ON C.DISTRICT_NO=D.DISTRICT_NO ";
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }


        public DataSet GetDistrictList(char language)
        {
            OleDbParameter[] paramList = new OleDbParameter[2];
            paramList[0] = new OleDbParameter("@Lang", OleDbType.Char);
            paramList[0].Value = language;

            paramList[1] = new OleDbParameter("@Lang1", OleDbType.Char);
            paramList[1].Value = language;


            string strSql = string.Empty;
            strSql = "SELECT [DISTRICT_NO] AS DISTNO,Case when ?='A' then [NAME_ARB] when ?='E' then [NAME_ENG] END AS DISTRICTNAME FROM [DISTRICT]";
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }

        public DataSet GetRoadsList(char language)
        {
            OleDbParameter[] paramList = new OleDbParameter[2];
            paramList[0] = new OleDbParameter("@Lang", OleDbType.Char);
            paramList[0].Value = language;
            paramList[1] = new OleDbParameter("@Lang1", OleDbType.Char);
            paramList[1].Value = language;

            string strSql = string.Empty;
            strSql = "SELECT [ROAD_NO] AS ROADNO,Case when ?='A' then [NAME_ARB] when ?='E' then [NAME_ENG] end AS ROADNAME FROM [ROADS]";
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }


        public bool UpdateVideoTags(int videoID, int Community_Tag, int Dist_Tag, int Road_Tag)
        {

            OleDbParameter[] paramList = new OleDbParameter[7];
            paramList[0] = new OleDbParameter("@Commuity_Tag", OleDbType.Integer);
            paramList[0].Value = Community_Tag;
            paramList[1] = new OleDbParameter("@Commuity_Tag2", OleDbType.Integer);
            paramList[1].Value = Community_Tag;
            paramList[2] = new OleDbParameter("@Dist_Tag", OleDbType.Integer);
            paramList[2].Value = Dist_Tag;
            paramList[3] = new OleDbParameter("@Dist_Tag2", OleDbType.Integer);
            paramList[3].Value = Dist_Tag;
            paramList[4] = new OleDbParameter("@Road_Tag", OleDbType.Integer);
            paramList[4].Value = Road_Tag;
            paramList[5] = new OleDbParameter("@Road_Tag2", OleDbType.Integer);
            paramList[5].Value = Road_Tag;
            paramList[6] = new OleDbParameter("@VideoId", OleDbType.Integer);
            paramList[6].Value = videoID;            

            string strSql = "UPDATE VOD_VIDEOS SET COMMUNITY_TAG =Case when ?=0 then NULL else ? end , "+
                " DISTRICT_TAG=case when ?=0 then NULL else ? end, ROAD_TAG=CASE when ?=0 then NULL else ? end "+
                " WHERE VOD_ID= ?";

            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            if (value > 0)
                return true;
            else
                return false;

        } 


    }
}