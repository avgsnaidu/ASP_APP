<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="District.aspx.cs" Inherits="VideoOnDemand.District" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <script type="text/javascript">
    


    </script>

    <div class="container">
        <div id="management-bottom" class="col-md-12">
            <div class="block1 clearfix">
                <h2 class="col-md-3">
                    <asp:Literal ID="ltlAssingVidGroup" runat="server" Text="<%$ Resources:District, Head_district %>" />

                </h2>
                <div class="col-md-9">
                    <ul>

                        <li>
                            <asp:LinkButton ID="lnkCreateDistrict" runat="server" PostBackUrl="#" data-toggle="modal" data-target="#myModal2">
                                <span class="sprite ic-creategroup"></span>
                                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:District, Head_Create_Dist %>" />

                            </asp:LinkButton>
                        </li>
                    </ul>
                    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dlg-top">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                    <h4 class="modal-title" id="myModalLabel">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:District, mdlCD_Hd_CreateDist %>" />

                                    </h4>

                                </div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label for="txtName" class="col-sm-4 control-label">
                                                        <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:District, mdlUD_DistNumber_label %>" />
                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtDistrictNumber" 
                                                            placeholder="<%$ Resources:District, mdlCD_Dist_Number_Placeholder %> " data-placement="top" data-trigger="manual" data-content="Enter valid data" />
                                                    </div>

                                                </div>

                                                <div class="form-group">
                                                    <label for="txtName" class="col-sm-4 control-label">
                                                        <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:District, mdlCD_Dist_Name_Label %>" />

                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtName"
                                                            placeholder="<%$ Resources:District, mdlCD_Dist_Name_Placeholder %> " data-placement="top" data-trigger="manual" data-content="Enter valid data" />
                                                    </div>
                                                </div>

                                                <%--  <div class="form-group">
                                                <label for="ddlDistrict" class="col-sm-4 control-label">District Name<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddlDistrict" AutoPostBack="true" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            </div>

                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="gvDistrict" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                    <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="<%$ Resources:District, mdlCD_Save_btnText%> " OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:District, mdlCD_Cancel_btn %> " />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="editGroupLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dlg-top">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="editCommunityLabel">
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:District, mdlUD_Head_EditDist %>" />

                                    </h4>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <div class="form-horizontal" role="form">

                                                <div class="form-group">
                                                    <label for="lblDistrictNumberValue" class="col-sm-4 control-label">
                                                        <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:District, mdlUD_DistNumber_label %>" />

                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-7">
                                                        <asp:Label runat="server" ID="lblDistrictNumberValue" />

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtEditCommunityName" class="col-sm-4 control-label">
                                                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:District, mdlUD_DistName_label %>" />

                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-7">
                                                        <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtEditCommunityName"
                                                            placeholder="<%$ Resources:District, mdlUD_DistName_placeHolder %>" data-placement="top" data-trigger="manual" data-content="Enter valid data" />

                                                    </div>
                                                </div>
                                                <%--  <div class="form-group">
                                                <label for="ddlDistrictEdit" class="col-sm-4 control-label">District<span class="required"> *</span></label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="ddlDistrictEdit" OnSelectedIndexChanged="ddlDistrictEdit_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            </div>

                                        </div>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="gvDistrict" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnSaveEdit" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <div class="modal-footer">
                                    <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" Text="<%$ Resources:District, mdlUD_Save_text %> " OnClick="btnSaveEdit_Click" />
                                    <asp:Button ID="btnCanelEdit" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:District, mdlUD_Cancel_text %> " />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="deleteWarning" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true" data-dismiss="modal">
                        <div class="modal-dialog modal-dlg-top">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="deleteModalLabel">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:District, mdlDel_Head_Delwar %>" />

                                    </h4>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <asp:Label runat="server" class="col-sm- control-label" Style="width: 320px;" Text="<%$ Resources:District, mdlDel_DelConfirm_Text %>"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="gvDistrict" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnDeleteConform" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                    <asp:Button ID="btnDeleteConform" runat="server" class="btn btn-primary" OnClick="btnDeleteConform_Click" Text="<%$ Resources:District, mdlDel_Delete_btn %>" />
                                    <asp:Button ID="btnDeleteCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:District, mdlDel_cancel_btn %>" />

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
                                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:District, mdlAlrt_Head %>" />

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
                                        <asp:AsyncPostBackTrigger ControlID="gvDistrict" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                    <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text="<%$ Resources:District, mdlAlrt_Ok_btn %>  " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-block clearfix col-md-12">

                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvDistrict" runat="server" AutoGenerateColumns="False" GridLines="None"
                            DataKeyNames="DISTRICT_NO" AllowPaging="true" PagerSettings-Mode="Numeric" OnPageIndexChanging="gvDistrict_PageIndexChanging"
                            ShowHeaderWhenEmpty="true" OnRowCommand="gvDistrict_RowCommand" OnRowEditing="gvDistrict_RowEditing"
                            EmptyDataText="<%$ Resources:District, gvDist_EmtpyDataText %>" EmptyDataRowStyle-HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="#DEDEDE" />
                            <HeaderStyle CssClass="gridheader" />
                            <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                            <Columns>
                                <asp:BoundField DataField="DISTRICT_NO" Visible="false" />
                                <asp:BoundField DataField="DISTRICTNAME" HeaderText="<%$ Resources:District, gvDist_Hd_DistName %> " />
                                <asp:TemplateField HeaderText=" <%$ Resources:District, gvDist_Hd_Actions %> " ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%#Eval("DISTRICT_NO")%>' />
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("DISTRICT_NO")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


        </div>
    </div>
</asp:Content>
