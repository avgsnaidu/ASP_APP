using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.Routing;
using System.Web.Security;
using VideoOnDemand;
using VideoOnDemand.Model;

namespace VideoOnDemand
{
    public class Global : HttpApplication
    {
        public static String ApplicationPath = "";
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            AuthConfig.RegisterOpenAuth();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            ApplicationPath = Server.MapPath("~");
            WebHelper.VirtualPath = WebConfigurationManager.AppSettings["VOD.VirtualPath"] ?? "~/";
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            //if (HttpContext.Current.User != null)
            //{
            //    if (HttpContext.Current.User.Identity.IsAuthenticated)
            //    {
            //        if (HttpContext.Current.User.Identity is FormsIdentity)
            //        {
            //            FormsIdentity id =
            //                (FormsIdentity)HttpContext.Current.User.Identity;
            //            FormsAuthenticationTicket ticket = id.Ticket;

            //            // Get the stored user-data, in this case, our roles
            //            string userData = ticket.UserData;
            //            string[] roles = userData.Split(',');
            //            HttpContext.Current.User = new GenericPrincipal(id, roles);
            //        }
            //    }
            //}

            //if (HttpContext.Current != null)
            //{
            //    String[] roles = GetRolesFromSomeDataTable(HttpContext.Current.User.Identity.Name);

            //    GenericPrincipal principal = new GenericPrincipal(HttpContext.Current.User.Identity, roles);

            //    Thread.CurrentPrincipal = HttpContext.Current.User = principal;
            //}


        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            //set english as default startup language
            Session["CurrentCulture"] = "en-GB";
            //Session["CurrentCulture"] = "ar";
        }


        void Session_End(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}
