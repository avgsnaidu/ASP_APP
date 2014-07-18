<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="SuperAdminInfo.aspx.cs" Inherits="VideoOnDemand.Setup.SuperAdminInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="SuperAdminContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <!--container-->

        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step3">
                    <li class="first-child completed"><a href="#"><span>1</span>Database Setup</a></li>
                    <li class="completed"><a href="#"><span>2</span>VOD Configuration Details </a></li>
                    <li class="last-child completed"><a href="#"><span>3</span>Super Admin Info</a></li>
                </ul>
            </div>
            <div class="column1">Enter the super admin details here</div>

            <div class="column2">
                <label>User Name</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserName"></asp:TextBox>
                    <span class="sprite username"></span>
                </div>
            </div>
            <div class="column2">
                <label>Password</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPassword"></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
            </div>
            <div class="column2">
                <label>Re-type Password</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtConfmPwd"></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
            </div>
            <div class="column2">
                <label>Your Mail</label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtMail"></asp:TextBox>
                    <span class="sprite mail"></span>
                </div>
            </div>
            <div class="bottom-container clearfix">
                <p class="pull-left">
                    Fields that must be completed<br>
                    If you are not sure about database details, please contact your host.
                </p>
                <p class="pull-right">
                    <%--<a href="login.html">Next<span class="sprite ic-arrow"></span></a>--%>
                    <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Account/Login.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>
                </p>
            </div>
        </div>
    </div>

</asp:Content>
