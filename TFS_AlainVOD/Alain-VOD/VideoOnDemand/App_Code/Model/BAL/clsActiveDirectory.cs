using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace VideoOnDemand.Model.BAL
{
    public class clsActiveDirectory
    {

        public string IP { get; set; }
        public string Userid { get; set; }
        public string Password { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ConfigId { get; set; }
        public string DomainName { get; set; }

        public bool AddADDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("INSERT INTO ADS_DETAILS (IP,USERID,PASSWORD,DATE_CREATED,DATE_UPDATED)VALUES('{0}','{1}','{2}','{3}','{4}')",
                IP, Userid, Password, DateTime.Now, (DateTime?)null);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool AddADDomainDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("INSERT INTO [DOMAINS] ([DomainName])VALUES('{0}')", DomainName);
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }


        public bool UpdateADDetails(int configid, string Ip, string Userid, string pwd, int domainId, string domainName)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Ip", SqlDbType.NVarChar);
            p[0].Value = Ip;
            p[1] = new SqlParameter("@Userid", SqlDbType.NVarChar);
            p[1].Value = Userid;
            p[2] = new SqlParameter("@pwd", SqlDbType.NVarChar);
            p[2].Value = pwd;
            p[3] = new SqlParameter("@configid", SqlDbType.Int);
            p[3].Value = configid;

            p[4] = new SqlParameter("@domainId", SqlDbType.Int);
            p[4].Value = domainId;

            p[5] = new SqlParameter("@domainName", SqlDbType.NVarChar);
            p[5].Value = domainName;

            string strSql = "UPDATE ADS_DETAILS SET IP=@Ip ,USERID=@Userid, PASSWORD=@pwd, DATE_UPDATED=GETDATE() where CONFIG_ID=@configid; " +
            " UPDATE [DOMAINS] SET [DomainName] =@domainName  WHERE ID=@domainId ";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }
        public DataSet GetADDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1  CONFIG_ID,IP,USERID,PASSWORD FROM ADS_DETAILS order by date_Created desc ");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public DataSet GetADDomainDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT [ID],[DomainName] FROM [DOMAINS] order by ID desc ");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }


    }
}