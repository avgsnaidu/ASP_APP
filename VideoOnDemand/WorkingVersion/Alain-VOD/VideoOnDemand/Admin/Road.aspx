<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.master" AutoEventWireup="true" CodeBehind="Road.aspx.cs" Inherits="VideoOnDemand.Road" %>


<asp:Content ID="Content1" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">

    <script type="text/javascript">

        function ShowImportSuccessMessage() {
            $('#alertMessageModal').modal('show');
        }

        function HideLoaderDiv() {
            $("#LoaderDiv").hide();
        }

        function ShowLoaderDiv() {
            $("#LoaderDiv").show();
        }

        function performCheck() {
            if ($("#<%= FileUpload1.ClientID %>").val()) {
                ShowLoaderDiv();
                return true;
            }
            else {
                HideLoaderDiv();
                return false;
            }
        }

        $(document).ready(function () {
            $("#<%= btnRoadImportConfirmOk.ClientID %>").click(function () {
                performCheck();
            });
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $("#<%= btnRoadImportConfirmOk.ClientID %>").click(function () {
                performCheck();
            });
        });

    </script>

    <div class="container">
        <div id="management-bottom" class="col-md-12  padLR10 configuration-wrap">
            <div class="block1  configgurationBlock clearfix">

                <div class="col-md-12 configPanel">
                    <ul class="configTabs">
                        <li class="configTab cft1">
                            <asp:LinkButton runat="server" ID="lnkConfiguration" TabIndex="-1" OnClick="lnkConfiguration_Click">
                                <span class="iconLump iconConfig"></span>
                                <asp:Literal ID="Literal35" runat="server" Text="<%$ Resources:Config, mHd_Config_text%>" />
                            </asp:LinkButton>
                        </li>

                        <li class="configTab cft2">
                            <asp:LinkButton runat="server" ID="lnkCommunity" TabIndex="-1" OnClick="lnkCommunity_Click">
                                <span class="iconLump iconCommuni"></span>
                                <asp:Literal ID="Litercal5" runat="server" Text="<%$ Resources:Config, mHd_Commnity_text%>" />
                            </asp:LinkButton>

                        </li>

                        <li class="configTab cft3">
                            <asp:LinkButton runat="server" ID="lnkDistrict" TabIndex="-1" OnClick="lnkDistrict_Click">
                                <span class="iconLump iconDistrits"></span>
                                <asp:Literal ID="Literacl6" runat="server" Text="<%$ Resources:Config, mHd_District_text%>" />
                            </asp:LinkButton>
                        </li>

                        <li class="configTab cft4">
                            <asp:LinkButton runat="server" CssClass="active" ID="lnkRoads" TabIndex="-1">
                                <span class="iconLump iconRoads"></span>
                                <asp:Literal ID="Literacl7" runat="server" Text="<%$ Resources:Config, mHd_Road_text%>" />
                            </asp:LinkButton>
                        </li>

                        <li>
                            <asp:LinkButton runat="server" ID="btnUpBackSubmit" OnClick="btnBackToHome_Click"
                                Text="<%$Resources:Config,btnTopBack_Text %>">
                            </asp:LinkButton>
                        </li>

                        <li>
                            <asp:LinkButton ID="lnkCreateRoad" runat="server" PostBackUrl="#" data-toggle="modal" data-target="#myModal2">
                                <span class="sprite ic-assigngroup"></span>
                                <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:Road, lnk_Create_Road_text %>"></asp:Literal>
                            </asp:LinkButton>
                        </li>

                        <li>
                            <asp:UpdatePanel runat="server" ID="lnkimportUpdate">
                                <ContentTemplate>
                                    <asp:LinkButton ID="lnkRoadImport" runat="server" OnClick="lnkRoadImport_Click">
                                        <span class="sprite ic-assigngroup"></span>
                                        <asp:Literal runat="server" ID="Literal7" Text="<%$ Resources:Road, lnk_Import_Road %>"></asp:Literal>
                                    </asp:LinkButton>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </li>
                    </ul>
                </div>

                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
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
                                                    <asp:TextBox type="number" MaxLength="5" runat="server" class="form-control textboxFormat required "
                                                        ID="txtRoadNumber" placeholder="<%$ Resources:Road, mdlCR_Road_Number_placeHolder %>"
                                                        data-placement="top" data-trigger="manual" data-content="Enter valid data" />
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtRoadNumber" ControlToValidate="txtRoadNumber"
                                                        ValidationGroup="Road" ErrorMessage="Please enter road number" ForeColor="Red"
                                                        Display="Dynamic" />
                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtRoadNumber" ID="RegularExpressionValidator1"
                                                        ValidationExpression="^[\s\S]{0,5}$" ValidationGroup="Road" runat="server" ForeColor="Red" ErrorMessage="Maximum 5 characters allowed"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtName" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal3" Text="<%$ Resources:Road, mdlCR_Road_Name_label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required "
                                                        ID="txtName" placeholder="<%$ Resources:Road, mdlCR_Road_Name_placeHolder %>"
                                                        data-placement="top" data-trigger="manual" data-content="Enter valid data" />
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtName" ControlToValidate="txtName"
                                                        ValidationGroup="Road" ErrorMessage="Please enter road name" ForeColor="Red"
                                                        Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvRoad" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="modal-footer">
                                <asp:Label ID="Label2" runat="server" CssClass="mdlFooterMessage">
                                    <span class="required">*</span>
                                    <asp:Literal runat="server" ID="Literal38" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                                </asp:Label>
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" ValidationGroup="Road" Text="<%$ Resources:Road, mdlCR_Save %> " OnClick="btnSave_Click" />
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
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required "
                                                        ID="txtEditRoadName" placeholder="<%$ Resources:Road, mdlUR_Road_Name_Placeholder %>"
                                                        data-placement="top" data-trigger="manual" data-content="Enter valid data" />
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtEditRoadName" ControlToValidate="txtEditRoadName"
                                                        ValidationGroup="RoadEdit" ErrorMessage="Please enter road name" ForeColor="Red"
                                                        Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvRoad" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSaveEdit" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="modal-footer">
                                <asp:Label ID="Label3" runat="server" CssClass="mdlFooterMessage">
                                    <span class="required">*</span>
                                    <asp:Literal runat="server" ID="Literal10" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                                </asp:Label>
                                <asp:Button ID="btnSaveEdit" runat="server" ValidationGroup="RoadEdit" class="btn btn-primary" Text="<%$ Resources:Road, mdlUR_Save %> " OnClick="btnSaveEdit_Click" />
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
                                                <asp:Label ID="lblRoadDeleteConfirm" runat="server" class="col-sm- control-label" CssClass="alertBodyContentAlign" Text="<%$ Resources:Road, mdlDel_DelConfim_Text%>"></asp:Label>
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
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="myModalLabel22">
                                            <asp:Literal runat="server" ID="ltlAlertHeader" Text="<%$ Resources:Road, mdlAlrt_Head %>"></asp:Literal>

                                        </h3>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label alertBodyContentAlign padLR10"></asp:Label>
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

                <div class="modal fade" id="mdlRoadImportConfirm" tabindex="-1" role="dialog" aria-labelledby="myRoadImportConfirmLabel" aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myRoadImportConfirmLabel">
                                    <asp:Literal ID="ltlRoadImportChangeAlert" runat="server" Text="<%$ Resources:Road, mdlImport_Confm_Header %>" />
                                </h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label ID="lblRoadImportConfirmation" runat="server" class="col-sm- control-label  padLR10 alertBodyContentAlign"
                                                    Text=" <%$ Resources:Road, MSG_Excel_Import_Format %>">
                                                </asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblUploadNeed" Text="<%$ Resources:Road, MSG_Select_Excel_Import %>" Visible="false" ForeColor="Red" />
                                            </div>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                    </div>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvRoad" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div id="LoaderDiv" align="center" style="display: none">
                                <img src="../Content/Images/loader.gif" />&nbsp;&nbsp; Please wait...
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnRoadImportConfirmOk" runat="server" OnClick="btnRoadImportConfirmOk_Click" class="btn btn-primary" Text=" <%$ Resources:Road, mdlBtnImport %> " />
                                <asp:Button ID="btnDBChangeCancel" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" <%$ Resources:Config, mdlCancel %> " />
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="table-block clearfix col-md-12">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvRoad" runat="server" AutoGenerateColumns="False" GridLines="None"
                            DataSourceID="RoadObjectSource" OnLoad="GridView_Load" OnRowCreated="GridView_RowCreated"
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
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("ROAD_NO") +";"+Eval("RoadName") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                        </asp:GridView>

                        <asp:ObjectDataSource runat="server" ID="RoadObjectSource" SelectMethod="BindRoadData"></asp:ObjectDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>
    </div>
</asp:Content>
