<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="ActiveDirectoryInfo.aspx.cs" Inherits="VideoOnDemand.Setup.ActiveDirectoryInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="ActiveDirectoryContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <!--container-->


        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step2">
                    <li class="first-child completed edit-s"><a href="DatabaseSetup.aspx"><span>1</span>Database Setup</a></li>
                    <li class="completed middle-leftchild"><a href="#"><span>2</span>Active Directory Details </a></li>
                    <li class="middle-rightchild"><a href="#"><span>3</span>VOD Configuration Details </a></li>
                    <li class="last-child"><a href="#"><span>4</span>Super Admin Info</a></li>
                </ul>
            </div>
            <div class="column1">Enter active directory access details.</div>
            <!--Step1-->
            <div class="column2">
                <label>Server ID<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtADServerId"  CssClass="form-control required LettersMin3" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters."></asp:TextBox>
                    <span class="sprite ip"></span>
                </div>
            </div>


            <div class="column2">
                <label>User Name<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtADUserName"  CssClass="form-control required LettersMin3" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters."></asp:TextBox>
                    <span class="sprite username"></span>
                </div>
            </div>
            <div class="column2">
                <label>Password<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtADPassword"  CssClass="form-control required LettersMin3" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters."></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
            </div>

            <div class="column2">
                <label>Domain Name<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDomain"  CssClass="form-control required LettersMin3" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters."></asp:TextBox>
                    <span class="sprite port"></span>
                </div>
            </div>


            <div class="bottom-container clearfix">
                <p class="pull-left">
                    <span class="required required-font">*</span> Indicates mandatory fields
                    <br>
                    If you are not sure about database details, please contact your host.
                </p>
                <p class="pull-right">
                   <%-- <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Setup/VODConfiguration.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>--%>
                      <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" Width="0" Height="0" BackColor="Transparent" BorderWidth="0" OnClick="GoToVODConfigurationPage_Click" />
                    <label runat="server" id="lblClickButton" for="btnNext" class="labelButton">Next<span class="sprite ic-arrow"></span></label>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
