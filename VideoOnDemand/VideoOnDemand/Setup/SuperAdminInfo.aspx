<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="SuperAdminInfo.aspx.cs" Inherits="VideoOnDemand.Setup.SuperAdminInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="SuperAdminContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <!--container-->

        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step4">
                    <li class="first-child completed edit-s"><a href="Index.aspx"><span>1</span>Database Setup</a></li>
                    <li class="completed edit-s middle-leftchild"><a href="ActiveDirectoryInfo.aspx"><span>2</span>Active Directory Details </a></li>
                    <li class="completed edit-s middle-rightchild"><a href="VODConfiguration.aspx"><span>3</span>VOD Configuration Details </a></li>
                    <li class="last-child completed"><a href="#"><span>4</span>Super Admin Info</a></li>
                </ul>
            </div>
            <div class="column1">Super Admin Details </div>

            <div class="column2">
                <label>User Name<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control required NoEmpty" MaxLength="15" data-placement="right" data-trigger="manual" data-content="Fields should not be empty."></asp:TextBox>
                    <span class="sprite username"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtUserName" ControlToValidate="txtUserName" ValidationGroup="ADInfo" ErrorMessage="* Please Enter Username" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Password<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control required NoEmpty" MaxLength="15" data-placement="right" data-trigger="manual" data-content="Fields should not be empty."></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtPassword" ControlToValidate="txtPassword" ValidationGroup="ADInfo" ErrorMessage="* Please Enter Password" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Re-type Password<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtConfmPwd" TextMode="Password" CssClass="form-control required NoEmpty" MaxLength="15" data-placement="right" data-trigger="manual" data-content="Fields should not be empty."></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtConfmPwd" ControlToValidate="txtConfmPwd" ValidationGroup="ADInfo" ErrorMessage="* Please Enter Password" Display="Dynamic" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ID="cvPassword" ControlToValidate="txtConfmPwd" ValidationGroup="ADInfo" ControlToCompare="txtPassword" Operator="Equal" Type="String" ForeColor="Red" Display="Dynamic" ErrorMessage="* Password Doesn't Match" />
            </div>
            <div class="column2">
                <label>Email<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtMail" CssClass="form-control required email" MaxLength="25" data-placement="right" data-trigger="manual" data-content="Enter valid email format."></asp:TextBox>
                    <span class="sprite mail"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtMail" ControlToValidate="txtMail"  ValidationGroup="ADInfo" ErrorMessage="* Please Enter Email" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="revtxtMail"  ValidationGroup="ADInfo"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtMail" ErrorMessage="* Invalid Email Address" />
            </div>


            <div class="bottom-container clearfix">
                <p class="pull-left">
                    <span class="required required-font">*</span> Indicates mandatory fields
                    <br>
                    If you are not sure about database details, please contact your host.
                </p>
                <p class="pull-right">
                    <%--<asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/VODManage/UserManagement.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>--%>
                    <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" Width="0" CausesValidation="true" ValidationGroup="ADInfo" Height="0" BackColor="Transparent" BorderWidth="0" OnClick="GoToVODDashBoard_Click" />
                    <label runat="server" id="lblClickButton" for="btnNext" class="labelButton">Next<span class="sprite ic-arrow"></span></label>
                </p>
            </div>
        </div>

    </div>

</asp:Content>
