<%@ Page Language="C#" AutoEventWireup="true" CodeFile="techspec.aspx.cs" Inherits="techspec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="AccessDataSource1">
                <ItemTemplate>
                    techspec:
                    <asp:Label ID="TechSpecUrlLocationLabel" runat="server" Text='<%# Bind("techspec") %>'></asp:Label><br />
                    ConfigurationNumber:
                    <asp:Label ID="ConfigurationNumberLabel" runat="server" Text='<%# Bind("ConfigurationNumber") %>'></asp:Label><br />
                </ItemTemplate>
            </asp:FormView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT SS_doc_type_SupportTechSpec.[SS-TechSpecUrlLocation] AS techspec, ProductConfiguration.ConfigurationNumber FROM (((ProductConfiguration INNER JOIN ProductModelname ON ProductConfiguration.ModelNameID = ProductModelname.ModelNameID) INNER JOIN SS_doc_product_path ON ProductModelname.[SS-URL] = SS_doc_product_path.[SS-URL]) INNER JOIN SS_doc_type_SupportTechSpec ON SS_doc_product_path.[SS-doc-name] = SS_doc_type_SupportTechSpec.[SS-doc-name]) WHERE (ProductConfiguration.ConfigurationNumber = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="?" QueryStringField="config" />
                </SelectParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>
