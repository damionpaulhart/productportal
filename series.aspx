<%@ Page Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="series.aspx.cs" Inherits="series" Title="Series" %>
<%@ OutputCache CacheProfile="cacheEmAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="Content$AccessDataSource1">
        <ItemTemplate>
            <asp:Label runat="server" Text='<% # Eval("Series")%>' /> Series 
        </ItemTemplate>
    </asp:FormView>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <asp:FormView ID="FormView2" runat="server" DataSourceID="AccessDataSource1" Width="100%">
        <ItemTemplate>
            <div class="filter">Show <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="AccessDataSource1" DataTextField="Series" DataValueField="Series" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" SelectedValue='<%# Eval("Series", "{0}") %>' >
                </asp:DropDownList><asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT Series FROM ProductSeries WHERE (Series <> 'All Series') AND (Series <> 'Pocket LOOX') AND (Series <> 'Power (Adapters, Batteries, etc.)') AND (Series <> 'Wireless Accessories') AND (Series <> 'FJ') AND (Series NOT LIKE '%cancelled')"></asp:AccessDataSource>
        Series where 
        <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="ModelName">Model</asp:ListItem>
            <asp:ListItem>Codename</asp:ListItem>
            <asp:ListItem Value="ConfigurationNumber">Config</asp:ListItem>
        </asp:DropDownList> contains <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> <asp:Button ID="Button1" runat="server" Text="Refresh" /></div>
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" CssClass="DataWebControlStyle" BorderStyle="None" GridLines="None" >
    <RowStyle CssClass="RowStyle" />
    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    <HeaderStyle CssClass="HeaderStyle" />
        <Columns>
        <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" SortExpression="ReleaseDate" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false" />
            <asp:TemplateField HeaderText="Config" SortExpression="ConfigurationNumber">
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Bind("ConfigurationNumber") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Model" SortExpression="ModelName">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ModelName", "search-modelname.aspx?modelname={0}") %>' Text='<%# Bind("ModelName") %>'></asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Codename" SortExpression="Codename">
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Codename", "search-codename.aspx?codename={0}") %>' Text='<%# Bind("Codename") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT [ProductLine], [Series], [Codename], [ModelName], [ConfigurationNumber], [ReleaseDate], [CodenameInSpareParts] FROM [Products_Basic] WHERE ([Series] = ?) ORDER BY [ReleaseDate] DESC, [Codename], [ConfigurationNumber]">
        <SelectParameters>
            <asp:QueryStringParameter Name="Series" QueryStringField="Series" Type="String" DefaultValue="%" />
            <asp:Parameter Name="Codename" Type="String" DefaultValue="%" />
            <asp:Parameter Name="Model" Type="String" DefaultValue="%" />
            <asp:Parameter Name="Config" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>

