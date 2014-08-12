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
        public string CommunityName { get; set; }
        public int DistrictNo { get; set; }
        public int CommunityNo { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddCommunityDetails(char language)
        {
            string strSql = string.Empty;
            if (language == 'A')
                strSql = string.Format("INSERT INTO [COMMUNITY]([COMMUNITY_NO],[NAME_ARB],[DISTRICT_NO],[DATE_CREATED]) VALUES('{0}',N'{1}',{2},'{3}')",
                   CommunityNo, CommunityName, DistrictNo, DateTime.Now);
            else
                strSql = string.Format("INSERT INTO [COMMUNITY]([COMMUNITY_NO],[NAME_ENG],[DISTRICT_NO],[DATE_CREATED]) VALUES('{0}',N'{1}',{2},'{3}')",
                                  CommunityNo, CommunityName, DistrictNo, DateTime.Now);

            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);

            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateCommunityDetails(int Community_Dist_Id, string NameEng, int DistrictNo, char language)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@CommunityId", SqlDbType.Int);
            p[0].Value = Community_Dist_Id;
            p[1] = new SqlParameter("@CommunityName", SqlDbType.NVarChar);
            p[1].Value = NameEng;
            p[2] = new SqlParameter("@DistrictNo", SqlDbType.Int);
            p[2].Value = DistrictNo;
            p[3] = new SqlParameter("@lang", SqlDbType.Char);
            p[3].Value = language;

            string strSql = "UPDATE Community SET  NAME_ARB=CASE WHEN @lang='A' then @CommunityName END,NAME_ENG=CASE when  @lang='E' then @CommunityName END, DISTRICT_NO=@DistrictNo , DATE_UPDATED=GETDATE() where COM_DIST_ID=@CommunityId";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetCommunityDetails(char language)
        {
            string strSql = string.Empty;

            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@lang", SqlDbType.Char);
            p[0].Value = language;

            strSql = string.Format("SELECT [COM_DIST_ID] AS CommunityUniqID,[COMMUNITY_NO],CASE WHEN @lang='A' THEN CM.[NAME_ARB] WHEN @lang='E' THEN CM.[NAME_ENG] END COMMUNITYNAME,CM.[DISTRICT_NO], " +
 "CASE WHEN @lang='A' THEN DS.[NAME_ARB] WHEN @lang='E' THEN DS.[NAME_ENG] END AS DISTRICTNAME " +
  "FROM [COMMUNITY] CM  INNER JOIN DISTRICT DS ON CM.DISTRICT_NO=DS.DISTRICT_NO ");
             
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            return ds;
        }

        public bool DeleteCommunity(int CommunityId)
        {
            string strSql = "DELETE FROM Community WHERE COM_DIST_ID=" + CommunityId;
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }
    }
}