<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="setup4.aspx.cs" Inherits="VideoOnDemand.Setup.SuperAdminInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="SuperAdminContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">

    <%-- <asp:Literal ID="StyleSheet" runat="Server" />--%>


    <div class="container">
        <!--container-->

        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step4">
                    <li class="first-child completed edit-s"><a href="setup1.aspx">

                        <span>
                            <asp:Literal runat="server" ID="ltlVidMang" Text="<%$ Resources:Setup, HD_Step1_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:Setup, HD_Step1_DatabaseSetup%>" />
                    </a></li>
                    <li class="completed edit-s middle-leftchild"><a href="setup2.aspx">

                        <span>
                            <asp:Literal runat="server" ID="Literal2" Text="<%$ Resources:Setup, HD_Step2_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal3" Text="<%$ Resources:Setup, HD_Step2_Active_Directory_Details%>" />
                    </a></li>
                    <li class="completed edit-s middle-rightchild"><a href="setup3.aspx">

                        <span>
                            <asp:Literal runat="server" ID="Literal4" Text="<%$ Resources:Setup, HD_Step3_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal5" Text="<%$ Resources:Setup, HD_Step3_VOD_Configuration_Details%>" />

                    </a></li>
                    <li class="last-child completed"><a href="#">

                        <span>
                            <asp:Literal runat="server" ID="Literal6" Text="<%$ Resources:Setup, HD_Step4_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal7" Text="<%$ Resources:Setup, HD_Step4_Super_Admin_Info%>" />
                    </a></li>
                </ul>
            </div>
            <div class="column1">
                <asp:Literal runat="server" ID="Literal8" Text="<%$ Resources:Setup, SAD_Hd_AdminDetails%>" />
            </div>

            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal9" Text="<%$ Resources:Setup, SAD_lbl_UserName%>" /><span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control required NoEmpty" MaxLength="15" data-placement="right" data-trigger="manual" data-content="Please Enter Username"></asp:TextBox>
                    <span class="sprite username"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtUserName" ControlToValidate="txtUserName" ValidationGroup="ADInfo"
                    ErrorMessage="<%$ Resources:Setup, SAD_Req_Username%>" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal10" Text="<%$ Resources:Setup, SAD_lbl_PWD%>" />
                    <span class="required">*</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control required NoEmpty" MaxLength="15" data-placement="right" data-trigger="manual" data-content="Please Enter Password"></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtPassword" ControlToValidate="txtPassword" ValidationGroup="ADInfo"
                    ErrorMessage="<%$ Resources:Setup, SAD_REqu_PWD%>" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal11" Text="<%$ Resources:Setup, SAD_lbl_REtypePWD%>" />
                    <span class="required">*</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtConfmPwd" TextMode="Password" CssClass="form-control required NoEmpty" MaxLength="15" data-placement="right" data-trigger="manual" data-content="Please Enter Password"></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtConfmPwd" ControlToValidate="txtConfmPwd" ValidationGroup="ADInfo"
                    ErrorMessage="<%$ Resources:Setup, SAD_REq_REtypePWD%>" Display="Dynamic" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ID="cvPassword" ControlToValidate="txtConfmPwd" ValidationGroup="ADInfo" ControlToCompare="txtPassword"
                    Operator="Equal" Type="String" ForeColor="Red" Display="Dynamic" ErrorMessage="<%$ Resources:Setup, SAD_Valid_REtypePWD%> " />
            </div>
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal12" Text="<%$ Resources:Setup, SAD_lbl_Eamil%>" />
                    <span class="required">*</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtMail" CssClass="form-control required email" MaxLength="25" data-placement="right" data-trigger="manual" data-content="Enter valid email format."></asp:TextBox>
                    <span class="sprite mail"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtMail" ControlToValidate="txtMail" ValidationGroup="ADInfo"
                    ErrorMessage="<%$ Resources:Setup, SAD_Requ_Eamil%>" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="revtxtMail" ValidationGroup="ADInfo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtMail" ErrorMessage="<%$ Resources:Setup, SAD_Valid_Eamil%>" />
            </div>


            <div class="bottom-container clearfix">
                <p class="pull-left">
                    <span class="required required-font">*</span>
                    <asp:Literal runat="server" ID="Literal14" Text="<%$ Resources:Setup, SAD_Fot_IndicatesMadatory%>" />
                    <br>
                    <asp:Literal runat="server" ID="Literal15" Text="<%$ Resources:Setup, SAD_Fot_DbDetailsSureMessage%>" />

                </p>
                <p class="pull-right">
                    <%--<asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/VODManage/UserManagement.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>--%>
                    <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" Width="0" CausesValidation="true" ValidationGroup="ADInfo" Height="0" BackColor="Transparent" BorderWidth="0" OnClick="GoToVODDashBoard_Click" />
                    <label runat="server" id="lblClickButton" for="btnNext" class="labelButton"><asp:Literal runat="server" ID="Literal13" Text="<%$ Resources:Setup, SAD_Fot_Nextbtn%>" /><span class="sprite ic-arrow"></span></label></p>
            </div>
        </div>

    </div>

</asp:Content>
