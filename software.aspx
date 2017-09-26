<%@ Page Language="C#" AutoEventWireup="true" CodeFile="software.aspx.cs" Inherits="software" %>
<%@ OutputCache CacheProfile="cacheEmAll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>software</title>
    <link media="screen" href="StyleSheetForMaster.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" CssClass="DataWebControlStyle">
        <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            <Columns>
                <asp:BoundField DataField="SS-author" HeaderText="SS-author" SortExpression="SS-author" />
                <asp:BoundField DataField="SS-date-created" HeaderText="SS-date-created" SortExpression="SS-date-created" />
                <asp:BoundField DataField="SS-OS-Abbreviation" HeaderText="SS-OS-Abbreviation" SortExpression="SS-OS-Abbreviation" />
                <asp:BoundField DataField="SS-Version" HeaderText="SS-Version" SortExpression="SS-Version" />
                <asp:HyperLinkField Target="_blank" DataNavigateUrlFields="SS-URLLocation" DataNavigateUrlFormatString="{0}" DataTextField="SS-Description" HeaderText="File" />
                <asp:BoundField DataField="SS-Size" HeaderText="SS-Size" SortExpression="SS-Size" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT ProductConfiguration.ConfigurationNumber, ProductModelname.ModelName, SS_doc_product_path.[SS-doc-name], SS_doc.[SS-doc-type-name], SS_doc.[SS-author], SS_doc.[SS-date-created], SS_doc_type_FujitsuPCDriver.[SS-URLLocation], SS_doc_type_FujitsuPCDriver_OS.[SS-OS-Abbreviation], SS_doc_type_FujitsuPCDriver.[SS-Version], SS_doc_type_FujitsuPCDriver.[SS-Size], SS_doc_type_FujitsuPCDriver.[SS-ReadMeURLLocation], SS_doc_type_FujitsuPCDriver.[SS-Description] FROM (((((SS_doc INNER JOIN SS_doc_product_path ON SS_doc.[SS-doc-name] = SS_doc_product_path.[SS-doc-name]) INNER JOIN ProductModelname ON SS_doc_product_path.[SS-URL] = ProductModelname.[SS-URL]) INNER JOIN SS_doc_type_FujitsuPCDriver ON SS_doc.[SS-doc-name] = SS_doc_type_FujitsuPCDriver.[SS-doc-name]) INNER JOIN SS_doc_type_FujitsuPCDriver_OS ON SS_doc_type_FujitsuPCDriver.[SS-doc-name] = SS_doc_type_FujitsuPCDriver_OS.[SS-doc-name]) INNER JOIN ProductConfiguration ON ProductModelname.ModelNameID = ProductConfiguration.ModelNameID) WHERE (ProductConfiguration.ConfigurationNumber = ?) ORDER BY SS_doc_type_FujitsuPCDriver_OS.[SS-OS-Abbreviation] ASC, SS_doc_type_FujitsuPCDriver.[SS-Description] ASC">
            <SelectParameters>
                <asp:QueryStringParameter Name="Configuration" QueryStringField="ConfigurationNumber" />
            </SelectParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
