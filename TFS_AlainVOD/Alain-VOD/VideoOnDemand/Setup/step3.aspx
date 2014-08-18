<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="step3.aspx.cs" Inherits="VideoOnDemand.Setup.ActiveDirectoryInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="ActiveDirectoryContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">

    <%--<asp:Literal ID="StyleSheet" runat="Server" />--%>



    <div class="container">
        <!--container-->


        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step3">
                    <li class="first-child completed edit-s"><a href="setup1.aspx">
                        <span>
                            <asp:Literal runat="server" ID="ltlVidMang" Text="<%$ Resources:Setup, HD_Step1_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:Setup, HD_Step1_DatabaseSetup%>" />
                    </a></li>
                    <li class="child-2 completed"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal13" Text="<%$ Resources:Setup, HD_Step2_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal17" Text="<%$ Resources:Setup, HD_Step2_SMTP_Details%>" />
                    </a></li>

                    <li class="completed child-3"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal2" Text="<%$ Resources:Setup, HD_Step3_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal3" Text="<%$ Resources:Setup, HD_Step3_Active_Directory_Details%>" />
                    </a></li>
                    <li class="child-4"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal4" Text="<%$ Resources:Setup, HD_Step4_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal5" Text="<%$ Resources:Setup, HD_Step4_VOD_Configuration_Details%>" />

                    </a></li>
                    <li class="last-child"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal6" Text="<%$ Resources:Setup, HD_Step5_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal7" Text="<%$ Resources:Setup, HD_Step5_Super_Admin_Info%>" />
                    </a></li>
                </ul>
            </div>
            <div class="column1">
                <asp:Literal runat="server" ID="Literal8" Text="<%$ Resources:Setup, ADD_Hd_enter_AD_Details%>" />
            </div>
            <!--Step3-->
            <asp:UpdatePanel ID="updtSMTPSetup" runat="server">
                <ContentTemplate>
                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal9" Text="<%$ Resources:Setup, ADD_lbl_ServerAddress%>" /><span class="required"> *</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtADServerId" ClientIDMode="Static" CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual" data-content="Enter valid server id"></asp:TextBox>
                            <span class="sprite ip"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtADServerId" ControlToValidate="txtADServerId" ValidationGroup="ADInfo"
                            ErrorMessage="<%$ Resources:Setup, ADD_Req_ServerId%>" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                    </div>


                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal10" Text="<%$ Resources:Setup, ADD_lbl_UserName%>" /><span class="required"> *</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtADUserName" MaxLength="15" ClientIDMode="Static" CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual" data-content="Enter valid username"></asp:TextBox>
                            <span class="sprite username"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtADUserName" ControlToValidate="txtADUserName" ValidationGroup="ADInfo"
                            ErrorMessage="<%$ Resources:Setup, ADD_REQu_UserName%>" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
                    </div>
                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal11" Text="<%$ Resources:Setup, ADD_lbl_Password%>" /><span class="required"> *</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtADPassword" ClientIDMode="Static" TextMode="Password" MaxLength="15" CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual" data-content="Enter valid password"></asp:TextBox>
                            <span class="sprite password"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtADPassword" ControlToValidate="txtADPassword" ValidationGroup="ADInfo"
                            ErrorMessage="<%$ Resources:Setup, ADD_REqu_Password%>" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
                    </div>

                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal12" Text="<%$ Resources:Setup, ADD_lbl_DomainName%>" /><span class="required"> *</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtDomain" ClientIDMode="Static" MaxLength="15" CssClass="form-control required LettersMin3" data-placement="right"
                                data-trigger="manual" data-content="Enter valid domain name"></asp:TextBox>
                            <span class="sprite port"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvtxtDomain" ControlToValidate="txtDomain" ValidationGroup="ADInfo"
                            ErrorMessage="<%$ Resources:Setup, ADD_Req_DomainName%> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
                    </div>

                    <div class="column2">
                        <label></label>
                        <div class="testbutton-holder">
                            <asp:Button runat="server" ID="btnTestAD" Text="Test Connection" OnClick="btnTestAD_Click" ValidationGroup="ADInfo" />
                        </div>
                    </div>

                    <div class="bottom-container clearfix">
                        <p class="pull-left">
                            <span class="required required-font">*</span>
                            <asp:Literal runat="server" ID="Literal14" Text="<%$ Resources:Setup, ADD_Fot_IndicatesMadatory%>" />


                            <br>
                            <asp:Literal runat="server" ID="Literal15" Text="<%$ Resources:Setup, ADD_Fot_DbDetailsSureMessage%>" />
                        </p>
                        <p class="pull-right">
                            <%-- <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Setup/setup3.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>--%>
                            <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" CausesValidation="true" Width="0" Height="0" ValidationGroup="ADInfo" BackColor="Transparent" BorderWidth="0" OnClick="GoToVODConfigurationPage_Click" />
                            <asp:Label runat="server" ID="lblClickButton" AssociatedControlID="btnNext" class="labelButton">
                                <asp:Literal runat="server" ID="Literal16" Text="<%$ Resources:Setup, ADD_Fot_btnNext%>" /><span class="sprite ic-arrow"></span></asp:Label>
                        </p>
                    </div>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnTestAD" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnNext" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

            <div class="modal fade" id="alertMessageModal" tabindex="-1" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
                <div class="modal-dialog modal-dlg-top">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                            <h4 class="modal-title" id="alertHeader">
                                <asp:Literal runat="server" ID="Literal18" Text="<%$ Resources:Setup, DBS_mdlAlt_HdText%>" />
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
