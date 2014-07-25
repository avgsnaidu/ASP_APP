using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;
using System.Data;
using System.Data.SqlClient;

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
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }

        public bool UpdateSuperDetails(int configid, string Userid, string Password, string Email)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@Userid", SqlDbType.NVarChar);
            p[0].Value = Userid;
            p[1] = new SqlParameter("@Password", SqlDbType.NVarChar);
            p[1].Value = Password;
            p[2] = new SqlParameter("@Email", SqlDbType.NVarChar);
            p[2].Value = Email;
            p[3] = new SqlParameter("@configid", SqlDbType.Int);
            p[3].Value = configid;

            string strSql = "UPDATE SUPER_ADMIN SET Email=@Email ,USERID=@Userid, PASSWORD=@Password, DATE_UPDATED=GETDATE() where CONFIG_ID=@configid";
            int value = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), CommandType.Text, strSql, p);
            if (value > 0)
                return true;
            else return false;

        }

        public DataSet GetSuperAdminDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("SELECT top 1 CONFIG_ID,USERID,PASSWORD,EMAIL FROM SUPER_ADMIN order by date_Created desc");
            DataSet ds = SqlHelper.ExecuteDataset(ClsConnectionString.getConnectionString(), CommandType.Text, strSql);
            return ds;
        }
    }
}
