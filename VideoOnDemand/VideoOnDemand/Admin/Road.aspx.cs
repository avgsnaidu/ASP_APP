using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VideoOnDemand.Model.BAL;
using System.Data.SqlClient;

namespace VideoOnDemand
{
    public partial class Road : BasePage
    {
        clsRoad road = new clsRoad();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated && Session["LoginUserName"] != null && Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"].ToString()))
            {
                if (!IsPostBack)
                    BindRoad();
            }
            else
                Response.Redirect("~/WindowsUser.aspx");
        }

        private void BindRoad()
        {
            DataSet ds = road.GetRoadDetails();
            gvRoad.DataSource = ds;
            gvRoad.DataBind();
        }

        protected void gvRoad_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvRoad_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Session["ROAD_NO"] = index;
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
            if (txtEditNameEng.Text.Trim() != string.Empty && Session["Road_NO"] != null)
            {
                road.Name_Eng = txtEditNameEng.Text.Trim();

                bool returnValue = road.UpdateRoadDetails(Convert.ToInt32(Session["ROAD_NO"]), txtEditNameEng.Text.Trim(), txtEditNameEng.Text.Trim());
                if (returnValue)
                {
                    lblMessage.Text = Resources.Road.MSG_Road_Upadate_Sucess;
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
                road.Name_Eng = txtName.Text.Trim();

                bool returnValue = road.AddRoadDetails();

                if (returnValue)
                {
                    BindRoad();
                    lblMessage.Text = Resources.Road.MSG_ROAD_SAVE_Sucess;
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
                var returnValue = road.DeleteRoad(Convert.ToInt32(Session["Road_NO"]));
                if (returnValue)
                    BindRoad();
                lblMessage.Text = Resources.Road.MSG_ROAD_DELETE_SUCESS;
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
                    lblMessage.Text = Resources.Road.MSG_ROAD_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
                else
                {
                    lblMessage.Text = Resources.Road.MSG_ROAD_Delete_Failed;
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#alertMessageModal').modal('show');");
                    sb.Append("$('#deleteWarning').modal('hide');");
                    sb.Append(@"</script>");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = Resources.Road.MSG_ROAD_Delete_Failed;
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

        protected void gvRoad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRoad.PageIndex = e.NewPageIndex;
            BindRoad();
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (gvRoad.BottomPagerRow != null)
            {
                GridViewRow pagerRow = gvRoad.BottomPagerRow;
                pagerRow.Cells[0].Attributes.Add("align", "right");
            }
        }
    }
}