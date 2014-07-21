using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VideoOnDemand.Model;

namespace VideoOnDemand.Model.BAL
{
    public class clsSuperAdmin
    {
        public string Userid { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }

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
        public bool GetSuperAdminDetails()
        {
            string strSql = string.Empty;
            strSql = string.Format("Select * from SUPER_ADMIN");
            int returnVal = SqlHelper.ExecuteNonQuery(ClsConnectionString.getConnectionString(), System.Data.CommandType.Text, strSql);
            if (returnVal > 0)
                return true;
            else
                return false;

        }
    }
}