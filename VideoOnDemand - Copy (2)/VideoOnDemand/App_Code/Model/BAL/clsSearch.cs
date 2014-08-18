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
        public DataSet fnSearch(string searchKeyword, string searchOn, bool IsArabic)
        {

            DataSet ds;

            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@SearchKey", SqlDbType.NVarChar);
            p[0].Value = searchKeyword;
            p[1] = new SqlParameter("@SearchOn", SqlDbType.NVarChar);
            p[1].Value = searchOn;
            p[2] = new SqlParameter("@IsArabic", SqlDbType.Bit);
            p[2].Value = IsArabic;

            ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.StoredProcedure, "usp_SearchKeyword", p);
            return ds;




        }
    }
}