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
        <div class="top clearfix">
            <h2>  <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:MasterData, Login_Hd_SuperAdminLogin %>"></asp:Literal></h2>
            <div class="column3">
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserName" placeholder="<%$ Resources:MasterData, Login_txtUser_PlaceHolder %> " TabIndex="1" > </asp:TextBox>

                    <span class="sprite username"></span>

                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvUserId" Display="Dynamic" ControlToValidate="txtUserName" ValidationGroup="login"
                     ErrorMessage="<%$ Resources:MasterData, Login_txtUser_Req_Error %> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>

            <div class="column3">
                <div class="input-holder">
                    <asp:TextBox TextMode="Password" runat="server" ID="txtPassword" placeholder="<%$ Resources:MasterData, Login_txtPwd_PlaceHolder %> " TabIndex="2"  ></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvPassword" Display="Dynamic" ControlToValidate="txtPassword" ValidationGroup="login"
                     ErrorMessage="<%$ Resources:MasterData, Login_txtPwd_Req_Error %> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>

            <div class="remember">
                <asp:CheckBox runat="server" ID="chkRemember" Text="<%$ Resources:MasterData, Login_RememeberMe %> " CssClass="labelNoBold checkNoPad" TabIndex="3"  />
            </div>
            <asp:Label ID="lblError" runat="server" ClientIDMode="Static" Text="<%$ Resources:MasterData, Login_lblError_Text %> " ForeColor="#ec3140" Visible="false" />
        </div>
        <div class="bottom">
            <%--<asp:LinkButton runat="server" ID="lnkForgotPwd" PostBackUrl="#" >Forgot Password ?</asp:LinkButton>--%>
            <a href="#"> <asp:Literal runat="server" ID="Literal2" Text="<%$ Resources:MasterData, Login_ForgotPassword %>"></asp:Literal> </a>

            <%--<asp:LinkButton runat="server" ID="btnSubmit" CssClass="btn-type1" PostBackUrl="~/Users.aspx">Login</asp:LinkButton>--%>

            <asp:Button runat="server" ID="btnSubmit" ClientIDMode="Static" Width="0" Height="0" CausesValidation="true" BackColor="Transparent"
                ValidationGroup="login" BorderWidth="0" OnClick="btnSubmit_Click" />
            <label runat="server" id="lblSubmitButton" for="btnSubmit" style="color: white" class="btn-type1" tabindex="4" >
              <asp:Literal runat="server" ID="Literal3" Text="<%$ Resources:MasterData, Login_btnSubmit %>"></asp:Literal> 
                </label>


            <%--<a href="user-management.html" class="btn-type1">Submit</a>--%>
        </div>
    </div>

</asp:Content>
