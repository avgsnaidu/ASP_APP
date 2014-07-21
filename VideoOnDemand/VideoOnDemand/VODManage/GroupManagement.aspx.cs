﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;

namespace VideoOnDemand.VODManage
{
    public partial class GroupManagement : System.Web.UI.Page
    {
        clsGroupManagement repository = new clsGroupManagement();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                BindGroupsDetails();
            //}
        }

        private void BindGroupsDetails()
        {
            DataSet ds = repository.GetGroups();
            gvGroupManagement.DataSource = ds;
            gvGroupManagement.DataBind();
        }

        protected void gvGroupManagement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Session["GroupID"] = "";
            if (e.CommandName.Equals("Editing"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                // row contains current Clicked Gridview Row
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                Session["GroupID"] = index;
                txtEditGroupName.Text = row.Cells[1].Text;
                txtEditDescription.Text = row.Cells[2].Text;

                //txtPopulation.Text = row.Cells[1].Text;
                //txtName.Text = row.Cells[2].Text;


                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModalUpdate').modal('show');");
                //sb.Append("$('#deleteModal').css('z-index', '1500');");

                sb.Append(@"</script>");
                //ClientScript.RegisterStartupScript(this.GetType(), "SelectGroup", sb.ToString()); //(0r)
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", sb.ToString(), false);

                //ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "$(function() { LoginFail(); });", false);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", "<script>alert('please Select At Least One User')</script>", false);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowEditModal", sb.ToString(), false);


                //ScriptManager.RegisterStartupScript(this, this.GetType(), "EditModalScript", "<script>alert('please Select At Least One User')</script>", false);


            }
            else if (e.CommandName.Equals("Deleting"))
            {

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtGroupName.Text.Trim() != string.Empty && txtDescription.Text.Trim() != string.Empty)
            {
                bool returnValue = repository.InsertGroupDetails(txtGroupName.Text.Trim(), txtDescription.Text.Trim());
                if (returnValue)
                {
                    BindGroupsDetails();
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('Record Added Successfully');");
                    sb.Append("$('#myModal2').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

                }
            }

        }

        protected void gvGroupManagement_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            if (txtEditGroupName.Text.Trim() != string.Empty && txtEditDescription.Text.Trim() != string.Empty && Session["GroupID"] != null)
            {
                bool returnValue = repository.UpdateGroupDetails(Convert.ToInt32(Session["GroupID"]), txtEditGroupName.Text.Trim(), txtEditDescription.Text.Trim());
                if (returnValue)
                {
                  
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('Record Updated Successfully');");
                    sb.Append("$('#myModalUpdate').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UpdateHideModalScript", sb.ToString(), false);
                    BindGroupsDetails();

                }
            }
        }
    }
}