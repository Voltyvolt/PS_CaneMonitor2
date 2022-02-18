<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMain2.aspx.cs" Inherits="PS_CaneMonitor.frmMain2" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpreadsheet.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpreadsheet" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                        <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" AutoSaveMode="On" AutoSaveTimeout="00:00:10" RibbonMode="None" ShowFormulaBar="False" ShowSheetTabs="False" Width="100%">
                        </dx:ASPxSpreadsheet>    
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
