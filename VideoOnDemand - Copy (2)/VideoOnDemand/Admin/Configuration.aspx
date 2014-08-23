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
                <asp:LinkButton runat="server" ID="btnSubmit" CssClass="btn-type1" ForeColor="White"
                    PostBackUrl="~/Archived.aspx">Back</asp:LinkButton>
                <br />
                &nbsp;
            </div>

            <div class="block1 clearfix">
                <table class="col-md-12 title1">
                    <tr>
                        <td width="93%">
                            <h2 class="col-md-12 title1">Database Connection Details</h2>
                        </td>
                        <td width="7%">
                            <div class="col-md-12 title1">
                                <asp:LinkButton runat="server" ID="LinkButton2" Font-Size="14px" PostBackUrl="#"
                                    data-toggle="modal" data-target="#myModal2"><span class="sprite ic-creategroup"></span>Edit</asp:LinkButton>
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
                            <h4 class="modal-title" id="myModalLabel">Database Connection Details</h4>
                        </div>
                         <asp:HiddenField ID="hdConfigId" runat="server" />

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">                                           
                                            <label for="txtIpAddress" class="col-sm-4 control-label">
                                                Ip&nbsp;Address<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control required textboxFormat"
                                                    ID="txtIpAddress" placeholder="Ip Address" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid IpAddress" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvTxtIPAddress" ControlToValidate="txtIPAddress" ValidationGroup="DbSetup" ErrorMessage="* Please Enter IP Address" ForeColor="Red" Display="Dynamic" />
                                                <asp:RegularExpressionValidator runat="server" ID="revTxtIPAddress" ValidationGroup="DbSetup" ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|3[0-4][0-9]|25[0-5])){3}$" ForeColor="Red" ControlToValidate="txtIPAddress" ErrorMessage="* Invalid Ip Address" Display="Dynamic" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtPort" class="col-sm-4 control-label">
                                                Port<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtPort" runat="server" class="form-control textboxFormat required"
                                                    placeholder="Port" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Port" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvport" ControlToValidate="txtPort" ValidationGroup="DbSetup" ErrorMessage="* Please Enter Port" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ID="revPort" ValidationGroup="DbSetup" ValidationExpression="^(102[0-4]|10[0-1]\d|[1-9][0-9]{0,3}|0)$" ForeColor="Red" ControlToValidate="txtPort" Display="Dynamic" ErrorMessage="* Invalid Port" />

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDatabase" class="col-sm-4 control-label">
                                                Database&nbsp;Name<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" ID="txtDatabase" class="form-control textboxFormat required NoEmpty onlynumbers"
                                                    name="" placeholder="Database Name" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Database"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvDatabaseName" ControlToValidate="txtDatabase" ValidationGroup="DbSetup" ErrorMessage="* Please Enter Database" ForeColor="#E2351D" Display="Dynamic" ></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtUserId" class="col-sm-4 control-label">
                                                User&nbsp;Id<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtUserId" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="User Id" data-placement="bottom" data-trigger="manual" data-content="Enter Valid UserId"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvUserId" ControlToValidate="txtUserId" ValidationGroup="DbSetup" ErrorMessage="* Please Enter UserId" ForeColor="#E2351D" Display="Dynamic" ></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtADPassword" class="col-sm-4 control-label">
                                                Password<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" TextMode="Password" ID="txtADPassword" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtADPassword" ValidationGroup="DbSetup" ErrorMessage="* Please Enter Password" ForeColor="#E2351D" Display="Dynamic" ></asp:RequiredFieldValidator>

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
                                Text="Save" />
                            <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="Cancel" />
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
                                        <asp:Label ID="lblIpAddress" runat="server" Text="IPAddress :" Width="170"></asp:Label>
                                    </div>
                                    <div class="middle-rightchild">
                                        <asp:Label ID="txtAddress" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblPort" runat="server" Text="Port Number :" Width="170"></asp:Label>
                                    </div>
                                    <div  class="middle-rightchild">
                                        <asp:Label ID="lblDataPort" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblDatabase" runat="server" Text="Database  :" Width="170"></asp:Label>
                                    </div>
                                    <div  class="middle-rightchild">
                                        <asp:Label ID="lbltxtDatabase" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="table-block clearfix col-md-8">
                                    <div style="float: left; font-weight: bold" class="middle-rightchild">
                                        <asp:Label ID="lblUserId" runat="server" Text="User ID :" Width="170"></asp:Label>
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
                                        <asp:Label ID="lblPassword" runat="server" Text="Password :" Width="170"></asp:Label>
                                    </div>
                                    <div  class="middle-rightchild">
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
                            <h2 class="col-md-12 title1">Active Directory Details</h2>
                        </td>
                        <td width="7%">
                            <div class="col-md-12 title1">
                                <asp:LinkButton runat="server" ID="lnkEditAD" Font-Size="14px" PostBackUrl="#" data-toggle="modal"
                                    data-target="#myActiveDirectory"><span class="sprite ic-creategroup"></span>Edit</asp:LinkButton>
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
                                    <asp:Label ID="lblServerId" runat="server" Text="Server ID :" Width="170"></asp:Label>
                                </div>
                                <div  class="middle-rightchild">
                                    <asp:Label ID="txtServer" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblADUserName" runat="server" Text="User Name :" Width="170"></asp:Label>
                                </div>
                                <div  class="middle-rightchild">
                                    <asp:Label ID="txtADUser" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblADPassword" runat="server" Text="Password :" Width="170"></asp:Label>
                                </div>
                                <div  class="middle-rightchild">
                                    <asp:Label ID="txtPassword" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblDomain" runat="server" Text="Domain      : " Width="170"></asp:Label>
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
                            <h4 class="modal-title" id="H1">Active Directory Details</h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:HiddenField ID="hdAdConfigId" runat="server" />
                                            <label for="txtServerId" class="col-sm-4 control-label">
                                                Server&nbsp;Id<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtServerId" placeholder="Server Id" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid ServerId" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADServerId" ControlToValidate="txtServerId" ValidationGroup="ADInfo" ErrorMessage="* Please Enter ServerId" ForeColor="#E2351D"  Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ID="rfvServerId" ValidationGroup="ADInfo" ValidationExpression="^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$" ForeColor="Red" ControlToValidate="txtServerId" ErrorMessage="* Invalid Ip Address" Display="Dynamic" />

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtUsername" class="col-sm-4 control-label">
                                                Username<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtUsername" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Username" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Username" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADUserName" ControlToValidate="txtUsername" ValidationGroup="ADInfo" ErrorMessage="* Please Enter Username" ForeColor="#E2351D"  Display="Dynamic"> </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDBPassword" class="col-sm-4 control-label">
                                                Password<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" TextMode="Password" runat="server" ID="txtDBPassword" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADPassword" ControlToValidate="txtDBPassword" ValidationGroup="ADInfo" ErrorMessage="* Please Enter Password" ForeColor="#E2351D"  Display="Dynamic"> </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDomain" class="col-sm-4 control-label">
                                                Domain&nbsp;Name<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtDomain" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Domain Name" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Domain Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtDomain" ControlToValidate="txtDomain" ValidationGroup="ADInfo" ErrorMessage="* Please Enter Domain Name" ForeColor="#E2351D"  Display="Dynamic"></asp:RequiredFieldValidator>

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
                            <asp:Button ID="btnAdSave" runat="server" class="btn btn-primary" Text="Save" ValidationGroup="ADInfo" OnClick="btnSaveAD_Click" />
                            <asp:Button ID="Button2" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="block1 clearfix">
                <table class="col-md-12 title1">
                    <tr>
                        <td width="93%">
                            <h2 class="col-md-12 title1">VOD Configuration Details</h2>
                        </td>
                        <td width="7%">
                            <div class="col-md-12 title1">
                                <asp:LinkButton runat="server" ID="lnkEditVOD" Font-Size="14px" PostBackUrl="#" data-toggle="modal"
                                    data-target="#myVOD"><span class="sprite ic-creategroup"></span>Edit</asp:LinkButton>
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
                                <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold;padding-left:0;">
                                    <asp:Label ID="lblSrcFolder" runat="server" Text="Source Folder :"></asp:Label>
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
                                <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold;padding-left:0;">
                                    <asp:Label ID="lblDestFolder" runat="server" Text="Destination   :"></asp:Label>
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
                                <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold;padding-left:0;">
                                    <asp:Label ID="lblArchiveFolder" runat="server" Text="Archive     :"></asp:Label>
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
                                <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold;padding-left:0;">
                                    <asp:Label ID="lblBackUp" runat="server" Text="Back Up     :"></asp:Label>
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
                                <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold;padding-left:0;">
                                    <asp:Label ID="lblSchedule" runat="server" Text="Interval Time :"></asp:Label>
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
                                <div class="col-md-3 pdLeft0 pull-left" style="font-weight: bold;padding-left:0;">
                                    <asp:Label ID="lblVideoConversion" runat="server" Text="Video Conversion :"></asp:Label>
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
                            <h4 class="modal-title" id="H2">VOD Configuration Details</h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:HiddenField ID="hdVODConfig" runat="server" />
                                            <label for="txtSrcFold" class="col-sm-4 control-label">
                                                Sourcer&nbsp;Folder<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtSrcFold" placeholder="Source Folder" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Source Folder" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtSourceFolder" ControlToValidate="txtSrcFold" ValidationGroup="VODInfo" ErrorMessage="* Please Enter Source Folder" ForeColor="#E2351D"  Display="Dynamic"> </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDstFold" class="col-sm-4 control-label">
                                                Destination&nbsp;Folder<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtDstFold" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Destination Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Destination Folder" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtDestFolder" ControlToValidate="txtDstFold" ValidationGroup="VODInfo" ErrorMessage="* Please Enter Destination Folder" ForeColor="#E2351D"  Display="Dynamic"> </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtArchiveFold" class="col-sm-4 control-label">
                                                Archive&nbsp;Folder<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" ID="txtArchiveFold" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Archive Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Archive Folder"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtArchiveFolder" ControlToValidate="txtArchiveFold" ValidationGroup="VODInfo" ErrorMessage="* Please Enter Archive Folder" ForeColor="#E2351D"  Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtBackupFold" class="col-sm-4 control-label">
                                                Backup&nbsp;Folder<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtBackupFold" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Backup Folder" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Backup Folder"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtBackUpFolder" ControlToValidate="txtBackupFold" ValidationGroup="VODInfo" ErrorMessage="* Please Enter Backup Folder" ForeColor="#E2351D"  Display="Dynamic"> </asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlInterval" class="col-sm-4 control-label">
                                                Schedule Interval/Time<span class="required"> *</span></label>
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
                                            <span class="label1 float-l">(Or) Time</span>
                                            <div class="float-l input2 timeIntr">
                                                <div class="input-holder">
                                                    <asp:TextBox runat="server" type="time" ID="txtScheduleInterval"></asp:TextBox>
                                                    <span class="sprite interval"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ddlSimultaneous" class="col-sm-4 control-label">
                                                Simultanious&nbsp;Video&nbsp;<br />
                                                Conversions<span class="required"> *</span></label>
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
                                                        ValidationGroup="VODInfo" ErrorMessage="* Please Select Video Conversion" ForeColor="#E2351D"  Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:Button ID="btnVODSave" runat="server" class="btn btn-primary" ValidationGroup="VODInfo" Text="Save" OnClick="btnSaveVOD_Click" />
                            <asp:Button ID="Button4" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="block1 clearfix">
                <table class="col-md-12 title1">
                    <tr>
                        <td width="93%">
                            <h2 class="col-md-12 title1">Super Admin Info</h2>
                        </td>
                        <td width="7%">
                            <div class="col-md-12 title1">
                                <asp:LinkButton runat="server" ID="lnkEditSuperAdmin" Font-Size="14px" PostBackUrl="#"
                                    data-toggle="modal" data-target="#mySuperAdmin"><span class="sprite ic-creategroup"></span>Edit </asp:LinkButton>
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
                                    <asp:Label ID="lblSuperUser" runat="server" Text="User Name :" Width="170"></asp:Label>
                                </div>
                                <div  class="middle-rightchild">
                                    <asp:Label ID="txtSuperUser" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblAdminPassword" runat="server" Text="Password :" Width="170"></asp:Label>
                                </div>
                                <div   class="middle-rightchild">
                                    <asp:Label ID="txtAdminPassword" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="table-block clearfix col-md-8">
                                <div style="float: left; font-weight: bold" class="middle-rightchild">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email  :" Width="170"></asp:Label>
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
                            <h4 class="modal-title" id="H3">Super Admin Details</h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:HiddenField ID="hdSuperAdmin" runat="server" />
                                            <label for="txtSuperUsername" class="col-sm-4 control-label">
                                                User&nbsp;Name<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    ID="txtSuperUsername" placeholder="User Name" data-placement="top" data-trigger="manual"
                                                    data-content="Enter Valid Username" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtUserName" ControlToValidate="txtSuperUsername" ValidationGroup="SuperAdminInfo" ErrorMessage="* Please Enter Username" ForeColor="#E2351D"  Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSupPassword" class="col-sm-4 control-label">
                                                Password<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtSupPassword" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    placeholder="Password" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Password" />
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtPassword" ControlToValidate="txtSupPassword" ValidationGroup="SuperAdminInfo" ErrorMessage="* Please Enter Password" ForeColor="#E2351D"  Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSupRetypePassword" class="col-sm-4 control-label">
                                                Retype&nbsp;Password<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" runat="server" ID="txtSupRetypePassword" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Retype Password" data-placement="bottom" data-trigger="manual"
                                                    data-content="Enter Valid Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtConfmPwd" ControlToValidate="txtSupRetypePassword" ValidationGroup="SuperAdminInfo" ErrorMessage="* Please Enter Password" Display="Dynamic" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator runat="server" ID="cvPassword" ControlToValidate="txtSupRetypePassword" ValidationGroup="SuperAdminInfo" ControlToCompare="txtSupPassword" Operator="Equal" Type="String" ForeColor="Red" Display="Dynamic" ErrorMessage="* Password Doesn't Match" />

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtSuperEmail" class="col-sm-4 control-label">
                                                Email<span class="required"> *</span></label>
                                            <div class="col-sm-7">
                                                <asp:TextBox type="text" ID="txtSuperEmail" runat="server" class="form-control textboxFormat required NoEmpty"
                                                    name="" placeholder="Email" data-placement="bottom" data-trigger="manual" data-content="Enter Valid Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvtxtMail" ControlToValidate="txtSuperEmail" ValidationGroup="ADInfo" ErrorMessage="* Please Enter Email" ForeColor="#E2351D"  Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ID="revtxtMail" ValidationGroup="SuperAdminInfo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtSuperEmail" ErrorMessage="* Invalid Email Address"  Display="Dynamic"/>

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
                            <asp:Button ID="btnSuperAdminSave" runat="server" ValidationGroup="SuperAdminInfo" class="btn btn-primary" Text="Save"
                                OnClick="btnSaveSuperAdmin_Click" />
                            <asp:Button ID="Button6" runat="server" class="btn btn-primary" data-dismiss="modal"
                                Text="Cancel" />
                        </div>
                    </div>
                </div>
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

