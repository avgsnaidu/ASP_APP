using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VideoOnDemand.Admin
{
    public partial class VODManagement : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Convert.ToBoolean(Session["IsAdmin"].ToString()))
                {
                  

                }
            }
            else
            {
                Response.Redirect("~/WindowsUser.aspx");
            }
            if (!IsPostBack)
            {
                lnkUserMang.CssClass = "";
                lnkVideoMang.CssClass = "";
                lnkSearch.CssClass = "";
                lnkArchiveListen.CssClass = "";
                string linkButtonID = Request.RawUrl;

                if (-1 < linkButtonID.IndexOf("Users"))
                {
                    ((HtmlGenericControl)lnkUserMang.Parent).Attributes.Add("class", "active");
                }
                if (-1 < linkButtonID.IndexOf("GroupManagement"))
                {
                    ((HtmlGenericControl)lnkGroupMang.Parent).Attributes.Add("class", "active");
                }
                else if (-1 < linkButtonID.IndexOf("VideoManagement"))
                {
                    ((HtmlGenericControl)lnkVideoMang.Parent).Attributes.Add("class", "active");
                }
                else if (-1 < linkButtonID.IndexOf("Search"))
                {
                    ((HtmlGenericControl)lnkSearch.Parent).Attributes.Add("class", "active");
                }
                else if (-1 < linkButtonID.IndexOf("Archived"))
                {
                    ((HtmlGenericControl)lnkArchiveListen.Parent).Attributes.Add("class", "active");

                }



            }

        }

        protected void Page_PreInt(object sender, EventArgs e)
        {

        }
        protected void SelectedTheCurrentItem(object sender, EventArgs e)
        {
            var selectedID = ((LinkButton)sender).ID;

            if (selectedID == lnkArchiveListen.ID)
            {
                Response.Redirect("~/Admin/Archived.aspx");
            }
            else if (selectedID == lnkSearch.ID)
            {
                Response.Redirect("~/Admin/Search.aspx");
            }
            else if (selectedID == lnkUserMang.ID)
            {
                Response.Redirect("~/Admin/Users.aspx");
            }
            else if (selectedID == lnkVideoMang.ID)
            {
                Response.Redirect("~/Admin/VideoManagement.aspx");
            }
            else if (selectedID == lnkGroupMang.ID)
            {
                Response.Redirect("~/Admin/GroupManagement.aspx");
            }
        }
    }
}