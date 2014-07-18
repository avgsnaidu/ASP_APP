using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;
namespace VideoOnDemand.Setup
{
    public partial class DatabaseSetup : System.Web.UI.Page
    {
        clsDBSetup repository = new clsDBSetup();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_ServerClick(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            else
            {
                repository.IPAddress = txtIPAddress.Text.Trim();
                repository.DatabaseName = txtDatabaseName.Text.Trim();
                repository.UserID = txtUserId.Text.Trim();
                repository.Password = txtPassword.Text.Trim();
                repository.Port = txtPort.Text.Trim();
                bool IsSuccess = repository.AddDBDetails();
                if (IsSuccess)
                    Response.Redirect("~/Setup/ActiveDirectoryInfo.aspx");
            }
        }
    }
}