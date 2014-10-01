using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    txtUserName.Text = Request.Cookies["UserName"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
                    chkRemember.Checked = true;
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            Page.Validate("login");
            if (!Page.IsValid)
            {
                return;
            }
            try
            {

                FormsAuthentication.Initialize();

                if (chkRemember.Checked)
                {
                    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                }

                Response.Cookies["UserName"].Value = txtUserName.Text.Trim();
                Response.Cookies["Password"].Value = txtPassword.Text.Trim();

                string userName = txtUserName.Text.Trim();
                string pwd = txtPassword.Text.Trim();
                DataSet ds = null;
                bool IsSucess = repository.IsValidSuperAdmin(userName, ref ds);

                if (IsSucess && EncryptHelper.VerifyHash(txtPassword.Text.Trim(), "SHA512", ds.Tables[0].Rows[0]["PASSWORD"].ToString()))
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
                        Response.Redirect(@"~/Admin/Login.aspx");
                }
                else
                {
                    ResetFields();
                    lblError.Visible = true;
                }
            }
            catch (Exception ex)
            {
                VODActionLog.LogException(VODActionLog.LogMessageType.Exception, ex.StackTrace, ex.Message, HttpContext.Current.User.Identity.Name, Request.RawUrl);

            }

        }

        private void ResetFields()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtModalUserName.Text = "";
        }


        //RedirectLogin(userInfo.UserName)
        public void RedirectLogin(string username)
        {

            VODLoginRedirectByRoleSection roleRedirectSection = (VODLoginRedirectByRoleSection)ConfigurationManager.GetSection("loginRedirectByRole");
            foreach (RoleRedirect roleRedirect in roleRedirectSection.RoleRedirects)
            {
                if (roleRedirect.Role.ToLower() == "administrator")
                {
                    try
                    {
                        Response.Redirect(WebHelper.RelativeWebRoot + roleRedirect.Url, false);
                    }
                    catch (Exception ex)
                    {

                    }
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

        protected void lnkForgotPwd_Click(object sender, EventArgs e)
        {

        }



        private bool SendMail(string mailingServer, int port, string fromAddress, string toAddress, string userId, string password, bool isSslEnabled, string SenderName, string adminUserName, string oneTimePassword)
        {
            try
            {

                var MailfromAddress = new MailAddress(fromAddress, SenderName);
                var MailUserIdAddress = new MailAddress(userId, SenderName);
                var MailtoAddress = new MailAddress(toAddress, toAddress.Substring(0, toAddress.IndexOf('@')));
                string fromPassword = password;
                string subject = "Password For VOD";
                string body = "<html><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' style='text-align:left'>" +
               "<tbody><tr>   <td width='600' height='83' valign='bottom'  bgcolor='#065688'><table width='592' border='0' align='left' cellpadding='0' " +
               " cellspacing='0'> <tbody><tr>  <td width='375' height='61' valign='top' style='font-family:Verdana,Arial;font-size:21px;color:#ffffff'>&nbsp; " +
                " &nbsp; Password</td></tr> </tbody></table></td> </tr> <tr> <td height='20'></td> </tr> <tr>  <td style='font-family:Verdana,Arial;font-size:11px;padding:0px 0px 0px " +
                "10px;color:#727171;line-height:19px'><strong>Dear User,</strong><br>  Your One Time Password to reset your <span class='il'>Password</span>   for  your User Name <strong> " + adminUserName + " </strong>is <strong>  " + oneTimePassword +
                " </strong><br>  </td> </tr> <tr>   <td></td>  </tr> <tr><td height='25'></td> </tr> <tr> <td height='25'></td> </tr> <tr> <td style='font- " +
                " family:Verdana,Arial;font-size:11px;color:#444444;line-height:16px;text-align:left'>Regards, <br>  <strong><span style='color:#189bd6'>VOD  " +
                " Admin</span></strong> Team</td>  </tr> </tbody></table></html>";

                var smtp = new SmtpClient
                {
                    Host = mailingServer,
                    Port = port,
                    EnableSsl = isSslEnabled,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(MailUserIdAddress.Address, fromPassword)

                };

                using (var message = new MailMessage(MailfromAddress.Address, MailtoAddress.Address)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                })
                {
                    smtp.Send(message);
                    return true;
                }
            }
            catch (Exception ex)
            {
                VODActionLog.LogException(VODActionLog.LogMessageType.Exception, ex.StackTrace, ex.Message, HttpContext.Current.User.Identity.Name, Request.RawUrl);
                return false;
            }

        }

        private bool UpdateResetPasswordKey(string userName, string oneTimePasswordKey, DateTime timeElapased)
        {
            clsSuperAdmin repositorySuperAd = new clsSuperAdmin();
            var result = repositorySuperAd.UpdateSuperAdminPasswordResetDetails(userName, oneTimePasswordKey, timeElapased);
            return result;
        }


        protected void btnForgotClick_Click(object sender, EventArgs e)
        {
            try
            {
                clsSuperAdmin repositorySuperAd = new clsSuperAdmin();
                if (string.IsNullOrEmpty(txtModalUserName.Text.Trim()))
                    return;

                DataSet superAdminDs = repositorySuperAd.GetSuperAdminDetails(txtModalUserName.Text.Trim());
                string adminAddress = string.Empty;
                string adminUserName = string.Empty;
                string adminPassword = string.Empty;
                string mailingServer = string.Empty;
                int port = default(int);
                string fromAddress = string.Empty;
                string UserEmailId = string.Empty;
                string password = string.Empty;
                bool isSSLEnabled = default(bool);
                string SenderName = string.Empty;
                string sucessMessage = string.Empty;
                bool emailSentSuccess = default(bool);

                if (superAdminDs != null && superAdminDs.Tables[0].Rows.Count > 0)
                {
                    adminAddress = superAdminDs.Tables[0].Rows[0]["EMAIL"].ToString();
                    adminUserName = superAdminDs.Tables[0].Rows[0]["USERID"].ToString();
                    adminPassword = superAdminDs.Tables[0].Rows[0]["PASSWORD"].ToString();

                    clsConfiguration repositoryConfig = new clsConfiguration();
                    DataSet adsSDS = repositoryConfig.GetEmailServerDetails();

                    string oneTimePassword = Guid.NewGuid().ToString();
                    DateTime oneTimeElapsedAt = DateTime.Now.AddHours(12);

                    if (adsSDS != null && adsSDS.Tables[0].Rows.Count > 0)
                    {
                        fromAddress = adsSDS.Tables[0].Rows[0]["REPLY_TO_EMAIL"].ToString();
                        mailingServer = adsSDS.Tables[0].Rows[0]["SERVERNAME"].ToString();
                        port = Convert.ToInt32(adsSDS.Tables[0].Rows[0]["PORT"].ToString());
                        UserEmailId = adsSDS.Tables[0].Rows[0]["USERNAME"].ToString();
                        password = Crypto.Decrypt(adsSDS.Tables[0].Rows[0]["PASSWORD"].ToString());
                        if (!string.IsNullOrEmpty(adsSDS.Tables[0].Rows[0]["SSL_Enabled"].ToString()))
                            isSSLEnabled = Convert.ToBoolean(adsSDS.Tables[0].Rows[0]["SSL_Enabled"].ToString());
                        SenderName = adsSDS.Tables[0].Rows[0]["SENDER_NAME"].ToString();
                        bool resultMail = SendMail(mailingServer, port, fromAddress, adminAddress, UserEmailId, password, isSSLEnabled, SenderName, adminUserName, oneTimePassword);
                        if (resultMail)
                        {
                            sucessMessage = Resources.MasterData.Login_Msg_Email_Sent;
                            var updateSucess = UpdateResetPasswordKey(adminUserName, oneTimePassword, oneTimeElapsedAt);
                            if (updateSucess)
                                emailSentSuccess = true;
                        }
                        else
                            sucessMessage = Resources.MasterData.Login_Msg_SendMail_failed;
                    }
                    else
                        sucessMessage = Resources.MasterData.Login_Msg_SMTP_Connection_Failed;
                }
                else
                    sucessMessage = Resources.MasterData.Login_Msg_Enter_UserName_NotExists;

                string singleqoute = "'";
                sucessMessage = sucessMessage.Replace(singleqoute, " ");

                //string message = string.Format("$('#myModalForgotPwd').modal('hide'); window.open('emailSent.aspx?message={0}','_target')", sucessMessage);
                if (emailSentSuccess)
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();

                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#myModalForgotPwd').modal('hide');");
                    sb.Append(@"</script>");
                    lblMessage.Text = sucessMessage;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", sb.ToString(), false);
                    string redirecUrl = "~/Admin/ResetPassword.aspx?userName=" + txtModalUserName.Text.Trim();
                    Response.Redirect(redirecUrl);
                }
                else
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();

                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#myModalForgotPwd').modal('hide');");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append(@"</script>");
                    lblMessage.Text = sucessMessage;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", sb.ToString(), false);
                }

            }
            
            catch (Exception ex)
            {
                VODActionLog.LogException(VODActionLog.LogMessageType.Exception, ex.StackTrace, ex.Message, HttpContext.Current.User.Identity.Name, Request.RawUrl);
            }
            finally
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "HideLoaderDiv", "HideLoaderDiv()", true);
            }

        }


    }
}