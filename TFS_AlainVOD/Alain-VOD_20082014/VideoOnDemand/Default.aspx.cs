using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VideoOnDemand
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Redirect("~/Index.aspx");
            }
        }

        protected void ddlSearchOn_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = string.IsNullOrEmpty(ddlSearchOn.SelectedValue) ? "1" : ddlSearchOn.SelectedValue; 
            autoCompleteSearch.ContextKey = selectedValue;
        }
    }
}