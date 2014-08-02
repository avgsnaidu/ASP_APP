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
        public string Name_Eng { get; set; }
        public string Name_Arb { get; set; }
        public int DistrictNo { get; set; }      

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddDistrictDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("Insert into District (NAME_ENG,NAME_ARB,DATE_CREATED,DATE_UPDATED)VALUES('{0}','{1}','{2}','{3}')",
                Name_Eng, Name_Arb, DateTime.Now, (DateTime?)null);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateDistrictDetails(int DistrictNo, string NameEng, string NameArb)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@DistrictNo", SqlDbType.Int);
            p[0].Value = DistrictNo;
            p[1] = new SqlParameter("@NameEng", SqlDbType.NVarChar);
            p[1].Value = NameEng;
            p[2] = new SqlParameter("@NameArb", SqlDbType.NVarChar);
            p[2].Value = NameArb;

            string strSql = "UPDATE District SET Name_Eng=@NameEng, Name_Arb=@NameArb, DATE_UPDATED=GETDATE() where District_No=@DistrictNo";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetDistrictDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT District_No,Name_Eng,Name_Arb FROM District order by date_Created desc");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
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