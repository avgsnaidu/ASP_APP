﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoOnDemand.Setup
{
    public partial class VODConfiguration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoToSuperAdminInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Setup/SuperAdminInfo.aspx");
        }
    }
}