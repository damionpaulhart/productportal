<%@ Page Language="C#" AutoEventWireup="true" CodeFile="partsforconfig.aspx.cs" Inherits="partsforconfig" %>
<%@ OutputCache CacheProfile="cacheEmAll" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>partsforconfig</title>
    <link media="screen" href="StyleSheetForMaster.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:scriptmanager ID="ScriptManager1" runat="server">
        </asp:scriptmanager>
        
        <asp:updatepanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <cc1:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server" TargetControlID="Panel1" ScrollEffectDuration="1.5"  >
        </cc1:AlwaysVisibleControlExtender>
        <div>
    <asp:Panel ID="Panel1" runat="server" Width="100%" DefaultButton="Button1" CssClass="PanelOver">
    <div class="filter">
    Show only if  <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="PartsOrdPart.DESCRIPTION">Part Name</asp:ListItem>
            <asp:ListItem Value="PartsBOM.PRTNUM">Part Number</asp:ListItem>
            <asp:ListItem Value="PartsBOM.COLVAL">COLVAL</asp:ListItem>
        </asp:DropDownList> contains
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
        <asp:Button ID="Button1" runat="server" Text="Refresh" />
        <br />
    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="User Parts" />
            <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" Text="Non-User Parts" />
    </div></asp:Panel><br /><br /><br /><br />
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="1" EnableViewState="false">
        <ProgressTemplate><img src="images/25-1.gif" /></ProgressTemplate>
        </asp:UpdateProgress>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/SANDS.mdb" 
                SelectCommand="SELECT ProductConfiguration.ConfigurationNumber, PartsBOM.PRTNUM, PartsBOM.prtperunit, PartsBOM.PrtEURepai, PartsBOM.COLVAL, PartsOrdPart.SANDS_Category, PartsOrdPart.DESCRIPTION, PartsOrdPart.SANDS_MEMO_OrdPart, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PRTNUM = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION &lt;&gt; 'ZERO') AND (ProductConfiguration.ConfigurationNumber = ?) ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PRTNUM">
            <SelectParameters>
                <asp:QueryStringParameter Name="config" QueryStringField="config" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" CssClass="DataWebControlStyle" AllowSorting="True" Width="98%" >
                    <HeaderStyle CssClass="HeaderStyle" />
        <RowStyle CssClass="RowStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
            <Columns>
                <asp:CheckBoxField DataField="PrtEURepai" HeaderText="User Part?" SortExpression="PrtEURepai" />
                <asp:BoundField DataField="LISTEACH" HeaderText="Price" SortExpression="LISTEACH" />
                <asp:BoundField DataField="prtperunit" HeaderText="# per unit" SortExpression="prtperunit" />
                <asp:HyperLinkField Target="_parent" DataTextField="PRTNUM" DataNavigateUrlFields="PRTNUM" DataNavigateUrlFormatString="partsbynumber.aspx?partnumber={0}" HeaderText="Part Number" SortExpression="PRTNUM" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="Name" SortExpression="DESCRIPTION" />
                <asp:BoundField DataField="SANDS_MEMO_OrdPart" HeaderText="Memo" SortExpression="SANDS_MEMO_OrdPart" />
                <asp:BoundField DataField="SANDS_Category" HeaderText="Category" SortExpression="SANDS_Category" />
                <asp:BoundField DataField="COLVAL" HeaderText="COLVAL" SortExpression="COLVAL" />
                <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                <asp:BoundField DataField="QUANTITY" HeaderText="In Stock" SortExpression="QUANTITY" />
            </Columns>
        </asp:GridView>
    </div></ContentTemplate>
        </asp:updatepanel>
        
    </form>
</body>
</html>
