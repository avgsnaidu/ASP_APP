using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace VideoOnDemand.Model.BAL
{
    public class clsSuperAdmin
    {
        public string Userid { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public int ConfigId { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public bool AddSuperAdminDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("INSERT INTO SUPER_ADMIN (USERID,PASSWORD,EMAIL,DATE_CREATED,DATE_UPDATED)VALUES('{0}','{1}','{2}','{3}','{4}')",
                Userid, Password, Email, DateTime.Now, (DateTime?)null);
            int returnVal = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateSuperDetails(int configid, string Userid, string Password, string Email)
        {
            OleDbParameter[] p = new OleDbParameter[4];
            p[0] = new OleDbParameter("@Userid", OleDbType.VarWChar);
            p[0].Value = Userid;
            p[1] = new OleDbParameter("@Password", OleDbType.VarWChar);
            p[1].Value = Password;
            p[2] = new OleDbParameter("@Email", OleDbType.VarWChar);
            p[2].Value = Email;
            p[3] = new OleDbParameter("@configid", OleDbType.Integer);
            p[3].Value = configid;

            string strSql = "UPDATE SUPER_ADMIN SET USERID=?, PASSWORD=?, Email=? , DATE_UPDATED=GETDATE() where CONFIG_ID=?";
            int value = OledbHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetSuperAdminDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1 CONFIG_ID,USERID,PASSWORD,EMAIL FROM SUPER_ADMIN order by date_Created desc");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }

        public DataSet GetSuperAdminDetails(string USERNAME)
        {
            OleDbParameter[] p = new OleDbParameter[1];
            p[0] = new OleDbParameter("@Userid", OleDbType.VarWChar);
            p[0].Value = USERNAME;

            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1 CONFIG_ID,USERID,PASSWORD,EMAIL FROM SUPER_ADMIN WHERE USERID=? order by date_Created desc ");
            DataSet ds = OledbHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql,p);
            return ds;
        }
    }
}
