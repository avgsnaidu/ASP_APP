using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.VODManage
{
    public partial class UserManagement : System.Web.UI.Page
    {
        clsUserManagement repository = new clsUserManagement();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserDetails();
            }
        }

        private void LoadUserDetails()
        {
            DataSet ds = repository.GetUsersList();
            gvUserManagement.DataSource = ds;
            gvUserManagement.DataBind();
        }

        protected void lnkUserMang_Click(object sender, EventArgs e)
        {

            Response.Redirect(@"~/VODManage/UserManagement.aspx");

        }

        protected void lnkVideoMang_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~/VODManage/VideoManagement.aspx");
        }
    }
}