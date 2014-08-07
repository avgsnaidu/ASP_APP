using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace VideoOnDemand.Model.BAL
{
    public class clsDistrict
    {
        public string DistrictName { get; set; }
        public int DistrictNo { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddDistrictDetails(char language)
        {
            string strSql = string.Empty;
            if (language == 'A')
                strSql = string.Format("Insert into District (District_No,NAME_ARB,DATE_CREATED)VALUES({0},'N{1}','{2}')",
                    DistrictNo, DistrictName, DateTime.Now);
            else
                strSql = string.Format("Insert into District (District_No,NAME_ENG,DATE_CREATED)VALUES({0},N'{1}','{2}')",
                DistrictNo, DistrictName, DateTime.Now);

            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateDistrictDetails(int DistrictNo, string DistrictName, char language)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@DistrictNo", SqlDbType.Int);
            p[0].Value = DistrictNo;
            p[1] = new SqlParameter("@DistrictName", SqlDbType.NVarChar);
            p[1].Value = DistrictName;
            p[2] = new SqlParameter("@lang", SqlDbType.Char);
            p[2].Value = language;

            string strSql = "UPDATE District SET Name_Eng=CASE WHEN @lang='E' THEN @DistrictName END, Name_Arb=CASE WHEN @lang='A' THEN @DistrictName END, DATE_UPDATED=GETDATE() where District_No=@DistrictNo";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetDistrictDetails(char language)
        {
            string strSql = string.Empty;
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@lang", SqlDbType.Char);
            p[0].Value = language;

            strSql = string.Format("SELECT [DISTRICT_NO],CASE WHEN @LANG='E' THEN [NAME_ENG] WHEN @LANG='A' THEN [NAME_ARB] END AS DISTRICTNAME, " +
                                " [DATE_CREATED] FROM [DISTRICT] order by DISTRICTNAME");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            return ds;
        }

        public bool DeleteDistrict(int DistrictNo)
        {
            string strSql = "DELETE FROM District WHERE District_No=" + DistrictNo;
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }

    }
}