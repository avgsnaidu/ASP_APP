﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="VideoOnDemand.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/css/project-custom.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="error_Page">
            <div class="error_head">
                <h1>Warning !.</h1>
            </div>
            <h3>
                <asp:Literal runat="server" ID="lblError" Text="<%$ Resources:MasterData, Error_Message_Autherization %>" />

            </h3>
        </div>
    </form>
</body>
</html>
