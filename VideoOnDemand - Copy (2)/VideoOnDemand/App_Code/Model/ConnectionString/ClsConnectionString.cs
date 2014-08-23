using System;
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

            if (ConfigurationManager.ConnectionStrings["VODConnection"].ConnectionString == string.Empty)
                throw new ConfigurationErrorsException("ConnectionString is empty or not valid");
            return ConfigurationManager.ConnectionStrings["VODConnection"].ConnectionString;
        }


    }



}