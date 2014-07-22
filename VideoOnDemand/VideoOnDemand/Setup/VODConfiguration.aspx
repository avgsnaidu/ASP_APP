<%@ Page Title="" Language="C#" MasterPageFile="~/VODMain.Master" AutoEventWireup="true" CodeBehind="VODConfiguration.aspx.cs" Inherits="VideoOnDemand.Setup.VODConfiguration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="VODConfigurationContent" ContentPlaceHolderID="VODContentPlaceHolder" runat="server">
    <div class="container">
        <!--container-->


        <div class="col-md-12 full-width">
            <div class="navigation">
                <ul class="step3">
                    <li class="first-child completed edit-s"><a href="index.aspx"><span>1</span>Database Setup</a></li>
                    <li class="completed edit-s middle-leftchild"><a href="ActiveDirectoryInfo.aspx"><span>2</span>Active Directory Details </a></li>
                    <li class="completed middle-rightchild"><a href="#"><span>3</span>VOD Configuration Details </a></li>
                    <li class="last-child"><a href="#"><span>4</span>Super Admin Info</a></li>
                </ul>
            </div>
            <div class="column1">VOD Configuration Details</div>
            <div class="column2">
                <label>Source Folder<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtSourceFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Source Folder"></asp:TextBox>
                    <span class="sprite source"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtSourceFolder" ControlToValidate="txtSourceFolder"  ValidationGroup="ADInfo" ErrorMessage="* Please Enter Source Folder" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Destination Folder<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtDestFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Destination Folder"></asp:TextBox>
                    <span class="sprite destination"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtDestFolder" ControlToValidate="txtDestFolder"  ValidationGroup="ADInfo" ErrorMessage="* Please Enter Destination Folder" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Archive Folder<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtArchiveFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Archive Folder"></asp:TextBox>
                    <span class="sprite archive"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtArchiveFolder" ControlToValidate="txtArchiveFolder"  ValidationGroup="ADInfo" ErrorMessage="* Please Enter Archive Folder" ForeColor="#E2351D"></asp:RequiredFieldValidator>
            </div>
            <div class="column2">
                <label>Backup Folder<span class="required"> *</span></label>
                <div class="input-holder">
                    <asp:TextBox runat="server" ID="txtBackUpFolder" CssClass="form-control required LettersMin3" MaxLength="100" data-placement="right" data-trigger="manual" data-content="Please Enter Backup Folder"></asp:TextBox>
                    <span class="sprite backup"></span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="rfvtxtBackUpFolder" ControlToValidate="txtBackUpFolder"  ValidationGroup="ADInfo" ErrorMessage="* Please Enter Backup Folder" ForeColor="#E2351D"> </asp:RequiredFieldValidator>
            </div>

            <!--  <div class="column2">
                	<label>Schedule Configuration</label>
                    <div class="input-holder">
                    	<input name="" type="text">
                        <span class="sprite configuration"></span>
                    </div>
                </div> -->
            <div class="column2">
                <label>Schedule Interval / Time<span class="required"> *</span></label>
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
                        <span class="label1">(Or) Time</span>
                        <div class="float-l">
                            <div class="input-holder">
                                <asp:TextBox runat="server" type="time" ID="txtScheduleInterval"></asp:TextBox>
                                <span class="sprite interval"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="column2">
                <label>Simultaneous Video Conversions<span class="required"> *</span></label>
                <div id="SimultaniousSelect" class="select-holder">
                    <asp:DropDownList ID="ddlSimultaneous" runat="server">
                        <asp:ListItem Text="1" Value="1" Selected="True" />
                        <asp:ListItem Text="2" Value="2" />
                        <asp:ListItem Text="3" Value="3" />
                        <asp:ListItem Text="4" Value="4" />
                        <asp:ListItem Text="5" Value="5" />
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator runat="server" ID="rfvddlSimultaneous" ControlToValidate="ddlSimultaneous"  ValidationGroup="ADInfo" ErrorMessage="* Please Select Video Conversion" ForeColor="#E2351D"></asp:RequiredFieldValidator>

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
                    <span class="required required-font">*</span> Indicates mandatory fields
                    <br />
                    If you are not sure about database details, please contact your host.
                     <p class="pull-right">
                         <asp:Button runat="server" ID="btnNext" ClientIDMode="Static" ValidationGroup="ADInfo" CausesValidation="true" Width="0" Height="0" BackColor="Transparent" BorderWidth="0" OnClick="GoToSuperAdminInfo_Click" />
                         <label runat="server" id="lblClickButton" for="btnNext" class="labelButton">Next<span class="sprite ic-arrow"></span></label>
                         <%--    <asp:LinkButton runat="server" ID="btnNext" PostBackUrl="~/Setup/SuperAdminInfo.aspx">Next<span class="sprite ic-arrow"></span></asp:LinkButton>--%>
                     </p>
                </p>

            </div>
        </div>

    </div>

</asp:Content>