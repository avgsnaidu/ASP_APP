using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using VideoOnDemand.Model;
using VideoOnDemand.Model.BAL;
namespace VideoOnDemand.Setup
{
    public partial class DatabaseSetup : BasePage
    {
        clsDBSetup repository = new clsDBSetup();
        protected void Page_Load(object sender, EventArgs e)
        {
            //ltlButtonClick.Text = HttpUtility.HtmlDecode(Resources.Setup.DBS_Fot_btnNext.Trim());
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

            repository.IPAddress = txtIPAddress.Text.Trim();
            repository.Port = txtPort.Text.Trim();
            repository.DatabaseName = txtDatabaseName.Text.Trim();
            repository.UserID = txtUserId.Text.Trim();
            repository.Password = txtPassword.Text.Trim();
            repository.CreatedDate = DateTime.Now;
            repository.ModifiedDate = DateTime.Now;


            try
            {

                var connectionValid = repository.GetValidConnectionString(repository.IPAddress, repository.DatabaseName, repository.Port, repository.UserID, repository.Password);

                if (string.IsNullOrEmpty(connectionValid))
                {
                    //ConfigureNewConnectionString(connectionValid);

                    if (CreateNewDatabase())
                    {

                        intResult = repository.AddDBDetails();


                        Response.Redirect("~/Setup/setup2.aspx", false);
                    }
                    else
                    {
                        sb = new System.Text.StringBuilder();
                        lblMessage.Text = Resources.Setup.DBS_Connection_Already_Exists;
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal2').modal('show');");
                        sb.Append(@"</script>");
                        ClientScript.RegisterStartupScript(GetType(), "DBNotCreated", sb.ToString(), false);

                    }

                }
                else
                {
                    if (ClsConnectionString.WriteConnectionStringToFile(txtDatabaseName.Text.Trim(), txtIPAddress.Text.Trim(), txtPort.Text.Trim(), txtUserId.Text.Trim(), txtPassword.Text.Trim()))
                    {


                        //sb = new System.Text.StringBuilder();
                        //sb.Append(@"<script type='text/javascript'>");
                        //sb.Append("$('#pleaseWaitDialog').modal('hide');");
                        ////sb.Append("$('#pleaseWaitDialog').modal('show');");
                        //sb.Append(@"</script>");
                        //ScriptManager.RegisterStartupScript(this, GetType(), "showPopups", sb.ToString(), false);

                        sb = new System.Text.StringBuilder();
                        lblMessage.Text = Resources.Setup.DBS_Database_CreationFailed;
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("$('#alertMessageModal2').modal('show');");
                        sb.Append(@"</script>");
                        ClientScript.RegisterStartupScript(GetType(), "NoDBCreated", sb.ToString(), false);


                        if (!IsAlreadyActiveDirectorySettingsExists())
                        {
                            Response.Redirect("~/Setup/setup2.aspx");
                        }
                        else
                        {
                            Response.Redirect("WindowsUser.aspx");
                        }
                    }
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

        private bool IsAlreadyActiveDirectorySettingsExists()
        {
            clsActiveDirectory repository = new clsActiveDirectory();
            var ds = repository.GetADDetails();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }

        private bool CreateNewDatabase()
        {
            try
            {
                var paramlist = AddNewDBPrameters();

                bool DbCreated = CreateDatabase(paramlist);
                if (DbCreated)
                {
                    if (CreateLoginUser(paramlist))
                    {
                        if (ClsConnectionString.WriteConnectionStringToFile(txtDatabaseName.Text.Trim(), txtIPAddress.Text.Trim(), txtPort.Text.Trim(), txtUserId.Text.Trim(), txtPassword.Text.Trim()))
                        {
                            if (ExecuteDatabaseScript())
                                return true;
                            else
                                return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to Update the Database, check your Permissions.");
            }
        }

        private DatabaseParam AddNewDBPrameters()
        {
            DatabaseParam DBParam = new DatabaseParam();
            DBParam.DatabaseName = txtDatabaseName.Text.Trim();
            DBParam.DataFileGrowth = "10%";
            DBParam.DataFileName = txtDatabaseName.Text.Trim();
            DBParam.DataFileSize = "4";
            DBParam.DataPathName = CreateScriptPath(txtDatabaseName.Text.Trim(), true);
            DBParam.LogFileGrowth = "10%";
            DBParam.LogFileName = txtDatabaseName.Text.Trim() + DateTime.Now.ToString("yyyyMMddHHmmss"); ;
            DBParam.LogFileSize = "2";
            DBParam.LogPathName = CreateScriptPath(txtDatabaseName.Text.Trim(), false);
            DBParam.ServerName = (txtPort.Text.Trim() != string.Empty) ? (txtIPAddress.Text.Trim() + "," + txtPort.Text.Trim()) : txtIPAddress.Text.Trim();
            DBParam.UserName = txtUserId.Text.Trim();
            DBParam.Password = txtPassword.Text.Trim();
            return DBParam;

        }

        private string CreateScriptPath(string fileName, bool isMDF)
        {
            string path = @"C:\VODScript";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (isMDF)
                return Path.Combine(path, fileName + Guid.NewGuid().ToString() + ".mdf");
            else
                return Path.Combine(path, fileName + ".ldf");
        }

        private bool ExecuteDatabaseScript()
        {

            try
            {
                using (SqlConnection dbCon = new SqlConnection(ClsConnectionString.getConnectionString()))
                {

                    FileInfo file = new FileInfo(Server.MapPath("~/Setup/VODScript.sql"));
                    StreamReader fileRead = file.OpenText();
                    string script = fileRead.ReadToEnd();
                    fileRead.Close();
                    dbCon.Open();
                    ExecuteScript(dbCon, script);
                    dbCon.Close();
                    return true;
                }
            }
            catch (SqlException sqlEx)
            {
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = sqlEx.Message;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal2').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);

                return false;

            }
            catch (Exception ex)
            {
                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = ex.InnerException.Message;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal2').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "NoGroups", sb.ToString(), false);

                return false;
            }
            finally
            {

            }
        }

        protected virtual void ExecuteScript(SqlConnection connection, string script)
        {
            SqlTransaction trans = null;
            try
            {
                string[] commandTextArray = System.Text.RegularExpressions.Regex.Split(script, "\r\n[\t ]*GO");
                //connection.Open();
                trans = connection.BeginTransaction();
                SqlCommand _cmd = new SqlCommand(String.Empty, connection, trans);

                foreach (string commandText in commandTextArray)
                {
                    if (commandText.Trim() == string.Empty) continue;
                    if ((commandText.Length >= 3) && (commandText.Substring(0, 3).ToUpper() == "USE"))
                    {
                        throw new Exception("Create-script contains USE-statement. Please provide non-database specific create-scripts!");
                    }

                    _cmd.CommandText = commandText;
                    _cmd.ExecuteNonQuery();

                }
                trans.Commit();
            }
            catch (Exception ex)
            {
                trans.Rollback();
                throw ex;

            }

        }

        private bool CreateDatabase(DatabaseParam DBParam)
        {
            System.Data.SqlClient.SqlConnection tmpConn;

            string sqlCreateDBQuery;
            tmpConn = new SqlConnection();
            bool result = false;
            string strDefaultConnectionString = string.Format(ClsConnectionString.DefaultDBConnection(), DBParam.ServerName);
            tmpConn.ConnectionString = strDefaultConnectionString;
            sqlCreateDBQuery = "IF (NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = '" + DBParam.DatabaseName + "' OR name =  '" + DBParam.DatabaseName + "'))) "
                             + "CREATE DATABASE  " + DBParam.DatabaseName;
            //     + "   ALTER DATABASE " + DBParam.DatabaseName + "  MODIFY FILE "
            //+ " (NAME = N'" + DBParam.DataFileName + "', "
            // + " SIZE = 4MB,"
            //   + "	FILEGROWTH =" + DBParam.DataFileGrowth + ") ";






            //+ " CREATE DATABASE " + DBParam.DatabaseName + " ON PRIMARY "
            //                + " (NAME = " + DBParam.DataFileName + ", "
            //                + " FILENAME = '" + DBParam.DataPathName + "', "
            //                + " SIZE = 4MB,"
            //                + "	FILEGROWTH =" + DBParam.DataFileGrowth + ") "
            //                + " LOG ON (NAME =" + DBParam.LogFileName + ", "
            //                + " FILENAME = '" + DBParam.LogPathName + "', "
            //                + " SIZE = 2MB, "
            //                + "	FILEGROWTH =" + DBParam.LogFileGrowth + ") ; ";

            try
            {
                tmpConn.Open();

                SqlCommand myCommand = new SqlCommand(sqlCreateDBQuery, tmpConn);
                myCommand.ExecuteNonQuery();

                return true;

            }
            catch (SqlException sqle)
            {
                if (sqle.Number == 1801)
                {
                    StringBuilder sb = new System.Text.StringBuilder();
                    lblMessage.Text = Resources.Setup.DBS_MSG_DBExists;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal2').modal('show');");
                    sb.Append(@"</script>");
                    ClientScript.RegisterStartupScript(GetType(), "AlreadyDBExists", sb.ToString(), false);


                }
                else if (sqle.Number == 15025)
                {
                    StringBuilder sb = new System.Text.StringBuilder();
                    lblMessage.Text = Resources.Setup.DBS_MSG_LoginAlreadyExists;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal2').modal('show');");
                    sb.Append(@"</script>");
                    ClientScript.RegisterStartupScript(GetType(), "AlreadyLoginExists", sb.ToString(), false);

                }
                return false;
            }
            catch (System.Exception ex)
            {

                StringBuilder sb = new System.Text.StringBuilder();
                lblMessage.Text = ex.Message;
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal2').modal('show');");
                sb.Append(@"</script>");
                ClientScript.RegisterStartupScript(GetType(), "error", sb.ToString(), false);
                return false;
            }
            finally
            {
                tmpConn.Close();
            }

        }

        private bool CreateLoginUser(DatabaseParam DBParam)
        {
            System.Data.SqlClient.SqlConnection tmpConn;

            tmpConn = new SqlConnection();

            //tmpConn.ConnectionString = "SERVER = " + DBParam.ServerName + "; DATABASE = master;Integrated Security=true;";
            string strDefaultConnectionString = string.Format(ClsConnectionString.DefaultDBConnection(), DBParam.ServerName);
            tmpConn.ConnectionString = strDefaultConnectionString;
            string loginQuery = "CREATE LOGIN [" + DBParam.UserName + "] WITH PASSWORD=N'" + DBParam.Password + "' ," +
                                " CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF, " +
                                  "DEFAULT_DATABASE=[" + DBParam.DatabaseName + "], DEFAULT_LANGUAGE=[English];   " +

                                   " EXEC sp_addsrvrolemember @loginame = N'" + DBParam.UserName + "', @rolename = N'sysadmin' ";

            //string nextQuery = " USE " + DBParam.DatabaseName
            // + " CREATE LOGIN " + DBParam.UserName + " WITH PASSWORD = '" + DBParam.Password + "'";

            try
            {
                tmpConn.Open();
                SqlCommand myCommand = new SqlCommand(loginQuery, tmpConn);
                myCommand.ExecuteNonQuery();
                return true;

            }
            catch (SqlException sqle)
            {
                if (sqle.Number == 1801)
                {
                    Response.Write("Database already exists");
                }
                else if (sqle.Number == 15025)
                {
                    Response.Write("Login already exists");
                }
                return false;
            }
            catch (System.Exception ex)
            {
                return false;
            }
            finally
            {
                tmpConn.Close();
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
    struct DatabaseParam
    {
        public string ServerName;
        public string DatabaseName;
        //Data file parameters
        public string DataFileName;
        public string DataPathName;
        public string DataFileSize;
        public string DataFileGrowth;
        //Log file parameters
        public string LogFileName;
        public string LogPathName;
        public string LogFileSize;
        public string LogFileGrowth;
        public string UserName;
        public string Password;
    }

}
