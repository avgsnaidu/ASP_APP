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
            string commandNames = e.CommandArgument.ToString();
            string[] commandArguments = commandNames.Split(';');


            int userId = Convert.ToInt32(commandArguments[0]);
            int GroupId = Convert.ToInt32(commandArguments[1]);

            Session["UserID"] = "";

            if (e.CommandName.Equals("Editing"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                // row contains current Clicked Gridview Row
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                Session["UserID"] = userId;
                Session["GroupID"] = GroupId;
                lblUserName.Text = row.Cells[2].Text;
                if (BindEditGroupsList())
                {
                    ddlGroupsEdit.SelectedValue = GroupId.ToString();

                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#editUserGroupModal').modal('show');");
                 
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowEditModal", sb.ToString(), false);
                }

            }
            else if (e.CommandName.Equals("Deleting"))
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                Session["UserID"] = userId;
                //deleteWarning
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteWarning').modal('show');");
            
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowDeleteConfirmModal", sb.ToString(), false);

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

        private bool BindEditGroupsList()
        {
            bool groupBinded = false;
            DataSet ds = groupRepository.GetGroups();
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].NewRow();
                dr["GroupId"] = 0;
                dr["GroupName"] = "Select";
                ds.Tables[0].Rows.InsertAt(dr, 0);
                ddlGroupsEdit.DataTextField = "GroupName";
                ddlGroupsEdit.DataValueField = "GroupId";
                ddlGroupsEdit.DataSource = ds;
                ddlGroupsEdit.DataBind();
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

                }

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

               sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Added Group Successfully');");
                sb.Append("$('#myModal1').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

            }

        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {

            if (ddlGroupsEdit.SelectedItem.Value == null || ddlGroupsEdit.SelectedItem.Value == "" || ddlGroupsEdit.SelectedItem.Value == "0")
            {
                string script = string.Format("<script>alert('Please select valid group Name');</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", script, false);
                return;
            }
             
            var returnValue = repository.UpdateUserGroup(Convert.ToInt32(ddlGroupsEdit.SelectedItem.Value), Convert.ToInt32(Session["UserID"].ToString()));
            if (returnValue)
                BindUsers();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Group Updated Successfully');");
            sb.Append("$('#editUserGroupModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);

            //}


        }

        protected void btnDeleteConform_Click(object sender, EventArgs e)
        {
            var returnValue = repository.UpdateUserGroup(0, Convert.ToInt32(Session["UserID"].ToString()));
            if (returnValue)
                BindUsers();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Group deleted successfully');");
            sb.Append("$('#deleteWarning').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteHideModalScript", sb.ToString(), false);

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