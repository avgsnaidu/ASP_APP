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
        }
    }
}