<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search-parts.aspx.cs" Inherits="searchparts" %>

<%@ OutputCache CacheProfile="cacheEmAll" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Parts Search</title>
    <%--<link media="screen" href="StyleSheetForMaster.css" type="text/css" rel="stylesheet" />--%>
    <style type="text/css">
       
        body 
        {
            font-family:Arial;
        }
        td 
        {
           vertical-align:top;
           padding:10px; }
        fieldset
        {
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        
    
            <div class="filter">
            <center>
            <table style="border:solid 1px #990000;"><tr>
           
            <td><fieldset style="width: 300px; height: 90px;">
                    <legend>CONFIGURATION PARTS SEARCH:</legend><br />
            <asp:TextBox ID="TextBoxMainSearch" runat="server" Width="240px" Font-Size="1.5em"></asp:TextBox>
            </fieldset></td>
            </tr>
            <tr>
            
            <td><fieldset style="background-color:#eeeeee";>
                    <legend>OPTIONS:</legend>
                    <table><tr><td colspan="2">
                    
                    <fieldset style="width: 250px; height:80px; text-align: right;">
                        <legend>Filter</legend>
                        
                        Description: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        Part Num: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <%--LUT col-val: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>--%>
                
                </fieldset>
                </td>
                
                <td>
                <fieldset style="width: 100px; height: 80px; text-align:left;">
                    <legend>Pricing:</legend>
                    
                    <asp:CheckBox ID="CheckBoxRetail" runat="server" Checked="True" Text="$0 Retail" /><br />
                    <asp:CheckBox ID="CheckBoxCost" runat="server" Checked="False" Text="$0 Cost" /><br />
                </fieldset>
               </td><%--<td>
                <fieldset style="width: 100px; height: 90px; text-align:left;">
                    <legend>Availability:</legend>
                    
                    <asp:CheckBox ID="CheckBoxRC" runat="server" Checked="True" Text=" RC" /><br />
                    <asp:CheckBox ID="CheckBoxASP" runat="server" Checked="True" Text=" ASP" /><br />
                    <asp:CheckBox ID="CheckBoxEU" runat="server" Checked="True" Text=" EU" /><br />
                </fieldset>
                </td>--%></tr></table>
                </fieldset></td></tr>
            
            
            <tr><td align="center"><asp:Button ID="Button1" Width="200px" Height="40px" runat="server" Text="Update View" /></td></tr></table></center>
            </div>
            
            <br />
            <br />
            
            
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb"
                SelectCommand="SELECT ProductConfiguration.ConfigurationNumber, PartsBOM.PrtNum, PartsBOM.prtperunit, PartsBOM.PrtEURepai, PartsBOM.colval, PartsOrdPart.DESCRIPTION, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY, ProductConfiguration.ReleaseDate, ProductConfiguration.dbMemo, PartsBOM.FG_P_N, PartsBOM.PrtDeRepai, PartsBOM.PrtASCRepair, PartsBOM.PrtReimb, PartsOrdPart.INVENTORY_ITEM_ID, PartsOrdPart.COSTEACH, PartsOrdPart.SANDS_MEMO_OrdPart, PartsOrdPart.SANDS_Category FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PrtNum = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION &lt;&gt; 'ZERO') AND (ProductConfiguration.ConfigurationNumber = ?) ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PrtNum">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxMainSearch" Name="config" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
                CssClass="DataWebControlStyle" AllowSorting="True" Width="98%">
                <HeaderStyle CssClass="HeaderStyle" />
                <RowStyle CssClass="RowStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <Columns>
                    <asp:CheckBoxField DataField="PrtDeRepai" HeaderText="RC" SortExpression="PrtDeRepai" />
                    <asp:CheckBoxField DataField="PrtASCRepair" HeaderText="ASP" SortExpression="PrtASCRepair" />
                    <asp:CheckBoxField DataField="PrtEURepai" HeaderText="EU" SortExpression="PrtEURepai" />
                    <asp:BoundField DataField="ConfigurationNumber" HeaderText="Config" SortExpression="ConfigurationNumber" />
                    <asp:BoundField DataField="COSTEACH" HeaderText="Cost" SortExpression="COSTEACH" />
                    <asp:BoundField DataField="LISTEACH" HeaderText="Retail" SortExpression="LISTEACH" />
                    <asp:BoundField DataField="PrtNum" HeaderText="Part#" SortExpression="PrtNum" />
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" SortExpression="DESCRIPTION" />
                    <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                    <asp:BoundField DataField="QUANTITY" HeaderText="QUANTITY" SortExpression="QUANTITY" />
                </Columns>
            </asp:GridView>
            </div>
    </form>
</body>
</html>
