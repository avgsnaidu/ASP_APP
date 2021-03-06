﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsVideoTags
    {

        public DataSet GetCommunityList(char language)
        {
            SqlParameter[] paramList = new SqlParameter[1];
            paramList[0] = new SqlParameter("@Lang", SqlDbType.Char);
            paramList[0].Value = language;

            string strSql = string.Empty;
            strSql = "SELECT [COMMUNITY_NO] COMMUNITYNO,Case when @Lang='A' then C.[NAME_ARB] when @Lang='E' then C.[NAME_ENG] END COMMUNITYNAME, " +
                " D.[DISTRICT_NO] DISTRICTNO,Case when @Lang='A' then D.[NAME_ARB] when @Lang='E' then D.[NAME_ENG] END DISTRICTNAME " +
                "FROM [COMMUNITY] C JOIN DISTRICT D ON C.DISTRICT_NO=D.DISTRICT_NO ";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }


        public DataSet GetDistrictList(char language)
        {
            SqlParameter[] paramList = new SqlParameter[1];
            paramList[0] = new SqlParameter("@Lang", SqlDbType.Char);
            paramList[0].Value = language;

            string strSql = string.Empty;
            strSql = "SELECT [DISTRICT_NO] AS DISTNO,Case when @Lang='A' then [NAME_ARB] when @Lang='E' then [NAME_ENG] END AS DISTRICTNAME FROM [DISTRICT]";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }

        public DataSet GetRoadsList(char language)
        {
            SqlParameter[] paramList = new SqlParameter[1];
            paramList[0] = new SqlParameter("@Lang", SqlDbType.Char);
            paramList[0].Value = language;

            string strSql = string.Empty;
            strSql = "SELECT [ROAD_NO] AS ROADNO,Case when @Lang='A' then [NAME_ARB] when @Lang='E' then [NAME_ENG] end AS ROADNAME FROM [ROADS]";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }


        public bool UpdateVideoTags(int videoID, int Community_Tag, int Dist_Tag, int Road_Tag)
        {

            SqlParameter[] paramList = new SqlParameter[4];
            paramList[0] = new SqlParameter("@VideoId", SqlDbType.Int);
            paramList[0].Value = videoID;
            paramList[1] = new SqlParameter("@Commuity_Tag", SqlDbType.Int);
            paramList[1].Value = Community_Tag;
            paramList[2] = new SqlParameter("@Dist_Tag", SqlDbType.Int);
            paramList[2].Value = Dist_Tag;
            paramList[3] = new SqlParameter("@Road_Tag", SqlDbType.Int);
            paramList[3].Value = Road_Tag;

            string strSql = "UPDATE VOD_VIDEOS SET COMMUNITY_TAG =Case when @Commuity_Tag=0 then NULL else @Commuity_Tag end ,DISTRICT_TAG=case when @Dist_Tag=0 then NULL else @Dist_Tag end, ROAD_TAG=CASE when @Road_Tag=0 then NULL else @Road_Tag  end WHERE VOD_ID= @VideoId";

            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            if (value > 0)
                return true;
            else
                return false;

        }





    }
}