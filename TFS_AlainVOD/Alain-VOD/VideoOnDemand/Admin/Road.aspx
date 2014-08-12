<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.master" AutoEventWireup="true" CodeBehind="Road.aspx.cs" Inherits="VideoOnDemand.Road" %>

<asp:Content ID="Content1" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <div id="management-bottom" class="col-md-12">
            <div class="block1 clearfix">
                <h2 class="col-md-3">
                    <asp:Literal runat="server" ID="ltlRoadHead" Text="<%$ Resources:Road, Head_Road %>"></asp:Literal></h2>

                <div class="col-md-9">
                    <ul>

                        <li>
                            <asp:LinkButton ID="lnkCreateRoad" runat="server" PostBackUrl="#" data-toggle="modal" data-target="#myModal2">
                                <span class="sprite ic-creategroup"></span>
                                <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:Road, lnk_Create_Road_text %>"></asp:Literal>


                            </asp:LinkButton>
                        </li>
                    </ul>
                    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dlg-top">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                                    <h4 class="modal-title" id="myModalLabel">

                                        <asp:Literal runat="server" ID="Literal2" Text="<%$ Resources:Road, mdlCR_Head_CretRoad %>"></asp:Literal>

                                    </h4>

                                </div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <div class="form-horizontal" role="form">

                                                <div class="form-group">
                                                    <label for="txtRoadNumber" class="col-sm-4 control-label">
                                                        <asp:Literal runat="server" ID="Literal8" Text="<%$ Resources:Road, mdlCR_Road_Number_label %>"></asp:Literal>
                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtRoadNumber" placeholder="<%$ Resources:Road, mdlCR_Road_Number_placeHolder %>"
                                                            data-placement="top" data-trigger="manual" data-content="Enter valid data" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtName" class="col-sm-4 control-label">
                                                        <asp:Literal runat="server" ID="Literal3" Text="<%$ Resources:Road, mdlCR_Road_Name_label %>"></asp:Literal>
                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-6">
                                                        <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtName" placeholder="<%$ Resources:Road, mdlCR_Road_Name_placeHolder %>"
                                                            data-placement="top" data-trigger="manual" data-content="Enter valid data" />
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
                                        <asp:AsyncPostBackTrigger ControlID="gvRoad" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                    <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="<%$ Resources:Road, mdlCR_Save %> " OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:Road, mdlCR_Cancel%> " />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="editGroupLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dlg-top">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="editCommunityLabel">
                                        <asp:Literal runat="server" ID="Literal4" Text="<%$ Resources:Road, mdlUR_Head_Road%>"></asp:Literal>
                                    </h4>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label for="lblRoadNumberValue" class="col-sm-4 control-label">
                                                        <asp:Literal runat="server" ID="Literal9" Text="<%$ Resources:Road, mdlCR_Road_Number_label %>"></asp:Literal>

                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-7">
                                                        <asp:Label runat="server" ID="lblRoadNumberValue" />

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtEditRoadName" class="col-sm-4 control-label">
                                                        <asp:Literal runat="server" ID="Literal5" Text="<%$ Resources:Road, mdlUR_Road_Name_label %>"></asp:Literal>

                                                        <span class="required">*</span></label>
                                                    <div class="col-sm-7">
                                                        <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtEditRoadName" placeholder="<%$ Resources:Road, mdlUR_Road_Name_Placeholder %>" data-placement="top" data-trigger="manual" data-content="Enter valid data" />

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
                                        <asp:AsyncPostBackTrigger ControlID="gvRoad" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnSaveEdit" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <div class="modal-footer">
                                    <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" Text="<%$ Resources:Road, mdlUR_Save %> " OnClick="btnSaveEdit_Click" />
                                    <asp:Button ID="btnCanelEdit" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:Road, mdlUR_Cancel %> " />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="deleteWarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-dismiss="modal">
                        <div class="modal-dialog modal-dlg-top">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="H2">
                                        <asp:Literal runat="server" ID="Literal6" Text="<%$ Resources:Road, mdlDel_DelWarning%>"></asp:Literal>

                                    </h4>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="modal-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <asp:Label runat="server" class="col-sm- control-label" Style="width: 320px;" Text="<%$ Resources:Road, mdlDel_DelConfim_Text%>"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="gvRoad" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnDeleteConform" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                    <asp:Button ID="btnDeleteConform" runat="server" class="btn btn-primary" OnClick="btnDeleteConform_Click" Text="<%$ Resources:Road, mdlDel_Delete%> " />
                                    <asp:Button ID="btnDeleteCancel" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$ Resources:Road, mdlDel_Cancel%> " />

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
                                        <asp:Literal runat="server" ID="Literal7" Text="<%$ Resources:Road, mdlAlrt_Head %>"></asp:Literal>

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
                                        <asp:AsyncPostBackTrigger ControlID="gvRoad" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                    <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text="<%$ Resources:Road, mdlAlrt_Ok %>  " />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-block clearfix col-md-12">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvRoad" runat="server" AutoGenerateColumns="False" GridLines="None"
                            DataKeyNames="ROAD_NO" AllowPaging="true" PagerSettings-Mode="Numeric" OnPageIndexChanging="gvRoad_PageIndexChanging"
                            ShowHeaderWhenEmpty="true" OnRowCommand="gvRoad_RowCommand" OnRowEditing="gvRoad_RowEditing"
                            EmptyDataText="<%$ Resources:Road, gvRoad_EmptyData_Text %>" EmptyDataRowStyle-HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="#DEDEDE" />
                            <HeaderStyle CssClass="gridheader" />
                            <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                            <Columns>
                                <asp:BoundField DataField="ROAD_NO" Visible="false" />
                                <asp:BoundField DataField="RoadName" HeaderText="<%$ Resources:Road, gvRoad_Head_RoadName %>" />
                                <asp:TemplateField HeaderText="<%$ Resources:Road, gvRoad_Hd_Actions %>" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%#Eval("ROAD_NO")%>' />
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("ROAD_NO")%>' />
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
