using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VideoOnDemand.Model.BAL
{
    public class clsSearch
    {
        public DataSet fnSearch(string searchKeyword, int searchOn, bool IsArabic)
        {

            DataSet ds;

            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@SearchKey", SqlDbType.NVarChar);
            p[0].Value = searchKeyword;
            p[1] = new SqlParameter("@SearchOn", SqlDbType.Int);
            p[1].Value = searchOn;
            p[2] = new SqlParameter("@IsArabic", SqlDbType.Bit);
            p[2].Value = IsArabic;

            ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_SearchKeyword", p);
            return ds;
 
        }


        public DataSet GetSearchFilterTagsList()
        {
            SqlParameter[] paramList = new SqlParameter[1];
            paramList[0] = new SqlParameter("@Lang", SqlDbType.Char);
            paramList[0].Value = BasePage.CurrentLanguage;

            string strSql = string.Empty;
            strSql = " Select SearchTagCode,case when @lang='A' then SEARCHTAGNAME_ARB when @lang='E' then SEARCHTAGNAME END SEARCHTAG from SearchFilterTags";
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }


    }
}