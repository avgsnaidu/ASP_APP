using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;



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
            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool AddADDomainDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("INSERT INTO [DOMAINS] ([DomainName])VALUES('{0}')", DomainName);
            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }


        public bool UpdateADDetails(int configid, string Ip, string Userid, string pwd, int domainId, string domainName)
        {
            OleDbParameter[] p = new OleDbParameter[6];
            p[0] = new OleDbParameter("@Ip", OleDbType.VarWChar);
            p[0].Value = Ip;
            p[1] = new OleDbParameter("@Userid", OleDbType.VarWChar);
            p[1].Value = Userid;
            p[2] = new OleDbParameter("@pwd", OleDbType.VarWChar);
            p[2].Value = pwd;
            p[3] = new OleDbParameter("@configid", OleDbType.Integer);
            p[3].Value = configid;
            p[5] = new OleDbParameter("@domainId", OleDbType.Integer);
            p[5].Value = domainId;
            p[4] = new OleDbParameter("@domainName", OleDbType.VarWChar);
            p[4].Value = domainName;

            string strSql = "UPDATE ADS_DETAILS SET IP=? ,USERID=?, PASSWORD=?, DATE_UPDATED=GETDATE() where CONFIG_ID=?; " +
            " UPDATE [DOMAINS] SET [DomainName] =?  WHERE ID=?";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }
        public DataSet GetADDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1  CONFIG_ID,IP,USERID,PASSWORD FROM ADS_DETAILS order by date_Created desc ");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public DataSet GetADDomainDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT [ID],[DomainName] FROM [DOMAINS] order by ID desc ");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }





    }
}