using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace VideoOnDemand.Admin
{
    /// <summary>
    /// Summary description for AutoCompleteSearch
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class AutoCompleteSearch : System.Web.Services.WebService
    {
        [WebMethod]
        public string[] GetSearchWord(string prefixText, int count)
        {
            var items = new string[2];
            return items;
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }



    }
}
