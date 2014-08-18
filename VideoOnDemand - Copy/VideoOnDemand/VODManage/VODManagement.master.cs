using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VideoOnDemand.VODManage
{
    public partial class VODManagement : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lnkUserMang.CssClass = "";
                lnkVideoMang.CssClass = "";
                lnkSearch.CssClass = "";
                lnkArchiveListen.CssClass = "";
                string linkButtonID = Request.RawUrl;

                if (-1 < linkButtonID.IndexOf("UserManagement"))
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
                else if (-1 < linkButtonID.IndexOf("ArchiveListing"))
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
            //foreach (Control ctrl in ulManageTop.Controls)
            //{
            //    if (ctrl is LinkButton)
            //    {

            //        if (selectedID == ((LinkButton)ctrl).ID)
            //        {
            //            ((LinkButton)ctrl).CssClass = "active";
            //        }
            //        else
            //        {
            //            ((LinkButton)ctrl).CssClass = "";

            //        }

            //        //string url = ((LinkButton)ctrl).Href;
            //        //if (url == GetCurrentPage())  // <-- you'd need to write that
            //        //    ctrl.Parent.Attributes.Add("class", "active");
            //    }

            //}

            if (selectedID == lnkArchiveListen.ID)
            {
                Response.Redirect("~/VODManage/ArchiveListing.aspx");
            }
            else if (selectedID == lnkSearch.ID)
            {
                Response.Redirect("~/VODManage/Search.aspx");
            }
            else if (selectedID == lnkUserMang.ID)
            {
                Response.Redirect("~/VODManage/UserManagement.aspx");
            }
            else if (selectedID == lnkVideoMang.ID)
            {
                Response.Redirect("~/VODManage/VideoManagement.aspx");
            }
            else if (selectedID == lnkGroupMang.ID)
            {
                Response.Redirect("~/VODManage/GroupManagement.aspx");
            }
        }
    }
}