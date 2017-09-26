<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true"
    CodeFile="LatestDrivers.aspx.cs" Inherits="LatestDrivers" %>

<%--<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" runat="Server">
    Driver Search 
    
    
    v1  
    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="filter">
                
                Use These Settings To Narrow Your Search:<br />
                OS: <asp:DropDownList ID="DropDownListOS" runat="server">
                <asp:ListItem Text="ALL" Value="%"></asp:ListItem>
                <asp:ListItem>WIN7</asp:ListItem>
                <asp:ListItem>WIN764</asp:ListItem>
                <asp:ListItem>VISTA</asp:ListItem>
                <asp:ListItem>VISTA64</asp:ListItem>
                <asp:ListItem>XP</asp:ListItem>
                <asp:ListItem>XPTPC</asp:ListItem>
                <asp:ListItem>XPMCE</asp:ListItem>
                <asp:ListItem>WIN2K</asp:ListItem>
                <asp:ListItem>98</asp:ListItem>
                <asp:ListItem>95</asp:ListItem>
                <asp:ListItem Text="BIOS" Value="ALL"></asp:ListItem>
            </asp:DropDownList>
            Status: <asp:DropDownList ID="DropDownListType" runat="server">
            <asp:ListItem Text="ALL" Value="%"></asp:ListItem>
            <asp:ListItem Text="Updated" Value="UP" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Original" Value="IN"></asp:ListItem>
            <asp:ListItem Text="Archive" Value="AR"></asp:ListItem>
            
            </asp:DropDownList>
            Driver Name: <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox" Width="200px">
                </asp:TextBox>
                
            Model: <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" Width="200px">
                </asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="button" Text="Search" /><br />
            </div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                DisplayAfter="1" EnableViewState="false">
                <progresstemplate>
                                                                <img src="images/25-1.gif" /><div class="clear">
                                                                </div>
                                                            </progresstemplate>
            </asp:UpdateProgress>
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
                CssClass="DataWebControlStyle" AllowSorting="true">
                <headerstyle cssclass="HeaderStyle" />
                <rowstyle cssclass="RowStyle" />
                <alternatingrowstyle cssclass="AlternatingRowStyle" />
                <columns>
            
                
                <asp:HyperLinkField DataNavigateUrlFields="ModelName" DataNavigateUrlFormatString="~/search-modelname.aspx?modelname={0}" DataTextField="ModelName" HeaderText="Model" SortExpression="ModelName" />
            <asp:BoundField DataField="column2" HeaderText="OS" 
                SortExpression="column2" />
           
                
             <asp:HyperLinkField DataNavigateUrlFields="column8" DataNavigateUrlFormatString="{0}" DataTextField="column3" HeaderText="Driver" SortExpression="column3" />   
            
            <asp:BoundField DataField="column4" HeaderText="Version"  HtmlEncode="false"
                SortExpression="column4" />
            <asp:BoundField DataField="column5" HeaderText="Size" 
                SortExpression="column5" />
            <asp:BoundField DataField="column7" HeaderText="Status" 
                SortExpression="column7" />
                <asp:BoundField DataField="column1" HeaderText="Date"  ItemStyle-Wrap="false"  
                SortExpression="column1" HtmlEncode="false" 
                DataFormatString="{0:yyyy-MMM-dd}" >
            </asp:BoundField>
        </columns>
            </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb"
                SelectCommand="SELECT [SS-date-created] AS column1, [ModelName], [SS-OS-Abbreviation] AS column2, [SS-Description] AS column3, [SS-Version] AS column4, [SS-Size] AS column5, [SS-URLLocation] AS column6, [SS-Type] AS column7, [SS-URLLocation] AS column8 FROM [LatestSilverStreamDrivers] WHERE ([SS-Type] = ?)">
                <selectparameters>
            <asp:Parameter DefaultValue="UP" Name="column1" Type="String" />
        </selectparameters>
            </asp:AccessDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
