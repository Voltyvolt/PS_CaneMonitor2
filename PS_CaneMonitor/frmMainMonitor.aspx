<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMainMonitor.aspx.cs" Inherits="PS_CaneMonitor.frmMainMonitor" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            height: 163px;
        }
        .centered {
            margin: 0 auto;
            float: none !important;
            display: table;
        }
        .Zoom {
            zoom: 90%;
        }
        .auto-style3 {
            text-decoration: underline;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Zoom">
            <div">
                <asp:ScriptManager ID="ScriptManager1" 
                               runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1"
                             runat="server">
                    <ContentTemplate>
                        <table style="width:100%;">
                    <tr>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td align ="center">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" BackColor="#FFCC99" HeaderText="ยอดหีบอ้อย ประจำวัน (05/12/2018) ตัดยอด 15:00" HorizontalAlign="Left" Theme="BlackGlass" Width="100%" Height="170px">
                                <HeaderStyle Font-Size="18pt" HorizontalAlign="Center" />
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxFormLayout ID="ASPxFormLayout4" runat="server" ColCount="5" CssClass="centered" Font-Bold="True" Font-Size="Medium">
                                            <Items>
                                                <dx:LayoutItem Caption="ราง A">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG31" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="คัน" ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E36" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG34" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout4_E4" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ราง B">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG32" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E38" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG35" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout4_E5" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="รวมหีบ">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG33" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="คัน" ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E40" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG36" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout4_E6" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:ASPxFormLayout>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                        <td align ="center">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="ยอดสะสมประจำฤดูการผลิต" HorizontalAlign="Center" ShowCollapseButton="true" Theme="BlackGlass" Width="100%" Height="170px">
                                <ContentPaddings PaddingTop="11px" />
                                <HeaderStyle HorizontalAlign="Center" Font-Size="18pt" />
                                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout5" runat="server" ColCount="5" Font-Bold="True" Font-Size="Medium" CssClass="centered">
        <Items>
            <dx:LayoutItem Caption="รวมอ้อยสะสมทั้งหมด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG41" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Width="200px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E42" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="รวมรถสะสม">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG44" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E44" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รวมอ้อยสด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG42" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Width="200px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E46" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="คิดเป็น %">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG45" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E48" runat="server" Font-Bold="True" Font-Size="Medium" Text="%">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รวมอ้อยไฟไหม้">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG43" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Width="200px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E50" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="คิดเป็น %">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG46" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E52" runat="server" Font-Bold="True" Font-Size="Medium" Text="%">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td align="center">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel9" runat="server" HeaderText="จำนวนรถอ้อย" HorizontalAlign="Center" Theme="BlackGlass" Height="500px" Width="100%" BackColor="#FFCC99">
                                <HeaderStyle HorizontalAlign="Center" Font-Size="18pt" />
                                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="6" Font-Bold="True" Font-Size="Medium" CssClass="centered">
        <Items>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutGroup Caption="ลานใน" ColCount="2" ColSpan="2">
                <Items>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="ราง A" HorizontalAlign="Right" VerticalAlign="Middle">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG21" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E2" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ราง B" HorizontalAlign="Right" VerticalAlign="Middle">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG22" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E5" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รวมลานใน" HorizontalAlign="Right" VerticalAlign="Middle">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG23" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E7" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="ลานนอก" ColCount="4" ColSpan="2">
                <Items>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E6" runat="server" CssClass="auto-style3" Text="อ้อยไฟไหม้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E3" runat="server" Text="อ้อยสด" CssClass="auto-style3">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="อ้อยกล่อง" HorizontalAlign="Center" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E1" runat="server" Font-Size="Large" Font-Underline="True" Text="อ้อยกล่อง">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="รถบรรทุก">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG24" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <strong>
                                <dx:ASPxTextBox ID="txtF1" runat="server" Font-Size="18pt" Theme="Moderno" Width="120px" HorizontalAlign="Center" Font-Bold="True">
                                </dx:ASPxTextBox>
                                </strong>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt29" runat="server" Font-Size="18pt" Theme="Moderno" Font-Bold="True" HorizontalAlign="Center" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False" HorizontalAlign="Center">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E22" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รถหกล้อเล็ก">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtNews1" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <strong>
                                <dx:ASPxTextBox ID="txtNews2" runat="server" Font-Size="18pt" Theme="Moderno" Width="120px" HorizontalAlign="Center" Font-Bold="True">
                                </dx:ASPxTextBox>
                                </strong>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtNews3" runat="server" Font-Size="18pt" Theme="Moderno" Font-Bold="True" HorizontalAlign="Center" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False" HorizontalAlign="Center">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="เทลเลอร์">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG26" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtF2" runat="server" Font-Size="18pt" Theme="Moderno" Width="120px" HorizontalAlign="Center" Font-Bold="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt31" runat="server" Font-Size="18pt" Theme="Moderno" Font-Bold="True" HorizontalAlign="Center" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E26" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รถสาวแต๋น">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG27" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtF3" runat="server" Theme="Moderno" Width="120px" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt32" runat="server" Font-Size="18pt" Theme="Moderno" Font-Bold="True" HorizontalAlign="Center" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E28" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รวมรถลานนอก" ColSpan="3" Width="360px">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG28" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False" Visible="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E20" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้" Visible="False">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รวมอ้อยกล่อง" ShowCaption="False" Visible="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG25" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Visible="False" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ตู้" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E24" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="รถตัดโรงงาน ประจำวัน" ColCount="4" ColSpan="2">
                <Items>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="รถอ้อยสด">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt33" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E10" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt39" runat="server" Theme="Moderno" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E8" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รถอ้อยไฟไหม้">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt34" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E14" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt40" runat="server" Theme="Moderno" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E9" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รวมรถทั้งหมด">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt35" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="lb34" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt41" runat="server" Theme="Moderno" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E11" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="รวมรถ ลานใน + ลานนอก" ColCount="6" ColSpan="4">
                <Items>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="รวมรถทั้งหมด">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtG29" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E4" runat="server" Font-Bold="True" Font-Size="Large" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings HorizontalAlign="Left" />
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="รถตัดชาวไร่  ประจำวัน" ColCount="4" ColSpan="2">
                <Items>
                    <dx:LayoutItem Caption="รถอ้อยสด">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt36" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E18" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt42" runat="server" Theme="Moderno" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E13" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รถอ้อยไฟไหม้">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt37" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E16" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt43" runat="server" HorizontalAlign="Center" Theme="Moderno" Font-Bold="True" Font-Size="18pt">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E17" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="รวมรถทั้งหมด">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt38" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="120px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E20" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txt44" runat="server" Theme="Moderno" Width="170px" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxLabel ID="ASPxFormLayout2_E21" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                        <td align ="center">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" HeaderText="สะสมรถตัดอ้อยโรงงาน" HorizontalAlign="Center" Theme="BlackGlass" Width="100%" Height="285px">
                                <ContentPaddings PaddingBottom="20px" PaddingTop="40px" />
                                <HeaderStyle HorizontalAlign="Center" Font-Size="18pt" />
                                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout6" runat="server" ColCount="5" Font-Bold="True" Font-Size="Medium" CssClass="centered">
        <Items>
            <dx:LayoutItem Caption="รถอ้อยสด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG51" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="19pt" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E54" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="อ้อยสด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG54" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E56" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รถอ้อยไฟไหม้">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG52" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E58" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="อ้อยไฟไหม้">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG55" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E60" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รวมรถทั้งหมด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG53" runat="server" Theme="Moderno" HorizontalAlign="Center" Font-Size="18pt" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E62" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="รวมอ้อยทั้งหมด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG56" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E64" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel6" runat="server" HeaderText="สะสมรถตัดอ้อยชาวไร่" HorizontalAlign="Center" Theme="BlackGlass" Width="100%" Height="285px">
                                <ContentPaddings PaddingBottom="20px" PaddingTop="40px" />
                                <HeaderStyle HorizontalAlign="Center" Font-Size="18pt" />
                                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout7" runat="server" ColCount="5" Font-Bold="True" Font-Size="Medium" CssClass="centered">
        <Items>
            <dx:LayoutItem Caption="รถอ้อยสด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG61" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E66" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="อ้อยสด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG64" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E68" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รถอ้อยไฟไหม้">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG62" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E70" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="อ้อยไฟไหม้">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG65" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E72" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รวมรถทั้งหมด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG63" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E74" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="รวมอ้อยทั้งหมด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG66" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E76" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td align ="center">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel8" runat="server" BackColor="#FFCC99" HeaderText="ยอดประจำวัน รถชั่ง เข้า-ออก ลานใน" HorizontalAlign="Center" Theme="BlackGlass" Width="100%" Height="170px">
                                <HeaderStyle Font-Size="18pt" HorizontalAlign="Center" />
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="5" CssClass="centered" Font-Bold="True" Font-Size="Medium">
                                            <Items>
                                                <dx:LayoutItem Caption="รถชั่งทั้งหมด">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG11" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                                <Paddings PaddingRight="6px" />
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="คัน" ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E9" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="อ้อยสด">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG14" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                                <Paddings PaddingRight="6px" />
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E7" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="รถที่ชั่งออกแล้ว">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG12" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="คัน" ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E13" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="อ้อยไฟไหม้">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG15" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                                <Paddings PaddingRight="6px" />
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E11" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="รถที่ค้างชั่งออก">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG13" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                                <Paddings PaddingRight="6px" />
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E18" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="รวมทั้งหมด">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="txtG16" runat="server" Font-Bold="True" Font-Size="18pt" HorizontalAlign="Center" Theme="Moderno" Width="170px">
                                                                <Paddings PaddingRight="6px" />
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </dx:LayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout1_E16" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:ASPxFormLayout>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                        <td align ="center">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel7" runat="server" HeaderText="รวมสะสมรถตัดทั้งหมด" HorizontalAlign="Center" Theme="BlackGlass" Width="100%" Height="170px">
                                <HeaderStyle HorizontalAlign="Center" Font-Size="18pt" />
                                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout8" runat="server" ColCount="5" Font-Bold="True" Font-Size="Medium" CssClass="centered">
        <Items>
            <dx:LayoutItem Caption="รถอ้อยสด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG71" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E78" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="อ้อยสด" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG74" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E80" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รถอ้อยไฟไหม้">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG72" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="คัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E82" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="อ้อยไฟไหม้" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG75" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ตัน" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E84" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="รวมรถทั้งหมด">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG73" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Font-Bold="True" Width="150px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E86" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตู้">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:EmptyLayoutItem>
            </dx:EmptyLayoutItem>
            <dx:LayoutItem Caption="รวมอ้อยทั้งหมด" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txtG76" runat="server" Theme="Moderno" Font-Size="18pt" HorizontalAlign="Center" Width="170px" Font-Bold="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" VerticalAlign="Middle" />
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E88" runat="server" Font-Bold="True" Font-Size="Medium" Text="ตัน">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                    </tr>
                    </table>   
                        <asp:Timer ID="TRefresh" runat="server" OnTick="TRefresh_Tick">
                        </asp:Timer>
                    </ContentTemplate>
            </asp:UpdatePanel>
            </div>             
        </div>
    </form>
</body>
</html>
