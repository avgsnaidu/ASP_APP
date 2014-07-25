using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsArchive
    {
        public DataSet GetArchiveList()
        {
            string strSql = string.Empty;

            strSql = "Select FILE_NAME AS [FILENAME],Community_TAG_ENG+' , '+District_TAG_ENG+' , '+ROAD_TAG_ENG AS TAG ,DATE_CREATED AS ARCHIVEDDATE FROM ARCHIVE";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);

            return ds;
        }



        public DataSet GetSearchedArchiveList(string searchKeyword, bool IsArabic = false)
        {

            DataSet ds;

            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@SearchKey", SqlDbType.NVarChar);
            p[0].Value = searchKeyword;
            p[1] = new SqlParameter("@IsArabic", SqlDbType.Bit);
            p[1].Value = IsArabic;

            string strSql = string.Empty;
            strSql = "Select FILE_NAME AS [FILENAME],Community_TAG_ENG+' , '+District_TAG_ENG+' , '+ROAD_TAG_ENG AS TAG ,DATE_CREATED AS ARCHIVEDDATE  from ARCHIVE  where " +
                "COMMUNITY_TAG_ENG like'%" + searchKeyword + "%'" +
            " OR District_TAG_ENG like'%" + searchKeyword + "%'" +
            " OR ROAD_TAG_ENG like'%" + searchKeyword + "%'";
            ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            return ds;

        }

    }
}