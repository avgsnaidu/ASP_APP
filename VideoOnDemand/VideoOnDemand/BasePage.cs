using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;

namespace VideoOnDemand
{
    public class BasePage : Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

            //if (!Request.IsAuthenticated)
            //{
            //    Response.Redirect("Error.aspx");
            //}
        }


        private const string m_DefaultCulture = "en-GB";

        protected override void InitializeCulture()
        {
            //retrieve culture information from session
            string culture = Convert.ToString(Session["CurrentCulture"]);

            //check whether a culture is stored in the session
            if (!string.IsNullOrEmpty(culture)) Culture = culture;
            else Culture = m_DefaultCulture;

            //set culture to current thread
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(culture);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);

            //call base class
            base.InitializeCulture();
        }

 

    }
}