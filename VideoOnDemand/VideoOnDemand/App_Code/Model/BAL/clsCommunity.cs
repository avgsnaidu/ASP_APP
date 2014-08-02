using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace VideoOnDemand.Model.BAL
{
    public class clsCommunity
    {
        public string Name_Eng { get; set; }
        public string Name_Arb { get; set; }
        public int DistrictNo { get; set; }
        public int CommunityNo { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddCommunityDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("Insert into Community (NAME_ENG,NAME_ARB,DISTRICT_NO,DATE_CREATED,DATE_UPDATED)VALUES('{0}','{1}','{2}','{3}','{4}')",
                Name_Eng, Name_Arb, DistrictNo, DateTime.Now, (DateTime?)null);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateCommunityDetails(int CommunityNo, string NameEng, string NameArb, int DistrictNo)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@CommunityNo", SqlDbType.Int);
            p[0].Value = CommunityNo;
            p[1] = new SqlParameter("@NameEng", SqlDbType.NVarChar);
            p[1].Value = NameEng;
            p[2] = new SqlParameter("@NameArb", SqlDbType.NVarChar);
            p[2].Value = NameArb;
            p[3] = new SqlParameter("@DistrictNo", SqlDbType.Int);
            p[3].Value = DistrictNo;

            string strSql = "UPDATE Community SET NAME_ENG=@NameEng, NAME_ARB=@NameArb, DISTRICT_NO=@DistrictNo, DATE_UPDATED=GETDATE() where Community_No=@CommunityNo";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetCommunityDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT C.Community_No,C.Name_Eng,C.Name_Arb,D.Name_Eng AS DISTRICT_NO FROM Community C Join District D ON C.District_No = D.District_No");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public bool DeleteCommunity(int CommunityNo)
        {
            string strSql = "DELETE FROM Community WHERE Community_No=" + CommunityNo;
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }
    }
}