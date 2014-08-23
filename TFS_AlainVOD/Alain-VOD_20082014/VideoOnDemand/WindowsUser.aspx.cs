using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand
{
    public partial class WindowsUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ValidateActiveDirectoryCredetials())
                {
                    if (Request.IsAuthenticated)
                    {
                        if (Response.IsClientConnected)
                        {

                            if (Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
                                Response.Redirect(@"~/Admin/Users.aspx", true);
                            else
                                Response.Redirect(@"~/Users/Videos.aspx", true);
                        }
                        else
                        {
                            // If the browser is not connected
                            // stop all response processing.
                            Response.End();
                        }

                    }
                }
                else
                    Response.Redirect(@"~/Error.aspx", false);

            }
        }

        private bool ValidateActiveDirectoryCredetials()
        {
            //PrincipalContext ctx = new PrincipalContext(ContextType.Domain);

            //UserPrincipal qbeUser = new UserPrincipal(ctx);           
            //UserPrincipal qbeUser = UserPrincipal.FindByIdentity(ctx, IdentityType.SamAccountName, HttpContext.Current.User.Identity.Name);

            //// find current user
            //System.DirectoryServices.AccountManagement.UserPrincipal user = System.DirectoryServices.AccountManagement.UserPrincipal.Current;
            ////UserPrincipal user = HttpContext.Current.User;
            //string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            string DomainName = Environment.UserDomainName;
            ////string usersss = HttpContext.Current.User;
            ////string UName = Environment.UserName;

            //string loginName = GetLogin(HttpContext.Current.User.Identity);
            string loginName = GetLogin(User.Identity);
            //string loginName = GetLoginSplit(System.Security.Principal.WindowsIdentity.GetCurrent().Name);



            if (!string.IsNullOrEmpty(loginName))
            {
                //string loginName = qbeUser.SamAccountName; // or whatever you mean by "login name"


                if (loginName != null && loginName != string.Empty)
                {
                    DataSet ds = AuthenticateWidowsUserWithDB(loginName, DomainName);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        //SELECT USER_ID AS USERID,NAME AS LOGINNAME,DOMAIN,FULL_NAME AS FULLNAME,GROUP_ID AS LOGINGroupID

                        Session["LoginUserName"] = ds.Tables[0].Rows[0]["LOGINNAME"].ToString();
                        Session["UserFullName"] = ds.Tables[0].Rows[0]["FULLNAME"].ToString();
                        Session["LOGINGroupId"] = ds.Tables[0].Rows[0]["LOGINGroupID"].ToString();
                        Session["IsAdmin"] = false;
                        Session["IsUser"] = true;

                        //FormsAuthentication.RedirectFromLoginPage(Session["LoginUserName"].ToString(), true);



                        return true;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;

            //ctx.Dispose();
            //if (qbeUser != null)
            //    qbeUser.Dispose();
        }

        private string GetLoginSplit(string s)
        {
            int stop = s.IndexOf("\\");
            return (stop > -1) ? s.Substring(stop + 1, s.Length - stop - 1) : string.Empty;
        }
        private DataSet AuthenticateWidowsUserWithDB(string loginName, string domain)
        {
            clsUserManagement repository = new clsUserManagement();
            DataSet userData = null;
            repository.IsAuthenticateLoginUser(loginName, domain, ref userData);
            return userData;
        }

        public string GetLogin(IIdentity identity)
        {
            string s = identity.Name;
            int stop = s.IndexOf("\\");
            return (stop > -1) ? s.Substring(stop + 1, s.Length - stop - 1) : string.Empty;
        }


    }
}