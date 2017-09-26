    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="partsearch.aspx.cs" Inherits="_Default" %>

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
    <link rel="shortcut icon" href="http://sv-corpfsapps01.fjcs.net/SANDS/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="http://sv-corpfsapps01.fjcs.net/SANDS/favicon.ico" type="image/x-icon" />
<style type="text/css">
.textbox {border: solid 3px #999999; font-size:14pt;  color:#666666;}
.button {border: solid 3px #666666; font-size:12pt; color:#444444;}
</style>
    <script language="javascript" type="text/javascript">
// <!CDATA[
function showhideBanner_onclick(id)
{
 var thisone = window.document.getElementById(id);
 if ((thisone.style.display == "none"))
 {
 thisone.style.display = "block"
 }
 else {thisone.style.display = "none"}
}
//]]>
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:scriptmanager ID="ScriptManager1" runat="server">
    </asp:scriptmanager>
    
            <%--<div id="status" style="padding: 2px; background-color:#666; color: White; font-size:12px;">
                NOTE: Older "FPC0" configurations working. Example: <a style="color:White;" href="http://sands/configuration.aspx?Configuration=FPC070201">FPC070201</a>.
            </div>--%>
    <table>
        <tr>
            <td id="master_header" colspan="2">
                Fujitsu Computer Systems
                <asp:label ID="Label1" runat="server" Text="(# users)"></asp:label>
            </td>
        </tr>
        <tr>
            <td id="master_nav" colspan="2">
                <a href="default.aspx">Return To SANDS</a>
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
                    Browse Models
                </div>
                <div class="serieslinks">
                    testarea
                    <div class="clear">
                    </div>
                </div>
                                <div id="sandslinks">
                    <cc1:tabcontainer ID="TabContainer1" runat="server"
                        ScrollBars="Auto">
                        <cc1:tabpanel id="TabPanel8" runat="server">
                        <headertemplate>Releases</headertemplate>
                        <contenttemplate>
                        <div id="metrics">
                    <%--<asp:button ID="btnExportToExcel" runat="server" OnClick="btnExportToExcel_Click"
                        Text="Open In Excel" />--%>
                    <asp:updatepanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
        
<div class="filter">
        <asp:TextBox ID="TextBox1" runat="server" cssclass="textbox" width="200px"></asp:TextBox> 
        <asp:Button ID="Button1" runat="server" cssclass="button"  Text="Search Models" /><br />(Codename, Model, Config, Date)

            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1" EnableViewState="false">
        <ProgressTemplate><img src="images/25-1.gif" /></ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    
    
                        
                        
                        
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" 
                                CssClass="DataWebControlStyle" AllowSorting="True" EnableViewState="False" OnRowDataBound="GridView1_RowDataBound">
                                <RowStyle CssClass="RowStyle"  />
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Codename" SortExpression="Codename">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Codename", "search-codename.aspx?codename={0}") %>' Text='<%# Bind("Codename") %>'></asp:HyperLink>
                                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Model" SortExpression="ModelName">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ModelName", "search-modelname.aspx?modelname={0}") %>' Text='<%# Bind("ModelName") %>'></asp:HyperLink>
                                    </ItemTemplate>
                </asp:TemplateField>

                                    
                        <asp:templatefield headertext="Config" sortexpression="ConfigurationNumber">
                <itemtemplate>
   
   <asp:HyperLink ID="HyperLink2" runat="server"  NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Bind("ConfigurationNumber") %>'></asp:HyperLink>
   
   <asp:HyperLink ID="HyperLinkImage1" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Bind("ConfigurationNumber") %>' imageurl="images/icons-grey/info.jpg"></asp:HyperLink>
   <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Bind("ConfigurationNumber") %>' imageurl="images/icons-grey/plugin.gif"></asp:HyperLink>--%>
   <asp:label runat="server" forecolor="#888888"  text='<%# Eval("dbMemo") %>'></asp:label>
                
                
                                    </itemtemplate>
                </asp:templatefield>
                
                <asp:templatefield headertext="Release Date" sortexpression="ReleaseDate">
                <itemtemplate>
                <asp:label runat="server" text='<%# Eval("ReleaseDate", "{0:yyyy-MMM-dd}") %>' HtmlEncode="False" />
                &nbsp;&nbsp;<asp:label runat="server" forecolor="#888888"   text='<%# Eval("Season") %>' />

                                    
                                    </itemtemplate>
                </asp:templatefield>
                        
                    
                                </Columns>
                            </asp:GridView>
                            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb"
                                SelectCommand="SELECT Codename, ModelName, ConfigurationNumber, ReleaseDate, Season, dbMemo FROM Products_Basic WHERE ((ReleaseDate LIKE '%2010' OR ReleaseDate LIKE '%2009' OR ReleaseDate LIKE '%2008' OR ReleaseDate LIKE '%2007' OR ReleaseDate LIKE '%2006')) ORDER BY ReleaseDate DESC">
                            </asp:AccessDataSource>
                            </ContentTemplate>
                    </asp:updatepanel>
                    &nbsp;&nbsp;
                </div>
                        </contenttemplate>

                        
                        
                        </cc1:tabpanel>
                        
                        <cc1:TabPanel ID="TabPanel1" runat="server">
                            <HeaderTemplate>
                                Memphis docs
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div id="Memphisfiles">
                                    <ul>
                                        <li class="header">Memphis docs </li>
                                        <li class="caption">Documents and Forms for Memphis use.</li>
                                        <li><a href="App_Data-Documents/Memphis August 2006.xls">
                                            <img src="images/doc_excel_grey.gif" alt="Excel File">Memphis Phone List</a></li>
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
                                        <li><a href="App_Data-Documents/SpPtList_(2008_11Nov_21).xls">
                                            <img src="images/doc_excel_grey.gif" alt="Excel File">Spare Parts List <span>2008_11Nov_21</span></a></li>
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
                                        <li ><a href="http://webshop.fujitsupc.com/intranet/AdminTool/osvalidate.jsp">CPN/FPC Lookup Tool</a></li>
       <li><a href="http://insite.fjcs.net/insite/getdocument?id=c373e900914ca0428f6aa276b3800100&action=view">
                                            <img src="images/doc_word_grey.gif" alt="Word File">Product Availability Chart</a></li>
                                        <li><a href="../../../App_Data-Documents/LB-Biblo_E20070220.xls">
                                            <img src="images/doc_excel_grey.gif" alt="Excel File">FJ Worldwide Reference (LB-Biblo_E20070220.xls)
                                            <span>2/20/2007</span> </a></li>
                                        <li><a href="../../../App_Data-Documents/MutualRule.pdf">
                                            <img src="images/doc_pdf_grey.gif" alt="PDF File">Mutual Repair Agreement</a></li>
                                        <li><a href="http://insite.ftsi.fujitsu.com/insite/offerings.do?catID=c373e9f98527383c8f6aa276b3800100">
                                            <img src="images/doc_html_grey.gif" alt="HTML file">FCS Product Roadmaps</a></li>
                                        <li><a href="../../../App_Data-Documents/Desktop Support Matrix.doc">
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
                                ASP & More</HeaderTemplate>
                            <ContentTemplate>

<table>
<tr>
<td><div style="width:200px; border:solid 1px #cccccc; padding:12px; margin:12px; "><img src="images/thumbnail-excel.jpg" style="margin-right:30px;"  /> <a href="fcsfiles/asp/Master ASP List.xls">Master ASP List</a></div></td>
<td>

<div style="width:200px; border:solid 1px #cccccc; padding:12px; margin:12px; ">
<img src="images/thumbnail-usa.jpg" style="margin-right:30px;" /><input name="Open" type="button" onclick="window.open(&quot;fcsfiles/asp/FujitsuServiceProviders.html&quot;,null,&quot;height=600,width=800,top=50,left=50,scrollbars=no,resizable=no,status=no,toolbar=no,menubar=no,location=no&quot;);" value="ASP Map">
</div>


</td></tr>
<tr><td><div style="width:200px; border:solid 1px #cccccc; padding:8px; margin:8px;">
<img src="images/thumbnail-canada.jpg" style="margin-right:30px;"  /> <a href="http://www.fujitsu.ca/support/notebooks/asp.html">ASP - CANADA</a>
</div></td></tr>

</table>




                              
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
                                        <li><a href="http://servicecenter.americas.fujitsu.com">IT Ticket (FAI newScale RequestCenter)
                                        </a></li>
                                        <li><a href="../Apps_FilesFujitsu/newScale_Training_-_User_Guide_v02.doc">&nbsp;How
                                            to use newScale RequestCenter</a></li>
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
                    </cc1:tabcontainer>
                </div>
            </td>
            <td id="master_searchright">
                <a href="http://diamond.ftsi.fujitsu.com/eservice/iview/ui/eserver.asp" target="_blank">
                    <img src="images/PrimusRM.gif" width="155" height="38" vspace="0" border="0" alt="Primus" /></a>
                <a href="http://fcsapps.fjcs.net:8001/OA_HTML/AppsLocalLogin.jsp" target="_blank">
                    <img src="images/ORACLE.gif" width="145" height="28" vspace="5" border="0"
                        alt="Oracle" style="margin-left: 10px" /></a>
                <fcs:searchright ID="SearchRight2" runat="server" />
            </td>
        </tr>
        <tr>
            <td id="master_footer" colspan="2">
                <span>All Rights Reserved, Copyright &#169; Fujitsu Computer Systems Corporation 2001-2008</span></td>
        </tr>
    </table>
    </form>
</body>
</html>
