using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VideoOnDemand.Model.BAL;
using System.Data;
using System.Data.SqlClient;

namespace VideoOnDemand
{
    public partial class District : BasePage
    {
        clsDistrict district = new clsDistrict();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
            {
                if (!IsPostBack)
                    BindDistrict();
            }
            else
                Response.Redirect("~/WindowsUser.aspx");
        }

        private void BindDistrict()
        {
            DataSet ds = district.GetDistrictDetails();
            gvDistrict.DataSource = ds;
            gvDistrict.DataBind();
        }

        protected void gvDistrict_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvDistrict_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Session["DISTRICT_NO"] = index;
            if (e.CommandName.Equals("Editing"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                txtEditNameEng.Text = row.Cells[1].Text;

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

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            if (txtEditNameEng.Text.Trim() != string.Empty && Session["DISTRICT_NO"] != null)
            {
                district.Name_Eng = txtEditNameEng.Text.Trim();

                bool returnValue = district.UpdateDistrictDetails(Convert.ToInt32(Session["DISTRICT_NO"]), txtEditNameEng.Text.Trim(), txtEditNameEng.Text.Trim());
                if (returnValue)
                {
                    lblMessage.Text = Resources.District.MSG_Distrct_Update_Sucess;
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
            if (txtName.Text.Trim() != string.Empty)
            {
                district.Name_Eng = txtName.Text.Trim();

                bool returnValue = district.AddDistrictDetails();

                if (returnValue)
                {
                    BindDistrict();
                    lblMessage.Text = Resources.District.MSG_District_Save_Sucess;
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
                var returnValue = district.DeleteDistrict(Convert.ToInt32(Session["DISTRICT_NO"]));
                if (returnValue)
                    BindDistrict();
                lblMessage.Text = Resources.District.MSG_District_Delete_Sucess;
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
                    lblMessage.Text = Resources.District.MSG_District_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
                else
                {
                    lblMessage.Text = Resources.District.MSG_District_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = Resources.District.MSG_District_Delete_Failed_Depends;
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

        protected void gvDistrict_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDistrict.PageIndex = e.NewPageIndex;
            BindDistrict();
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvDistrict.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvDistrict.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }


    }
}