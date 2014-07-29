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
            <h2>Super Admin Login</h2>
            <div class="column3">
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserName" placeholder="User Name" TabIndex="1" > </asp:TextBox>

                    <span class="sprite username"></span>

                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvUserId" Display="Dynamic" ControlToValidate="txtUserName" ValidationGroup="login" ErrorMessage="* Please Enter UserId" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>

            <div class="column3">
                <div class="input-holder">
                    <asp:TextBox TextMode="Password" runat="server" ID="txtPassword" placeholder="Password" TabIndex="2"  ></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvPassword" Display="Dynamic" ControlToValidate="txtPassword" ValidationGroup="login" ErrorMessage="* Please Enter Password" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>

            <div class="remember">
                <asp:CheckBox runat="server" ID="chkRemember" Text="Remember Me" CssClass="labelNoBold checkNoPad" TabIndex="3"  />
            </div>
            <asp:Label ID="lblError" runat="server" ClientIDMode="Static" Text="* Please provde valid username and password." ForeColor="#ec3140" Visible="false" />
        </div>
        <div class="bottom">
            <%--<asp:LinkButton runat="server" ID="lnkForgotPwd" PostBackUrl="#" >Forgot Password ?</asp:LinkButton>--%>
            <a href="#">Forgot Password ?</a>

            <%--<asp:LinkButton runat="server" ID="btnSubmit" CssClass="btn-type1" PostBackUrl="~/Users.aspx">Login</asp:LinkButton>--%>

            <asp:Button runat="server" ID="btnSubmit" ClientIDMode="Static" Width="0" Height="0" CausesValidation="true" BackColor="Transparent"
                ValidationGroup="login" BorderWidth="0" OnClick="btnSubmit_Click" />
            <label runat="server" id="lblSubmitButton" for="btnSubmit" style="color: white" class="btn-type1" tabindex="4" >Login</label>


            <%--<a href="user-management.html" class="btn-type1">Submit</a>--%>
        </div>
    </div>

</asp:Content>
