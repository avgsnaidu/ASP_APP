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

        protected void gvUserManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("Edit"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                // row contains current Clicked Gridview Row
                String VersionId = row.Cells[2].Text;

                //GridViewRow gvrow = gvUserManagement.Rows[index];
                //lblCountryCode.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                //txtPopulation.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text);
                //txtName.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
                //txtContinent1.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text);
                //lblResult.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
                //ClientScript.RegisterStartupScript(GetType(), "Select One User", sb.ToString());

            
            }
            else if (e.CommandName.Equals("Delete"))
            {
            }
        }


        protected void lnkAssignUserGroup_Click(object sender, EventArgs e)
        {
            bool atLeastOneSelected = default(bool);
            foreach (GridViewRow row in gvUserManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null)
                {
                    if (checkBox.Checked)
                        atLeastOneSelected = true;
                }
            }
            if (!atLeastOneSelected)
                ClientScript.RegisterStartupScript(GetType(), "Select One User", "<script>alert('please Select At Least One User')</script>");
        }


        protected void chkSelectUser_CheckedChanged(object sender, EventArgs e)
        {


            CheckBox ChkBoxHeader = (CheckBox)gvUserManagement.HeaderRow.FindControl("chkAll");
            // if top is checked


            bool allNotChecked = default(bool);
            foreach (GridViewRow row in gvUserManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null)
                {
                    if (!checkBox.Checked)
                    {
                        allNotChecked = true;

                    }
                    else
                    {
                        row.BackColor = System.Drawing.Color.FromName("#D1DDF1");

                    }
                    //if (checkBox == ((CheckBox)sender) && ((CheckBox)sender).Checked)
                    //{
                    //    row.BackColor = System.Drawing.Color.FromName("#D1DDF1");
                    //}

                    //else
                    //{
                    //    row.BackColor = System.Drawing.Color.FromName("#e23363");
                    //}

                }

                //if (((CheckBox)sender).Checked)
                //{
                //    row.BackColor = System.Drawing.Color.FromName("#D1DDF1");
                //}
                //else
                //{
                //    row.BackColor = System.Drawing.Color.FromName("#e23363");
                //}

            }

            if (allNotChecked)
            {
                if (ChkBoxHeader != null)
                    ChkBoxHeader.Checked = false;
            }
            else if (!ChkBoxHeader.Checked)
            {
                ChkBoxHeader.Checked = true;
            }




        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)gvUserManagement.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in gvUserManagement.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkSelectUser");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                    row.BackColor = System.Drawing.Color.FromName("#D1DDF1");
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }

        }



        //protected void lnkUserMang_Click(object sender, EventArgs e)
        //{

        //    Response.Redirect(@"~/VODManage/UserManagement.aspx");

        //}

        //protected void lnkVideoMang_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect(@"~/VODManage/VideoManagement.aspx");
        //}


    }
}