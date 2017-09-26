<%@ Page Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="ConfigReader.aspx.cs" Inherits="ConfigReader" Title="Configuration Reader" MaintainScrollPositionOnPostback="true" %>
<%@ OutputCache CacheProfile="cacheEmAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
    Configuration Reader
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <%--<table style="width: 500px; border-right: gray 1px solid; font-size: 14pt; border-left: gray 1px solid;
                border-top: gray 1px solid; font-family: Arial; background-color: gainsboro"
                width="100%">
                <tr>
                    <td>
                        Fujitsu Configuration Reader</td>
                    <td style="font-size: 8pt; font-family: Arial; text-align: right">
                        <a href="javascript:print();">Print</a></td>
                </tr>
            </table>--%>
            <div style="width:96%; background-color:White; padding:20px;">
    <table style="width: 500px; border: gray 1px solid; background-color: gainsboro; background-repeat: repeat-x;" width="100%">
        <tr>
            <td colspan="2">
                <blockquote>
                    Configuration:<br />
                    <%--<ul>
                                <li><strong>16-digit: </strong>for example: AC1011E119020000 or RC1011E119020000 </li>
                                <li><strong>Retail Configuration</strong> for example: FPCR60407 or CP240625-01 or RCP240625-01</li>
                                <li><strong>3-digit config: </strong>for example: ATE, AJD, AYY</li>
                            </ul>--%>
                    <asp:Panel DefaultButton="Button1" runat="server">
                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="16" ToolTip="Enter a configuration number" Wrap="False" Width="300px"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Read" /></asp:Panel>
                </blockquote>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 500px;" id="Table1" runat="server">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <ul>
                    <li>Not In Reader</li>
                    <li>Check more info:
                        <asp:HyperLink runat="server" ID="GoToDetailHyperLink" Text="Detail Page" NavigateUrl="~/configuration.aspx" /></li>
                </ul>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 500px; font-size: 10pt;" id="tblRetail" runat="server" visible="false">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="ConfigurationNumber" Font-Size="10pt" DataSourceID="AccessDataSourceRetailCheck" RepeatLayout="Flow">
                    <ItemTemplate>
                        <table cellpadding="4" cellspacing="0" border="1" width="500" style="background-color: #fff;">
                            <tr>
                                <td colspan="2">
                                    Matches this 16-digit configuration:
                                    <asp:HyperLink ID="HyperLinkMatchingForRetail" runat="server" NavigateUrl='<%# Eval("MatchingForRetail", "ConfigReader.aspx?cpn={0}") %>' Text='<%# Eval("MatchingForRetail")%>' /></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList></td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 100%" id="tblParser" runat="server">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="AccessDataSource2" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" Font-Size="10pt" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="500px">
                    <Fields>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <strong>Config</strong></HeaderTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkCPNDetail" runat="server" NavigateUrl='<%# Eval("ConfigurationNumber", "configuration.aspx?Configuration={0}") %>' Text='<%# Eval("ConfigurationNumber")%>' ToolTip='<%# Eval("ConfigurationNumber", "Details Page") %>'></asp:HyperLink></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LUT_desc" HeaderText="Base Description" SortExpression="LUT_desc">
                            <HeaderStyle Font-Bold="True" />
                        </asp:BoundField>
                    </Fields>
                    <FooterStyle BackColor="#CCCC99" />
                    <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EEEEEE" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr id="myRowDropDown">
            <td colspan="2" bgcolor="white" style="font-size: 10pt; padding: 2px;">
                Show:
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem>Customer's Choices Highlighted</asp:ListItem>
                    <asp:ListItem>Customer's Choices Only</asp:ListItem>
                    <asp:ListItem>All Choices</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 231px; vertical-align: top;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="AccessDataSource2" Font-Size="10pt" ForeColor="Black" GridLines="Vertical" OnRowDataBound="GridView1_RowDataBound" Width="500px">
                    <FooterStyle BackColor="#CCCC99" />
                    <Columns>
                        <asp:BoundField DataField="ColumnNumber" HeaderText="Col" SortExpression="ColumnNumber" />
                        <asp:BoundField DataField="RowNumber" HeaderText="Row" SortExpression="RowNumber" />
                        <asp:BoundField DataField="ColumnName" HeaderText="Option" SortExpression="ColumnName" />
                        <asp:BoundField DataField="RowItem" HeaderText="Choice" SortExpression="RowItem" />
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        DataFile="~/App_Data/LookUpTableDB.mdb" 
        SelectCommand="SELECT ConfigurationNumber, LUT_desc, ColumnNumber, RowNumber, ColumnName, RowItem FROM ViewLookUpTableContent WHERE (ConfigurationNumber = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="AZH" Name="ConfigurationNumber" QueryStringField="Conf" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceInsert" runat="server" ConflictDetection="CompareAllValues" DataFile="~/App_Data/LookUpTableDB.mdb" InsertCommand="INSERT INTO [Searched] ([textEntered], [View], [Who]) VALUES (?, ?, ?)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="textEntered" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="View" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="Who" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceRetailCheck" runat="server" DataFile="~/App_Data/LookUpTableDB.mdb" SelectCommand="SELECT [ConfigurationNumber], [MatchingForRetail] FROM [Model] WHERE ([ConfigurationNumber] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="ConfigurationNumber" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>
