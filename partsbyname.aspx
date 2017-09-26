<%@ Page Language="C#" Debug="true" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="partsbyname.aspx.cs" Inherits="partsbyname" Title="partsbyname" %>
<%@ OutputCache CacheProfile="cacheEmAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" Runat="Server">

<asp:Label ID="Label1" runat="server"></asp:Label>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" CssClass="DataWebControlStyle" EmptyDataText="Not Found" EnableViewState="false">
        <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        <Columns>
        <asp:CheckBoxField DataField="PRTEUREPAI" HeaderText="User Part?" SortExpression="PRTEUREPAI" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="LISTEACH" HeaderText="Price" SortExpression="LISTEACH" DataFormatString="{0:C}" HtmlEncode="false" />
            <asp:HyperLinkField DataNavigateUrlFields="PRTNUM" DataNavigateUrlFormatString="~/partsbynumber.aspx?partnumber={0}" DataTextField="PRTNUM" HeaderText="Number" SortExpression="PRTNUM">
                <ItemStyle Wrap="False" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="DESCRIPTION" HeaderText="Name" SortExpression="DESCRIPTION" />
           <asp:HyperLinkField DataNavigateUrlFields="ConfigurationNumber" DataNavigateUrlFormatString="~/configuration.aspx?Configuration={0}" DataTextField="ConfigurationNumber" HeaderText="Config" SortExpression="ConfigurationNumber" />
            <asp:BoundField DataField="ModelName" HeaderText="Model" SortExpression="ModelName" />
            <asp:BoundField DataField="Codename" HeaderText="Codename" SortExpression="Codename" />
            <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
            <asp:BoundField DataField="QUANTITY" HeaderText="Stock" SortExpression="QUANTITY" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT DESCRIPTION, PRTNUM, ProductLine, Series, Codename, ModelName, ConfigurationNumber, LISTEACH, PART_TYPE, PRTEUREPAI, LOCATION, QUANTITY FROM Parts_BOM WHERE (DESCRIPTION LIKE '%' & ? & '%')">
        <SelectParameters>
            <asp:QueryStringParameter Name="DESCRIPTION" QueryStringField="partname" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>

