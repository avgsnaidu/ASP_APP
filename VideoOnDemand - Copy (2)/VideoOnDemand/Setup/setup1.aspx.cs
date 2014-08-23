using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
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

            System.Text.StringBuilder sb;

            if (!Page.IsValid)
            {
                return;
            }
            bool intResult = true;

            clsDBSetup repository = new clsDBSetup();

            repository.IPAddress = txtIPAddress.Text;
            repository.Port = txtPort.Text.Trim();
            repository.DatabaseName = txtDatabaseName.Text;
            repository.UserID = txtUserId.Text;
            repository.Password = txtPassword.Text;
            repository.CreatedDate = DateTime.Now;
            repository.ModifiedDate = DateTime.Now;

            //sb = new System.Text.StringBuilder();
            //sb.Append(@"<script type='text/javascript'>");
            //sb.Append("$('#pleaseWaitDialog').modal('show');");
            ////sb.Append("$('#pleaseWaitDialog').modal('show');");
            //sb.Append(@"</script>");
            //ScriptManager.RegisterStartupScript(this, GetType(), "showPopups", sb.ToString(), false);

            //sb = new System.Text.StringBuilder();
            //lblMessage.Text = "Please wait connection checking.";
            //sb.Append(@"<script type='text/javascript'>");
            //sb.Append("$('#alertMessageModal2').modal('show');");
            //sb.Append(@"</script>");
            //ClientScript.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);

            try
            {

                var connectionValid = repository.GetValidConnectionString(repository.IPAddress, repository.DatabaseName, repository.Port, repository.UserID, repository.Password);

                if (connectionValid != string.Empty)
                {
                    ConfigureNewConnectionString(connectionValid);

                    intResult = repository.AddDBDetails();
                    Response.Redirect("~/Setup/setup2.aspx");

                    //sb = new System.Text.StringBuilder();
                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#pleaseWaitDialog').modal('hide');");
                    ////sb.Append("$('#pleaseWaitDialog').modal('show');");
                    //sb.Append(@"</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "showPopups", sb.ToString(), false);


                }
                else
                {
                    //sb = new System.Text.StringBuilder();
                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#pleaseWaitDialog').modal('hide');");
                    ////sb.Append("$('#pleaseWaitDialog').modal('show');");
                    //sb.Append(@"</script>");
                    //ScriptManager.RegisterStartupScript(this, GetType(), "showPopups", sb.ToString(), false);

                    sb = new System.Text.StringBuilder();
                    lblMessage.Text = "With provided details the connection not established. Please provide valid details.";
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal2').modal('show');");
                    sb.Append(@"</script>");
                    ClientScript.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);
                }
            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                repository = null;
            }

        }

        void ConfigureNewConnectionString(string connectionString)
        {

            System.Configuration.Configuration Config1 = WebConfigurationManager.OpenWebConfiguration("~");
            ConnectionStringsSection conSetting = (ConnectionStringsSection)Config1.GetSection("connectionStrings");
            ConnectionStringSettings StringSettings = new ConnectionStringSettings("VODConnection", connectionString);
            conSetting.ConnectionStrings.Remove(StringSettings);
            conSetting.ConnectionStrings.Add(StringSettings);
            Config1.Save(ConfigurationSaveMode.Modified);
        }

    }


}
