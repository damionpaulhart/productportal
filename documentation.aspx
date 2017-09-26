<%@ Page Language="C#" AutoEventWireup="true" CodeFile="documentation.aspx.cs" Inherits="documentation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>documentation</title>
        <link media="screen" href="StyleSheetForMaster.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div> 
    
    External Documents:
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" CssClass="DataWebControlStyle">
        <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            <Columns>
                <asp:BoundField DataField="SS-GuideDocName" HeaderText="Name" SortExpression="SS-GuideDocName" />
                <asp:HyperLinkField Target="_blank" DataNavigateUrlFields="SS-GuideUrlLocation" DataNavigateUrlFormatString="http://www.fujitsupc.com/{0}" DataTextField="SS-GuideDocName" HeaderText="Location" />
                <asp:BoundField DataField="SS-author" HeaderText="author" SortExpression="SS-author" />
                <asp:BoundField DataField="SS-date-created" HeaderText="date-created" SortExpression="SS-date-created" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT ProductConfiguration.ConfigurationNumber, ProductModelname.ModelName, SS_doc_product_path.[SS-doc-name], SS_doc.[SS-doc-type-name], SS_doc.[SS-author], SS_doc.[SS-date-created], SS_doc_type_SupportGuides.[SS-GuideUrlLocation], SS_doc_type_SupportGuides.[SS-GuideDocName] FROM (((SS_doc INNER JOIN (SS_doc_product_path INNER JOIN ProductModelname ON SS_doc_product_path.[SS-URL] = ProductModelname.[SS-URL]) ON SS_doc.[SS-doc-name] = SS_doc_product_path.[SS-doc-name]) INNER JOIN SS_doc_type_SupportGuides ON SS_doc.[SS-doc-name] = SS_doc_type_SupportGuides.[SS-doc-name]) INNER JOIN ProductConfiguration ON ProductModelname.ModelNameID = ProductConfiguration.ModelNameID) WHERE (ProductConfiguration.ConfigurationNumber = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Configuration" QueryStringField="Configuration" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
    Internal Documents:
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource3" CssClass="DataWebControlStyle">
        <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <Columns>
            <asp:BoundField DataField="FujitsuFileType" HeaderText="FujitsuFileType" SortExpression="FujitsuFileType" />
            <asp:HyperLinkField Target="_blank" DataNavigateUrlFields="FileName" DataNavigateUrlFormatString="http://sands/FACTS/FILES/{0}" DataTextField="FileName" HeaderText="File" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="Memo" />
            <asp:BoundField DataField="AddDate" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false" HeaderText="AddDate" SortExpression="AddDate" />
        </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/FILES.mdb" SelectCommand="SELECT ProductConfiguration.ConfigurationNumber, FujitsuFileTypes.FujitsuFileType, FACTSFiles.FileName, FACTSFiles.[Memo], FACTSFiles.AddDate FROM ((ProductCodename INNER JOIN ((FujitsuFileTypes INNER JOIN FACTSFiles ON FujitsuFileTypes.FujitsuFileTypeID = FACTSFiles.FujitsuFileTypeID) INNER JOIN joinCodenameFile ON FACTSFiles.FileID = joinCodenameFile.FileID) ON ProductCodename.CodenameID = joinCodenameFile.CodenameID) INNER JOIN (ProductConfiguration INNER JOIN ProductModelname ON ProductConfiguration.ModelNameID = ProductModelname.ModelNameID) ON ProductCodename.CodenameID = ProductModelname.CodenameID) WHERE (ProductConfiguration.ConfigurationNumber = ?) ORDER BY FujitsuFileTypes.FujitsuFileType ASC, FACTSFiles.FileName ASC">
            <SelectParameters>
                <asp:QueryStringParameter Name="Configuration" QueryStringField="Configuration" />
            </SelectParameters>
        </asp:AccessDataSource>
    
    <br />
    FACTS Documents:
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource2" CssClass="DataWebControlStyle">
        <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
            <Columns>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" ItemStyle-Wrap="false" />
                <asp:HyperLinkField Target="_blank" DataNavigateUrlFields="FilePath" DataNavigateUrlFormatString="FACTS/FACTSORG/FACTS/Files/{0}" DataTextField="Type" HeaderText="File" ItemStyle-Wrap="false" />
                <asp:BoundField DataField="File_TypeNote" HeaderText="Note" SortExpression="File_TypeNote" />
                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                <asp:BoundField DataField="Notes" HeaderText="Memo" SortExpression="Notes" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT Files_Category.Category, Files_Type.Type, Files.File_TypeNote, Files.Version, Files.Notes, Files.FilePath, ProductConfiguration.ConfigurationNumber, ProductModelname.ModelName, ProductCodename.Codename FROM (((Files_Category INNER JOIN (Files_Type INNER JOIN Files ON Files_Type.TypeID = Files.File_TypeID) ON Files_Category.CategoryID = Files_Type.CategoryID) INNER JOIN (ProductCodename INNER JOIN [join_Codename-Files] ON ProductCodename.CodenameID = [join_Codename-Files].CodenameID) ON Files.FileID = [join_Codename-Files].FileID) INNER JOIN (ProductModelname INNER JOIN ProductConfiguration ON ProductModelname.ModelNameID = ProductConfiguration.ModelNameID) ON ProductCodename.CodenameID = ProductModelname.CodenameID) WHERE (Files.FilePath NOT LIKE 'http*') AND (ProductConfiguration.ConfigurationNumber = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Configuration" QueryStringField="Configuration" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
