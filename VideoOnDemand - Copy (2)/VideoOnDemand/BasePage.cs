using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace VideoOnDemand
{
    public class BasePage : Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

            if (Request.IsAuthenticated)
            {
                if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                    MasterPageFile = "~/VODManagement.master";
                else
                    MasterPageFile = "~/VODUserManagement.master";
            }
            else
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected override void InitializeCulture()
        {
            if (Session["CurrentLanguage"] != null)
            {
                UICulture = Session["CurrentLanguage"].ToString();
                Culture = Session["CurrentLanguage"].ToString();
            }
            else
                Session["CurrentLanguage"] = "Auto";


            if (Session["CurrentLanguage"].ToString() != "Auto")
            {
                System.Globalization.CultureInfo ci = new System.Globalization.CultureInfo(Session["CurrentLanguage"].ToString());
                System.Threading.Thread.CurrentThread.CurrentCulture = ci;
                System.Threading.Thread.CurrentThread.CurrentUICulture = ci;
            }


            base.InitializeCulture();
        }

    }
}