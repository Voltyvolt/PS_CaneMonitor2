<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCaneDiary.aspx.cs" Inherits="PS_CaneMonitor.frmCaneDiary" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            height: 51px;
            background-color: #CCFFCC;
            width: 1346px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 1346px;
        }
        .Zoom {
            zoom: 90%;
        }
        .auto-style5 {
            width: 1346px;
            height: 23px;
        }
        .auto-style6 {
            height: 18px;
        }
        .auto-style7 {
            height: 64px;
        }

        table.mygridview {
            font-family: 'Prompt', sans-serif;
            text-align: center;
            border-collapse: collapse;
            width: 100%;
        }

            table.mygridview td, table.mygridview th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            table.mygridview tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            table.mygridview tr:hover {
                background-color: #ddd;
            }

            table.mygridview th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #4CAF50;
                text-shadow: 2px 2px black;
                color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Zoom">
            <div>
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" Font-Size="20pt" Text="รายงานปริมาณอ้อย / รถเข้าหีบ"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="LoadingPanel">
                            </dx:ASPxLoadingPanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" AllowCollapsingByHeaderClick="True" HeaderText="รายวัน" ShowCollapseButton="true" Theme="Office2003Blue" Width="100%">
                                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" />
                                <Content BackColor="White">
                                </Content>
                                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="4">
        <Items>
            <dx:LayoutItem Caption="วันที่">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <div class="form-group">
                                        <dx:ASPxDateEdit ID="txtDateS" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                        </dx:ASPxDateEdit>
                                    </div>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ถึง">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <div class="form-group">
                                        <dx:ASPxDateEdit ID="txtDateE" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                        </dx:ASPxDateEdit>
                                    </div>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" Theme="Moderno" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
                            <Image IconID="find_find_32x32">
                            </Image>
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxButton ID="ASPxFormLayout1_E1" runat="server" OnClick="ASPxFormLayout1_E1_Click" Text="Export">
                        </dx:ASPxButton>
                        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" OnInit="ASPxGridViewExporter1_Init">
                        </dx:ASPxGridViewExporter>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
                                    <table style="width:100%;">
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" EnableTheming="True" Font-Size="10pt" OnPageIndexChanged="ASPxGridView1_PageIndexChanged" Theme="Office2010Silver" Width="100%">
                                                    <SettingsPager PageSize="50" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <Settings ShowFooter="True" />
                                                    <SettingsBehavior AllowGroup="False" AllowSort="False" />
                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                    <EditFormLayoutProperties ColCount="2">
                                                    </EditFormLayoutProperties>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="วันที่" FieldName="Q_Date" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle HorizontalAlign="Center">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewBandColumn Caption="รถออกรวม" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="ราง A" FieldName="Q_CarA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="ราง B" FieldName="Q_CarB" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="รวม A+B (คัน)" FieldName="Q_CarAB" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="จำนวนอ้อยราง A" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="เฉลี่ยตัน / ชม." FieldName="Q_AvgCaneA" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="สะสม (ตัน)" FieldName="Q_SumA" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="จำนวนอ้อยราง B" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="สะสม (ตัน)" FieldName="Q_SumB" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="เฉลี่ยตัน / ชม." FieldName="Q_AvgCaneB" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="ราง A + B (ตัน)" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="เฉลี่ยตัน / ชม." FieldName="Q_AvgCaneAB" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="สะสมประจำวัน (ตัน)" FieldName="Q_SumAB" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                    </Columns>
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="#,##0" FieldName="Q_CarA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="#,##0" FieldName="Q_CarB" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="#,##0" FieldName="Q_CarAB" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="#,##0.00" FieldName="Q_SumA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="#,##0.00" FieldName="Q_SumB" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="#,##0.00" FieldName="Q_SumAB" SummaryType="Sum" />
                                                    </TotalSummary>
                                                    <GroupSummary>
                                                        <dx:ASPxSummaryItem ShowInColumn="ราง A" SummaryType="Sum" />
                                                    </GroupSummary>
                                                    <Styles>
                                                        <AlternatingRow BackColor="#EEEEEE">
                                                        </AlternatingRow>
                                                        <Footer HorizontalAlign="Center">
                                                        </Footer>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
    </table>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" AllowCollapsingByHeaderClick="True" HeaderText="รายชั่วโมง" ShowCollapseButton="true" Theme="Office2003Olive" Width="100%">
                                <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" />
                                <Content BackColor="White">
                                </Content>
                                <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="2">
                    <Items>
                        <dx:LayoutItem Caption="วันที่">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <div class="form-group">
                                        <dx:ASPxDateEdit ID="txtDate1" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Font-Size="12pt">
                                        </dx:ASPxDateEdit>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="btnSearch1" runat="server" AutoPostBack="False" OnClick="btnSearch1_Click" Theme="Moderno">
                                        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
                                        <Image IconID="find_find_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" EnableTheming="True" Font-Size="10pt" OnPageIndexChanged="ASPxGridView1_PageIndexChanged" Theme="Office2010Silver" Width="100%" OnRowCommand="ASPxGridView2_RowCommand">
                    <SettingsPager PageSize="50" Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowFooter="True" />
                    <SettingsBehavior AllowGroup="False" AllowSort="False" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <EditFormLayoutProperties ColCount="2">
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewBandColumn Caption="รายงานประมาณอ้อย รายชั่วโมง" ShowInCustomizationForm="True" VisibleIndex="4">
                            <HeaderStyle HorizontalAlign="Center" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="เวลา" FieldName="Q_Date" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center" Border-BorderColor="Black">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="รถออกรวม" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="ราง A" FieldName="Q_CarA" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#FEE4D7" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ราง B" FieldName="Q_CarB" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#FEE4D7" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="รวม A+B (คัน)" FieldName="Q_CarAB" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#FEE4D7" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="จำนวนอ้อยราง A" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="ตัน / ชม." FieldName="Q_AvgCaneA" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#DDEBF8" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="สะสม (ตัน)" FieldName="Q_SumA" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#DDEBF8" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="จำนวนอ้อยราง B" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="ตัน / ชม." FieldName="Q_AvgCaneB" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#E2F0D9" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="สะสม (ตัน)" FieldName="Q_SumB" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#E2F0D9" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="ราง A + B (ตัน)" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="ตัน / ชม." FieldName="Q_AvgCaneAB" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#FFF0D2" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="สะสมประจำวัน (ตัน)" FieldName="Q_SumAB" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle BackColor="#FFF0D2" HorizontalAlign="Center" Border-BorderColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="รถรอคิว (คัน)" FieldName="Q_CarCount" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle BackColor="#D5DCE4" Border-BorderColor="Black" HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="รถรอคิวรายชั่วโมง" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                            <HeaderStyle HorizontalAlign="Center" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="จำนวนรถ (คัน)" ShowInCustomizationForm="True" VisibleIndex="0" FieldName="C_Carnum">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataButtonEditColumn Caption="รายละเอียด" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <DataItemTemplate>
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" RenderMode="Link" Theme="Material" CommandName="A">
                                            <Image IconID="spreadsheet_showallsubtotalsatbottompivottable_32x32">
                                            </Image>
                                        </dx:ASPxButton>
                                    </DataItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataButtonEditColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                    </Columns>
                    <GroupSummary>
                        <dx:ASPxSummaryItem ShowInColumn="ราง A" SummaryType="Sum" />
                    </GroupSummary>
                    <Styles>
                        <Footer HorizontalAlign="Center">
                        </Footer>
                    </Styles>
                </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" AllowCollapsingByHeaderClick="True" BackColor="White" HeaderText="รายงานเปรียบเทียบ อ้อยไฟไหม้ อ้อยสด" HorizontalAlign="Center" LoadContentViaCallback="True" ShowCollapseButton="true" Width="100%" Theme="Default">
                                <HeaderStyle BackColor="#FFCC99" Font-Size="X-Large" HorizontalAlign="Center" />
                                <PanelCollection>
<dx:PanelContent runat="server">
    <table class="dxflInternalEditorTable_Office2003Blue">
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style7">
                <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" ColCount="4" Theme="Default">
                    <Items>
                        <dx:LayoutItem Caption="วันที่">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                     <div class="form-group">
                                         <dx:ASPxDateEdit ID="txtDateS0" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Font-Size="10pt">
                                         </dx:ASPxDateEdit>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="ถึง">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <div class="form-group">
                                        <dx:ASPxDateEdit ID="txtDateE0" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Font-Size="10pt">
                                        </dx:ASPxDateEdit>
                                    </div>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="btnSearch2" runat="server" OnClick="btnSearch2_Click" Theme="Moderno">
                                        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
                                        <Image IconID="find_find_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="ASPxFormL" runat="server" OnClick="ASPxFormL_Click" Text="Export">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style6">
                <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" EnableTheming="True" Font-Size="10pt" OnPageIndexChanged="ASPxGridView1_PageIndexChanged" Theme="Default" Width="100%" ShowFooter="true">
                    <SettingsPager PageSize="50" Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowFooter="True" />
                    <SettingsBehavior AllowGroup="False" AllowSort="False" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <EditFormLayoutProperties ColCount="2">
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewBandColumn Caption="รายงานเปรียบเทียบ อ้อยสด อ้อยไฟไหม้" ShowInCustomizationForm="True" VisibleIndex="6">
                            <HeaderStyle BackColor="#FFFFCC" Font-Size="Large" ForeColor="Black" HorizontalAlign="Center" />
                            <ExportCellStyle BackColor="#FFFFCC" BorderSize="3" Font-Size="X-Large" Font-Strikeout="False" ForeColor="Black" HorizontalAlign="Center">
                            </ExportCellStyle>
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="วันที่" FieldName="Q_Date" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#CCCCCC" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                    <ExportCellStyle ForeColor="Black" HorizontalAlign="Center">
                                    </ExportCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="จำนวนอ้อยราง A" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                    <ExportCellStyle BorderSize="2" Font-Size="18pt" ForeColor="Black" HorizontalAlign="Center">
                                    </ExportCellStyle>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="สะสมอ้อยสด" FieldName="Q_SumSA" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="สะสมอ้อยไฟไหม้" FieldName="Q_SumFA" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="จำนวนอ้อยราง B" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                    <ExportCellStyle BorderSize="2" Font-Size="18pt" ForeColor="Black" HorizontalAlign="Center">
                                    </ExportCellStyle>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="รวมอ้อยไฟไหม้" FieldName="Q_SumFB" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black" HorizontalAlign="Center">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="รวมอ้อยสด" FieldName="Q_SumSB" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black" HorizontalAlign="Center">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="ราง A + B (ตัน)" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                    <ExportCellStyle BorderSize="2" Font-Size="18pt" ForeColor="Black" HorizontalAlign="Center">
                                    </ExportCellStyle>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="สะสมอ้อยไฟไหม้" FieldName="Q_SumcaneFAB" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black" HorizontalAlign="Center">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="สะสมอ้อยสด" FieldName="Q_SumcaneSAB" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black" HorizontalAlign="Center">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="รวม A + B ( % )" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                    <ExportCellStyle BorderSize="2" Font-Size="18pt" ForeColor="Black">
                                    </ExportCellStyle>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="% อ้อยไฟไหม้" FieldName="Q_AvgFCaneAB" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black" HorizontalAlign="Center">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% อ้อยสด" FieldName="Q_AvgSCaneAB" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#CCCCCC" />
                                            <CellStyle ForeColor="Black" HorizontalAlign="Center">
                                            </CellStyle>
                                            <ExportCellStyle BorderSize="2" ForeColor="Black" HorizontalAlign="Center">
                                            </ExportCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="รวมรายวัน" FieldName="Sumdate" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                    </Columns>
                    <GroupSummary>
                        <dx:ASPxSummaryItem ShowInColumn="% อ้อยไฟไหม้" SummaryType="Average" FieldName="Q_SumcaneFAB" ShowInGroupFooterColumn="% อ้อยไฟไหม้" />
                    </GroupSummary>
                    <Styles>
                        <AlternatingRow BackColor="#EEEEEE">
                        </AlternatingRow>
                        <Footer HorizontalAlign="Center">
                        </Footer>
                    </Styles>
                </dx:ASPxGridView>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server"  GridViewID="ASPxGridView3">
                </dx:ASPxGridViewExporter>
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter3" runat="server" ExportedRowType="All" FileName="23132132" GridViewID="ASPxGridView3" OnDataBinding="ASPxGridViewExporter3_DataBinding" OnLoad="ASPxGridViewExporter3_Load" ReportHeader="{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset222 Angsana New;}{\f1\fnil\fcharset0 Times New Roman;}}
\viewkind4\uc1\pard\qc\lang1054\b\f0\fs32\'c3\'d2\'c2\'a7\'d2\'b9\'e0\'bb\'c3\'d5\'c2\'ba\'e0\'b7\'d5\'c2\'ba \'cd\'e9\'cd\'c2\'ca\'b4 \'cd\'e9\'cd\'c2\'e4\'bf\'e4\'cb\'c1\'e9\lang1033\b0\f1\fs20\par
}
">
                    <Styles>
                        <Default HorizontalAlign="Center">
                        </Default>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <Cell HorizontalAlign="Center">
                        </Cell>
                    </Styles>
                </dx:ASPxGridViewExporter>
                <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" HeaderText="รายงานรถรอคิดรายชั่วโมง" PopupHorizontalAlign="WindowCenter" Theme="Material" Width="711px" CloseOnEscape="True" ShowHeader="False">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">                      
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" ShowCollapseButton="True" Theme="Material" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxFormLayout ID="ASPxFormLayout5" runat="server" Theme="Material" Font-Size="Large" ForeColor="Black" Width="100%" ColCount="2">
                                            <Items>
                                                <dx:LayoutItem BackColor="#FFFFCC" Caption="" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout5_E2" runat="server" Font-Size="Large" Text="จำนวนรถอ้อย ลานนอก">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="อ้อยไฟ">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="T_Firecane0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="อ้อยสด">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="T_Freshcane0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="อ้อยกล่อง">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="T_CaneBox0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="อ้อยสด ( คุณภาพ )">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="T_Caneclean0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="สามแต๋น">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="T_CaneCAR0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="เทลเลอร์">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="T_CanTrailer0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem BackColor="#FFCC99" Caption="รวมรถลานนอก">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="sumRangnok0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem BackColor="#FFFFCC" Caption="" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout5_E1" runat="server" Font-Size="Large" Text="จำนวนรถอ้อย ลานใน" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ราง A">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="RangA0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="ราง B">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="RangB0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem BackColor="#FFCC99" Caption="รวมรถลานใน">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="sumAB0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem BackColor="#99CCFF" Caption="รวมลานนอก+ลานใน">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="sumRangnokAB0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="X-Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem BackColor="#FFFFCC" Caption="" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout5_E4" runat="server" Font-Size="Large" Text="สถานะการเดินเครื่อง" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout5_E3" runat="server">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ราง A">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="ASPxFormLayout4_E19" runat="server" Font-Size="Large" Theme="Material" >
                                                                <Items>
                                                                    <dx:ListEditItem Text="ยังไม่เดินเครื่อง" Value="0" />
                                                                    <dx:ListEditItem Text="เดินเครื่องปกติ" Value="1" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout4_E20" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ราง B">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="ASPxFormLayout4_E21" runat="server" Font-Size="Large" Theme="Material" >
                                                                <Items>
                                                                    <dx:ListEditItem Text="ยังไม่เดินเครื่อง" Value="0" />
                                                                    <dx:ListEditItem Text="เดินเครื่องปกติ" Value="1" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout4_E22" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem BackColor="#FFFFCC" Caption="" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout5_E5" runat="server" Font-Size="Large" Text="เวลา" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ราง A">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="rangAton0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout5_E6" runat="server" Font-Size="Large">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ราง B">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="rangBton0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="ASPxFormLayout5_E7" runat="server" Font-Size="Large">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="ณ.วันที่" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="date0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                    <ParentContainerStyle ForeColor="Black">
                                                    </ParentContainerStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem BackColor="#CCFFCC" Caption="เป้าหมาย">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="kpi0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem BackColor="#CCFFCC" Caption="สะสม">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="kpaP0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem BackColor="#CCFFFF" Caption="เกิดจริง">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="Actuallyborn0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem BackColor="#CCFFFF" Caption="สะสม">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="cumulative0" runat="server" Font-Size="Large" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem BackColor="#FFCC99" Caption="ผลต่าง+/-">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="Difference0" runat="server" Font-Size="Large" ForeColor="Red" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Red">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem BackColor="#FFCC99" Caption="สะสม">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxLabel ID="cumulativeD0" runat="server" Font-Size="Large" ForeColor="Red" Theme="Material" Width="100%">
                                                            </dx:ASPxLabel>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                    <CaptionStyle Font-Size="Large" ForeColor="Red">
                                                    </CaptionStyle>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                            </Items>
                                        </dx:ASPxFormLayout>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
                <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" CloseOnEscape="True" HeaderText="รายงานรถรอคิดรายชั่วโมง" PopupHorizontalAlign="WindowCenter" ShowHeader="False" Theme="Material" Width="711px">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" ShowCollapseButton="True" Theme="Material" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxFormLayout ID="ASPxFormLayout4" runat="server" Font-Size="Large" ForeColor="Black" Theme="Material" Width="100%">
                                            <Items>
                                                <dx:LayoutGroup Caption="รถรอคิวลานนอก ลานใน">
                                                    <Items>
                                                        <dx:LayoutGroup Caption="ลานนอก" ColCount="2">
                                                            <Items>
                                                                <dx:LayoutItem Caption="อ้อยไฟ">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="T_Firecane" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="อ้อยสด">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="T_Freshcane" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="อ้อยกล่อง">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="T_CaneBox" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="อ้อยสด ( คุณภาพ )">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="T_Caneclean" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="สามแต๋น">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="T_CaneCAR" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="เทลเลอร์">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="T_CanTrailer" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem BackColor="#FFCC99" Caption="รวมรถลานนอก">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="sumRangnok" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                            </Items>
                                                        </dx:LayoutGroup>
                                                        <dx:LayoutGroup Caption=" ลานใน" ColCount="2">
                                                            <Items>
                                                                <dx:LayoutItem Caption="ราง A">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="RangA" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="ราง B">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="RangB" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem BackColor="#99CCFF" Caption="รวมรถลานใน">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxLabel ID="sumAB" runat="server" Font-Size="Large" Theme="Material">
                                                                            </dx:ASPxLabel>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                    <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                                    </CaptionStyle>
                                                                </dx:LayoutItem>
                                                            </Items>
                                                        </dx:LayoutGroup>
                                                        <dx:LayoutItem BackColor="#FFCC99" Caption="รวมลานนอก+ลานใน">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="sumRangnokAB" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="X-Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                                <dx:LayoutGroup Caption="เวลาปัจจุบัน" ColCount="2">
                                                    <Items>
                                                        <dx:LayoutItem Caption="ช่วงเวลา">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="Time" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:EmptyLayoutItem>
                                                        </dx:EmptyLayoutItem>
                                                        <dx:LayoutItem Caption="ราง A">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="rangAton" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="ราง B">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="rangBton" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                                <dx:LayoutGroup Caption="สถานะการเดินเครื่อง" ColCount="2">
                                                    <Items>
                                                        <dx:LayoutItem Caption="ราง A">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxComboBox ID="ASPxFormLayout4_E15" runat="server" Font-Size="Large" Theme="Material">
                                                                        <Items>
                                                                            <dx:ListEditItem Text="ยังไม่เดินเครื่อง" Value="0" />
                                                                            <dx:ListEditItem Text="เดินเครื่องปกติ" Value="1" />
                                                                        </Items>
                                                                    </dx:ASPxComboBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="ASPxFormLayout4_E17" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="ราง B">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxComboBox ID="ASPxFormLayout4_E16" runat="server" Font-Size="Large" Theme="Material">
                                                                        <Items>
                                                                            <dx:ListEditItem Text="ยังไม่เดินเครื่อง" Value="0" />
                                                                            <dx:ListEditItem Text="เดินเครื่องปกติ" Value="1" />
                                                                        </Items>
                                                                    </dx:ASPxComboBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="ASPxFormLayout4_E18" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                                <dx:LayoutGroup Caption="สะสมประจำวัน" ColCount="2">
                                                    <Items>
                                                        <dx:LayoutItem Caption="ณ.วันที่" ColSpan="2">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="date" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem BackColor="#CCFFCC" Caption="เป้าหมาย">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="kpi" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem BackColor="#CCFFCC" Caption="สะสม">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="kpaP" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem BackColor="#CCFFFF" Caption="เกิดจริง">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="Actuallyborn" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem BackColor="#CCFFFF" Caption="สะสม">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="cumulative" runat="server" Font-Size="Large" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Black">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem BackColor="#FFCC99" Caption="ผลต่าง+/-">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="Difference" runat="server" Font-Size="Large" ForeColor="Red" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Red">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem BackColor="#FFCC99" Caption="สะสม">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxLabel ID="cumulativeD" runat="server" Font-Size="Large" ForeColor="Red" Theme="Material">
                                                                    </dx:ASPxLabel>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                            <CaptionStyle Font-Size="Large" ForeColor="Red">
                                                            </CaptionStyle>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                            </Items>
                                        </dx:ASPxFormLayout>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
                                    </dx:PanelContent>
</PanelCollection>
                            </dx:ASPxRoundPanel>
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            &nbsp;</td>
                    </tr>
                </table>

            </div>
        </div>
    </form>
</body>
</html>
