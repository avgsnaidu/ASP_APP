<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="setup2.aspx.cs" Inherits="VideoOnDemand.Setup.ActiveDirectoryInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="ActiveDirectoryContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
      
    <%--<asp:Literal ID="StyleSheet" runat="Server" />--%>



    <div class="container">
        <!--container-->


        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step2">
                    <li class="first-child completed edit-s"><a href="setup1.aspx">
                       <span>
                            <asp:Literal runat="server" ID="ltlVidMang" Text="<%$ Resources:Setup, HD_Step1_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal1" Text="<%$ Resources:Setup, HD_Step1_DatabaseSetup%>" />
                    </a></li>
                    <li class="completed middle-leftchild"><a href="#">
                         <span>
                            <asp:Literal runat="server" ID="Literal2" Text="<%$ Resources:Setup, HD_Step2_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal3" Text="<%$ Resources:Setup, HD_Step2_Active_Directory_Details%>" />
                    </a></li>
                    <li class="middle-rightchild"><a href="#">
                        <span>
                             <asp:Literal runat="server" ID="Literal4" Text="<%$ Resources:Setup, HD_Step3_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal5" Text="<%$ Resources:Setup, HD_Step3_VOD_Configuration_Details%>" />

                        </a></li>
                    <li class="last-child"><a href="#">
                        <span>
                            <asp:Literal runat="server" ID="Literal6" Text="<%$ Resources:Setup, HD_Step4_Number%>" /></span>
                        <asp:Literal runat="server" ID="Literal7" Text="<%$ Resources:Setup, HD_Step4_Super_Admin_Info%>" />
                       </a></li>
                </ul>
            </div>
            <div class="column1"><asp:Literal runat="server" ID="Literal8" Text="<%$ Resources:Setup, ADD_Hd_enter_AD_Details%>" /></div>
            <!--Step1-->
            <div class="column2">
                <label><asp:Literal runat="server" ID="Literal9" Text="<%$ Resources:Setup, ADD_lbl_ServerAddress%>" /><span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtADServerId" ClientIDMode="Static"  CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual" data-content="Enter valid server id"></asp:TextBox>
                    <span class="sprite ip"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtADServerId" ControlToValidate="txtADServerId" ValidationGroup="ADInfo" 
                    ErrorMessage="<%$ Resources:Setup, ADD_Req_ServerId%>" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>


            <div class="column2">
                <label><asp:Literal runat="server" ID="Literal10" Text="<%$ Resources:Setup, ADD_lbl_UserName%>" /><span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtADUserName" MaxLength="15"  ClientIDMode="Static"  CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual" data-content="Enter valid username"></asp:TextBox>
                    <span class="sprite username"></span>
                </div>
                 <asp:RequiredFieldValidator runat="server" ID="rfvtxtADUserName" ControlToValidate="txtADUserName"  ValidationGroup="ADInfo"
                      ErrorMessage="<%$ Resources:Setup, ADD_REQu_UserName%>" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
              </div>
            <div class="column2">
                <label><asp:Literal runat="server" ID="Literal11" Text="<%$ Resources:Setup, ADD_lbl_Password%>" /><span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtADPassword" ClientIDMode="Static" TextMode="Password" MaxLength="15" CssClass="form-control required LettersMin3" data-placement="right" data-trigger="manual" data-content="Enter valid password"></asp:TextBox>
                    <span class="sprite password"></span>
                </div>
                 <asp:RequiredFieldValidator runat="server" ID="rfvtxtADPassword" ControlToValidate="txtADPassword"  ValidationGroup="ADInfo"
                      ErrorMessage="<%$ Resources:Setup, ADD_REqu_Password%>" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
            </div>

            <div class="column2">
                <label> <asp:Literal runat="server" ID="Literal12" Text="<%$ Resources:Setup, ADD_lbl_DomainName%>" /><span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDomain" ClientIDMode="Static"  MaxLength="15"  CssClass="form-control required LettersMin3" data-placement="right" 
                        data-trigger="manual" data-content="Enter valid domain name"></asp:TextBox>
                    <span class="sprite port"></span>
                </div>
                 <asp:RequiredFieldValidator runat="server" ID="rfvtxtDomain" ControlToValidate="txtDomain"  ValidationGroup="ADInfo" 
                     ErrorMessage="<%$ Resources:Setup, ADD_Req_DomainName%> " ForeColor="#E2351D"></asp:RequiredFieldValidator>
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
                      <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" CausesValidation="true" Width="0" Height="0" ValidationGroup="ADInfo"  BackColor="Transparent" BorderWidth="0" OnClick="GoToVODConfigurationPage_Click" />
                    <label runat="server" id="lblClickButton" for="btnNext" class="labelButton">
                          <asp:Literal runat="server" ID="Literal16" Text="<%$ Resources:Setup, ADD_Fot_btnNext%>" />
                        <span class="sprite ic-arrow"></span></label>
                </p>
            </div>
        </div>
    </div>
</asp:Content>