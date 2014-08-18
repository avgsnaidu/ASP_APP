using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Data.OleDb;

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

            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateDistrictDetails(int DistrictNo, string DistrictName, char language)
        {
            OleDbParameter[] p = new OleDbParameter[5];
            p[0] = new OleDbParameter("@lang", OleDbType.Char);
            p[0].Value = language;
            p[1] = new OleDbParameter("@DistrictName", OleDbType.VarWChar);
            p[1].Value = DistrictName;
            p[2] = new OleDbParameter("@lang2", OleDbType.Char);
            p[2].Value = language;
            p[3] = new OleDbParameter("@DistrictName2", OleDbType.VarWChar);
            p[3].Value = DistrictName;
            p[4] = new OleDbParameter("@DistrictNo", OleDbType.Integer);
            p[4].Value = DistrictNo;

            string strSql = "UPDATE District SET Name_Eng=CASE WHEN ?='E' THEN ? END, Name_Arb=CASE WHEN ?='A' " +
                " THEN ? END, DATE_UPDATED=GETDATE() where District_No=?";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetDistrictDetails(char language)
        {
            string strSql = string.Empty;
            OleDbParameter[] p = new OleDbParameter[2];
            p[0] = new OleDbParameter("@lang", OleDbType.Char);
            p[0].Value = language;
            p[1] = new OleDbParameter("@lang2", OleDbType.Char);
            p[1].Value = language;

            strSql = string.Format("SELECT [DISTRICT_NO],CASE WHEN ?='E' THEN [NAME_ENG] WHEN ?='A' THEN [NAME_ARB] END AS DISTRICTNAME, " +
                                " [DATE_CREATED] FROM [DISTRICT] order by DISTRICTNAME");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            return ds;
        }

        public bool DeleteDistrict(int DistrictNo)
        {
            string strSql = "DELETE FROM District WHERE District_No=" + DistrictNo;
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }

    }
}