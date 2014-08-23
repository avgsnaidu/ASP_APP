using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;



namespace VideoOnDemand.Account
{
    public partial class Login : System.Web.UI.Page
    {
        clsLogin repository = new clsLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;

            txtUserName.Attributes.Add("onFocus", "hideLabel()");
            txtPassword.Attributes.Add("onFocus", "hideLabel()");


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }

            string userName = txtUserName.Text.Trim();
            string pwd = txtPassword.Text.Trim();
            DataSet ds = null;
            bool IsSucess = repository.IsValidSuperAdmin(userName, pwd, ref ds);
            if (IsSucess)
            {
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    //SELECT USER_ID AS USERID,NAME AS LOGINNAME,DOMAIN,FULL_NAME AS FULLNAME,GROUP_ID AS LOGINGroupID

                    Session["LoginUserName"] = ds.Tables[0].Rows[0]["USERNAME"].ToString();
                    Session["IsAdmin"] = true;
                    Session["IsUser"] = false;
                    //FormsAuthenticationUtil.RedirectFromLoginPage(Session["LoginUserName"].ToString(), "Admin", chkRemember.Checked);
                    FormsAuthentication.RedirectFromLoginPage(Session["LoginUserName"].ToString(), chkRemember.Checked);

                    Response.Redirect(@"~/Users.aspx");
                }
                else
                    Response.Redirect(@"~/Error.aspx");
            }
            else
                lblError.Visible = true;




        }


    }
}