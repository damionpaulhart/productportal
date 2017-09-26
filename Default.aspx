<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%--
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>  --%>

<%@ OutputCache CacheProfile="cacheEmAll" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="fcs" TagName="searchright" Src="~/App_Controls/SearchRight.ascx" %>
<%@ Register TagPrefix="fcs" TagName="WhatsUpdatedPopUp" Src="~/App_Controls/WhatsUpdatedPopUp.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SANDS</title>
    <link media="screen" href="StyleSheetForMaster.css" type="text/css" rel="stylesheet" />
    <link href="App_Controls/WhatsUpdatedPopUpStyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="favicon.ico"
        type="image/x-icon" />
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <style type="text/css">
        .textbox
        {
            border: solid 3px #999999;
            font-size: 14pt;
            color: #666666;
        }
        .button
        {
            border: solid 3px #666666;
            font-size: 12pt;
            color: #444444;
        }
    </style>

    <script language="javascript" type="text/javascript">
// <!CDATA[
        function showhideBanner_onclick(id) {
            var thisone = window.document.getElementById(id);
            if ((thisone.style.display == "none")) {
                thisone.style.display = "block"
            }
            else { thisone.style.display = "none" }
        }
//]]>
    </script>

</head>
<body>
    
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 
    <div id="status" style="padding: 2px; background-color:#ff0000; color: White; font-size:12px;">
                SANDS will change to FUSE on April 1st. You do not have to do anything. All the information is the same, it is just better... try it here: <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="http://fuse.corp.fc.local/fjportal">FUSE</asp:HyperLink></div>

    
                <%--<fcs:whatsupdatedpopup ID="Popup1" runat="server" />--%>
                <%-- <img style="float: left;" alt="Fujitsu America Logo" src="images/logo.gif" />--%>

<div style="background-color:#000000;">

	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="100%" height="120" id="Untitled-1" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="movie" value="FUSE_20110401.swf" />
	<param name="quality" value="high" />
	<param name="bgcolor" value="#000000" />	
	<embed src="FUSE.swf" quality="high" bgcolor="#000000" width="100%" height="120" name="FUSE_20110401.swf" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	</object>
 
         </div>
            
<table>
<tr>
                    <td id="master_header" colspan="2"><img alt="Fujitsu America Logo" src="images/logo.gif"/>Try the new version of SANDS > <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://fuse.corp.fc.local/fjportal">FUSE</asp:HyperLink></td>
                </tr>
        <tr>
            <td id="master_nav" colspan="2">
                <a href="default.aspx">Home</a><a href="fcsfiles\lut">Look
                    Up Tables</a> <a href="fcsfiles\drawings" target="_blank">
                        Exploded Diagrams</a> <a href="LatestDrivers.aspx" target="_blank">
                        Driver Search</a>
            </td>
        </tr>
        <%--<tr>
                    <td id="master_sitemap" colspan="2">
                        <asp:SiteMapPath ID="SiteMapPath1" runat="server" CssClass="sitemap" />
                    </td>
                </tr>
                <tr>
                    <td id="master_pageheader" colspan="2">
                        
                    </td>
                </tr>--%>
        <tr>
            <td id="content_home">
                <%--<div class="serieslinks">
                <asp:Panel ID="PanelQuickConfig" DefaultButton="ButtonQuickConfig" runat="server" CssClass="no">Quick Config Check: 
<asp:TextBox ID="TextBoxQuickConfig" runat="server" Width="200px"></asp:TextBox>
<asp:Button ID="ButtonQuickConfig" runat="server" Text=">>" OnClick="ButtonQuickConfig_Click" Width="30px" /><br />
</asp:Panel>
                
                
                </div>--%>
                <div class="bannerbar">
                    <a href="http://support.fujitsupc.com/CS/Portal/supporthome.do" style="color:#ffffff; font-size:.6em;" target="_blank">FUJITSU Mobile Support Website</a> | 
                <a href="http://salesuskm.fc.fujitsu.com/SalesToolkit/PPG/ProductInfo/Mobile.aspx" style="color:#ffffff; font-size:.6em;" target="_blank">FUJITSU Mobile Marketing</a> |
                
                <a href="http://wwwi.connect.fujitsu.com/" style="color:#ffffff; font-size:.6em;" target="_blank">FUJITSU News</a> |
                <a href="http://www.fujitsu.com/global/about/profile/philosophy/" style="color:#ffffff; font-size:.6em;" target="_blank">The Fujitsu Way</a>
                </div>
                <div class="serieslinks">
                    <table width="100%">
                        <tr>
                            <td valign="top">
                                <ul class="links1">
                                    <li><a href="series.aspx?Series=A">A Series </a></li>
                                    <li><a href="series.aspx?Series=B">B Series</a></li>
                                    <li><a href="series.aspx?Series=C">C Series </a></li>
                                    <li><a href="series.aspx?Series=E">E Series</a></li>
                                    <li><a href="series.aspx?Series=i">i Series</a></li>
                                    <li><a href="series.aspx?Series=L">L Series</a></li></ul>
                                <ul class="links1">
                                    <li><a href="series.aspx?Series=M">M Series</a></li>
                                    <li><a href="series.aspx?Series=N">N Series</a></li>
                                    <li><a href="series.aspx?Series=P">P Series</a></li>
                                    <li><a href="series.aspx?Series=Q">Q Series</a></li>
                                    <li><a href="series.aspx?Series=S">S Series</a></li>
                                    <li><a href="series.aspx?Series=T">T Series</a></li>
                                    <li><a href="series.aspx?Series=U">U Series</a></li>
                                    <li><a href="series.aspx?Series=V">V Series</a></li></ul>
                                <ul class="links2">
                                    <li><a href="series.aspx?Series=200">200 Series</a></li>
                                    <li><a href="series.aspx?Series=400">400 Series</a></li>
                                    <li><a href="series.aspx?Series=500">500 Series</a></li>
                                    <li><a href="series.aspx?Series=600">600 Series</a></li>
                                    <li><a href="series.aspx?Series=700">700 Series</a></li>
                                    <li><a href="series.aspx?Series=900">900 Series</a></li></ul>
                                <ul class="links1">
                                    <li><a href="series.aspx?Series=Point">Point</a></li>
                                    <li><a href="series.aspx?Series=PenCentra">PenCentra</a></li>
                                    <li><a href="series.aspx?Series=Stylistic LT">Stylistic LT </a></li>
                                    <li><a href="series.aspx?Series=Stylistic">Stylistic</a></li></ul>
                                <ul class="links2">
                                    <li><a href="series.aspx?Series=Celsius">Celsius</a></li>
                                    <li><a href="series.aspx?Series=Milan">Milan</a></li>
                                    <li><a href="series.aspx?Series=Monte Carlo">MonteCarlo</a></li>
                                    <li><a href="series.aspx?Series=Montego">Montego</a></li>
                                </ul>
                                <div class="clear">
                                </div>
                            </td>
                            <td style="width: 100%; vertical-align: top; text-align: left;">
                                <div id="sandslinks">
                                <cc1:TabContainer ID="TabContainer1" runat="server" ScrollBars="Auto">
                                    <cc1:TabPanel ID="TabPanel8" runat="server">
                                        <HeaderTemplate>
                                            Mobile Products</HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="metrics">
                                                <%--<asp:button ID="btnExportToExcel" runat="server" OnClick="btnExportToExcel_Click"
                        Text="Open In Excel" />--%>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <div class="filter">
                                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
                                                            <asp:Button ID="Button1" runat="server" CssClass="button" Text="Search" /><br />
                                                        </div>
                                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                                            DisplayAfter="1" EnableViewState="false">
                                                            <ProgressTemplate>
                                                                <img src="images/25-1.gif" /><div class="clear">
                                                                </div>
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
                                                            CssClass="DataWebControlStyle" AllowSorting="True" EnableViewState="False" OnRowDataBound="GridView1_RowDataBound">
                                                            <RowStyle CssClass="RowStyle" />
                                                            <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Codename" SortExpression="Codename">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Codename", "search-codename.aspx?codename={0}") %>'
                                                                            Text='<%# Bind("Codename") %>'></asp:HyperLink>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Model" SortExpression="ModelName">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ModelName", "search-modelname.aspx?modelname={0}") %>'
                                                                            Text='<%# Bind("ModelName") %>'></asp:HyperLink>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Config" SortExpression="ConfigurationNumber">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>'
                                                                            Text='<%# Bind("ConfigurationNumber") %>'></asp:HyperLink>
                                                                        <%--<asp:HyperLink ID="HyperLinkImage1" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Bind("ConfigurationNumber") %>' imageurl="images/icons-grey/info.jpg"></asp:HyperLink>--%>
                                                                        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Bind("ConfigurationNumber") %>' imageurl="images/icons-grey/plugin.gif"></asp:HyperLink>--%>
                                                                        <asp:Label runat="server" ForeColor="#888888" Text='<%# Eval("dbMemo") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%# Eval("ReleaseDate", "{0:yyyy-MMM-dd}") %>' HtmlEncode="False" />
                                                                        &nbsp;&nbsp;<asp:Label runat="server" ForeColor="#888888" Text='<%# Eval("Season") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb"
                                                            SelectCommand="SELECT Codename, ModelName, ConfigurationNumber, ReleaseDate, Season, dbMemo FROM Products_Basic WHERE ((ReleaseDate LIKE '%2011' OR ReleaseDate LIKE '%2010' OR ReleaseDate LIKE '%2009' OR ReleaseDate LIKE '%2008' OR ReleaseDate LIKE '%2007' OR ReleaseDate LIKE '%2006')) ORDER BY ReleaseDate DESC">
                                                        </asp:AccessDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                &nbsp;&nbsp;
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                                                       
                                    <cc1:TabPanel ID="TabPanel6" runat="server">
                                        <HeaderTemplate>
                                           ASP</HeaderTemplate>
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div style="width: 200px; border: solid 1px #cccccc; padding: 12px; margin: 12px;">
                                                            <img src="images/thumbnail-excel.jpg" style="margin-right: 30px;" />
                                                            <a href="fcsfiles/asp/DLRMSTRupdate.xls">NEW ASP SPREADSHEET</a></div>
                                                    </td>
                                                    <td>
                                                        <div style="width: 200px; border: solid 1px #cccccc; padding: 8px; margin: 8px;">
                                                            <img src="images/thumbnail-canada.jpg" style="margin-right: 30px;" />
                                                            <a href="http://www.fujitsu.ca/support/notebooks/asp.html">ASP - CANADA</a>
                                                        </div>
                                                    </td>
                                                </tr>
<tr>
                                                    <td>
                                                        <div style="width: 200px; border: solid 1px #cccccc; padding: 12px; margin: 12px;">
                                                           
                                                            Map Unavailable until further notice</div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <!--<iframe width="850" height="650" src="fcsfiles/asp/FujitsuServiceProviders.swf"></iframe>-->
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel1" runat="server">
                                        <HeaderTemplate>
                                            Memphis docs
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="Memphisfiles">
                                                <ul>
                                                    <li class="header">Memphis docs </li>
                                                    <li class="caption">Documents and Forms for Memphis use.</li>
                                                    <li><a href="fcsfiles/documents-service-templates/Flat Rate Repair Pricing Guidelines 3.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Flate Rate Pricing v3</a></li>
                                                    <li><a href="fcsfiles/documents-service-templates/Final Notice Letter.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Final Notice Letter</a></li>
                                                    <li><a href="fcsfiles/documents-service-templates/FAX%20COVER%20SHEET.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Fax Cover Sheet</a></li>
                                                    <li><a href="fcsfiles/documents-service-templates/Domestic%20Shipping%20Request%20Form.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Shipping - US</a></li>
                                                    <li><a href="fcsfiles/documents-service-templates/International%20Shipping%20Request%20Form.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Shipping - International</a></li>
                                                    <li><a href="fcsfiles/documents-service-templates/warranty%20template.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Warranty Change</a></li>
                                                    <li><a href="fcsfiles/documents-service-templates/FPC_credit_app.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">FCS Credit Application</a></li>
                                                    <li><a href="fcsfiles/CUSTOMER ACCOUNT NUMBERS.xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Word File">CUSTOMER ACCOUNT NUMBERS</a></li>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel2" runat="server">
                                        <HeaderTemplate>
                                            Part docs
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="PartsInfo">
                                                <ul>
                                                    <li class="header">Part docs</li>
                                                    <li class="caption">Reference documents for parts </li>
                                                    <li><a href="App_Data-Documents/SpPtList_(2010_10Oct15).xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Excel File">Spare Parts List <span>2010_10Oct15</span></a></li>
                                                    <li><a href="App_Data-Documents/PenSparePartsApr011.xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Excel File">Spare Parts - PenTablet</a></li>
                                                    <li><a href="http://insite.fjcs.net/insite/operations.do?catID=c373e912eefd72218f6aa276b3800100"
                                                        target="_blank">Backorder report</a></li>
                                                    <li><a href="App_Data-Documents/BIOS List v3.01.xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Excel File">BIOS List v3.01<span>2009/02/19</span></a></li>
                                                    <li><a href="fcsfiles/cdlog/NhouseCD.xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Excel File">CD/DVD list </a></li>
                                                    <li><a href="App_Data-Documents/FCS Product-Memory Reference 2005.01.06 v01.xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Excel File">Memory list </a></li>
                                                    <li><a href="App_Data-Documents/PEN%20ACCESSORIES%20CROSS%20REFERENCE%20%20B%209-5-01.xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Excel File">Tablet Accessories</a></li>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel3" runat="server">
                                        <HeaderTemplate>
                                            Model docs
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="Productdocs">
                                                <ul>
                                                    <li class="header">Model docs</li>
                                                    <li class="caption">Model/Configuration Information </li>
                                                    <li><a href="http://webshop.fujitsupc.com/intranet/AdminTool/osvalidate.jsp">CPN/FPC
                                                        Lookup Tool</a></li>
                                                    <li><a href="http://insite.fjcs.net/insite/getdocument?id=c373e900914ca0428f6aa276b3800100&action=view">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Product Availability Chart</a></li>
                                                    <li><a href="App_Data-Documents/LB-Biblo_E20090615.xls">
                                                        <img src="images/doc_excel_grey.gif" alt="Excel File">FJ Worldwide Reference (LB-Biblo_E20090615.xls)
                                                        <span>06/15/2009</span> </a></li>
                                                    <li><a href="App_Data-Documents/MutualRule090904.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Mutual Repair Agreement</a></li>
                                                    <li><a href="http://insite.ftsi.fujitsu.com/insite/offerings.do?catID=c373e9f98527383c8f6aa276b3800100">
                                                        <img src="images/doc_html_grey.gif" alt="HTML file">FCS Product Roadmaps</a></li>
                                                    <li><a href="App_Data-Documents/Desktop Support Matrix.doc">
                                                        <img src="images/doc_word_grey.gif" alt="Word File">Desktop Support<span>8/15/2005</span></a></li>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel4" runat="server">
                                        <HeaderTemplate>
                                            Primus</HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="Primus">
                                                <ul>
                                                    <li class="header">Primus&nbsp;</li>
                                                    <li class="caption">Links for Primus </li>
                                                    <li><a href="http://intranet.fjcs.net/clarify/id/primusid.html">Sign Up for Primus logon</a></li>
                                                    <li><a href="http://insite.fjcs.net/insite/techsupport.do?catID=c373e9f47ea0bad88f6aa276b3800100">
                                                        Open Primus</a></li>
                                                    <li><a href="http://insite.fjcs.net/insite/techsupport.do?catID=c373e9f47ea0bad88f6aa276b3800100">
                                                        Primus on Intranet</a></li>
                                                    <li><a href="http://insite.fjcs.net/insite/getdocument?id=c373e9053a77e65b8f6aa276b3800100&action=download">
                                                        Coaching Review Template</a></li>
                                                    <li><a href="http://insite.fjcs.net/insite/getdocument?id=c373e9053a77e6288f6aa276b3800100&action=download">
                                                        Coaching Review Template Combiner</a></li>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="ASP" runat="server">
                                        <HeaderTemplate>
                                            Numbers and ZIP</HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="Fax">
                                                <ul>
                                                    <li class="header">Fax and FedEx </li>
                                                    <li class="caption">Common numbers </li>
                                                    <li><strong>Customer Relations Fax</strong><br />
                                                        408-764-2723</li>
                                                    <li><strong>Escalation Support Fax</strong><br />
                                                        408-764-2724</li>
                                                    <li><strong>Warranty Fax</strong>
                                                        <br />
                                                        408-764-2726</li>
                                                </ul>
                                            </div>
                                            <div id="zip">
                                                <ul>
                                                    <li class="header">ZIP </li>
                                                    <li class="caption">Enter ZIP Code to find county </li>
                                                </ul>
                                                <input name="cnty" type="hidden" value="cnty" />
                                                <input name="zip" type="text" title="enter zip code to find county" size="25" maxlength="5" />
                                                <input name="go" type="image" value="go" src="images/13x14_Arrow_grey.gif" alt="GO!"
                                                    align="middle" width="16" height="16" hspace="0" vspace="0" />
                                                <br />
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="Downloads" runat="server">
                                        <HeaderTemplate>
                                            Downloads</HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="DownloadsDiv">
                                                <ul>
                                                    <li class="header">Downloads</li>
                                                    <li class="caption">Files which can be sent to customers</li>
                                                    <li><a href="fcsfiles/downloads-sands/PCMCIA_CD/FPCCD.exe">PCMCIA CD Boot Disk</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/usbcam.zip">USB Camera Driver</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/LANhubw2k.zip">USB LAN HUB 2K</a><img src="images/blankdoc.gif"
                                                        alt="NO XP DRIVER" onclick="MM_openBrWindow('fcsfiles/downloads-sands/USB HUB Drivers XP.txt','LANHUB','scrollbars=yes,resizable=yes,width=400,height=600')"></li>
                                                    <li><a href="fcsfiles/downloads-sands/software-bundled-2003/RecordNow.exe">RecordNow!
                                                        Software</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/software-bundled-2003/dla.zip">DLA Software</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/DISE/DISE1.exe">DISE Disk</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/DISE/HIDDENmodels.html">
                                                        <img src="images/blankdoc.gif" alt="Models with hidden DISE partitions">Models with
                                                        Hidden DISE</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/DISE/DISE1.exe">DISE Disk Hidden 1</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/DISE/DISE2HIDDEN.exe">DISE Disk Hidden 2</a></li>
                                                    <li><a href="fcsfiles/downloads-sands/Printkey.exe" title="Printkey is used print screenshots without copy/pasting into a graphics program - the screenshot opens in Printkey and can be edited or sent directly to the printer">
                                                        <img alt="printkey" src="images/printkey.gif" width="16" height="16" hspace="2" border="0">Printkey<span>
                                                            (choose Run)</span></a></li>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="FujitsuWebsites" runat="server">
                                        <HeaderTemplate>
                                            Fujitsu Websites</HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="websites">
                                                <ul>
                                                    <li class="header">Fujitsu Websites </li>
                                                    <li class="caption">Websites of Fujitsu compaines.</li>
                                                    <li><a href="http://support.fujitsupc.com/CS/Portal/supporthome.do">US Support Home
                                                        Page</a></li>
                                                    <li><a href="http://insite.ftsi.fujitsu.com/insite/home.do">Fujitsu INTRANET Home</a></li>
                                                    <li><a href="https://trioleservicedesk.fai.fujitsu.com/CAisd/pdmweb.exe">Request IT HELP (TRIOLE for Service (TfS))
                                                    </a></li>
                                                    <li><a href="../Apps_FilesFujitsu/FAI TfS User Guide.doc">&nbsp;How to use TfS</a></li>
                                                    <li>&nbsp;Helpdesk at x66500 or 1(866)383-6821, or (408)746-6500</li>
                                                    <li><a href="http://netcampus.fujitsu.com/">NetCampus</a></li>
                                                    <li><a href="fcsfiles/HowToLogonNetCampus.html">&nbsp;How to logon NetCampus</a></li>
                                                    <li><a href="http://channel.fujitsupc.com/channels/">ASP website </a></li>
                                                    <li><a href="mailto:dhart@us.fujitsu.com">&nbsp;Request ASP ite logon </a></li>
                                                    <li><a href="http://www.fmworld.net/globalpc/index.html" target="_blank">GIC <span>Global
                                                        Information Center</span></a></li>
                                                    <li><a href="http://www.fujitsu.com" target="_blank">FJ <span>Japan Fujitsu LTD</span></a></li>
                                                    <li><a href="http://www.fujitsu.ca" target="_blank">FCI <span>Canada</span></a></li>
                                                    <li><a href="http://www.fujitsu-pc-asia.com" target="_blank">FCPA <span>Asia/Australia</span></a></li>
                                                    <li><a href="http://kr.fujitsu.com/" target="_blank">FKL <span>Korea</span></a></li>
                                                    <li><a href="http://www.fujitsu-siemens.com" target="_blank">FSC <span>Europe - Fujitsu-Siemens</span></a></li>
                                                    <li><a href="http://aftersales.fsc-pc.de/portal" target="_blank">&nbsp;FSC Warranty
                                                        Check <span>(Adler)</span> </a></li>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </cc1:TabContainer></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="master_searchright">
                <a href="http://diamond.ftsi.fujitsu.com/eservice/iview/ui/eserver.asp" target="_blank">
                    <img src="images/PrimusRM.gif" width="155" height="38" vspace="0" border="0" alt="Primus" /></a>
                <a href="http://fcsapps.fjcs.net:8001/oa_servlets/AppsLogin" target="_blank">
                    <img src="images/ORACLE.gif" width="145" height="28" vspace="5" border="0" alt="Oracle"
                        style="margin-left: 10px" /></a>
                <fcs:searchright ID="SearchRight2" runat="server" />
            </td>
        </tr>
        <tr>
            <td id="master_footer" colspan="2">
                <span>All Rights Reserved, Copyright &#169; Fujitsu America Incorporated 2001-2010</span>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
