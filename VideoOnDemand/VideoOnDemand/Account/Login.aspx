<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VideoOnDemand.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
    <style>
        .labelNoBold label {
            font-weight: normal;
            margin-left: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div id="login">
        <div class="icon-logo">
        </div>
        <div class="icon-logo1">
            <span class="sprite"></span>
        </div>
        <div class="top clearfix">
            <h2>User Login</h2>
            <div class="input-holder">
                <asp:TextBox runat="server" ID="txtUserName" placeholder="User Name"></asp:TextBox>

                <span class="sprite username"></span>
            </div>
            <div class="input-holder">
                <asp:TextBox runat="server" ID="txtPassword" placeholder="Password"></asp:TextBox>
                <span class="sprite password"></span>
            </div>
            <div class="remember">
                <asp:CheckBox runat="server" ID="chkRemember" Text="Remember Me" CssClass="labelNoBold" />
            </div>
        </div>
        <div class="bottom">
            <%--<asp:LinkButton runat="server" ID="lnkForgotPwd" PostBackUrl="#" >Forgot Password ?</asp:LinkButton>--%>
            <a href="#">Forgot Password ?</a>
            <asp:LinkButton runat="server" ID="btnSubmit" CssClass="btn-type1" PostBackUrl="~/VODManage/VideoManagement.aspx">Submit</asp:LinkButton>
            <%--<a href="user-management.html" class="btn-type1">Submit</a>--%>
        </div>
    </div>

</asp:Content>
