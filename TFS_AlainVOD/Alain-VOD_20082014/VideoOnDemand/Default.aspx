<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VideoOnDemand.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" ></ajaxToolkit:ToolkitScriptManager>
        
         <div class="ddlSearchOnButton input-append">
                        <asp:TextBox type="text" ID="txtSearchKey" runat="server" class="span2 search-query searchBorder searchTextPadingExist" 
                            Style="height: inherit; min-width: 350px;" placeholder="<%$Resources:Search,txtSearch_PlaceHolder %>" autocomplete="off" />

                        <ajaxToolkit:AutoCompleteExtender
                            runat="server"
                            BehaviorID="AutoCompleteEx"
                            ID="autoCompleteSearch"
                            TargetControlID="txtSearchKey" 
                            ServicePath="AutoComplete.asmx"
                            UseContextKey="true"
                            ServiceMethod="GetCompletionList"
                            MinimumPrefixLength="2"
                            CompletionInterval="1000"
                            EnableCaching="true"
                            CompletionSetCount="20"
                            CompletionListCssClass="autocomplete_completionListElement"
                            CompletionListItemCssClass="autocomplete_listItem"
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            DelimiterCharacters=";, :"
                            ShowOnlyCurrentWordInCompletionListItem="true">
                            <Animations>
                    <OnShow>
                        <Sequence>
                            <%-- Make the completion list transparent and then show it --%>
                            <OpacityAction Opacity="0" />
                            <HideAction Visible="true" />
                            
                            <%--Cache the original size of the completion list the first time
                                the animation is played and then set it to zero --%>
                            <ScriptAction Script="
                                // Cache the size and setup the initial size
                                var behavior = $find('AutoCompleteEx');
                                if (!behavior._height) {
                                    var target = behavior.get_completionList();
                                    behavior._height = target.offsetHeight - 2;
                                    target.style.height = '0px';
                                }" />
                            
                            <%-- Expand from 0px to the appropriate size while fading in --%>
                            <Parallel Duration=".4">
                                <FadeIn />
                                <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                            </Parallel>
                        </Sequence>
                    </OnShow>
                    <OnHide>
                        <%-- Collapse down to 0px and fade out --%>
                        <Parallel Duration=".4">
                            <FadeOut />
                            <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                        </Parallel>
                    </OnHide>
                            </Animations>
                        </ajaxToolkit:AutoCompleteExtender>
                        <asp:DropDownList ID="ddlSearchOn" runat="server" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchOn_SelectedIndexChanged" CssClass="selectpicker searchBorder input-prepend  radiusNone" Width="100px" Height="35px">
                               <asp:ListItem Text="All" Value="1" />
                            <asp:ListItem Text="Community" Value="2" />
                            <asp:ListItem Text="District" Value="3" />
                            <asp:ListItem Text="Road" Value="4" />
                        </asp:DropDownList>
                        <%--<div class="btn-group input-prepend">
                            <button id="btnDropDown" class="btn dropdown-toggle searchBorder" data-toggle="dropdown">Filter By..<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Route </a></li>
                                <li><a href="#">Area     </a></li>
                                <li><a href="#">Road     </a></li>
                                <li><a href="#">Community </a></li>
                                <li><a href="#">District </a></li>
                            </ul>
                        </div>--%>


                        <button type="submit" id="btnSearch" runat="server" class="btn searchBorder buttonColor">
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:Search,btnsearch_text %>" />
                            <i class="icon-search"></i>
                        </button>
    </div>
    </form>
</body>
</html>
