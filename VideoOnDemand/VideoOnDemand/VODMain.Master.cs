using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VideoOnDemand
{

    public partial class VODMain : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {

                if (!IsPostBack)
                {

                    string linkButtonID = Request.RawUrl;

                    if (-1 < linkButtonID.IndexOf("Users") || -1 < linkButtonID.IndexOf("GroupManagement") || -1 < linkButtonID.IndexOf("VideoManagement")
                        || -1 < linkButtonID.IndexOf("Search") || -1 < linkButtonID.IndexOf("Archived") || -1 < linkButtonID.IndexOf("Configuration"))
                    {
                        lnkDDMUserName.Visible = true;
                    }
                    else
                        lnkDDMUserName.Visible = false;

                }
                BindUserName();
                
            }
            else
            {
                Response.Redirect("~/Error.aspx");
            }
        }

        private void BindUserName()
        {
            lnkDDMUserName.Text = "Welcome , " + Session["LoginUserName"];
        }


        protected void btnConfiguration_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Admin/Configuration.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/Admin/Login.aspx");
        }


    }
}