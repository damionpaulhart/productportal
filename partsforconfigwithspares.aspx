<%@ Page Language="C#" AutoEventWireup="true" CodeFile="partsforconfigwithspares.aspx.cs" Inherits="partsforconfigwithspares" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Spare Parts</title>
    <link media="screen" href="StyleSheetForMaster.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="DataWebControlStyle" style="padding:3em;">
<p>This page has been updated for models up to Spring 2007. Newer models with be available soon.</p>
<p>This page matches  <strong>BOM Parts</strong> to the <strong>Spare Parts SpreadSheet</strong>.<br />It also shows the number of the part in the <strong>Exploded Diagram</strong>.</p>
<p>BOM = Bill Of Materials.These are the individual parts available Orders. Some of the BOM parts are not Spare Parts - such as Recovery discs, and User's Guides, they are at the bottom.</p>
</div>
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="AccessDataSource1" CssClass="DataWebControlStyle" AllowSorting="True" AutoGenerateColumns="false">
        <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            <columns>
            <asp:BoundField DataField="down" 
        HeaderText="#" 
        ReadOnly="true" 
        Visible="True"/>
            <asp:HyperLinkField Target="_parent" DataTextField="PrtNum" DataNavigateUrlFields="PrtNum" DataNavigateUrlFormatString="partsbynumber.aspx?partnumber={0}" HeaderText="Part Number" SortExpression="PrtNum" />           
            <asp:BoundField DataField="DESCRIPTION" 
        HeaderText="BOM Name" 
        ReadOnly="true" 
        Visible="True" ItemStyle-VerticalAlign="Middle"/>            
            <asp:BoundField DataField="Parts Name" 
        HeaderText="SpareParts Name" 
        ReadOnly="true" 
        Visible="True"/>            
            <asp:BoundField DataField="Note" 
        HeaderText="Note" 
        ReadOnly="true" 
        Visible="True"/>            
            <asp:BoundField DataField="LOCATION" 
        HeaderText="Shelf" 
        ReadOnly="true" 
        Visible="True"/>            
            <asp:BoundField DataField="QUANTITY" 
        HeaderText="Stock" 
        ReadOnly="true" 
        Visible="True"/>            
</columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT ProductLine, Series, Codename, ModelName, ConfigurationNumber, down, PrtNum, DESCRIPTION, [Parts Name], [Note], LOCATION, QUANTITY FROM Parts_BOM_SpareParts WHERE (ConfigurationNumber = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ConfigurationNumber" QueryStringField="ConfigurationNumber" />
            </SelectParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>
