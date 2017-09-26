<%@ Page Language="C#" MasterPageFile="~/MasterPageGrey.master" AutoEventWireup="true" CodeFile="search-codename.aspx.cs" Inherits="searchcodename" Title="Search Codename" %>

<asp:content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:content>
<asp:content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
    Codename Search
</asp:content>
<asp:content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <asp:panel ID="PanelSearch" DefaultButton="ButtonSearch" runat="server" 
        CssClass="no">
<asp:TextBox ID="TextBoxSearch" runat="server" Width="200px"></asp:TextBox>&nbsp;
<asp:Button ID="ButtonSearch" runat="server" Text=">>" OnClick="ButtonSearch_Click" Width="30px" />
    <br />
    <br />
    <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" width="100%" horizontalalign="Center" rowstyle-horizontalalign="Center" cellpadding="4" headerstyle-backcolor="#999999" headerstyle-forecolor="White"
        datasourceid="AccessDataSource1">
        <columns>
            <asp:boundfield datafield="Season" headertext="Season" 
                sortexpression="Season" />
            
                <asp:TemplateField HeaderText="Series" SortExpression="Series">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Series", "series.aspx?series={0}") %>' Text='<%# Bind("Series") %>'></asp:HyperLink>
                </ItemTemplate>
                </asp:TemplateField>
                
                
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
            <asp:TemplateField HeaderText="Config" SortExpression="ConfigurationNumber">
                <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Bind("ConfigurationNumber") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </columns>
    </asp:gridview>
    <asp:accessdatasource id="AccessDataSource1" runat="server" 
        datafile="~/App_Data/SANDS.mdb" 
        selectcommand="SELECT [Series], [Codename], [Season], [ModelName], [ConfigurationNumber] FROM [Products_Basic] WHERE ([Codename] LIKE '%' + ? + '%')">
        <selectparameters>
            <asp:controlparameter controlid="TextBoxSearch" defaultvalue="" name="Codename" 
                propertyname="Text" type="String" />
        </selectparameters>
    </asp:accessdatasource>
    <br />
</asp:panel>
</asp:content>

