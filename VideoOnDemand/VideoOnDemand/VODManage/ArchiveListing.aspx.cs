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
    public partial class ArchiveListing : System.Web.UI.Page
    {
        clsArchive repository = new clsArchive();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindArchiveList();
            }
        }
        private void BindArchiveList()
        {
            DataSet ds = repository.GetArchiveList();
            gvArchiveListing.DataSource = ds;
            gvArchiveListing.DataBind();
        }

    }
}