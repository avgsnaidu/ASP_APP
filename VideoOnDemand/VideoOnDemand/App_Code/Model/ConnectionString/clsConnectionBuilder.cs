using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace VideoOnDemand.Model
{
    public class clsConnectionStringBuilder
    {
        public string ServerName { get; set; }
        public string Port { get; set; }
        public string DatabaseName { get; set; }
        public string UserID { get; set; }
        public string Password { get; set; }
        public string Provider { get; set; }
        private string ServerNameWithPort
        {
            get { return ServerName + ((Port.Trim() != string.Empty) ? (',' + Port) : " "); }
        }


        public string GetConnectionString()
        {
            string strConn = string.Format("Initial Catalog={0};Data Source={1};User ID={2};password={3};", DatabaseName.Trim(), ServerNameWithPort.Trim(), UserID.Trim(), Password.Trim());
            return strConn;
        }
    }
}