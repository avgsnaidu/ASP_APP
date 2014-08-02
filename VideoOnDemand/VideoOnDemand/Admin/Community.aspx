<%@ Page Title="" Language="C#" MasterPageFile="~/VODManagement.master" AutoEventWireup="true" CodeBehind="Community.aspx.cs" Inherits="VideoOnDemand.Community" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODMangContentPlaceHolder" runat="server">
    <script type="text/javascript">
         
    </script>

    <script type="text/javascript"> 
    </script>
    <div id="management-bottom" class="col-md-12">
        <div class="block1 clearfix">
            <h2 class="col-md-3">
                <asp:Literal runat="server" ID="ltlCommnuityHeader" Text="<%$Resources:Community,Hd_Community_Text %>"></asp:Literal></h2>

            </h2>
            <div class="col-md-9">
                <ul>

                    <li>
                        <asp:LinkButton ID="lnkCreateCommunity" runat="server" PostBackUrl="#" data-toggle="modal" data-target="#myModal2">
                            <span class="sprite ic-creategroup"></span>
                            <asp:Literal runat="server" ID="Literal1" Text="<%$Resources:Community,lnkCreatedCommnity_Text %>"></asp:Literal>

                        </asp:LinkButton>
                    </li>
                </ul>
                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                <h4 class="modal-title" id="myModalLabel">
                                    <asp:Literal runat="server" ID="Literal2" Text="<%$Resources:Community,mdlCC_Head_CreateCommu %>"></asp:Literal>

                                </h4>

                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="txtCommunity" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal3" Text="<%$Resources:Community,mdlCC_Commnity_Label %>"></asp:Literal>

                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtCommunity" placeholder="<%$Resources:Community,mdlCC_Commnity_PlaceHolder %> " data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlDistrict" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal4" Text="<%$Resources:Community,mdlCC_District_Label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddlDistrict" AutoPostBack="true" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvCommunity" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="<%$Resources:Community,mdlCC_Save %> " OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$Resources:Community,mdlCC_Cancel %> " />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="editGroupLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="editCommunityLabel">
                                    <asp:Literal runat="server" ID="Literal5" Text="<%$Resources:Community,mdlUC_Head_UpdateCommu %>"></asp:Literal>

                                </h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="txtEditNameEng" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal6" Text="<%$Resources:Community,mdlUC_Community_Label %>"></asp:Literal>

                                                    <span class="required">*</span></label>
                                                <div class="col-sm-7">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtEditNameEng" placeholder="<%$Resources:Community,mdlUC_Community_placeHolder %>" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlDistrictEdit" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal7" Text="<%$Resources:Community,mdlUC_District_Label %>"></asp:Literal>

                                                    <span class="required">*</span></label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddlDistrictEdit" OnSelectedIndexChanged="ddlDistrictEdit_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvCommunity" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSaveEdit" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" Text="<%$Resources:Community,mdlUC_Save %>" OnClick="btnSaveEdit_Click" />
                                <asp:Button ID="btnCanelEdit" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$Resources:Community,mdlUC_Cancel %>" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteWarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="H2">
                                    <asp:Literal runat="server" ID="Literal8" Text="<%$Resources:Community,mdlDel_Head_DeleteWarning %>"></asp:Literal>
                                </h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label runat="server" class="col-sm- control-label" Style="width: 320px;" Text="<%$Resources:Community,mdlDel_Delete_Confirm_Text %>"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvCommunity" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnDeleteConform" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnDeleteConform" runat="server" class="btn btn-primary" OnClick="btnDeleteConform_Click" Text="<%$Resources:Community,mdlDel_Delete_btntext %> " />
                                <asp:Button ID="btnDeleteCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$Resources:Community,mdlDel_Calcel_btnText %>" />

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
                                    <asp:Literal runat="server" ID="Literal9" Text="<%$Resources:Community,mdlAlrt_Head_Alert %>"></asp:Literal>

                                </h3>
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
                                    <asp:AsyncPostBackTrigger ControlID="gvCommunity" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text="<%$Resources:Community,mdlAlrt_Ok_btnText %>  " />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-block clearfix col-md-12">
            <asp:GridView ID="gvCommunity" runat="server" AutoGenerateColumns="False" GridLines="None"
                AllowPaging="true" PagerSettings-Mode="Numeric" OnPageIndexChanging="gvCommunity_PageIndexChanging"
                ShowHeaderWhenEmpty="true" OnRowCommand="gvCommunity_RowCommand" OnRowEditing="gvCommunity_RowEditing"
                EmptyDataText="<%$Resources:Community,gvComm_EmptyData_Text %> " EmptyDataRowStyle-HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#DEDEDE" />
                <HeaderStyle CssClass="gridheader" />
                <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                <Columns>
                    <asp:BoundField DataField="COMMUNITY_NO" Visible="false" />
                    <asp:BoundField DataField="NAME_ENG" HeaderText="<%$Resources:Community,gvComm_Hd_CommnName %> " ItemStyle-Width="35%" />
                    <asp:BoundField DataField="DISTRICT_NO" HeaderText="<%$Resources:Community,gvComm_Hd_District %> " />
                    <asp:TemplateField HeaderText="<%$Resources:Community,gvComm_Hd_Actions %> " ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%#Eval("COMMUNITY_NO")%>' />
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("COMMUNITY_NO")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BorderStyle="None" BorderWidth="0px" />
            </asp:GridView>
        </div>

        <%-- <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="delModalLabel">Delete Record</h3>
            </div>
            <div class="modal-body">
                Are you sure you want to delete the record?
                            <asp:HiddenField ID="hfCode" runat="server" />
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info" />
                <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>

        </div>--%>
    </div>
</asp:Content>
