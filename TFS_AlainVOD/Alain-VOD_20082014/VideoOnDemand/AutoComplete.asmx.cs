using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Services;
using VideoOnDemand.Model;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand
{
    /// <summary>
    /// Summary description for AutoComplete
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.Web.Script.Services.ScriptService]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

    public class AutoComplete : System.Web.Services.WebService
    {

        [WebMethod]
        public string[] GetCompletionList(string prefixText, int count, string contextKey)
        {
            clsSearch repository = new clsSearch();

            //string contextKey=string.Empty;
            string searchKey = prefixText.Trim();
            int searchOn = Convert.ToInt32(contextKey);

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            try
            {
                if (Session["LoginUserName"] != null && Session["IsUser"] != null && Convert.ToBoolean(Session["IsUser"].ToString()))
                {
                    ds = repository.fnSearchBasedOnUser(searchKey, Session["LoginUserName"].ToString(), searchOn, BasePage.CurrentLanguage == 'E' ? false : true);

                }
                else if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                {
                    ds = repository.fnSearch(searchKey, searchOn, BasePage.CurrentLanguage == 'E' ? false : true);
                }

            }
            catch
            {
            }
            finally
            {
                //cn.Close();
            }
            dt = ds.Tables[0];

            //Then return List of string(txtItems) as result
            List<string> txtItems = new List<string>();
            String dbValues;

            foreach (DataRow row in dt.Rows)
            {
                //String From DataBase(dbValues)
                dbValues = row["VideoName"].ToString();
                dbValues = dbValues.ToLower();
                txtItems.Add(dbValues);

            }

            return txtItems.ToArray();

        }


        [WebMethod]
        public string[] GetSearchWord(string prefixText, int count)
        {
            var items = new string[2];
            return items;
        }

    }
}
