<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="Configuration.aspx.cs" Inherits="VideoOnDemand.Admin.Configuration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>


<asp:Content ID="ConfigurationContent" ContentPlaceHolderID="VODContentPlaceHolder"
    runat="server">
    <%--  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <div class="container">
        <div id="management-bottom" class="col-md-12 padLR10 configuration-wrap">

            <div style="float: right; padding-right: 30px;">
                <br />
                <asp:LinkButton runat="server" ID="btnSubmit" CssClass="btn-type1" ForeColor="White" PostBackUrl="~/Archived.aspx"
                    Text="<%$Resources:Config,btnTopBack_Text %>">
                </asp:LinkButton>
                <br />
                &nbsp;
            </div>

            <div class="block1 clearfix">
                <table class="col-md-12 title1">
                    <tr>
                        <td width="93%">
                            <h2 class="col-md-12 title1">
                                <asp:Literal ID="ltlConfigHead" runat="server" Text="<%$Resources:Config,hd_DBConnection %>" />
                            </h2>
                        </td>
                        <td width="7%">
                            <div class="col-md-12 title1">
                                <asp:LinkButton runat="server" ID="LinkButton2" Font-Size="14px" PostBackUrl="#"
                                    data-toggle="modal" data-target="#myModal2">
                                    <span class="sprite ic-creategroup"></span>
                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Config,hd_DBC_Edit_Text %>" />

                                </asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
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
                                                <asp:RegularExpressionValidator runat="server" ID="revTxtIPAddress" ValidationGroup="DbSetup" ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])){3}$" ForeColor="Red"
                                                    ControlToValidate="txtIPAddress" ErrorMessage="<%$Resources:Config,mdlDB_IPAddress_Valid %> " Display="Dynamic" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPort" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Config,mdlDB_Port %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtPort" runat="server" class="form-control textboxFormat required"
                                                    placeholder="Port" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Port" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvport" ControlToValidate="txtPort" ValidationGroup="DbSetup"
                                                    ErrorMessage="<%$Resources:Config,mdlDB_Port_Need %> "
                                                    ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
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
                                                    data-content="Enter Valid Database"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvDatabaseName" ControlToValidate="txtDatabase" ValidationGroup="DbSetup"
                                                    ErrorMessage="<%$Resources:Config,mdlDB_DbName_Need %> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtUserId" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Config,mdlDB_UserId %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtUserId" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="User Id" data-placement="bottom" data-trigger="manual" data-content="Enter Valid UserId"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvUserId" ControlToValidate="txtUserId" ValidationGroup="DbSetup"
                                                    ErrorMessage="<%$Resources:Config,mdlDB_UserId_Need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtADPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Config,mdlDB_password %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" TextMode="Password" ID="txtADPassword" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtADPassword" ValidationGroup="DbSetup"
                                                    ErrorMessage="<%$Resources:Config,mdlDB_Pwd_Need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave" runat="server" class="btn btn-primary" OnClick="btnSaveDB_Click" ValidationGroup="DbSetup"
                                Text="<%$Resources:Config,mdlDB_Save %> " />
                            <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlDB_Cancel %>" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-block clearfix col-md-12">
                <div>
                    <table style="background: #dcdbdb">
                        <tr>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblIpAddress" runat="server" Text="<%$Resources:Config,DB_IPAdderess%>" Width="170"></asp:Label>
                                    </div>
                                    <div class="middle-rightchild">
                                        <asp:Label ID="txtAddress" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblPort" runat="server" Text="<%$Resources:Config,DB_Port%> " Width="170"></asp:Label>
                                    </div>
                                    <div class="middle-rightchild">
                                        <asp:Label ID="lblDataPort" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblDatabase" runat="server" Text="<%$Resources:Config,DB_Database%> " Width="170"></asp:Label>
                                    </div>
                                    <div class="middle-rightchild">
                                        <asp:Label ID="lbltxtDatabase" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblUserId" runat="server" Text="<%$Resources:Config,DB_UserId%>" Width="170"></asp:Label>
                                    </div>
                                    <div class="middle-rightchild">
                                        <asp:Label ID="txtUser" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblPassword" runat="server" Text="<%$Resources:Config,DB_Password%> " Width="170"></asp:Label>
                                    </div>
                                    <div class="middle-rightchild">
                                        <asp:Label ID="lblDataPassword" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">&nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

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
                                <asp:LinkButton runat="server" ID="lnkEditAD" Font-Size="14px" PostBackUrl="#" data-toggle="modal"
                                    data-target="#myActiveDirectory">
                                    <span class="sprite ic-creategroup"></span>
                                    <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Config,hd_AD_Edit_Text %>" />
                                </asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="table-block clearfix col-md-12">
                <table style="background: #dcdbdb">
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblServerId" runat="server" Text="<%$Resources:Config,AD_ServerId%> " Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="txtServer" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblADUserName" runat="server" Text="<%$Resources:Config,AD_username%>" Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="txtADUser" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblADPassword" runat="server" Text="<%$Resources:Config,AD_Password%>" Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="txtPassword" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblDomain" runat="server" Text="<%$Resources:Config,AD_Domain%>  " Width="170"></asp:Label>
                                </div>
                                <div style="float: right;" class="middle-rightchild">
                                    <asp:Label ID="lblDataDomain" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="modal fade" id="myActiveDirectory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
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
                                            <label for="txtServerId" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Config,mdlAD_ServerId %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtServerId" placeholder="Server Id" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid ServerId" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADServerId" ControlToValidate="txtServerId" ValidationGroup="ADInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlAD_ServerId_need %> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ID="rfvServerId" ValidationGroup="ADInfo"
                                                    ValidationExpression="^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$" ForeColor="Red"
                                                    ControlToValidate="txtServerId" ErrorMessage="<%$Resources:Config,mdlAD_ServerId_Valid %>" Display="Dynamic" />

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
                                            <label for="txtDBPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal13" runat="server" Text="<%$Resources:Config,mdlAD_Password%>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" TextMode="Password" runat="server" ID="txtDBPassword" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADPassword" ControlToValidate="txtDBPassword" ValidationGroup="ADInfo"
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
                                                    data-content="Enter Valid Domain Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtDomain" ControlToValidate="txtDomain" ValidationGroup="ADInfo"
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
                        <div class="modal-footer">
                            <asp:Button ID="btnAdSave" runat="server" class="btn btn-primary" Text="<%$Resources:Config,mdlAD_Save%> " ValidationGroup="ADInfo" OnClick="btnSaveAD_Click" />
                            <asp:Button ID="Button2" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlAD_Cancel%> " />
                        </div>
                    </div>
                </div>
            </div>

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
                                <asp:LinkButton runat="server" ID="lnkEditVOD" Font-Size="14px" PostBackUrl="#" data-toggle="modal"
                                    data-target="#myVOD">
                                    <span class="sprite ic-creategroup"></span>
                                    <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Config,hd_VOD_Edit_Text %>" />
                                </asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="table-block clearfix col-md-12">
                <table style="background: #dcdbdb">
                    <tr>
                        <td>
                            <div class="table-block clearfix col-md-12">
                                <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold; padding-left: 0;">
                                    <asp:Label ID="lblSrcFolder" runat="server" Text="<%$Resources:Config,VOD_Source%> "></asp:Label>
                                </div>
                                <div class="col-md-9 pull-right" style="word-wrap: break-word;">
                                    <asp:Label ID="txtSrcFolder" runat="server" Text=""></asp:Label>
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
                                    <asp:Label ID="txtDestFolder" runat="server" Text=""></asp:Label>
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
                                    <asp:Label ID="txtArchive" runat="server" Text=""></asp:Label>
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
                                    <asp:Label ID="txtSchedule" runat="server" Text=""></asp:Label>
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
                                    <asp:Label ID="txtVideo" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="modal fade" id="myVOD" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtSourceFolder" ControlToValidate="txtSrcFold"
                                                    ValidationGroup="VODInfo" ErrorMessage="<%$Resources:Config,mdlVOD_SourceFolder_need %>" ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator>

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
                                                    ErrorMessage="<%$Resources:Config,mdlVOD_Dest_need %>" ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtArchiveFold" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal20" runat="server" Text="<%$Resources:Config,mdlVOD_Archive %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" ID="txtArchiveFold" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Archive Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Archive Folder"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtArchiveFolder" ControlToValidate="txtArchiveFold" ValidationGroup="VODInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlVOD_need %> " ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtBackupFold" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal21" runat="server" Text="<%$Resources:Config,mdlVOD_BackUp %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtBackupFold" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Backup Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Backup Folder"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtBackUpFolder" ControlToValidate="txtBackupFold" ValidationGroup="VODInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlVOD_BackUp_need %>" ForeColor="#E2351D" Display="Dynamic"> </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlInterval" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal22" runat="server" Text="<%$Resources:Config,mdlVOD_SchdInterval %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-3">
                                                <div class="input1">
                                                    <div class="select-holder">
                                                        <asp:DropDownList ID="ddlInterval" runat="server" CssClass="span12">
                                                            <asp:ListItem Value="0" Text="Select" Selected="True" />
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
                                                    <asp:TextBox runat="server" type="time" ID="txtScheduleInterval"></asp:TextBox>
                                                    <span class="sprite interval"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlSimultaneous" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal24" runat="server" Text="<%$Resources:Config,mdlVOD_Simul_Convertions %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <div id="SimultaniousSelect" class="select-holder">
                                                    <asp:DropDownList ID="ddlSimultaneous" runat="server">
                                                        <asp:ListItem Text="1" Value="1" Selected="True" />
                                                        <asp:ListItem Text="2" Value="2" />
                                                        <asp:ListItem Text="3" Value="3" />
                                                        <asp:ListItem Text="4" Value="4" />
                                                        <asp:ListItem Text="5" Value="5" />
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
                            <asp:Button ID="btnVODSave" runat="server" class="btn btn-primary" ValidationGroup="VODInfo" Text="<%$Resources:Config,mdlVOD_Save %> " OnClick="btnSaveVOD_Click" />
                            <asp:Button ID="btnVODCancel" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlVOD_Cancel %>  " />
                        </div>
                    </div>
                </div>
            </div>

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
                                <asp:LinkButton runat="server" ID="lnkEditSuperAdmin" Font-Size="14px" PostBackUrl="#"
                                    data-toggle="modal" data-target="#mySuperAdmin">
                                    <span class="sprite ic-creategroup"></span>
                                    <asp:Literal ID="Literal26" runat="server" Text="<%$Resources:Config,hd_SAD_Edit_Text%>" />
                                </asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="table-block clearfix col-md-12">
                <table style="background: #dcdbdb">
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblSuperUser" runat="server" Text="<%$Resources:Config,SAD_Username%> " Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="txtSuperUser" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblAdminPassword" runat="server" Text="<%$Resources:Config,SAD_Pwd%> " Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="txtAdminPassword" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblEmail" runat="server" Text="<%$Resources:Config,SAD_Email%> " Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="txtEmail" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">&nbsp;
                        </td>
                    </tr>
                </table>
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

                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtSuperUsername" placeholder="User Name" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Username" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtUserName" ControlToValidate="txtSuperUsername"
                                                    ValidationGroup="SuperAdminInfo" ErrorMessage="<%$Resources:Config,mdlSAD_Username_need %> " ForeColor="#E2351D"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSupPassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal29" runat="server" Text="<%$Resources:Config,mdlSAD_password %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtSupPassword" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Password" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Password" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtPassword" ControlToValidate="txtSupPassword" ValidationGroup="SuperAdminInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlSAD_password_need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSupRetypePassword" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal30" runat="server" Text="<%$Resources:Config,mdlSAD_retyPwd %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" ID="txtSupRetypePassword" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Retype Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtConfmPwd" ControlToValidate="txtSupRetypePassword" ValidationGroup="SuperAdminInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlSAD_retyPwd_need %>" Display="Dynamic" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator runat="server" ID="cvPassword" ControlToValidate="txtSupRetypePassword" ValidationGroup="SuperAdminInfo"
                                                    ControlToCompare="txtSupPassword" Operator="Equal" Type="String" ForeColor="Red" Display="Dynamic" ErrorMessage="<%$Resources:Config,mdlSAD_retyPwd_valid %>" />

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSuperEmail" class="col-sm-4 control-label">
                                                <asp:Literal ID="Literal31" runat="server" Text="<%$Resources:Config,mdlSAD_Email %>" />
                                                <span class="required">*</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtSuperEmail" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Email" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtMail" ControlToValidate="txtSuperEmail" ValidationGroup="ADInfo"
                                                    ErrorMessage="<%$Resources:Config,mdlSAD_Email_need %>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ID="revtxtMail" ValidationGroup="SuperAdminInfo"
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
                        <div class="modal-footer">
                            <asp:Button ID="btnSuperAdminSave" runat="server" ValidationGroup="SuperAdminInfo" class="btn btn-primary" Text="<%$Resources:Config,mdlSAD_Save %> "
                                OnClick="btnSaveSuperAdmin_Click" />
                            <asp:Button ID="Button6" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="<%$Resources:Config,mdlSAD_Cancel %>" />
                        </div>
                    </div>
                </div>
            </div>



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
                                <asp:LinkButton runat="server" ID="lnkServerDetEdit" Font-Size="14px" PostBackUrl="#"
                                    data-toggle="modal" data-target="">
                                    <span class="sprite ic-creategroup"></span>
                                    <asp:Literal ID="Literal33" runat="server" Text="<%$Resources:Config,hd_SSD_Edit_Text%>" />
                                </asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="table-block clearfix col-md-12">
                <table style="background: #dcdbdb">
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblStreamingServerText" runat="server" Text="<%$Resources:Config,SSD_StremServer%> " Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="lblStreamingServer" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblSSDPwdText" runat="server" Text="<%$Resources:Config,SSD_Pwd%> " Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="lblSSDPwd" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblSSDPortText" runat="server" Text="<%$Resources:Config,SSD_Port%> " Width="170"></asp:Label>
                                </div>
                                <div class="middle-rightchild">
                                    <asp:Label ID="lblSSDPort" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">&nbsp;
                        </td>
                    </tr>
                </table>
            </div>






            <div style="float: right; padding-right: 30px;">
                <br />
                <asp:LinkButton ID="btnDownBackToHome" runat="server" CssClass="btn-type1" ForeColor="White" PostBackUrl="~/Search.aspx">Back</asp:LinkButton>
                <br />
                &nbsp;
            </div>

        </div>
    </div>
</asp:Content>

