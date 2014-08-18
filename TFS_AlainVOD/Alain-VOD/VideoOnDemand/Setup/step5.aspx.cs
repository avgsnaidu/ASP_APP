using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.Setup
{
    public partial class SuperAdminInfo : System.Web.UI.Page
    {
        clsSuperAdmin repository = new clsSuperAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    string StyleSheetPath = string.Empty;
            //    if (Session["CurrentCulture"].ToString() == "ar")
            //        StyleSheetPath = "Content/css/style_arabic.css";
            //    else
            //        StyleSheetPath = "";

            //    string styleFormat = "<LINK href='{0}' type='text/css' rel='stylesheet'>";

            //    string linkText;
            //    linkText = String.Format(styleFormat, StyleSheetPath);
            //    StyleSheet.Text = linkText;


            //}
        }



        protected void GoToVODDashBoard_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            bool intResult = true;

            clsSuperAdmin repository = new clsSuperAdmin();

            repository.Userid = txtUserName.Text;
            repository.Password = txtPassword.Text;
            repository.Email = txtMail.Text;
            repository.CreatedDate = DateTime.Now;
            repository.ModifiedDate = DateTime.Now;

            try
            {
                intResult = repository.AddSuperAdminDetails();

            }
            catch (Exception ee)
            {
                ee.Message.ToString();
            }
            finally
            {
                repository = null;
            }
            Response.Redirect("~/Admin/Users.aspx");
        }
    }
}