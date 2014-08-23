<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VideoOnDemand.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">

    <script type="text/javascript">

        function hideLabel() {
            var lbl = document.getElementById('<%=lblError.ClientID%>');
            if (lbl != null)
                lbl.hidden = true;
        }

    </script>


    <div id="login">
        <div class="icon-logo">
        </div>
        <div class="icon-logo1">
            <span class="sprite"></span>
        </div>
        <%--<asp:UpdatePanel ID="updateLogin" runat="server">
            <ContentTemplate>--%>

        <div class="top clearfix">
            <h2>
                <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:MasterData, Login_Hd_SuperAdminLogin %>"></asp:Literal></h2>
            <div class="column3">
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserName" placeholder="<%$ Resources:MasterData, Login_txtUser_PlaceHolder %> " TabIndex="1"> </asp:TextBox>

                    <span class="sprite username"></span>

                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvUserId" Display="Dynamic" ControlToValidate="txtUserName" ValidationGroup="login"
                    ErrorMessage="<%$ Resources:MasterData, Login_txtUser_Req_Error %> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>

            <div class="column3">
                <div class="input-holder">
                    <asp:TextBox TextMode="Password" runat="server" ID="txtPassword" placeholder="<%$ Resources:MasterData, Login_txtPwd_PlaceHolder %> " TabIndex="2"></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvPassword" Display="Dynamic" ControlToValidate="txtPassword" ValidationGroup="login"
                    ErrorMessage="<%$ Resources:MasterData, Login_txtPwd_Req_Error %> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>

            <div class="remember">
                <asp:CheckBox runat="server" ID="chkRemember" Text="<%$ Resources:MasterData, Login_RememeberMe %> " CssClass="labelNoBold checkNoPad" TabIndex="3" />
            </div>
            <asp:Label ID="lblError" runat="server" ClientIDMode="Static" Text="<%$ Resources:MasterData, Login_lblError_Text %> " ForeColor="#ec3140" Visible="false" />
        </div>


        <div class="bottom">
            <asp:LinkButton runat="server" ID="lnkForgotPwd" OnClick="lnkForgotPwd_Click" data-toggle="modal" data-target="#myModalForgotPwd">
                <asp:Literal runat="server" ID="Literal2" Text="<%$ Resources:MasterData, Login_ForgotPassword %>"></asp:Literal>
            </asp:LinkButton>


            <%--<asp:LinkButton runat="server" ID="btnSubmit" CssClass="btn-type1" PostBackUrl="~/Users.aspx">Login</asp:LinkButton>--%>

            <asp:Button runat="server" ID="btnSubmit" ClientIDMode="Static" CssClass="btn-type1" CausesValidation="true" BorderColor="#ec3140" ForeColor="White" Height="42"
                ValidationGroup="login"  OnClick="btnSubmit_Click"  Text="<%$ Resources:MasterData, Login_btnSubmit %>"/>
         <%--   <label runat="server" id="lblSubmitButton" for="btnSubmit" style="color: white" class="btn-type1" tabindex="4">
                <asp:Literal runat="server" ID="Literal3" Text="<%$ Resources:MasterData, Login_btnSubmit %>"></asp:Literal>
            </label>--%>



            <%--<a href="user-management.html" class="btn-type1">Submit</a>--%>
        </div>

        <%-- </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lnkForgotPwd" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>--%>

        <div class="modal fade" id="myModalForgotPwd" tabindex="-1" role="dialog" aria-labelledby="forgotModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dlg-top">
                <div class="modal-content">
                    <div class="modal-header">
                        <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
                        <h4 class="modal-title" id="forgotModalLabel">
                            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:MasterData, mdlLog_Hd_forgotPassword %>" /></h4>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblgroupNText" for="txtModalUserName" class="col-sm-4 control-label">
                                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:MasterData, mdlLoG_UserName %>" /><span class="required"> *</span></asp:Label>
                                        <div class="col-sm-7">
                                            <asp:TextBox type="text" runat="server" class="form-control textboxFormat required " ID="txtModalUserName" placeholder="<%$ Resources:MasterData, mdlLog_userName_Placeholder %>" data-placement="top" data-trigger="manual" />
                                        </div>
                                        <label></label>
                                        <div class="req_align">
                                            <asp:RequiredFieldValidator runat="server" ID="requModalUsername" Display="Dynamic" ControlToValidate="txtModalUserName" ValidationGroup="modalLog"
                                                ErrorMessage="<%$ Resources:MasterData, Login_txtUser_Req_Error %> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnForgotClick" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>

                    <div class="modal-footer">
                        <asp:Button ID="btnForgotClick" runat="server" ValidationGroup="modalLog" class="btn btn-primary"  Text="<%$ Resources:MasterData, mdlLogin_Submit %>" OnClick="btnForgotClick_Click" />
                    </div>
                </div>
            </div>
        </div>


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
                        <asp:Button ID="btnOk" runat="server" class="btn btn-primary" data-dismiss="modal"  Text="<%$ Resources:Setup, DBS_mdlAlt_Ok%> " />
                    </div>
                </div>
            </div>
        </div>

    </div>


    

</asp:Content>
