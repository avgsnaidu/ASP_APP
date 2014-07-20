using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.VODManage
{
    public partial class UserManagement : System.Web.UI.Page
    {
        clsUserManagement repository = new clsUserManagement();
        clsGroupManagement groupRepository = new clsGroupManagement();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ViewState["SelectedUsersToAddGroup"] = "";
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            DataSet ds = repository.GetUsersList();
            gvUserManagement.DataSource = ds;
            gvUserManagement.DataBind();
        }

        protected void gvUserManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

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
                //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#editModal').modal('show');");
                //sb.Append(@"</script>");
                ////ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", "openModal()", true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", "<script>alert('ldldld')</script>", true);
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", "<script>alert('ldldld')</script>", false);

                ////ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
                ////ClientScript.RegisterStartupScript(GetType(), "Select One User", sb.ToString());


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

            if (BindGroups())
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModal1').modal('show');");
                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }


        }

        private bool BindGroups()
        {
            bool groupBinded = false;
            DataSet ds = groupRepository.GetGroups();
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].NewRow();
                dr["GroupId"] = 0;
                dr["GroupName"] = "Select";
                ds.Tables[0].Rows.InsertAt(dr, 0);
                ddlGroupList.DataTextField = "GroupName";
                ddlGroupList.DataValueField = "GroupId";
                ddlGroupList.DataSource = ds;
                ddlGroupList.DataBind();
                groupBinded = true; ;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "NoGroups", "<script>alert('there is no groups avaliable')</script>", false); groupBinded = false;
            }
            return groupBinded;
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

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Session["SelectedUsersToAddGroup"] = "";
            StringBuilder sb = new StringBuilder();
            bool allNotChecked = default(bool);
            if (ddlGroupList.SelectedItem.Value == null || ddlGroupList.SelectedItem.Value == "" || ddlGroupList.SelectedItem.Value == "0")
            {
                string script = string.Format("<script>alert('Please select valid group Name');</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", script, false);
                return;
            }
            foreach (GridViewRow row in gvUserManagement.Rows)
            {
                //check is any single row is selected.
                CheckBox checkBox = (CheckBox)row.FindControl("chkSelectUser");
                if (checkBox != null && checkBox.Checked)
                {
                    sb.Append(gvUserManagement.DataKeys[row.RowIndex].Value.ToString()); sb.Append(';');
                }
            }
            Session["SelectedUsersToAddGroup"] = sb.ToString();

            string scriptValue = string.Format("<script>alert('checked Checkboxes {0} ');</script>", Session["SelectedUsersToAddGroup"]);
            ClientScript.RegisterStartupScript(this.GetType(), "SelectedList", scriptValue, false);


            if (Session["SelectedUsersToAddGroup"] != null && Session["SelectedUsersToAddGroup"].ToString() != "")
            {
                repository.AssignUsersToGroup(Convert.ToInt32(ddlGroupList.SelectedItem.Value), Session["SelectedUsersToAddGroup"].ToString());
                BindUsers();
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