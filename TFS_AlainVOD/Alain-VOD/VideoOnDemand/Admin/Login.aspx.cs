using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model;
using VideoOnDemand.Model.BAL;



namespace VideoOnDemand.Account
{
    public partial class Login : BasePage
    {
        clsLogin repository = new clsLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;

            txtUserName.Attributes.Add("onFocus", "hideLabel()");
            txtPassword.Attributes.Add("onFocus", "hideLabel()");
            if (!IsPostBack)
            {
                if (!CheckConnectionStringExists())
                {
                    Response.Redirect("~/setup/setup1.aspx");
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            try
            {

                FormsAuthentication.Initialize();

                string userName = txtUserName.Text.Trim();
                string pwd = txtPassword.Text.Trim();
                DataSet ds = null;
                bool IsSucess = repository.IsValidSuperAdmin(userName, pwd, ref ds);
                if (IsSucess)
                {
                    HttpContext context = HttpContext.Current;
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        //SELECT USER_ID AS USERID,NAME AS LOGINNAME,DOMAIN,FULL_NAME AS FULLNAME,GROUP_ID AS LOGINGroupID

                        Session["LoginUserName"] = ds.Tables[0].Rows[0]["USERNAME"].ToString();
                        Session["IsAdmin"] = true;
                        Session["IsUser"] = false;
                        //FormsAuthenticationUtil.RedirectFromLoginPage(Session["LoginUserName"].ToString(), "Admin", chkRemember.Checked);
                        //FormsAuthentication.RedirectFromLoginPage(Session["LoginUserName"].ToString(), chkRemember.Checked); 


                        // Create a new ticket used for authentication
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                           1, // Ticket version
                          ds.Tables[0].Rows[0]["USERNAME"].ToString(), // Username associated with ticket
                           DateTime.Now, // Date/time issued
                           DateTime.Now.AddMinutes(30), // Date/time to expire
                           true, // "true" for a persistent user cookie
                           "administrator", // User-data, in this case the roles
                           FormsAuthentication.FormsCookiePath);// Path cookie valid for

                        // Encrypt the cookie using the machine key for secure transport
                        string hash = FormsAuthentication.Encrypt(ticket);
                        HttpCookie cookie = new HttpCookie(
                           FormsAuthentication.FormsCookieName, // Name of auth cookie
                           hash); // Hashed ticket

                        // Set the cookie's expiration time to the tickets expiration time
                        if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

                        // Add the cookie to the list for outgoing response
                        Response.Cookies.Add(cookie);

                        // Redirect to requested URL, or homepage if no previous page
                        // requested
                        //string returnUrl = Request.QueryString["ReturnUrl"];
                        //if (returnUrl == null) returnUrl = "/";


                        // Don't call FormsAuthentication.RedirectFromLoginPage since it
                        // could
                        // replace the authentication ticket (cookie) we just added
                        //Response.Redirect(returnUrl);

                        //Response.Redirect(@"~/Admin/Users.aspx");

                        string returnUrl = context.Request.QueryString["returnUrl"];

                        // ignore Return URLs not beginning with a forward slash, such as remote sites.
                        if (string.IsNullOrWhiteSpace(returnUrl) || !returnUrl.StartsWith("/"))
                            returnUrl = null;

                        if (!string.IsNullOrWhiteSpace(returnUrl))
                        {
                            context.Response.Redirect(returnUrl);
                        }
                        else
                        {
                            RedirectLogin(userName);
                        }
                        RedirectLogin(userName);


                    }
                    else
                        Response.Redirect(@"~/WindowsUser.aspx");
                }
                else
                    lblError.Visible = true;

            }
            catch (Exception ex)
            { 
            
            }




        }


        //RedirectLogin(userInfo.UserName)
        public void RedirectLogin(string username)
        {
            VODLoginRedirectByRoleSection roleRedirectSection = (VODLoginRedirectByRoleSection)ConfigurationManager.GetSection("loginRedirectByRole");
            foreach (RoleRedirect roleRedirect in roleRedirectSection.RoleRedirects)
            {
                if (roleRedirect.Role.ToLower() == "administrator")
                {
                    Response.Redirect(WebHelper.RelativeWebRoot + roleRedirect.Url);
                }



            }
        }

        private bool CheckConnectionStringExists()
        {
            string connString = ClsConnectionString.getConnectionString();
            clsDBSetup obj = new clsDBSetup();
            if (connString != null && connString != string.Empty)
            {
                if (obj.GetValidConnectionString(connString) != string.Empty)
                    return true;
                else
                    return false;
            }
            else
                return false;

            
        }


    }
}