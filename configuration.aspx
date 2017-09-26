<%@ Page Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="configuration.aspx.cs" Inherits="configuration" Title="Config Details" %>
<%@ OutputCache CacheProfile="cacheEmAll" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
    <asp:label ID="Label1" runat="server" Text="{Config}"></asp:label>
</asp:content>
<asp:content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:scriptmanagerproxy ID="ScriptManagerProxy1" runat="server" >
    </asp:scriptmanagerproxy>
    <asp:accessdatasource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/SANDS.mdb" 
        
        
        SelectCommand="SELECT ProductLine.ProductLine, ProductSeries.Series, ProductCodename.Codename, ProductCodename.Season, ProductModelname.ModelName, ProductConfiguration.ConfigurationNumber, ProductConfiguration.ReleaseDate, ProductConfiguration.LUT_desc AS LUT_Description, ProductMDLNFO.SW, ProductMDLNFO.HDD, ProductMDLNFO.CPU, ProductMDLNFO.MEM, ProductCodename.Spec_Memory, FilesLookUpTable_NewLUT.FileName FROM ((((ProductLine INNER JOIN ProductSeries ON ProductLine.ProductLineID = ProductSeries.ProductLineID) INNER JOIN (ProductCodename INNER JOIN (ProductModelname INNER JOIN (ProductConfiguration LEFT OUTER JOIN ProductMDLNFO ON ProductConfiguration.ConfigurationNumber = ProductMDLNFO.ModelConfig) ON ProductModelname.ModelNameID = ProductConfiguration.ModelNameID) ON ProductCodename.CodenameID = ProductModelname.CodenameID) ON ProductSeries.SeriesID = ProductCodename.SeriesID) INNER JOIN [FilesLookUpTable_joinConfiguration-LUT] ON ProductConfiguration.ConfigurationNumberID = [FilesLookUpTable_joinConfiguration-LUT].ConfigurationNumberID) INNER JOIN FilesLookUpTable_NewLUT ON [FilesLookUpTable_joinConfiguration-LUT].FileID = FilesLookUpTable_NewLUT.FileID) WHERE (ProductConfiguration.ConfigurationNumber = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="Configuration" />
        </SelectParameters>
    </asp:accessdatasource>
    <asp:formview ID="FormView1" runat="server" DataSourceID="AccessDataSource1" 
        Width="100%" >
        <ItemTemplate>
            <table class="tabledetail">
                <tr>
                    <td id="tabledetailTDProduct">
                        <table style="width: 190px;">
                            <tr>
                                <th>
                                    Series</th>
                                <td>
                                    <a href="series.aspx?Series=<%# Eval("Series") %>"><%# Eval("Series") %></a></td>
                            </tr>
                            <tr>
                                <th>
                                    Codename</th>
                                <td>
                                <a href="search-codename.aspx?codename=<%# Eval("Codename") %>"><%# Eval("Codename")%></a>
                                    </td>
                            </tr>
                            <tr>
                                <th>
                                    Model</th>
                                <td>
                                <a href="search-modelname.aspx?modelname=<%# Eval("ModelName") %>"><%# Eval("ModelName")%></a>
                                    </td>
                            </tr>
                            <tr>
                                <th>
                                    Config</th>
                                <td nowrap="nowrap">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "ConfigReader.aspx?cpn={0}") %>' Text='<%# Eval("ConfigurationNumber") %>' ToolTip='<%# Eval("ConfigurationNumber", "Config Reader") %>'></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 100%;">
                        <table>
                            <tr>
                                <th>
                                    Release Date</th>
                                <td width="100px" nowrap="nowrap">
                                <%# Eval("ReleaseDate", "{0:yyyy-MMM-dd}")%>
                                    </td>
                                <td>Season: <%# Eval("Season")%>
                                    </td>
                            </tr>
                            <tr>
                                <th>
                                    Description</th>
                                <td colspan="2">
                                    <%# Eval("LUT_Description")%></td>
                            </tr>
                            <tr>
                                <th>
                                    Memory Type</th>
                                <td colspan="2">
                                    <%# Eval("Spec_Memory")%></td>
                            </tr>
                            <tr>
                                <th>
                                    Look Up Table</th>
                                <td colspan="2">
                                    <asp:HyperLink ID="HyperLinkLUT" runat="server" Target="_blank" Text='<%# Eval("FileName") %>' NavigateUrl='<%# Eval("FileName", "~/fcsfiles/lut/{0}")%>' ></asp:HyperLink>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="AccessDataSource2">
                                        <HeaderTemplate>Exploded Diagrams<br /></HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLinkExploded" runat="server" Target="_blank" Text='<%# Eval("FileName") %>' NavigateUrl='<%# Eval("FilePath", "~/fcsfiles/drawings/{0}") %>' />
                                            </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT ProductConfiguration.ConfigurationNumber, FilesExploded.FileName, FilesExploded.FilePath, ProductCodename.Codename FROM (((([join_Codename-FilesExploded] INNER JOIN ProductCodename ON [join_Codename-FilesExploded].CodenameID = ProductCodename.CodenameID AND [join_Codename-FilesExploded].CodenameID = ProductCodename.CodenameID) INNER JOIN ProductModelname ON ProductCodename.CodenameID = ProductModelname.CodenameID) INNER JOIN ProductConfiguration ON ProductModelname.ModelNameID = ProductConfiguration.ModelNameID) INNER JOIN FilesExploded ON [join_Codename-FilesExploded].ExplodedID = FilesExploded.ExplodedID) WHERE (ProductConfiguration.ConfigurationNumber = ?)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="?" QueryStringField="Configuration" />
                                        </SelectParameters>
                                    </asp:AccessDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br /><br />
            <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" Height="350px" Width="100%">
                <cc1:TabPanel ID="TabPanel1" runat="server" >
                    <HeaderTemplate>
                        Tech Spec </HeaderTemplate>
                    <ContentTemplate>
                        <iframe name="iContent" style="border: 1px solid #cccccc;" src='<%# Eval("ConfigurationNumber", "techspec.aspx?config={0}") %>' width="100%" height="350" scrolling="auto" frameborder="0" id="Iframe3"></iframe>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel2" runat="server">
                    <HeaderTemplate>
                        Documents </HeaderTemplate>
                    <ContentTemplate>
                        <iframe name="iContent" style="border: 1px solid #cccccc;" src='<%# Eval("ConfigurationNumber", "documentation.aspx?Configuration={0}") %>' width="100%" height="350" scrolling="auto" frameborder="0" id="Iframe4"></iframe>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel3" runat="server">
                    <HeaderTemplate>
                        Downloads </HeaderTemplate>
                    <ContentTemplate>
                        <iframe name="iContent" style="border: 1px solid #cccccc;" src='<%# Eval("ConfigurationNumber", "software.aspx?ConfigurationNumber={0}") %>' width="100%" height="350" scrolling="auto"  frameborder="0" id="Iframe1"></iframe>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel ID="TabPanel4" runat="server">
                    <HeaderTemplate>
                        Parts List </HeaderTemplate>
                    <ContentTemplate>
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
        
    <div class="filter">
    Show only if  <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="PartsOrdPart.DESCRIPTION">Part Name</asp:ListItem>
            <asp:ListItem Value="PartsBOM.PRTNUM">Part Number</asp:ListItem>
            <asp:ListItem Value="PartsBOM.COLVAL">COLVAL</asp:ListItem>
            <asp:ListItem Value="PartsOrdPart.LOCATION">Location | Bulklocation</asp:ListItem>
        </asp:DropDownList> contains
        <asp:TextBox ID="TextBox1" runat="server" width="250px"></asp:TextBox> 
        <asp:Button ID="Button1" runat="server" Text="Filter Parts List" />
        
        <br />
    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="User Parts" />
            <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" Text="Non-User Parts" />
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1" EnableViewState="false">
        <ProgressTemplate><img src="images/25-1.gif" /></ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <asp:Panel ID="Panel1" runat="server" Width="100%" DefaultButton="Button1" ScrollBars="Both" Height="300px">
                        
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource3" CssClass="DataWebControlStyle" AllowSorting="True" Width="98%" >
                    <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            <Columns>
                <asp:CheckBoxField DataField="PRTEUREPAI" HeaderText="User Part?" SortExpression="PRTEUREPAI" />
                <asp:BoundField DataField="LISTEACH" HeaderText="Price" SortExpression="LISTEACH" DataFormatString="{0:C}" HtmlEncode="false"  />
                <asp:HyperLinkField Target="_parent" DataTextField="PRTNUM" DataNavigateUrlFields="PRTNUM" DataNavigateUrlFormatString="partsbynumber.aspx?partnumber={0}" HeaderText="Part Number" SortExpression="PRTNUM" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="Part Name" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="COLVAL" HeaderText="COLVAL" SortExpression="COLVAL" />
                <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                <asp:BoundField DataField="QUANTITY" HeaderText="In Stock" SortExpression="QUANTITY" />
                            </Columns>
        </asp:GridView>
        </asp:Panel>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT ProductConfiguration.ConfigurationNumber, PartsBOM.PRTNUM, PartsBOM.PRTEUREPAI, PartsBOM.COLVAL, PartsOrdPart.DESCRIPTION, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PRTNUM = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION <> 'ZERO') AND(ProductConfiguration.ConfigurationNumber = ?) ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PRTNUM">
            <SelectParameters>
                <asp:QueryStringParameter Name="config" QueryStringField="Configuration" />
                <asp:Parameter Name="Codename" Type="String" DefaultValue="%" />
            <asp:Parameter Name="Model" Type="String" DefaultValue="%" />
            <asp:Parameter Name="Config" Type="String" DefaultValue="%" />
            </SelectParameters>
            </asp:AccessDataSource></ContentTemplate></asp:UpdatePanel>
                    </ContentTemplate>
                </cc1:TabPanel>
                <%--<cc1:TabPanel ID="TabPanel5" runat="server" >
                    <HeaderTemplate>
                        Spare Parts </HeaderTemplate>
                    <ContentTemplate>
                        <iframe name="iContent" style="border: 1px solid #cccccc;" src='<%# Eval("ConfigurationNumber", "partsforconfigwithspares.aspx?ConfigurationNumber={0}") %>' width="100%" height="300" scrolling="auto" frameborder="0" id="Iframe2"></iframe>
                    </ContentTemplate>
                </cc1:TabPanel>--%>
            </cc1:TabContainer>
        </ItemTemplate>
    </asp:formview>
</asp:content>
