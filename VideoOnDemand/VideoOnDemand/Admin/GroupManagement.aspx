<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/VODManagement.master" AutoEventWireup="true" CodeBehind="~/Admin/GroupManagement.aspx.cs" 
    Inherits="VideoOnDemand.Admin.GroupManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('form').find('a.submit-link').click(function () {
                $('form').trigger('submit');
            }).show();
        });

        $(document).ready(function () {
            var showGroupUpdateMsg = function () {
                $('#alertMessageModal').modal('show');
                $('#myModalUpdate').modal('hide');
            };
        });


    </script>

    <script type="text/javascript">
         
    </script>
    <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-4">
                <asp:Literal runat="server" Text="<%$ Resources:GroupManage, hdrGroupManagement %>" /></h2>
            <div class="col-md-8">
                <ul>
                    <li>
                        <asp:LinkButton ID="lnkCreateGroup" runat="server" PostBackUrl="#" data-toggle="modal" data-target="#myModal2">
                            <span class="sprite ic-creategroup"></span>
                            <asp:Literal ID="ltlcreateGrop" runat="server" Text="<%$ Resources:GroupManage, lnkCreateGroup_link %>" />
                        </asp:LinkButton>
                    </li>
                </ul>


                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel">
                                    <asp:Literal ID="ltlCreateGroup" runat="server" Text="<%$ Resources:GroupManage, MLCG_ltlCreateGroup %>" />
                                </h4>

                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="txtGroupName" class="col-sm-4 control-label">
                                                    <asp:Literal ID="ltlMCG_groupName" runat="server" Text="<%$ Resources:GroupManage, MLCG_GroupName %>" /><span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtGroupName" placeholder="<%$ Resources:GroupManage, mdl2_gn_PlaceHolder %>" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtDescription" class="col-sm-4 control-label">
                                                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:GroupManage, mdl2_Description%>" /><span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox runat="server" ID="txtDescription" class="form-control required NoEmpty" name="" placeholder="<%$ Resources:GroupManage, mdl2_Desc_PlaceHolder%> " TextMode="MultiLine" data-placement="bottom" data-trigger="manual" data-content="Fields must not be empty."></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <%-- <button type="submit" class="btn btn-primary" >Save</button>--%>

                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="<%$ Resources:GroupManage, btnSave_button%>" OnClick="btnSave_Click" />
                                <%--<asp:LinkButton ID="btnSave" runat="server" class="btn btn-primary submit-link" Text="Save" />--%>
                                <%--<asp:ImageButton ID="btnSave" runat="server" UseSubmitBehavior="true" class="btn btn-primary" Text="Save" />--%>
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:GroupManage, btnCancel_Text%>" />

                                <%--  <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> --%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="editGroupLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="editGroupLabel">
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:GroupManage, UPMDL_EditGroup %>" /></h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblgroupNText" for="txtEditGroupName" class="col-sm-4 control-label">
                                                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:GroupManage, UPMDL_GroupName_Text %>" /><span class="required"> *</span></asp:Label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtEditGroupName" placeholder="<%$ Resources:GroupManage, UPMDL_GroupName_placeHolder %>" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPassword3" class="col-sm-4 control-label">
                                                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:GroupManage, UPMDL_txtEditDescription_text %>" />
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox runat="server" ID="txtEditDescription" class="form-control required NoEmpty" name="" placeholder="<%$ Resources:GroupManage, UPMDL_txtEditDescription_PHold %>" TextMode="MultiLine" data-placement="bottom" data-trigger="manual" data-content="Fields must not be empty."></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSaveEdit" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <%-- <button type="submit" class="btn btn-primary" >Save</button>--%>

                                <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" Text="<%$ Resources:GroupManage, UPMDL_btnSaveEdit_button %>" OnClick="btnSaveEdit_Click" />
                                <%--<asp:LinkButton ID="btnSave" runat="server" class="btn btn-primary submit-link" Text="Save" />--%>
                                <%--<asp:ImageButton ID="btnSave" runat="server" UseSubmitBehavior="true" class="btn btn-primary" Text="Save" />--%>
                                <asp:Button ID="btnCanelEdit" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:GroupManage, UPMDL_btnCanelEdit_button %>" />

                                <%--  <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> --%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteWarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="H2">
                                    <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:GroupManage, DMdl_DeleteWarning%>" /></h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lbldeleteWrng" class="col-sm- control-label" Style="width: 320px;" Text="<%$ Resources:GroupManage, DMdl_lblDeleteWrang_Text %> "> </asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnDeleteConform" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnDeleteConform" runat="server" class="btn btn-primary" OnClick="btnDeleteConform_Click" Text="<%$ Resources:GroupManage, DMdl_btnDeleteConform_button %>" />
                                <asp:Button ID="btnDeleteCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:GroupManage, DMdl_btnDeleteCancel_text %>" />

                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel22" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h3 class="modal-title" id="myModalLabel22">
                                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:GroupManage, AltMdl_Head %>" /></h3>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <%--<label   class="col-sm- control-label" style="width: 320px;">Are&nbsp;you&nbsp;sure&nbsp;to&nbsp;delete&nbsp;group&nbsp?.</label>--%>
                                                <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label" Style="width: 320px; text-align: left; padding-left: 25px;"></asp:Label>

                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text="<%$ Resources:GroupManage, AltMdl_Ok %>" />
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>




        <%--  <div id="editModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="editModalLabel">Edit Record</h3>
            </div>
            <asp:UpdatePanel ID="upEdit" runat="server">
                <ContentTemplate>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <td><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:GroupManage, AltMdl_Head %>" /> 
                            <asp:Label ID="lblCountryCode" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:GroupManage, AltMdl_Head %>" />Population : 
                            <asp:TextBox ID="txtPopulation" runat="server"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="Type Integer Value!" />
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:GroupManage, AltMdl_Head %>" />Country Name:
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:GroupManage, AltMdl_Head %>" /> Continent:
                            <asp:TextBox ID="txtContinent1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                        <asp:Button ID="btnSaveTwo" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnSave_Click" />
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="gvGroupManagement" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="btnSaveTwo" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>--%>

        <div class="table-block clearfix col-md-12">
            <asp:UpdatePanel ID="UpdatePanelGroupMang" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvGroupManagement" runat="server" AutoGenerateColumns="False" GridLines="None"
                        DataKeyNames="GroupId" AllowPaging="true" PagerSettings-Mode="Numeric" OnPageIndexChanging="gvGroupManagement_PageIndexChanging"
                        OnRowEditing="gvGroupManagement_RowEditing" ShowHeaderWhenEmpty="true"
                        OnRowCommand="gvGroupManagement_RowCommand" EmptyDataText="No groups found" EmptyDataRowStyle-HorizontalAlign="Center">
                        <AlternatingRowStyle BackColor="#DEDEDE" />
                        <HeaderStyle CssClass="gridheader" />
                        <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                        <Columns>
                            <asp:BoundField DataField="GroupId" Visible="false" />
                            <asp:BoundField DataField="GroupName" HeaderText="<%$ Resources:GroupManage, gv_Hd_txtGroupName %>" ItemStyle-Width="35%" />
                            <asp:BoundField DataField="Description" HeaderText="<%$ Resources:GroupManage, gv_Hd_Desct %>" />
                            <asp:TemplateField HeaderText="<%$ Resources:GroupManage, gv_HD_Actions %>" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%#Eval("GroupId")%>' />
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("GroupId")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="delModalLabel">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:GroupManage, delModalLabel_h3 %>" /></h3>
            </div>
            <%-- <asp:UpdatePanel ID="upDel" runat="server">
                <ContentTemplate>--%>
            <div class="modal-body">
                Are you sure you want to delete the record?
                            <asp:HiddenField ID="hfCode" runat="server" />
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info" />
                <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
            <%--                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </div>

    </div>
</asp:Content>
