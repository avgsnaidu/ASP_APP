﻿<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="Configuration.aspx.cs" Inherits="VideoOnDemand.Admin.Configuration" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>

<asp:Content ID="ConfigurationContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">

    <script type="text/javascript">

        /*Active Directory Configuration Loader*/
        function HideLoaderDiv() {
            $("#LoaderDiv").hide();
        }

        function ShowLoaderDiv() {
            if (Page_ClientValidate("")) {
              $("#LoaderDiv").show();
            }
        }

        function performCheck() {
            if (Page_ClientValidate("ADInfo")) {
                ShowLoaderDiv();
                return true;
            }
            else {
                HideLoaderDiv();
                return false;
            }
        }

        /*Email Server Configuration Loader*/
        function HideEmailServerLoaderDiv() {
            $("#EmailSeverLoaderDiv").hide();
        }

        function ShowEmailServerLoaderDiv() {
            if (Page_ClientValidate("")) {
                $("#EmailSeverLoaderDiv").show();
            }
        }

        function performEmailCheck() {
            if (Page_ClientValidate("EmailServer")) {
                ShowEmailServerLoaderDiv();
                return true;
            }
            else {
                HideEmailServerLoaderDiv();
                return false;
            }
        }

        /*Super Admin Configuration Loader*/
        function HideSuperAdminLoaderDiv()
        {
            $("#SuperAdminLoaderDiv").hide();
        }

        function ShowSuperAdminLoaderDiv() {
            if (Page_ClientValidate("")) {
                $("#SuperAdminLoaderDiv").show();
            }
        }

        function performSuperAdminCheck()
        {
            if (Page_ClientValidate("SuperAdminInfo")) {
                ShowSuperAdminLoaderDiv();
                return true;
            }
            else {
                HideSuperAdminLoaderDiv();
                return false;
            }
        }

        $(document).ready(function () {
            $("#btnAdSave").click(function () {
                performCheck();
            });
            $("#btnEmailSerSave").click(function () {
                performEmailCheck();
            });

            $("#btnSuperAdminSave").click(function () {
                performSuperAdminCheck();
            });
        });

    </script>

    <div class="container">
        <div id="management-bottom" class="col-md-12 padLR10 configuration-wrap">

            <div class="block1  configgurationBlock clearfix">
                <div class="col-md-12 configPanel">
                    <ul class="configTabs">
                        <li class="configTab cft1">
                            <asp:LinkButton CssClass="active" runat="server" ID="lnkConfiguration" TabIndex="-1">
                                <span class="iconLump iconConfig"></span>
                                <asp:Literal ID="Literal35" runat="server" Text="<%$ Resources:Config, mHd_Config_text%>" />
                            </asp:LinkButton></li>
                        <li class="configTab cft2">
                            <asp:LinkButton runat="server" ID="lnkCommunity" TabIndex="-1" OnClick="lnkCommunity_Click">
                                <span class="iconLump iconCommuni"></span>
                                <asp:Literal ID="Litercal5" runat="server" Text="<%$ Resources:Config, mHd_Commnity_text%>" />
                            </asp:LinkButton></li>
                        <li class="configTab cft3">
                            <asp:LinkButton runat="server" ID="lnkDistrict" TabIndex="-1" OnClick="lnkDistrict_Click">
                                <span class="iconLump iconDistrits"></span>
                                <asp:Literal ID="Literacl6" runat="server" Text="<%$ Resources:Config, mHd_District_text%>" />
                            </asp:LinkButton></li>
                        <li class="configTab cft4">
                            <asp:LinkButton runat="server" ID="lnkRoads" TabIndex="-1" OnClick="lnkRoads_Click">
                                <span class="iconLump iconRoads"></span>
                                <asp:Literal ID="Literacl7" runat="server" Text="<%$ Resources:Config, mHd_Road_text%>" />
                            </asp:LinkButton></li>
                        <li>
                            <asp:LinkButton runat="server" ID="btnUpBackSubmit" OnClick="btnUpBackSubmit_Click"
                                Text="<%$Resources:Config,btnTopBack_Text %>">
                            </asp:LinkButton></li>
                    </ul>
                </div>
            </div>

            <div class="modal fade" id="mdlDbSetup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">
                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Config,mdlDB_Header %>" />

                            </h4>
                        </div>
                        <asp:HiddenField ID="hdConfigId" runat="server" />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="txtIpAddress" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Config,mdlDB_IPAddress %>" />

                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control required textboxFormat"
                                                    ID="txtIpAddress" placeholder="Ip Address" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid IpAddress" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvTxtIPAddress" ControlToValidate="txtIPAddress" ValidationGroup="DbSetup" ErrorMessage="<%$Resources:Config,mdlDB_IPAddress_Need %> " ForeColor="Red" Display="Dynamic" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPort" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Config,mdlDB_Port %>" />
                                                <span class="required"></span>
                                            </label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtPort" runat="server" class="form-control textboxFormat required"
                                                    placeholder="Port" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Port" />
                                                <asp:RegularExpressionValidator runat="server" ID="revPort" ValidationGroup="DbSetup" ValidationExpression="^(102[0-4]|10[0-1]\d|[1-9][0-9]{0,3}|0)$"
                                                    ForeColor="Red" ControlToValidate="txtPort" Display="Dynamic" ErrorMessage="<%$Resources:Config,mdlDB_Port_Valid %>" />

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDatabase" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Config,mdlDB_DbName %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" ID="txtDatabase" class="form-control textboxFormat required NoEmpty onlynumbers"
                                                    name="" placeholder="Database Name" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Database"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvDatabaseName" ControlToValidate="txtDatabase" ValidationGroup="DbSetup"
                                                        ErrorMessage="<%$Resources:Config,mdlDB_DbName_Need %> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtUserId" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Config,mdlDB_UserId %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtUserId" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="User Id" data-placement="bottom" data-trigger="manual" data-content="Enter Valid UserId"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvUserId" ControlToValidate="txtUserId" ValidationGroup="DbSetup"
                                                        ErrorMessage="<%$Resources:Config,mdlDB_UserId_Need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtADPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Config,mdlDB_password %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" TextMode="Password" ID="txtDbPassword" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtDbPassword" ValidationGroup="DbSetup"
                                                        ErrorMessage="<%$Resources:Config,mdlDB_Pwd_Need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="connectionErrorDiv">
                                                <asp:CustomValidator ID="validConnectionString" ControlToValidate="txtDbPassword" OnServerValidate="validConnectionString_ServerValidate" runat="server"
                                                    ErrorMessage="<%$Resources:Config,DB_Connection_Entered_NotValid %>" ValidationGroup="DbSetup" ForeColor="#E2351D" Display="Dynamic" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSaveDb" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Label ID="Label2" runat="server" CssClass="mdlFooterMessage">
                                <span class="required">*</span>
                                <asp:Literal runat="server" ID="Literal54" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                            </asp:Label><asp:Button ID="btnSaveDb" runat="server" class="btn btn-primary" OnClick="btnSaveDB_Click" ValidationGroup="DbSetup"
                                Text="<%$Resources:Config,mdlDB_Save %> " />
                            <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlDB_Cancel %>" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="mdlDBChangeConfirm" tabindex="-1" role="dialog" aria-labelledby="myDBChangeConfirmLabel"
                aria-hidden="true" data-dismiss="modal">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myDBChangeConfirmLabel">
                                <asp:Literal ID="ltlDatabaseChangeAlert" runat="server" Text="<%$ Resources:Config, mdlDbChange_Confm_Header %>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:Label ID="lblDbChnageConfirmation" runat="server" class="col-sm- control-label  padLR10 alertBodyContentAlign"
                                                Text="<%$ Resources:Config, mdlDbChange_Confm_Content %>"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnDBChangeConfirmOk" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Button ID="btnDBChangeConfirmOk" runat="server" OnClick="btnDBChangeConfirmOk_Click" class="btn btn-primary" Text=" <%$ Resources:Config, mdlDBChange_btnChangCofrm %> " />
                            <asp:Button ID="btnDBChangeCancel" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" <%$ Resources:Config, mdlCancel %> " />
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="mdlNewDbCreateConfirm" tabindex="-1" role="dialog" aria-labelledby="myNewDbCreateLabel"
                aria-hidden="true" data-dismiss="modal">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myNewDbCreateLabel">
                                <asp:Literal ID="ltlNewDbCreate" runat="server" Text="<%$ Resources:Config, mdlNewDbCreate_Confm_Header %>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:Label ID="lblCreateNewDBMessage" runat="server" class="col-sm- control-label  padLR10 alertBodyContentAlign"
                                                Text="<%$ Resources:Config, mdlNewDbCreate_Confm_Content %>"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnCreateNewDbSetup" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Button ID="btnCreateNewDbSetup" runat="server" OnClick="btnCreateNewDbSetup_Click" class="btn btn-primary" Text=" <%$ Resources:Config, mdlCreateDB_btntext %> " />
                            <asp:Button ID="btnCreateDBCancel" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" <%$ Resources:Config, mdlCancel %> " />
                        </div>
                    </div>
                </div>
            </div>

            <%--DB Details--%>
            <%--  <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="block1 configTabContent clearfix">
                        <table class="col-md-12 title1">
                            <tr>
                                <td width="93%">
                                    <h2 class="col-md-12 title1">
                                        <asp:Literal ID="ltlConfigHead" runat="server" Text="<%$Resources:Config,hd_DBConnection %>" />
                                    </h2>
                                </td>
                                <td width="7%">
                                    <div class="col-md-12 title1">
                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" ID="lnkEditDBDInfo" Font-Size="14px" OnClick="lnkEditDBDInfo_Click">
                                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Config,hd_DBC_Edit_Text %>" />
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="table-block table-border-margin clearfix col-md-12">
                        <div>
                            <table style="background: #dcdbdb" class="configDataTable">
                                <tr>
                                    <td width="50%">
                                        <div class="table-block clearfix col-md-8">
                                            <div class="leftField">
                                                <asp:Label ID="lblIpAddress" runat="server" Text="<%$Resources:Config,DB_IPAdderess%>"></asp:Label>
                                            </div>
                                            <div class="rightField">
                                                <asp:Label ID="txtAddress" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                    <td width="50%">
                                        <div class="table-block clearfix col-md-8">
                                            <div class="leftField">
                                                <asp:Label ID="lblPort" runat="server" Text="<%$Resources:Config,DB_Port%> " Width="170"></asp:Label>
                                            </div>
                                            <div class="rightField">
                                                <asp:Label ID="lblDataPort" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        <div class="table-block clearfix col-md-8">
                                            <div class="leftField">
                                                <asp:Label ID="lblDatabase" runat="server" Text="<%$Resources:Config,DB_Database%> " Width="170"></asp:Label>
                                            </div>
                                            <div class="rightField">
                                                <asp:Label ID="lbltxtDatabase" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                    <td width="50%">
                                        <div class="table-block clearfix col-md-8">
                                            <div class="leftField">
                                                <asp:Label ID="lblUserId" runat="server" Text="<%$Resources:Config,DB_UserId%>" Width="170"></asp:Label>
                                            </div>
                                            <div class="rightField">
                                                <asp:Label ID="txtUser" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        <div class="table-block clearfix col-md-8">
                                            <div class="leftField">
                                                <asp:Label ID="lblPassword" runat="server" Text="<%$Resources:Config,DB_Password%> " Width="170"></asp:Label>
                                            </div>
                                            <div class="rightField">
                                                <asp:Label ID="lblDataPassword" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                    <td width="50%">&nbsp; </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lnkEditDBDInfo" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>--%>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="block1 clearfix">
                        <table class="col-md-12 title1">
                            <tr>
                                <td width="93%">
                                    <h2 class="col-md-12 title1">

                                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources:Config,hd_ADDetails %>" />
                                    </h2>
                                </td>
                                <td width="7%">
                                    <div class="col-md-12 title1">
                                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" ID="lnkEditAD" Font-Size="14px" OnClick="lnkEditAD_Click">

                                                    <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Config,hd_AD_Edit_Text %>" />
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="table-block table-border-margin clearfix col-md-12">
                        <table style="background: #dcdbdb" class="configDataTable">
                            <tr>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblADServerId" runat="server" Text="<%$Resources:Config,AD_ServerId%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblADServerIdValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblADUserName" runat="server" Text="<%$Resources:Config,AD_username%>" Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblADUserNameValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblADPassword" runat="server" Text="<%$Resources:Config,AD_Password%>" Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblADPasswordValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblDomain" runat="server" Text="<%$Resources:Config,AD_Domain%>  " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblDomainValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <%--VOD Details--%>
                    <div class="block1 clearfix">
                        <table class="col-md-12 title1">
                            <tr>
                                <td width="93%">
                                    <h2 class="col-md-12 title1">
                                        <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Config,hd_VOD %>" />
                                    </h2>
                                </td>
                                <td width="7%">
                                    <div class="col-md-12 title1">
                                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" ID="lnkEditVOD" Font-Size="14px" OnClick="lnkEditVOD_Click">

                                                    <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Config,hd_VOD_Edit_Text %>" />
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="table-block table-border-margin clearfix col-md-12">
                        <table style="background: #dcdbdb" class="configDataTable">
                            <tr>
                                <td>
                                    <div class="table-block clearfix col-md-12">
                                        <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold; padding-left: 0;">
                                            <asp:Label ID="lblSrcFolder" runat="server" Text="<%$Resources:Config,VOD_Source%> "></asp:Label>
                                        </div>
                                        <div class="col-md-9 pull-right" style="word-wrap: break-word;">
                                            <asp:Label ID="lblSrcFolderValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="table-block clearfix col-md-12">
                                        <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold; padding-left: 0;">
                                            <asp:Label ID="lblDestFolder" runat="server" Text="<%$Resources:Config,VOD_Dest%>"></asp:Label>
                                        </div>
                                        <div class="col-md-9 pull-right" style="word-wrap: break-word;">
                                            <asp:Label ID="lblDestFolderValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="table-block clearfix col-md-12">
                                        <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold; padding-left: 0;">
                                            <asp:Label ID="lblArchiveFolder" runat="server" Text="<%$Resources:Config,VOD_Archive%>"></asp:Label>
                                        </div>
                                        <div class="col-md-9 pull-right" style="word-wrap: break-word;">
                                            <asp:Label ID="lblArchiveFolderValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="table-block clearfix col-md-12">
                                        <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold; padding-left: 0;">
                                            <asp:Label ID="lblBackUp" runat="server" Text="<%$Resources:Config,VOD_BackUp%>"></asp:Label>
                                        </div>
                                        <div class="col-md-9 pull-right" style="word-wrap: break-word;">
                                            <asp:Label ID="txtBack" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="table-block clearfix col-md-12">
                                        <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold; padding-left: 0;">
                                            <asp:Label ID="lblSchedule" runat="server" Text="<%$Resources:Config,VOD_Interval%> "></asp:Label>
                                        </div>
                                        <div class="col-md-9 pull-right">
                                            <asp:Label ID="lblScheduleValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="table-block clearfix col-md-12">
                                        <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold; padding-left: 0;">
                                            <asp:Label ID="lblVideoConversion" runat="server" Text="<%$Resources:Config,VOD_Videoconvertions%>"></asp:Label>
                                        </div>
                                        <div class="col-md-9 pdLeft0 pull-right">
                                            <asp:Label ID="lblVideoConversionValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <%--Super Admin Details--%>
                    <div class="block1 clearfix">
                        <table class="col-md-12 title1">
                            <tr>
                                <td width="93%">
                                    <h2 class="col-md-12 title1">
                                        <asp:Literal ID="Literal25" runat="server" Text="<%$Resources:Config,hd_SAdmin %>" />
                                    </h2>
                                </td>
                                <td width="7%">
                                    <div class="col-md-12 title1">
                                        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" ID="lnkEditSuperAdmin" Font-Size="14px" OnClick="lnkEditSuperAdmin_Click">

                                                    <asp:Literal ID="Literal26" runat="server" Text="<%$Resources:Config,hd_SAD_Edit_Text%>" />
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="table-block table-border-margin clearfix col-md-12">
                        <table style="background: #dcdbdb" class="configDataTable">
                            <tr>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblSuperUser" runat="server" Text="<%$Resources:Config,SAD_Username%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="txtSuperUser" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblAdminPassword" runat="server" Text="<%$Resources:Config,SAD_Pwd%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblAdminPasswordValue" runat="server" Text="***"></asp:Label><asp:LinkButton ID="lnkResetPassword" runat="server" OnClick="lnkResetPassword_Click">
                                                <asp:Literal ID="Literal30" runat="server" Text="<%$Resources:Config,lbl_SAD_ResetPassword %>" />
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblEmail" runat="server" Text="<%$Resources:Config,SAD_Email%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="txtEmail" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">&nbsp; </td>
                            </tr>
                        </table>
                    </div>

                    <%--Email Server Details--%>
                    <div class="block1 clearfix">
                        <table class="col-md-12 title1">
                            <tr>
                                <td width="93%">
                                    <h2 class="col-md-12 title1">
                                        <asp:Literal ID="Literal34" runat="server" Text="<%$Resources:Config,hd_EmailServeDetails %>" />
                                    </h2>
                                </td>
                                <td width="7%">
                                    <div class="col-md-12 title1">
                                        <asp:UpdatePanel runat="server" ID="EditbuttonEmailServer">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" ID="lnkEmailServerEdit" Font-Size="14px" OnClick="lnkEmailServerEdit_Click" Text="<%$Resources:Config,hd_EmalSD_Edit_Text%>">
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="table-block table-border-margin clearfix col-md-12">
                        <table style="background: #dcdbdb" class="configDataTable">
                            <tr>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblesdServerNametext" runat="server" Text="<%$Resources:Config,ESD_ServerName%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblEsdServernameValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblESDPort" runat="server" Text="<%$Resources:Config,ESD_Port%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblESDPortValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">

                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblESDUserName" runat="server" Text="<%$Resources:Config,ESD_UserName%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblESDUserNameValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">

                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblESDPwd" runat="server" Text="<%$Resources:Config,ESD_Pwd%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblESDPwdValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblESDEmailType" runat="server" Text="<%$Resources:Config,ESD_EmailType%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblESDEmailTypeValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">

                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblESDTlsEnabled" runat="server" Text="<%$Resources:Config,lblEncryptionType_Text%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblESDEncryptionTypeValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="50%">

                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblESDReplyEmail" runat="server" Text="<%$Resources:Config,ESD_ReplyEmail%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblESDReplyEmailValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">

                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblESDSenderName" runat="server" Text="<%$Resources:Config,ESD_SenderName%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblESDSenderNameValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%--<tr>
                                <td width="50%">

                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblSSLEnabled" runat="server" Text="<%$Resources:Config,ESD_SSLEnabled%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblSSLEnabledValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>--%>
                        </table>
                    </div>

                    <%--Streaming server Details--%>
                    <div class="block1 clearfix">
                        <table class="col-md-12 title1">
                            <tr>
                                <td width="93%">
                                    <h2 class="col-md-12 title1">
                                        <asp:Literal ID="Literal32" runat="server" Text="<%$Resources:Config,hd_StrServeDetails %>" />
                                    </h2>
                                </td>
                                <td width="7%">
                                    <div class="col-md-12 title1">
                                        <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" ID="lnkServerDetEdit" Font-Size="14px" OnClick="lnkServerDetEdit_Click">
                                                    <asp:Literal ID="Literal33" runat="server" Text="<%$Resources:Config,hd_SSD_Edit_Text%>" />
                                                </asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="table-block table-border-margin clearfix col-md-12">
                        <table style="background: #dcdbdb" class="configDataTable">
                            <tr>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblStreamingServerText" runat="server" Text="<%$Resources:Config,SSD_StremServer%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblSSDServerNameValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                                <td width="50%">
                                    <div class="table-block clearfix col-md-8">
                                        <div class="leftField">
                                            <asp:Label ID="lblSSDPortText" runat="server" Text="<%$Resources:Config,SSD_Port%> " Width="170"></asp:Label>
                                        </div>
                                        <div class="rightField">
                                            <asp:Label ID="lblSSDPortValue" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <%--      <tr>

                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div class="leftField">
                                    <asp:Label ID="lblSSDUserIdText" runat="server" Text="<%$Resources:Config,SSD_UserName%> " Width="170"></asp:Label>
                                </div>
                                <div class="rightField">
                                    <asp:Label ID="lblSSDUserIdValue" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>

                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div class="leftField">
                                    <asp:Label ID="lblSSDPasswordText" runat="server" Text="<%$Resources:Config,SSD_Pwd%> " Width="170"></asp:Label>
                                </div>
                                <div class="rightField">
                                    <asp:Label ID="lblSSDPasswordValue" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>--%>
                        </table>
                    </div>

                    <asp:Panel ID="modelPanel" runat="server" Style="display: none; background-color: #C0C0C0;">
                        <img src="App_Themes/Themes/progress.gif" alt="Loading..." />
                        <asp:HiddenField ID="hiddenField" runat="server" />
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lnkEditVOD" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkEditAD" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkEmailServerEdit" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkServerDetEdit" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkEditSuperAdmin" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkEditSuperAdmin" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lnkResetPassword" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

            <div class="modal fade" id="myActiveDirectory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="H1">
                                <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Config,mdlAD_Header %>" />

                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:HiddenField ID="hdAdConfigId" runat="server" />
                                            <label for="txtADServerId" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Config,mdlAD_ServerId %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtADServerId" placeholder="Server Id" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid ServerId" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADServerId" ControlToValidate="txtADServerId" ValidationGroup="ADInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlAD_ServerId_need %> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ID="rfvServerId" ValidationGroup="ADInfo"
                                                        ValidationExpression="^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$" ForeColor="Red"
                                                        ControlToValidate="txtADServerId" ErrorMessage="<%$Resources:Config,mdlAD_ServerId_Valid %>" Display="Dynamic" />

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtUsername" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal12" runat="server" Text="<%$Resources:Config,mdlAD_UserName%>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtUsername" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Username" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Username" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADUserName" ControlToValidate="txtUsername" ValidationGroup="ADInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlAD_Username_need %> " ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtADPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Config,mdlAD_Password%>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" TextMode="Password" runat="server" ID="txtADPassword" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvtxtADPassword" ControlToValidate="txtADPassword" ValidationGroup="ADInfo"
                                                        ErrorMessage="<%$Resources:Config,mdlAD_Password_need %> " ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDomain" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal14" runat="server" Text="<%$Resources:Config,mdlAD_Domain%>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtDomain" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Domain Name" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Domain Name"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvtxtDomain" ControlToValidate="txtDomain" ValidationGroup="ADInfo"
                                                        ErrorMessage="<%$Resources:Config,mdlAD_Domain_Need%> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>

                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAdSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div id="LoaderDiv" align="center" style="display:none"><img src="../Content/Images/loader.gif" />&nbsp;&nbsp; Please wait...</div>
                        <div class="modal-footer">
                            <asp:Label ID="Label3" runat="server" CssClass="mdlFooterMessage">
                                <span class="required">*</span>
                                <asp:Literal runat="server" ID="Literal55" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                            </asp:Label>
                            <asp:Button ID="btnAdSave" ClientIDMode="Static" runat="server" class="btn btn-primary" Text="<%$Resources:Config,mdlAD_Save%> " ValidationGroup="ADInfo" OnClick="btnSaveAD_Click" />
                            <asp:Button ID="Button2" runat="server" class="btn btn-primary" data-dismiss="modal" Text="<%$Resources:Config,mdlAD_Cancel%> " />
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="mdlVOD" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                            <h4 class="modal-title" id="H2">
                                <asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Config,mdlVOD_Header %>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:HiddenField ID="hdVODConfig" runat="server" />
                                            <label for="txtSrcFold" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal18" runat="server" Text="<%$Resources:Config,mdlVOD_SourceFolder %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtSrcFold" placeholder="Source Folder" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Source Folder" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtSourceFolder" ControlToValidate="txtSrcFold" EnableClientScript="true"
                                                    ValidationGroup="VODInfo" ErrorMessage="<%$Resources:Config,mdlVOD_SourceFolder_need %>" ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator><asp:CustomValidator runat="server" ID="custSourceVald" ControlToValidate="txtSrcFold" ValidationGroup="VODInfo" OnServerValidate="custSourceVald_ServerValidate"
                                                        ErrorMessage="<%$ Resources:Setup, VOD_SourceFold_Valid%>" Display="Dynamic" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDstFold" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal19" runat="server" Text="<%$Resources:Config,mdlVOD_Dest %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtDstFold" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Destination Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Destination Folder" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtDestFolder" ControlToValidate="txtDstFold" ValidationGroup="VODInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlVOD_Dest_need %>" ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator><asp:CustomValidator runat="server" ID="custDestValidator" ControlToValidate="txtDstFold" ValidationGroup="VODInfo" OnServerValidate="custDestValidator_ServerValidate"
                                                        ErrorMessage="<%$ Resources:Setup, VOD_DestinationFold_Valid%>" Display="Dynamic" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtArchiveFold" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal20" runat="server" Text="<%$Resources:Config,mdlVOD_Archive %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" ID="txtArchiveFold" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Archive Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Archive Folder"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvtxtArchiveFolder" ControlToValidate="txtArchiveFold" ValidationGroup="VODInfo"
                                                        ErrorMessage="<%$Resources:Config,mdlVOD_need %> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator><asp:CustomValidator runat="server" ID="custArchValidator" ControlToValidate="txtArchiveFold" ValidationGroup="VODInfo" OnServerValidate="custArchValidator_ServerValidate"
                                                            ErrorMessage="<%$ Resources:Setup, VOD_aRchiveFold_Valid%>" Display="Dynamic" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtBackupFold" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal21" runat="server" Text="<%$Resources:Config,mdlVOD_BackUp %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtBackupFold" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Backup Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Backup Folder"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvtxtBackUpFolder" ControlToValidate="txtBackupFold" ValidationGroup="VODInfo"
                                                        ErrorMessage="<%$Resources:Config,mdlVOD_BackUp_need %>" ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator><asp:CustomValidator runat="server" ID="custBackValidator" ControlToValidate="txtBackupFold" ValidationGroup="VODInfo" OnServerValidate="custBackValidator_ServerValidate"
                                                            ErrorMessage="<%$ Resources:Setup, VOD_BackupFolder_Valid%>" Display="Dynamic" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlInterval" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal22" runat="server" Text="<%$Resources:Config,mdlVOD_SchdInterval %>" />
                                                <span class="required">*</span></label>
                                            <div class="timeintevalCont">
                                                <div class="col-sm-3">
                                                    <div class="input1">
                                                        <div class="select-holder">
                                                            <asp:DropDownList ID="ddlInterval" runat="server" CssClass="span12">
                                                                <asp:ListItem Value="0" Text="Select" />
                                                                <asp:ListItem Value="1" Text="1 Hrs" />
                                                                <asp:ListItem Value="2" Text="2 Hrs" />
                                                                <asp:ListItem Value="3" Text="3 Hrs" />
                                                                <asp:ListItem Value="4" Text="4 Hrs" />
                                                                <asp:ListItem Value="5" Text="5 Hrs" />
                                                                <asp:ListItem Value="6" Text="6 Hrs" />
                                                                <asp:ListItem Value="7" Text="7 Hrs" />
                                                                <asp:ListItem Value="8" Text="8 Hrs" />
                                                                <asp:ListItem Value="9" Text="9 Hrs" />
                                                                <asp:ListItem Value="10" Text="10 Hrs" />
                                                                <asp:ListItem Value="11" Text="11 Hrs" />
                                                                <asp:ListItem Value="12 " Text="12 Hrs" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="label1 float-l">
                                                    <asp:Literal ID="Literal23" runat="server" Text="<%$Resources:Config,mdlVOD_SchdInterval_OrTime %>" />
                                                </span>
                                                <div class="float-l input2 timeIntr">
                                                    <div class="input-holder">
                                                        <asp:TextBox runat="server" type="time" ID="txtScheduleInterval"></asp:TextBox><span class="sprite interval"></span>
                                                    </div>
                                                </div>
                                                <asp:CustomValidator runat="server" ID="custIntervalValidator" CssClass="timeInterSpan" ControlToValidate="ddlInterval" ValidationGroup="VODInfo" OnServerValidate="custIntervalTimeValidator_ServerValidate"
                                                    ErrorMessage="<%$ Resources:Setup, VOD_IntervalOrTime_Valid%>" Display="Dynamic" ForeColor="Red" />
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="ddlSimultaneous" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal24" runat="server" Text="<%$Resources:Config,mdlVOD_Simul_Convertions %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <div id="SimultaniousSelect" class="select-holder">
                                                    <asp:DropDownList ID="ddlSimultaneous" runat="server">
                                                        <asp:ListItem Text="1" Value="1" />
                                                        <asp:ListItem Text="2" Value="2" />
                                                        <asp:ListItem Text="3" Value="3" />
                                                        <asp:ListItem Text="4" Value="4" />
                                                        <asp:ListItem Text="5" Value="5" />
                                                        <asp:ListItem Text="6" Value="6" />
                                                        <asp:ListItem Text="7" Value="7" />
                                                        <asp:ListItem Text="8" Value="8" />
                                                        <asp:ListItem Text="9" Value="9" />
                                                        <asp:ListItem Text="10" Value="10" />
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvddlSimultaneous" ControlToValidate="ddlSimultaneous"
                                                        ValidationGroup="VODInfo" ErrorMessage="<%$Resources:Config,mdlVOD_Simul_Convertions_Need %> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnVODSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Label ID="Label4" runat="server" CssClass="mdlFooterMessage">
                                <span class="required">*</span>
                                <asp:Literal runat="server" ID="Literal56" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                            </asp:Label>
                            <button runat="server" id="btnLoadingVOD" visible="false" class="btn btn-lg btn-warning"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span>Loading...</button><asp:Button ID="btnVODSave" runat="server" class="btn btn-primary" ValidationGroup="VODInfo" Text="<%$Resources:Config,mdlVOD_Save %>" OnClick="btnSaveVOD_Click" OnClientClick="EnableItem()" />
                            <asp:Button ID="btnVODCancel" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlVOD_Cancel %>  " />
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="superAdminResetPassword" tabindex="-1" role="dialog" aria-labelledby="SuperAdminPasswordLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="SuperAdminPasswordLabel">
                                <asp:Literal ID="Literal29" runat="server" Text="<%$Resources:Config,mdlRset_SAD_HeadText %>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <label for="txtOldPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal50" runat="server" Text="<%$Resources:Config,mdlRset_SAD_lblOldPwd_text %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox TextMode="Password" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtOldPassword" placeholder="<%$Resources:Config,mdlRset_SAD_lblOldPwd_placeHolder %>" data-placement="top" data-trigger="manual" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="txtOldPassword"
                                                    ValidationGroup="ResetPassword" ErrorMessage="<%$Resources:Config,mdlRset_SAD_lblOldPwd_Need %>" ForeColor="#E2351D"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtNewPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal51" runat="server" Text="<%$Resources:Config,mdlRset_SAD_lblNewPwd_text %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox TextMode="Password" ID="txtNewPassword" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="<%$Resources:Config,mdlRset_SAD_lblNewPwd_placeholder%>" data-placement="bottom" data-trigger="manual" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="txtNewPassword" ValidationGroup="ResetPassword"
                                                    ErrorMessage="<%$Resources:Config,mdlRset_SAD_lblNewPwd_Need%>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtRetypePwd" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal52" runat="server" Text="<%$Resources:Config,mdlRset_SAD_lblReTypePwd_text %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox TextMode="Password" runat="server" ID="txtRetypePwd" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="<%$Resources:Config,mdlRset_SAD_lblReTypePwd_placeHolder %>" data-placement="bottom" data-trigger="manual"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="txtRetypePwd" ValidationGroup="ResetPassword"
                                                        ErrorMessage="<%$Resources:Config,mdlSAD_retyPwd_need %>" Display="Dynamic" ForeColor="#E2351D"></asp:RequiredFieldValidator><asp:CompareValidator runat="server" ID="CompareValidator1" ControlToValidate="txtNewPassword" ValidationGroup="ResetPassword"
                                                            ControlToCompare="txtRetypePwd" Operator="Equal" Type="String" ForeColor="Red" Display="Dynamic" ErrorMessage="<%$Resources:Config,mdlSAD_retyPwd_valid %>" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnResetPwdSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                      
                        <div class="modal-footer">
                            <asp:Label ID="Label5" runat="server" CssClass="mdlFooterMessage">
                                <span class="required">*</span>
                                <asp:Literal runat="server" ID="Literal57" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                            </asp:Label><asp:Button ID="btnResetPwdSave" runat="server" ValidationGroup="ResetPassword" class="btn btn-primary" Text="<%$Resources:Config,mdlSAD_Save %> "
                                OnClick="btnResetPwdSave_Click" />
                            <asp:Button ID="Button4" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlSAD_Cancel %>" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="mySuperAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="H3">
                                <asp:Literal ID="Literal27" runat="server" Text="<%$Resources:Config,mdlSAD_Header %>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:HiddenField ID="hdSuperAdmin" runat="server" />
                                            <label for="txtSuperUsername" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal28" runat="server" Text="<%$Resources:Config,mdlSAD_Username %>" />
                                            </label>
                                            <div class="col-sm-7">
                                                <%--<asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtSuperUsername" placeholder="User Name" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Username" />--%>
                                                <asp:Label runat="server" ID="lblmdlSuperUserName"></asp:Label><%-- <asp:RequiredFieldValidator runat="server" ID="rfvtxtUserName" ControlToValidate="txtSuperUsername"
                                                    ValidationGroup="SuperAdminInfo" ErrorMessage="<%$Resources:Config,mdlSAD_Username_need %> " ForeColor="#E2351D"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSuperEmail" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal31" runat="server" Text="<%$Resources:Config,mdlSAD_Email %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtSuperEmail" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Email" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Email"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="rfvtxtMail" ControlToValidate="txtSuperEmail" ValidationGroup="SuperAdminInfo"
                                                        ErrorMessage="<%$Resources:Config,mdlSAD_Email_need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ID="revtxtMail" ValidationGroup="SuperAdminInfo"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtSuperEmail"
                                                            ErrorMessage="<%$Resources:Config,mdlSAD_Email_valid %> " Display="Dynamic" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSuperAdminSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                       <div id="SuperAdminLoaderDiv" align="center" style="display:none"><img src="../Content/Images/loader.gif" />&nbsp;&nbsp; Please wait...</div>
                        <div class="modal-footer">
                            <asp:Label ID="Label6" runat="server" CssClass="mdlFooterMessage">
                                <span class="required">*</span>
                                <asp:Literal runat="server" ID="Literal58" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                            </asp:Label><asp:Button ID="btnSuperAdminSave"  ClientIDMode="Static" runat="server" ValidationGroup="SuperAdminInfo" class="btn btn-primary" Text="<%$Resources:Config,mdlSAD_Save %> "
                                OnClick="btnSaveSuperAdmin_Click" />
                            <asp:Button ID="Button6" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlSAD_Cancel %>" />
                        </div>
                    </div>
                </div>
            </div>

            <%--Email Server Details--%>
            <div class="modal fade" id="mdlEmailServer" tabindex="-1" role="dialog" aria-labelledby="myESDModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myESDModalLabel">
                                <asp:Literal ID="Literal41" runat="server" Text="<%$Resources:Config,mdlESD_Header %>" />
                            </h4>
                        </div>

                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="txtEmailServerId" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal44" runat="server" Text="<%$Resources:Config,mdlESD_IPAddress %>" />

                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control required textboxFormat"
                                                    ID="txtEmailServerId" placeholder="<%$Resources:Config,mdlESD_servername_PlaceHolder %>" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid IpAddress" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtEmailServerId"
                                                    ValidationGroup="EmailServer" ErrorMessage="<%$Resources:Config,mdlESD_IPAddress_Need %> " ForeColor="Red" Display="Dynamic" />
                                                <%--<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationGroup="EmailServer"
                                                    ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])){3}$" ForeColor="Red"
                                                    ControlToValidate="txtEmailServerId" ErrorMessage="<%$Resources:Config,mdlESD_IPAddress_Valid %> " Display="Dynamic" />--%>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="txtEmailSerPort" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal45" runat="server" Text="<%$Resources:Config,mdlESD_Port %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="number" ID="txtEmailSerPort" runat="server" class="form-control textboxFormat required"
                                                    placeholder="<%$Resources:Config,mdlESD_Port_PlaceHolder %>" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Port" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtEmailSerPort" ValidationGroup="EmailServer"
                                                    ErrorMessage="<%$Resources:Config,mdlESD_Port_Need %> "
                                                    ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationGroup="EmailServer" ValidationExpression="^(102[0-4]|10[0-1]\d|[1-9][0-9]{0,3}|0)$"
                                                        ForeColor="Red" ControlToValidate="txtEmailSerPort" Display="Dynamic" ErrorMessage="<%$Resources:Config,mdlESD_Port_Valid %>" />

                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <label for="txtEmailSerUsername" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal42" runat="server" Text="<%$Resources:Config,mdlESD_Username %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtEmailSerUsername" placeholder="<%$Resources:Config,mdlESD_Username_PlaceHolder %>" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Username" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtEmailSerUsername"
                                                    ValidationGroup="EmailServer" ErrorMessage="<%$Resources:Config,mdlESD_Username_need %> " ForeColor="#E2351D"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEmailPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal46" runat="server" Text="<%$Resources:Config,mdlESD_password %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtEmailPassword" runat="server" class="form-control textboxFormat required NoEmpty" TextMode="Password"
                                                    placeholder="Password" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Password" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtEmailPassword" ValidationGroup="EmailServer"
                                                    ErrorMessage="<%$Resources:Config,mdlESD_password_need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEmailServReplyToEmail" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal43" runat="server" Text="<%$Resources:Config,mdlESD_Email %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtEmailServReplyToEmail" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="<%$Resources:Config,mdlESD_Email_placeholder %>" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Email"></asp:TextBox><asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="txtEmailServReplyToEmail" ValidationGroup="EmailServer"
                                                        ErrorMessage="<%$Resources:Config,mdlESD_Email_need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationGroup="EmailServer"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmailServReplyToEmail"
                                                            ErrorMessage="<%$Resources:Config,mdlESD_Email_valid %> " Display="Dynamic" />

                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <label for="txtEmailSenderName" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal47" runat="server" Text="<%$Resources:Config,mdlESD_Sender_name %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtEmailSenderName" placeholder="<%$Resources:Config,mdlESD_Sender_PlaceHolder %>" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Username" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtEmailSenderName"
                                                    ValidationGroup="EmailServer" ErrorMessage="<%$Resources:Config,mdlESD_Sender_need %> " ForeColor="#E2351D"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlESDMailType" class="col-sm-4 control-label">
                                                <asp:Literal runat="server" ID="Literal48" Text="<%$Resources:Config,mdlESD_EmailType %>"></asp:Literal><span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:Label ID="lblESDMailTypeValue" runat="server">
                                                    <asp:Literal runat="server" ID="Literal37" Text="<%$Resources:Config,mdlESD_EmailType_Text %>" />
                                                </asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="chkTlsEnabled" class="col-sm-4 control-label">
                                                <asp:Literal runat="server" ID="Literal49" Text="<%$Resources:Config,lblEncryptionType_Text %>"></asp:Literal><span class="required">*</span></label>
                                            <div class="col-sm-7 ">

                                                <asp:DropDownList ID="ddlEncryptType" runat="server">
                                                    <asp:ListItem Text="<%$Resources:Setup,SMTP_None_Text %>" Value="0" />
                                                    <asp:ListItem Text="<%$Resources:Setup,SMTP_SSLEnabled_Text %>" Value="1" />
                                                    <asp:ListItem Text="<%$Resources:Setup,SMTP_TLSEnabled_Text %>" Value="2" />
                                                </asp:DropDownList>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-7 ">
                                                <asp:CustomValidator ID="custValid_SMTP_Connection" runat="server" ErrorMessage="<%$  Resources:Setup,SMTP_MSG_Connection_Failed %>" ForeColor="#E2351D" ValidationGroup="EmailServer" Display="Dynamic" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnEmailSerSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div id="EmailSeverLoaderDiv" align="center" style="display:none"><img src="../Content/Images/loader.gif" />&nbsp;&nbsp; Please wait...</div>
                        <div class="modal-footer">
                            <asp:Label runat="server" CssClass="mdlFooterMessage">
                                <span class="required">*</span>
                                <asp:Literal runat="server" ID="Literal38" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                            </asp:Label>
                            <asp:Button ID="btnEmailSerSave" ClientIDMode="Static" runat="server" ValidationGroup="EmailServer" class="btn btn-primary" Text="<%$Resources:Config,mdlEsD_Save %> "
                                OnClick="btnEmailSerSave_Click" />
                            <asp:Button ID="Button5" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlEsD_Cancel %>" />
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="myAlertMsgModalLabel" aria-hidden="true" data-dismiss="modal">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">

                            <h4 class="modal-title" id="myAlertMsgModalLabel">
                                <asp:Literal ID="ltlalert" runat="server" Text="<%$ Resources:Config, AlertMsgModal_Header %>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label alertBodyContentAlign padLR10"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>

                        <div class="modal-footer">
                            <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text=" <%$ Resources:Config, ALM_btnOK_Text %> " />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Streaming Server Details -->
            <div class="modal fade" id="mdlStreamServer" tabindex="-1" role="dialog" aria-labelledby="mySSDModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="mySSDModalLabel">
                                <asp:Literal ID="Literal36" runat="server" Text="<%$Resources:Config,mdlSSD_Header %>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <asp:HiddenField ID="hdfStreaminServerId" runat="server" />
                                        <div class="form-group">
                                            <label for="txtStreaminServerId" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal39" runat="server" Text="<%$Resources:Config,mdlSsD_IPAddress %>" />

                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control required textboxFormat"
                                                    ID="txtStreaminServerId" placeholder="<%$Resources:Config,mdlSsD_servername_PlaceHolder %>" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid IpAddress" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtStreaminServerId" ValidationGroup="StreamingServer" ErrorMessage="<%$Resources:Config,mdlSsD_IPAddress_Need %> " ForeColor="Red" Display="Dynamic" />
                                                <%--   <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationGroup="StreamingServer" ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])){3}$" ForeColor="Red"
                                                    ControlToValidate="txtStreaminServerId" ErrorMessage="<%$Resources:Config,mdlSsD_IPAddress_Valid %> " Display="Dynamic" />--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtStrSerPort" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal40" runat="server" Text="<%$Resources:Config,mdlSsD_Port %>" />
                                                <%-- <span class="required">*</span>--%></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtStrSerPort" runat="server" class="form-control textboxFormat required"
                                                    placeholder="<%$Resources:Config,mdlSsD_Port_PlaceHolder %>" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Port" />
                                                <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtPort" ValidationGroup="StreamingServer"
                                                    ErrorMessage="<%$Resources:Config,mdlSsD_Port_Need %> "
                                                    ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationGroup="StreamingServer" ValidationExpression="^(102[0-4]|10[0-1]\d|[1-9][0-9]{0,3}|0)$"
                                                    ForeColor="Red" ControlToValidate="txtStrSerPort" Display="Dynamic" ErrorMessage="<%$Resources:Config,mdlSsD_Port_Valid %>" />--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-7 ">
                                                <asp:CustomValidator ID="cust_StreaminServer_Validator" runat="server" ErrorMessage="<%$  Resources:Config,MSG_SSD_Connection_Failed %>" ForeColor="#E2351D" ValidationGroup="StreamingServer" Display="Dynamic" />
                                            </div>
                                        </div>


                                        <%-- <div class="form-group">

                                            <label for="txtStremserUsername" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal37" runat="server" Text="<%$Resources:Config,mdlSSD_Username %>" />

                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtStremserUsername" placeholder="<%$Resources:Config,mdlSsD_Username_PlaceHolder %>" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Username" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtStremserUsername"
                                                    ValidationGroup="StreamingServer" ErrorMessage="<%$Resources:Config,mdlSsD_Username_need %> " ForeColor="#E2351D"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtStrserPwd" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal38" runat="server" Text="<%$Resources:Config,mdlSSD_password %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtStrserPwd"  TextMode="Password" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Password" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Password" />
                                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtStrserPwd" ValidationGroup="StreamingServer"
                                                    ErrorMessage="<%$Resources:Config,mdlSSD_password_need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>--%>
                                    </div>


                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnStreaminServerSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Label ID="Label1" runat="server" CssClass="mdlFooterMessage">
                                <span class="required">*</span>
                                <asp:Literal runat="server" ID="Literal53" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                            </asp:Label><asp:Button ID="btnStreaminServerSave" runat="server" ValidationGroup="StreamingServer" class="btn btn-primary" Text="<%$Resources:Config,mdlSsD_Save %> "
                                OnClick="btnStreaminServerSave_Click" />
                            <asp:Button ID="Button3" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlSsD_Cancel %>" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="block1 clearfix">
                <ul>
                    <li>
                        <asp:LinkButton ID="btnDownBackToHome" runat="server" OnClick="btnUpBackSubmit_Click" Text=" <%$ Resources:Config, btnTopBack_Text %>">
                        </asp:LinkButton></li>
                </ul>
            </div>

        </div>
    </div>
</asp:Content>
