<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="step1.aspx.cs" Inherits="VideoOnDemand.Setup.DatabaseSetup" %>

<asp:Content ID="DatabaseSetupHeadContent" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>

<asp:Content ID="DatabaseSetupContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <%-- 
    <asp:Literal ID="StyleSheet" runat="Server" />--%>



    <script type="text/javascript">
        $(document).ready(function () {
            $('form').find('a.submit-link').click(function () {
                $('form').trigger('submit');
            }).show();


            //var myApp;
            //myApp = myApp || (function () {
            //    alert('kkk');
            //    var pleaseWaitDiv = $('<div class="modal hide" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false"><div class="modal-header"><h1>Processing...</h1></div><div class="modal-body"><div class="progress progress-striped active"><div class="bar" style="width: 100%;"></div></div></div></div>');
            //    return {
            //        showPleaseWait: function () {
            //            pleaseWaitDiv.modal();

            //        },
            //        hidePleaseWait: function () {
            //            pleaseWaitDiv.modal('hide');

            //        },

            //    };
            //})();


        });



    </script>
    <div class="container">
        <!--container-->


        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul>
                    <li class="first-child completed edit-s"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="ltlVidMang" Text="<%$ Resources:Setup, HD_Step1_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:Setup, HD_Step1_DatabaseSetup%>" />
                    </a></li>
                       <li class="child-2"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal16" Text="<%$ Resources:Setup, HD_Step2_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal18" Text="<%$ Resources:Setup, HD_Step2_SMTP_Details%>" />
                    </a></li>
                    
                    <li class="child-3"><a href="#">
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
                <asp:Literal runat="server" ID="Literal8" Text="<%$ Resources:Setup, DBS_Hd_enterDBDetails%>" />
            </div>
            <asp:UpdatePanel ID="updtDbSetup" runat="server">
                <ContentTemplate>
                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal9" Text="<%$ Resources:Setup, DBS_lbl_IPAddress%>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtIPAddress" ClientIDMode="Static" CssClass="form-control required NoEmpty ipformat" data-placement="right" data-trigger="manual" MaxLength="25" data-content="Enter valid ip address"></asp:TextBox>
                            <span class="sprite ip"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvTxtIPAddress" ControlToValidate="txtIPAddress" ValidationGroup="DbSetup" ErrorMessage="<%$ Resources:Setup, DBS_Req_IPAddress%>" ForeColor="Red" Display="Dynamic" />
                        <%--  <asp:RegularExpressionValidator runat="server" ID="revTxtIPAddress" ValidationGroup="DbSetup" ValidationExpression="^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
                    ForeColor="Red" ControlToValidate="txtIPAddress" ErrorMessage="<%$ Resources:Setup, DBS_Valid_IPAddress%>" Display="Dynamic" />--%>
                    </div>
                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal10" Text="<%$ Resources:Setup, DBS_lbl_Port%>" />
                            <%-- <span class="required">*</span>--%></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtPort" ClientIDMode="Static" CssClass="form-control required NoEmpty portnumber" data-placement="right" data-trigger="manual" MaxLength="6" data-content="Enter valid port number"></asp:TextBox>
                            <span class="sprite port"></span>
                        </div>
                        <%--   <asp:RequiredFieldValidator runat="server" ID="rfvport" ControlToValidate="txtPort" ValidationGroup="DbSetup" ErrorMessage="<%$ Resources:Setup, DBS_Req_PORT%>" ForeColor="#E2351D" Display="Dynamic"></asp:RequiredFieldValidator>
                        --%>
                        <asp:RegularExpressionValidator runat="server" ID="revPort" ValidationGroup="DbSetup" ValidationExpression="^(102[0-4]|10[0-1]\d|[1-9][0-9]{0,3}|0)$" ForeColor="Red"
                            ControlToValidate="txtPort" Display="Dynamic" ErrorMessage="<%$ Resources:Setup, DBS_Valid_Port%>" />
                    </div>
                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal11" Text="<%$ Resources:Setup, DBS_lbl_DBName%>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtDatabaseName" CssClass="form-control required NoEmpty " data-placement="right" data-trigger="manual" MaxLength="25" data-content="Enter Valid Database"></asp:TextBox>
                            <span class="sprite database"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDatabaseName" ControlToValidate="txtDatabaseName" ValidationGroup="DbSetup"
                            ErrorMessage="<%$ Resources:Setup, DBS_REq_DBName%>" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                        <%-- <asp:RegularExpressionValidator runat="server" ID="rgDataBaseExpressino" ValidationGroup="DbSetup" ValidationExpression=" ^[a-zA-Z0-9_]+$" ForeColor="Red"
                    ControlToValidate="txtDatabaseName" Display="Dynamic" ErrorMessage="<%$ Resources:Setup, DBS_Valid_DatabaseName%>" />--%>
                    </div>

                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal12" Text="<%$ Resources:Setup, DBS_lbl_UserID%>" /><span class="required"> *</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtUserId" CssClass="form-control required NoEmpty " data-placement="right" data-trigger="manual" MaxLength="15" data-content="Enter Valid UserId"></asp:TextBox>
                            <span class="sprite username"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvUserId" ControlToValidate="txtUserId" ValidationGroup="DbSetup"
                            ErrorMessage="<%$ Resources:Setup, DBS_Req_UserId%> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
                    </div>
                    <div class="column2">
                        <label>
                            <asp:Literal runat="server" ID="Literal13" Text="<%$ Resources:Setup, DBS_lbl_Password%>" />
                            <span class="required">*</span></label>
                        <div class="input-holder">
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control required NoEmpty" data-placement="right" data-trigger="manual" MaxLength="15" data-content="Enter Password"></asp:TextBox>
                            <span class="sprite password"></span>
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtPassword" ValidationGroup="DbSetup" ErrorMessage="<%$ Resources:Setup, DBS_Req_PWD%> " ForeColor="#E2351D"></asp:RequiredFieldValidator>

                    </div>
                    <div class="column2">
                        <label></label>
                        <div class="testbutton-holder">
                            <asp:Button runat="server" ID="btnTestDb" Text="Test Connection" OnClick="btnTestDb_Click" ValidationGroup="DbSetup" />
                        </div>
                        <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtPassword" ValidationGroup="DbSetup" ErrorMessage="<%$ Resources:Setup, DBS_Req_PWD%> " ForeColor="#E2351D"></asp:RequiredFieldValidator>--%>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnTestDb" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <!--Step1-->

            <div class="bottom-container clearfix">
                <p class="pull-left">
                    <span class="required required-font">*</span>
                    <asp:Literal runat="server" ID="Literal14" Text="<%$ Resources:Setup, DBS_Fot_IndicatesMadatory%>" /><br />
                    <asp:Literal runat="server" ID="Literal15" Text="<%$ Resources:Setup, DBS_Fot_DbDetailsSureMessage%>" />
                </p>
                <p class="pull-right">

                    <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" Width="0" Height="0" CausesValidation="true" BackColor="Transparent"
                        ValidationGroup="DbSetup" BorderWidth="0" OnClick="btnNext_ServerClick" OnClientClick="myApp.showPleaseWait()" />
                    <label runat="server" id="lblClickButton" for="btnNext" class="labelButton">
                        <asp:Literal runat="server" ID="ltlButtonClick" Mode="PassThrough" Text="<%$ Resources:Setup, DBS_Fot_btnNext %>" /><span class="sprite ic-arrow"></span>
                    </label>
                </p>
            </div>
            

        <div class="modal fade" id="alertMessageModal2" tabindex="-1" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
            <div class="modal-dialog modal-dlg-top">
                <div class="modal-content">
                    <div class="modal-header">
                        <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                        <h4 class="modal-title" id="alertHeader">
                            <asp:Literal runat="server" ID="Literal17" Text="<%$ Resources:Setup, DBS_mdlAlt_HdText%>" />
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

        <%--  <div class="modal fade hide" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="alertHeader" aria-hidden="true" data-dismiss="modal">
        <div class="modal-header">
            <h1>Processing...</h1>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="modal-body">
                    <div class="progress progress-striped active">
                        <div class="bar" style="width: 100%;"></div>
                    </div>
                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
    </div>--%>
</asp:Content>
