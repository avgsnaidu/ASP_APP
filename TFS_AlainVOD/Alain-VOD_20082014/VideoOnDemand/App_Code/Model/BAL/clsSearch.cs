using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
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

            OleDbParameter[] p = new OleDbParameter[3];
            p[0] = new OleDbParameter("@SearchKey", OleDbType.VarWChar);
            p[0].Value = searchKeyword;
            p[1] = new OleDbParameter("@SearchOn", OleDbType.Integer);
            p[1].Value = searchOn;
            p[2] = new OleDbParameter("@IsArabic", OleDbType.Boolean);
            p[2].Value = IsArabic;

            ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_SearchKeyword", p);
            return ds;
 
        }

        public DataSet fnSearchBasedOnUser(string searchKeyword,string userName, int searchOn, bool IsArabic)
        {

            DataSet ds;

            OleDbParameter[] p = new OleDbParameter[4];
            p[0] = new OleDbParameter("@SearchKey", OleDbType.VarWChar);
            p[0].Value = searchKeyword;
            p[1] = new OleDbParameter("@UserName", OleDbType.VarWChar);
            p[1].Value = userName;
            p[2] = new OleDbParameter("@SearchOn", OleDbType.Integer);
            p[2].Value = searchOn;
            p[3] = new OleDbParameter("@IsArabic", OleDbType.Boolean);
            p[3].Value = IsArabic;
           
            ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_SearchKeywordBasedOnUser", p);
            return ds;

        }


        public DataSet GetSearchFilterTagsList()
        {
            OleDbParameter[] paramList = new OleDbParameter[2];
            paramList[0] = new OleDbParameter("@Lang", OleDbType.Char);
            paramList[0].Value = BasePage.CurrentLanguage;

            paramList[1] = new OleDbParameter("@Lang", OleDbType.Char);
            paramList[1].Value = BasePage.CurrentLanguage;
             
            string strSql = string.Empty;
            strSql = " Select SearchTagCode,case when ?='A' then SEARCHTAGNAME_ARB when ?='E' then SEARCHTAGNAME END SEARCHTAG from SearchFilterTags";
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, paramList);
            return ds;
        }


    }
}