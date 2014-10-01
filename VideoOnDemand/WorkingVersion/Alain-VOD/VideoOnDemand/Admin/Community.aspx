<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="Community.aspx.cs" Inherits="VideoOnDemand.Community" %>

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
            $("#<%= btnCommunityImportConfirmOk.ClientID %>").click(function () {
                 performCheck();
             });
         });
    </script>
    <div class="container">
        <div id="management-bottom" class="col-md-12 padLR10 configuration-wrap">


            <div class="block1 configgurationBlock clearfix">

                <div class="col-md-12 configPanel">
                    <ul class="configTabs">
                        <li class="configTab cft1">
                            <asp:LinkButton runat="server" ID="lnkConfiguration" role="menuitem" TabIndex="-1" OnClick="lnkConfiguration_Click">
                                <span class="iconLump iconConfig"></span>
                                <asp:Literal ID="Literal35" runat="server" Text="<%$ Resources:Config, mHd_Config_text%>" />
                            </asp:LinkButton>

                        </li>
                        <li class="configTab cft2" role="presentation">
                            <asp:LinkButton runat="server" ID="lnkCommunity" CssClass="active" TabIndex="-1">
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
                            <asp:LinkButton runat="server" ID="lnkRoads" TabIndex="-1" OnClick="lnkRoads_Click">
                                <span class="iconLump iconRoads"></span>
                                <asp:Literal ID="Literacl7" runat="server" Text="<%$ Resources:Config, mHd_Road_text%>" />
                            </asp:LinkButton>
                        </li>

                        <li>
                            <asp:LinkButton runat="server" ID="btnBackToHome" OnClick="btnBackToHome_Click"
                                Text="<%$Resources:Config,btnTopBack_Text %>" /></li>
                        <li>
                            <asp:LinkButton ID="lnkCreateCommunity" runat="server" data-toggle="modal" data-target="#myModal2">

                                <%--<asp:LinkButton ID="lnkCreateCommunity" runat="server" OnClick="lnkCreateCommunity_Click">--%>
                                <span class="sprite ic-assigngroup"></span>
                                <asp:Literal runat="server" ID="Literal1" Text="<%$Resources:Community,lnkCreatedCommnity_Text %>"></asp:Literal>
                            </asp:LinkButton>
                        </li>
                        <li>
                            <asp:UpdatePanel runat="server" ID="lnkimportUpdate">
                                <ContentTemplate>
                                    <asp:LinkButton ID="lnkImportCommunity" runat="server" OnClick="lnkImportCommunity_Click" Visible="false">
                                        <span class="sprite ic-assigngroup"></span>
                                        <asp:Literal runat="server" ID="Literal9" Text="<%$Resources:Community,lnk_Import_Community %>"></asp:Literal>
                                    </asp:LinkButton>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="lnkImportCommunity" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </li>
                    </ul>
                </div>


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
                                                <label for="txtCommunityNO" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal10" Text="<%$Resources:Community,mdlCC_CommnityNo_Label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox type="number" MaxLength="5" runat="server" class="form-control textboxFormat required "
                                                        ID="txtCommunityNumber" placeholder="<%$Resources:Community,mdlCC_CommnityNO_PlaceHolder %> "
                                                        data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtCommunityNumber" ControlToValidate="txtCommunityNumber"
                                                        ValidationGroup="Community" ErrorMessage="Please enter community number" ForeColor="Red"
                                                        Display="Dynamic" />
                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtCommunityNumber" ID="RegularExpressionValidator1"
                                                        ValidationExpression="^[\s\S]{0,5}$" ValidationGroup="Community" runat="server" ForeColor="Red" ErrorMessage="Maximum 5 characters allowed"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtCommunity" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal3" Text="<%$Resources:Community,mdlCC_Commnity_Label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required "
                                                        ID="txtCommunity" placeholder="<%$Resources:Community,mdlCC_Commnity_PlaceHolder %> "
                                                        data-placement="top" data-trigger="manual" />
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtCommunity" ControlToValidate="txtCommunity"
                                                        ValidationGroup="Community" ErrorMessage="Please enter community" ForeColor="Red"
                                                        Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlDistrict" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal4" Text="<%$Resources:Community,mdlCC_District_Label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6 comu_Dist_Select_width">
                                                    <asp:DropDownList ID="ddlDistrict" AutoPostBack="true" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:CustomValidator runat="server" ID="custValid_District" ControlToValidate="ddlDistrict" OnServerValidate="custValid_District_ServerValidate"
                                                        ForeColor="Red" ErrorMessage="Please select District" ValidationGroup="Community" Display="Dynamic"></asp:CustomValidator>
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
                                <asp:Label ID="Label1" runat="server" CssClass="mdlFooterMessage">
                                    <span class="required">*</span>
                                    <asp:Literal runat="server" ID="Literal38" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                                </asp:Label>
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" ValidationGroup="Community" Text="<%$Resources:Community,mdlCC_Save %> " OnClick="btnSave_Click" />
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
                                                    <asp:Literal runat="server" ID="Literal11" Text="<%$Resources:Community,mdlUC_Community_Label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <%--<asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="TextBox1" placeholder="<%$Resources:Community,mdlUC_Community_placeHolder %>" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />--%>
                                                    <asp:Label runat="server" ID="lblCommunityNumberValue" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtEditCommunity" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal6" Text="<%$Resources:Community,mdlUC_Community_Label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6">
                                                    <asp:TextBox type="text" runat="server" class="form-control textboxFormat required "
                                                        ID="txtEditCommunity" placeholder="<%$Resources:Community,mdlUC_Community_placeHolder %>"
                                                        data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." />
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvtxtEditCommunity" ControlToValidate="txtEditCommunity"
                                                        ValidationGroup="CommunityEdit" ErrorMessage="Please enter community" ForeColor="Red"
                                                        Display="Dynamic" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlDistrictEdit" class="col-sm-4 control-label">
                                                    <asp:Literal runat="server" ID="Literal7" Text="<%$Resources:Community,mdlUC_District_Label %>"></asp:Literal>
                                                    <span class="required">*</span></label>
                                                <div class="col-sm-6 comu_Dist_Select_width">
                                                    <asp:DropDownList ID="ddlDistrictEdit" AutoPostBack="true" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:CustomValidator runat="server" ID="cust_Valid_DistrictEdit" ControlToValidate="ddlDistrictEdit" ValidationGroup="CommunityEdit" OnServerValidate="cust_Valid_DistrictEdit_ServerValidate"
                                                        ForeColor="Red" ErrorMessage="Please select District" Display="Dynamic"></asp:CustomValidator>

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
                                <asp:Label ID="Label2" runat="server" CssClass="mdlFooterMessage">
                                    <span class="required">*</span>
                                    <asp:Literal runat="server" ID="Literal12" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                                </asp:Label>
                                <asp:Button ID="btnSaveEdit" runat="server" class="btn btn-primary" ValidationGroup="CommunityEdit" Text="<%$Resources:Community,mdlUC_Save %>" OnClick="btnSaveEdit_Click" />
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
                                                <asp:Label runat="server" ID="lblCommunityDelConfirm" class="col-sm- control-label alertBodyContentAlign" Text="<%$Resources:Community,mdlDel_Delete_Confirm_Text %>"></asp:Label>
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
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="myModalLabel22">
                                            <asp:Literal runat="server" ID="ltlAlertHeader" Text="<%$Resources:Community,mdlAlrt_Head_Alert %>"></asp:Literal>

                                        </h3>
                                    </div>

                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <%--<label   class="col-sm- control-label" style="width: 320px;">Are&nbsp;you&nbsp;sure&nbsp;to&nbsp;delete&nbsp;group&nbsp?.</label>--%>
                                                <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label alertBodyContentAlign padLR10"></asp:Label>

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


                       <div class="modal fade" id="mdlCommunityImportConfirm" tabindex="-1" role="dialog" aria-labelledby="myCommunityImportConfirmLabel"
                    aria-hidden="true" data-dismiss="modal">
                    <div class="modal-dialog modal-dlg-top">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myCommunityImportConfirmLabel">
                                    <asp:Literal ID="ltlCommunityImportChangeAlert" runat="server" Text="<%$ Resources:Community, mdlImport_Confm_Header %>" />
                                </h4>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <asp:Label ID="lblCommunityImportConfirmation" runat="server" class="col-sm- control-label  padLR10 alertBodyContentAlign"
                                                    Text="<%$ Resources:Community, MSG_Excel_Import_Format %>">
                                                </asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblUploadNeed" Text="<%$ Resources:Community, MSG_Select_Excel_Import %>" Visible="false" ForeColor="Red"/>
                                            </div>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                    </div>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnCommunityImportConfirmOk" />
                                    <asp:AsyncPostBackTrigger ControlID="gvCommunity" />
                                </Triggers>
                            </asp:UpdatePanel>
                              <div id="LoaderDiv" align="center" style="display: none">
                                <img src="../Content/Images/loader.gif" />&nbsp;&nbsp; Please wait...</div>
                            <div class="modal-footer">
                                <asp:Button ID="btnCommunityImportConfirmOk" runat="server" OnClick="btnCommunityImportConfirmOk_Click" class="btn btn-primary" Text=" <%$ Resources:Community, btnImport_Text%> " />
                                <asp:Button ID="btnDBChangeCancel" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" <%$ Resources:Config, mdlCancel %> " />
                            </div>
                        </div>
                    </div>
                </div>

        
            </div>

            <div class="table-block clearfix col-md-12">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvCommunity" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="CommunityUniqID,COMMUNITY_NO,DISTRICT_NO"
                            AllowPaging="true" PagerSettings-Mode="Numeric" OnPageIndexChanging="gvCommunity_PageIndexChanging"
                            ShowHeaderWhenEmpty="true" OnRowCommand="gvCommunity_RowCommand"
                            DataSourceID="CommunityObjectSource" OnLoad="GridView_Load" OnRowCreated="GridView_RowCreated"
                            EmptyDataText="<%$Resources:Community,gvComm_EmptyData_Text %> " EmptyDataRowStyle-HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="#DEDEDE" />
                            <HeaderStyle CssClass="gridheader" />
                            <PagerStyle CssClass="gridpager" HorizontalAlign="Right" />
                            <Columns>
                                <asp:BoundField DataField="CommunityUniqID" Visible="false" />
                                <asp:BoundField DataField="COMMUNITYNAME" HeaderText="<%$Resources:Community,gvComm_Hd_CommnName %> " />
                                <asp:BoundField DataField="DISTRICTNAME" HeaderText="<%$Resources:Community,gvComm_Hd_District %>" ItemStyle-Width="35%" />
                                <asp:TemplateField HeaderText="<%$Resources:Community,gvComm_Hd_Actions %> " ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Editing" CssClass="sprite delete" CommandArgument='<%#Eval("CommunityUniqID")+";"+Eval("COMMUNITY_NO")+";"+Eval("DISTRICT_NO")%>' />
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Deleting" CssClass="sprite edit" CommandArgument='<%#Eval("CommunityUniqID") +";"+Eval("COMMUNITYNAME") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BorderStyle="None" BorderWidth="0px" />
                        </asp:GridView>

                        <asp:ObjectDataSource runat="server" ID="CommunityObjectSource" SelectMethod="BindCommunityDetailsData"></asp:ObjectDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


        </div>
    </div>
</asp:Content>
