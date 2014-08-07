<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="setup3.aspx.cs" Inherits="VideoOnDemand.Setup.VODConfiguration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="VODConfigurationContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">

    <%--  <asp:Literal ID="StyleSheet" runat="Server" />--%>


    <div class="container">
        <!--container-->


        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step3">
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

                    <li class="completed middle-rightchild"><a href="#">
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
            <div class="column1">
                <asp:Literal runat="server" ID="Literal8" Text="<%$ Resources:Setup, VOD_Hd_VODDetails%>" />
            </div>
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal9" Text="<%$ Resources:Setup, VOD_lbl_SourceFold%>" /><span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtSourceFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Source Folder"></asp:TextBox>
                    <span class="sprite source"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtSourceFolder" ControlToValidate="txtSourceFolder" ValidationGroup="VODGroup"  Display="Dynamic"
                    ErrorMessage="<%$ Resources:Setup, VOD_REQu_SourceFold%>" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ID="custSourceVald" ControlToValidate="txtSourceFolder" ValidationGroup="VODGroup" OnServerValidate="custSourceVald_ServerValidate"
                    ErrorMessage="<%$ Resources:Setup, VOD_SourceFold_Valid%>" Display="Dynamic" ForeColor="Red" />
            </div>
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal10" Text="<%$ Resources:Setup, VOD_lbl_DestinationFold%>" /><span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDestFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Destination Folder"></asp:TextBox>
                    <span class="sprite destination"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtDestFolder" ControlToValidate="txtDestFolder" ValidationGroup="VODGroup"  Display="Dynamic"
                    ErrorMessage="<%$ Resources:Setup, VOD_REq_DestinationFold%>" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ID="custDestValidator" ControlToValidate="txtDestFolder" ValidationGroup="VODGroup" OnServerValidate="custDestValidator_ServerValidate"
                    ErrorMessage="<%$ Resources:Setup, VOD_DestinationFold_Valid%>" Display="Dynamic" ForeColor="Red" />
            </div>
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal11" Text="<%$ Resources:Setup, VOD_lbl_ArchiveFold%>" />
                    <span class="required">*</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtArchiveFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Archive Folder"></asp:TextBox>
                    <span class="sprite archive"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtArchiveFolder" ControlToValidate="txtArchiveFolder" ValidationGroup="VODGroup"  Display="Dynamic"
                    ErrorMessage="<%$ Resources:Setup, VOD_REq_aRchiveFold%>" ForeColor="#E2351D"></asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ID="custArchValidator" ControlToValidate="txtArchiveFolder" ValidationGroup="VODGroup" OnServerValidate="custArchValidator_ServerValidate"
                    ErrorMessage="<%$ Resources:Setup, VOD_aRchiveFold_Valid%>" Display="Dynamic" ForeColor="Red" />
            </div>
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal12" Text="<%$ Resources:Setup, VOD_lbl_BackupFolder%>" />
                    <span class="required">*</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtBackUpFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Backup Folder"></asp:TextBox>
                    <span class="sprite backup"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtBackUpFolder" ControlToValidate="txtBackUpFolder" ValidationGroup="VODGroup"  Display="Dynamic"
                    ErrorMessage="<%$ Resources:Setup, VOD_Req_BackupFolder%>" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ID="custBackValidator" ControlToValidate="txtBackUpFolder" ValidationGroup="VODGroup" OnServerValidate="custBackValidator_ServerValidate"
                    ErrorMessage="<%$ Resources:Setup, VOD_BackupFolder_Valid%>" Display="Dynamic" ForeColor="Red" />
            </div>

            <!--  <div class="column2">
                	<label>Schedule Configuration</label>
                    <div class="input-holder">
                    	<input name="" type="text">
                        <span class="sprite configuration"></span>
                    </div>
                </div> -->
            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal13" Text="<%$ Resources:Setup, VOD_lbl_ScheduleInterval%>" />
                    <span class="required">*</span></label>
                <div class="column-2">
                    <div class="input1">
                        <div class="select-holder">
                            <asp:DropDownList ID="ddlInterval" runat="server">
                                <asp:ListItem Value="0" Text="Select" Selected="True" />
                                <asp:ListItem Value="1" Text="1 Hrs" />
                                <asp:ListItem Value="2" Text="2 Hrs" />
                                <asp:ListItem Value="3" Text="3 Hrs" />
                                <asp:ListItem Value="4" Text="4 Hrs" />
                                <asp:ListItem Value="5" Text="5 Hrs" />
                                <asp:ListItem Value="6" Text="6 Hrs" />
                                <asp:ListItem Value="7" Text="7 Hrs" />
                                <asp:ListItem Value="8" Text="8 Hrs" />
                                <asp:ListItem Value="9" Text="9 Hrs" />
                                <asp:ListItem Value="10" Text="10 Hrs" />
                                <asp:ListItem Value="11" Text="11 Hrs" />
                                <asp:ListItem Value="12 " Text="12 Hrs" />

                            </asp:DropDownList>
                           
                            <%-- <select id="selectInterval">
                                <option selected>Select</option>
                                <option>1 Hrs</option>
                                <option>2 Hrs</option>
                                <option>3 Hrs</option>
                                <option>4 Hrs</option>
                                <option>5 Hrs</option>
                                <option>6 Hrs</option>
                                <option>7 Hrs</option>
                                <option>8 Hrs</option>
                                <option>9 Hrs</option>
                                <option>10 Hrs</option>
                                <option>11 Hrs</option>
                                <option>12 Hrs</option>
                            </select>--%>
                            <!--<div class="btn-group">
                                        <button class="btn dropdown-toggle" style="text-align:left;" data-toggle="dropdown">Search On..<span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">All</a></li>
                                            <li><a href="#">Done</a></li>
                                            <li><a href="#">Pending</a></li>
                                            <li><a href="#">Processing</a></li>
                                        </ul>
                                    </div>-->
                            <!--<input name="" type="text">-->
                            <!--<span class="sprite interval"></span>-->
                        </div>
                    </div>
                    <div class="input2">
                        <span class="label1">
                            <asp:Literal runat="server" ID="Literal14" Text="<%$ Resources:Setup, VOD_lbl_ScheduleTime%>" /></span>
                        <div class="float-l">
                            <div class="input-holder">
                                <asp:TextBox runat="server" type="time" ID="txtScheduleInterval"></asp:TextBox>
                                <span class="sprite interval"></span>
                            </div>
                        </div>
                    </div>
                </div>
                 <asp:CustomValidator runat="server" ID="custIntervalValidator" ControlToValidate="ddlInterval" ValidationGroup="VODGroup" OnServerValidate="custIntervalTimeValidator_ServerValidate"
                                ErrorMessage="<%$ Resources:Setup, VOD_IntervalOrTime_Valid%>" Display="Dynamic" ForeColor="Red" />
                <%-- <asp:CustomValidator runat="server" ID="custTimeValidator" ControlToValidate="txtScheduleInterval" ValidationGroup="VODGroup" OnServerValidate="custIntervalTimeValidator_ServerValidate"
                                ErrorMessage="<%$ Resources:Setup, VOD_IntervalOrTime_Valid%>" Display="Dynamic" ForeColor="Red" />--%>
            </div>

            <div class="column2">
                <label>
                    <asp:Literal runat="server" ID="Literal15" Text="<%$ Resources:Setup, VOD_lbl_Simul_VideoConversion%>" />
                    <span class="required">*</span></label>
                <div id="SimultaniousSelect" class="select-holder">
                    <asp:DropDownList ID="ddlSimultaneous" runat="server">
                        <asp:ListItem Text="1" Value="1" Selected="True" />
                        <asp:ListItem Text="2" Value="2" />
                        <asp:ListItem Text="3" Value="3" />
                        <asp:ListItem Text="4" Value="4" />
                        <asp:ListItem Text="5" Value="5" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvddlSimultaneous" ControlToValidate="ddlSimultaneous" ValidationGroup="VODGroup"  Display="Dynamic"
                        ErrorMessage="<%$ Resources:Setup, VOD_Req_Simul_VideoConversion%> " ForeColor="#E2351D"></asp:RequiredFieldValidator>

                    <%--  <select id="selectSimultaneous">
                                    <option selected>1 </option>
                                    <option>2 </option>
                                    <option>3 </option>
                                    <option>4 </option>
                                    <option>5 </option>
                                </select>--%>
                    <!--<input type="number" min="1" max="5" />-->
                </div>
            </div>



            <div class="bottom-container clearfix">
                <p class="pull-left">
                    <span class="required required-font">*</span>
                    <asp:Literal runat="server" ID="Literal16" Text="<%$ Resources:Setup, VOD_Fot_IndicatesMadatory%>" />
                    <br />
                    <asp:Literal runat="server" ID="Literal17" Text="<%$ Resources:Setup, VOD_Fot_DbDetailsSureMessage%>" />
                    <p class="pull-right">
                        <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" ValidationGroup="VODGroup" CausesValidation="true" Width="0" Height="0" BackColor="Transparent" BorderWidth="0" OnClick="GoToSuperAdminInfo_Click" />
                        <label runat="server" id="lblClickButton" for="btnNext" class="labelButton"><asp:Literal runat="server" ID="Literal18" Text="<%$ Resources:Setup, VOD_Fot_NExtBtn%>" /><span class="sprite ic-arrow"></span></label>
                        <%--    <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Setup/SuperAdminInfo.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>--%>
                    </p>
                </p>

            </div>
        </div>

    </div>

</asp:Content>
