using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Setup
{
    public partial class ActiveDirectoryInfo : System.Web.UI.Page
    {

        clsActiveDirectory repository = new clsActiveDirectory();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoToVODConfigurationPage_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            bool intResult = true;

            clsActiveDirectory repository = new clsActiveDirectory();

            repository.IP = txtADServerId.Text;
            repository.Userid = txtADUserName.Text;
            repository.Password = txtADPassword.Text;
            repository.CreatedDate = DateTime.Now;
            repository.ModifiedDate = DateTime.Now;

            try
            {
                intResult = repository.AddADDetails();

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                repository = null;
            }
            Response.Redirect("~/Setup/VODConfiguration.aspx");
        }
    }
}