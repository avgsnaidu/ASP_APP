<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="step2.aspx.cs" Inherits="VideoOnDemand.Setup.SMTPSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <!--container-->
        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step2">
                    <li class="first-child completed edit-s"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="ltlVidMang" Text="<%$ Resources:Setup, HD_Step1_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal14" Text="<%$ Resources:Setup, HD_Step1_DatabaseSetup%>" />
                    </a></li>
                    <li class="child-2 completed"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal16" Text="<%$ Resources:Setup, HD_Step2_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal18" Text="<%$ Resources:Setup, HD_Step2_SMTP_Details%>" />
                    </a></li>

                    <li class="child-3"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal15" Text="<%$ Resources:Setup, HD_Step3_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal17" Text="<%$ Resources:Setup, HD_Step3_Active_Directory_Details%>" />
                    </a></li>
                    <li class="child-4"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal19" Text="<%$ Resources:Setup, HD_Step4_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal20" Text="<%$ Resources:Setup, HD_Step4_VOD_Configuration_Details%>" />

                    </a></li>
                    <li class="last-child"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal21" Text="<%$ Resources:Setup, HD_Step5_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal22" Text="<%$ Resources:Setup, HD_Step5_Super_Admin_Info%>" />
                    </a></li>

                </ul>
            </div>
            <div class="column1">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Setup,SMTP_lbl_SMTPDetails %>" />
            </div>
            <asp:UpdatePanel ID="updtSMTPSetup" runat="server">
                <ContentTemplate>
                    <div class="column2">
                        <label for="txtServerId">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Setup,SMTP_lbl_ServerId %>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtServerId" ClientIDMode="Static" CssClass="form-control required LettersMin3"
                                data-placement="right" data-trigger="manual" data-content="Enter valid Host"></asp:TextBox>
                            <span class="sprite ip"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtServerId" ControlToValidate="txtServerId"
                            ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_ServerId_Need %>"
                            ForeColor="#E2351D"></asp:RequiredFieldValidator>
                        <%--  <asp:RegularExpressionValidator runat="server" ID="revtxtServerId" ValidationGroup="SMTPInfo"
                    ValidationExpression="\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b" ForeColor="Red"
                    ControlToValidate="txtServerId" ErrorMessage="<%$Resources:Setup,SMTP_ServerId_Valid %>"
                    Display="Dynamic" />--%>
                    </div>
                    <div class="column2">
                        <label for="txtPort">
                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Setup,SMTP_lbl_Port %>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtPort" ClientIDMode="Static" CssClass="form-control required LettersMin3" type="number"
                                data-placement="right" data-trigger="manual" data-content="Enter valid port"></asp:TextBox>
                            <span class="sprite port"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPort" ControlToValidate="txtPort"
                            ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_Port_Need %>"
                            ForeColor="#E2351D"></asp:RequiredFieldValidator>
                    </div>
                    <div class="column2">
                        <label for="txtUserName">
                            <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Setup,SMTP_lbl_Username %>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtUserName" MaxLength="35" ClientIDMode="Static"
                                CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual"
                                data-content="Enter valid username"></asp:TextBox>
                            <span class="sprite username"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtUserName" ControlToValidate="txtUserName"
                            ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_Username_Need %>"
                            ForeColor="#E2351D"> </asp:RequiredFieldValidator>
                    </div>
                    <div class="column2">
                        <label for="txtPassword">
                            <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Setup,SMTP_lbl_Password %>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtPassword" ClientIDMode="Static" TextMode="Password"
                                MaxLength="15" CssClass="form-control required LettersMin3" data-placement="right"
                                data-trigger="manual" data-content="Enter valid password"></asp:TextBox>
                            <span class="sprite password"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtPassword" ControlToValidate="txtPassword"
                            ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_Password_Need %>"
                            ForeColor="#E2351D"> </asp:RequiredFieldValidator>
                    </div>
                    <div class="column2">
                        <label for="txtReply">
                            <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:Setup,SMTP_lbl_ReplyToEmail %>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtReply" ClientIDMode="Static" MaxLength="35" CssClass="form-control required LettersMin3"
                                data-placement="right" data-trigger="manual" data-content="Enter valid email"></asp:TextBox>
                            <span class="sprite mail"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtReply" ControlToValidate="txtReply"
                            ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_ReplyToEmail_Need %>"
                            ForeColor="#E2351D"></asp:RequiredFieldValidator>
                    </div>
                    <div class="column2">
                        <label for="txtSenderName">
                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Setup,SMTP_lbl_SenderName %>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtSenderName" ClientIDMode="Static" MaxLength="15"
                                CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual"
                                data-content="Enter valid sender name"></asp:TextBox>
                            <span class="sprite username"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtSenderName" ControlToValidate="txtSenderName"
                            ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_SenderName_Need %>"
                            ForeColor="#E2351D"></asp:RequiredFieldValidator>
                    </div>
                    <div class="column2">
                        <label for="ddlEncryptType" class="col-sm-4 control-label">
                            <asp:Literal runat="server" ID="Literal49" Text="<%$Resources:Setup,SMTP_lbl_TypeofEncrypt %>"></asp:Literal>
                            <span class="required">*</span></label>
                        <div class="col-sm-7 selctBox">
                            <asp:DropDownList ID="ddlEncryptType" runat="server">
                                <asp:ListItem Text="<%$Resources:Setup,SMTP_None_Text %>" Value="0" />
                                <asp:ListItem Selected="True" Text="<%$Resources:Setup,SMTP_SSLEnabled_Text %>" Value="1" />
                                <asp:ListItem Text="<%$Resources:Setup,SMTP_TLSEnabled_Text %>" Value="2" />
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvchkTlsEnabled" ControlToValidate="ddlEncryptType" Display="Dynamic"
                            ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_EncryptedConnection_Need %>"
                            ForeColor="#E2351D"></asp:RequiredFieldValidator>
                    </div>
                    <%--     <div class="column2">
                <div class="col-sm-9">
                    <label for="ddlESDMailType" class="col-sm-4 control-label selctBocLabel">
                        <asp:Literal runat="server" ID="Literal8" Text="<%$Resources:Setup,SMTP_lbl_EmailType %>"></asp:Literal>
                        <span class="required">*</span></label>
                    <div>
                        <asp:DropDownList ID="ddlESDMailType" AutoPostBack="true" runat="server">
                            <asp:ListItem Selected="True" Text="<%$Resources:Config,mdlESD_EmailType_Text %>"
                                Value="<%$Resources:Config,mdlESD_EmailType_Value %>" />
                        </asp:DropDownList>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="rfvddlESDMailType" ControlToValidate="ddlESDMailType"
                        ValidationGroup="SMTPInfo" ErrorMessage="<%$Resources:Setup,SMTP_EmailType_Need %>"
                        ForeColor="#E2351D"></asp:RequiredFieldValidator>
                </div>
                <div class="col-sm-3 testBtn">
                    <asp:Button runat="server" ID="btnTest" ClientIDMode="Static" CausesValidation="true" OnClick="btnTest_Click"
                        Text="<%$Resources:Setup,SMTP_btnTest %>" ValidationGroup="SMTPInfo" />
                </div>
            </div>--%>
                    <div class="column2">
                        <label></label>
                        <div class="testbutton-holder">
                            <asp:Button runat="server" ID="btnTest" Text="Test Connection" OnClick="btnTest_Click" ValidationGroup="SMTPInfo" />
                        </div>
                    </div>

                    <div class="bottom-container clearfix">
                        <p class="pull-left">
                            <span class="required required-font">*</span>
                            <asp:Literal ID="Literal9" runat="server" Text="<%$Resources:Setup,SMTP_lblMandatoryFields %>"></asp:Literal>
                            <br>
                            <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Setup,SMTP_lblMessage %>"></asp:Literal>
                        </p>
                        <p class="pull-right">
                            <%-- <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Setup/VODConfiguration.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>--%>
                            <asp:Button runat="server" ID="btnNext" CausesValidation="true" OnClick="btnNext_Click"
                                Width="0" Height="0" ValidationGroup="SMTPInfo" BackColor="Transparent" BorderWidth="0" />
                            <asp:Label runat="server" ID="lblClickButton" AssociatedControlID="btnNext" class="labelButton">
                                <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Setup,SMTP_btnNext %>"></asp:Literal><span class="sprite ic-arrow"></span></asp:Label>
                        </p>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnTest" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnNext" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>


            <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                            <h4 class="modal-title" id="alertHeader">
                                <asp:Literal runat="server" ID="Literal8" Text="<%$ Resources:Setup, DBS_mdlAlt_HdText%>" />
                            </h4>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <asp:Label ID="lblMessage" runat="server" class="col-sm- control-label" Style="width: 400px; word-wrap: normal; text-align: left; padding-left: 20px;"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnOk" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Button ID="btnOk" runat="server" data-dismiss="modal" class="btn btn-primary" Text="<%$ Resources:Setup, DBS_mdlAlt_Ok%> " />
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>
</asp:Content>
