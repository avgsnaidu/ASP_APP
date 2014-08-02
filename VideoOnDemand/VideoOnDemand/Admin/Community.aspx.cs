using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;
using System.Data.SqlClient;
using System.Data;

namespace VideoOnDemand
{
    public partial class Community : BasePage
    {        
        clsCommunity repository = new clsCommunity();
        clsDistrict district = new clsDistrict();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindDistrict();
            BindCommunityDetails();
        }
        private void BindCommunityDetails()
        {
            DataSet ds = repository.GetCommunityDetails();
            gvCommunity.DataSource = ds;
            gvCommunity.DataBind();
        }

        private void BindDistrict()
        {
            System.Data.DataSet ds = district.GetDistrictDetails();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].NewRow();

                ddlDistrict.DataTextField = "NAME_ENG";
                ddlDistrict.DataValueField = "District_No";              

                ddlDistrict.DataSource = ds;
                ddlDistrict.DataBind();

                ddlDistrictEdit.DataTextField = "NAME_ENG";
                ddlDistrictEdit.DataTextField = "District_No";

                ddlDistrictEdit.DataSource = ds;
                ddlDistrictEdit.DataBind();
            } 
        }

        protected void gvCommunity_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void gvCommunity_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            BindDistrict();
            int index = Convert.ToInt32(e.CommandArgument);
            Session["COMMUNITY_NO"] = index;
            if (e.CommandName.Equals("Editing"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);                
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                txtEditNameEng.Text = row.Cells[1].Text;                
                System.Data.DataSet ds = district.GetDistrictDetails();

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = ds.Tables[0].NewRow();
                    ddlDistrictEdit.DataTextField = "NAME_ENG";
                    ddlDistrictEdit.DataValueField = "District_No";

                    ddlDistrictEdit.DataSource = ds;
                    ddlDistrictEdit.DataBind();
                }
                ddlDistrictEdit.SelectedItem.Value = row.Cells[2].Text;   

                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModalUpdate').modal('show');");
                
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowEditModal", sb.ToString(), false);

            }
            else if (e.CommandName.Equals("Deleting"))
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteWarning').modal('show');");

                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ShowDeleteConfirmModal", sb.ToString(), false);
            }
        }

        protected void ddlDistrictEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDistrict();
        }


        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            if (txtEditNameEng.Text.Trim() != string.Empty && ddlDistrictEdit.SelectedItem.Value.ToString() != string.Empty && Session["COMMUNITY_NO"] != null)
            {
                repository.Name_Eng = txtEditNameEng.Text.Trim();
                repository.DistrictNo = Convert.ToInt32(ddlDistrictEdit.SelectedItem.Value.ToString());

                bool returnValue = repository.UpdateCommunityDetails(Convert.ToInt32(Session["COMMUNITY_NO"]), txtEditNameEng.Text.Trim(), txtEditNameEng.Text.Trim(), Convert.ToInt32(ddlDistrictEdit.SelectedItem.Value.ToString()));
                if (returnValue)
                {
                    lblMessage.Text = "Community updated successfully";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModalUpdate').modal('hide');");
                    sb.Append(@"</script>");

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "UpdateHideModalScript", sb.ToString(), false);               

                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtCommunity.Text.Trim() != string.Empty && ddlDistrict.SelectedItem.Value.ToString() != string.Empty)
            {
                repository.Name_Eng = txtCommunity.Text.Trim();
                repository.DistrictNo = Convert.ToInt32(ddlDistrict.SelectedItem.Value.ToString());                
                repository.CreatedDate = DateTime.Now;
                repository.ModifiedDate = DateTime.Now;

                bool returnValue = repository.AddCommunityDetails();

                if (returnValue)
                {
                    BindCommunityDetails();
                    lblMessage.Text = "Community saved sucessfully";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#myModal2').modal('hide');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

                }
            }

        }


        protected void btnDeleteConform_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            try
            {
                var returnValue = repository.DeleteCommunity(Convert.ToInt32(Session["COMMUNITY_NO"]));
                if (returnValue)
                    BindCommunityDetails();
                    BindDistrict();
                lblMessage.Text = "Community deleted successfully";
                sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#deleteWarning').modal('hide');");
                sb.Append(@"</script>");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteHideModalScript", sb.ToString(), false);
            }
            catch (SqlException ex)
            {
                sb = new System.Text.StringBuilder();
                if (ex.Number == 547)
                {
                    lblMessage.Text = "Community not deleted,as it is assigned to another user";
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
                else
                {
                    lblMessage.Text = "Community not deleted as it is assigned to another";
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Another object is depends on this Community";
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#alertMessageModal').modal('show');");
                sb.Append("$('#deleteWarning').modal('hide');");
                sb.Append(@"</script>");

            }
            finally
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteHideModalScript", sb.ToString(), false);
            }

        }

        protected void gvCommunity_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCommunity.PageIndex = e.NewPageIndex;
            BindCommunityDetails();
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvCommunity.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvCommunity.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }
    }
}