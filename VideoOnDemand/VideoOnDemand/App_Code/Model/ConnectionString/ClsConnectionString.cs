using System.Configuration;

namespace VideoOnDemand.Model
{
    public class ClsConnectionString
    {
        public ClsConnectionString()
        {

        }
        public static string getConnectionString()
        {
            return ConfigurationManager.AppSettings["connstr"];
        }


    }
}