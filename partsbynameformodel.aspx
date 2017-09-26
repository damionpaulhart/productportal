<%@ Page Language="C#" Debug="true" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="partsbynameformodel.aspx.cs" Inherits="partsbynameformodel" Title="partsbynameformodel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" Runat="Server">

<asp:Label ID="Label1" runat="server"></asp:Label>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" CssClass="DataWebControlStyle" EmptyDataText="Not Found" EnableViewState="False">
        <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        <Columns>
        <asp:CheckBoxField DataField="PrtEURepai" HeaderText="User Part?" SortExpression="PrtEURepai" >
            <ItemStyle HorizontalAlign="Center" />
        </asp:CheckBoxField>
            <asp:BoundField DataField="LISTEACH" HeaderText="Price" SortExpression="LISTEACH" DataFormatString="{0:C}" HtmlEncode="False" />
            <asp:HyperLinkField DataNavigateUrlFields="PrtNum" DataNavigateUrlFormatString="~/partsbynumber.aspx?partnumber={0}" DataTextField="PrtNum" HeaderText="Number" SortExpression="PrtNum">
                <ItemStyle Wrap="False" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="DESCRIPTION" HeaderText="Name" SortExpression="DESCRIPTION" />
           <asp:HyperLinkField DataNavigateUrlFields="ConfigurationNumber" DataNavigateUrlFormatString="~/configuration.aspx?Configuration={0}" DataTextField="ConfigurationNumber" HeaderText="Config" SortExpression="ConfigurationNumber" />
            <asp:BoundField DataField="ModelName" HeaderText="Model" SortExpression="ModelName" />
            <asp:BoundField DataField="Codename" HeaderText="Codename" SortExpression="Codename" />
            <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
            <asp:BoundField DataField="QUANTITY" HeaderText="Stock" SortExpression="QUANTITY" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT Parts_BOM.DESCRIPTION, Parts_BOM.PrtNum, Parts_BOM.ProductLine, Parts_BOM.Series, Parts_BOM.Codename, Parts_BOM.ModelName, Parts_BOM.ConfigurationNumber, Parts_BOM.LISTEACH, Parts_BOM.PARTTYPE, Parts_BOM.PrtEURepai, Parts_BOM.SANDS_MEMO_OrdPart, Parts_BOM.LOCATION, Parts_BOM.QUANTITY, ProductModelname.ModelName AS Expr1, ProductModelname.ModelNameID FROM (Parts_BOM INNER JOIN ProductModelname ON Parts_BOM.ModelName = ProductModelname.ModelName) WHERE (Parts_BOM.DESCRIPTION LIKE '%' & ? & '%') AND (ProductModelname.ModelNameID = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DESCRIPTION" QueryStringField="partname" Type="String" />
            <asp:QueryStringParameter Name="ModelNameID" QueryStringField="model" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>

