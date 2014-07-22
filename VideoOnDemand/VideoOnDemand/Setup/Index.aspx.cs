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
            bool intResult = true;

            clsDBSetup repository = new clsDBSetup();

            repository.IPAddress = txtIPAddress.Text;
            repository.Port = txtPort.Text;
            repository.DatabaseName = txtDatabaseName.Text;
            repository.UserID = txtUserId.Text;
            repository.Password = txtPassword.Text;
            repository.CreatedDate = DateTime.Now;
            repository.ModifiedDate = DateTime.Now;

            try
            {
                intResult = repository.AddDBDetails();

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                repository = null;
            }
            Response.Redirect("~/Setup/ActiveDirectoryInfo.aspx");
        }
    }
}