using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

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

            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);

            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateCommunityDetails(int Community_Dist_Id, string NameEng, int DistrictNo, char language)
        {
            OleDbParameter[] p = new OleDbParameter[6];
            p[0] = new OleDbParameter("@lang", OleDbType.Char);
            p[0].Value = language;
            p[1] = new OleDbParameter("@CommunityName", OleDbType.VarWChar);
            p[1].Value = NameEng;
            p[2] = new OleDbParameter("@lang2", OleDbType.Char);
            p[2].Value = language;
            p[3] = new OleDbParameter("@CommunityName2", OleDbType.VarWChar);
            p[3].Value = NameEng;
            p[4] = new OleDbParameter("@DistrictNo", OleDbType.Integer);
            p[4].Value = DistrictNo;
            p[5] = new OleDbParameter("@CommunityId", OleDbType.Integer);
            p[5].Value = Community_Dist_Id;

            string strSql = "UPDATE Community SET  NAME_ARB=CASE WHEN ?='A' then ? END,NAME_ENG=CASE " +
            " when ?='E' then ? END, " +
            " DISTRICT_NO=? , DATE_UPDATED=GETDATE() where COM_DIST_ID=?";

            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetCommunityDetails(char language)
        {
            string strSql = string.Empty;

            OleDbParameter[] p = new OleDbParameter[4];
            p[0] = new OleDbParameter("@lang", OleDbType.Char);
            p[0].Value = language;
            p[1] = new OleDbParameter("@lang2", OleDbType.Char);
            p[1].Value = language;
            p[2] = new OleDbParameter("@lang3", OleDbType.Char);
            p[2].Value = language;
            p[3] = new OleDbParameter("@lang4", OleDbType.Char);
            p[3].Value = language;

            strSql = string.Format("SELECT [COM_DIST_ID] AS CommunityUniqID,[COMMUNITY_NO],CASE WHEN ?='A' THEN CM.[NAME_ARB] WHEN ?='E' THEN CM.[NAME_ENG] END COMMUNITYNAME,CM.[DISTRICT_NO], " +
        " CASE WHEN ?='A' THEN DS.[NAME_ARB] WHEN ?='E' THEN DS.[NAME_ENG] END AS DISTRICTNAME " +
         " FROM [COMMUNITY] CM  INNER JOIN DISTRICT DS ON CM.DISTRICT_NO=DS.DISTRICT_NO ");

            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            return ds;
        }

        public bool DeleteCommunity(int CommunityId)
        {
            string strSql = "DELETE FROM Community WHERE COM_DIST_ID=" + CommunityId;
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            if (value > 0)
                return true;
            else return false;

        }
    }
}