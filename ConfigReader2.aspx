<%@ Page Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="ConfigReader2.aspx.cs" Inherits="ConfigReader2" Title="Configuration Reader" MaintainScrollPositionOnPostback="true" %>
<%@ OutputCache CacheProfile="cacheEmAll" %>
<asp:content ID="Content1" ContentPlaceHolderID="PageHeader" runat="Server">
    Configuration Reader
</asp:content>
<asp:content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
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
    <table style="width: 500px; border: gray 1px solid; background-color: silver; background-repeat: repeat-x;" width="100%">
        <tr>
            <td colspan="2">
                <blockquote>
                    Configuration:<br />
                    <%--<ul>
                                <li><strong>16-digit: </strong>for example: AC1011E119020000 or RC1011E119020000 </li>
                                <li><strong>Retail Configuration</strong> for example: FPCR60407 or CP240625-01 or RCP240625-01</li>
                                <li><strong>3-digit config: </strong>for example: ATE, AJD, AYY</li>
                            </ul>--%>
                    <asp:panel DefaultButton="Button1" runat="server">
                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="16" ToolTip="Enter a configuration number" Wrap="False" Width="300px"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Read" /></asp:panel>
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
                        <asp:hyperlink runat="server" ID="GoToDetailHyperLink" Text="Detail Page" 
                            NavigateUrl="~/configuration.aspx" /></li>
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
                <asp:datalist ID="DataList1" runat="server" DataKeyField="ConfigurationNumber" 
                    Font-Size="10pt" DataSourceID="AccessDataSourceRetailCheck" RepeatLayout="Flow">
                    <ItemTemplate>
                        ConfigurationNumber:
                        <asp:label id="ConfigurationNumberLabel" runat="server" 
                            text='<%# Eval("ConfigurationNumber") %>' />
                        <br />
                        MatchingForRetail:
                        <asp:label id="MatchingForRetailLabel" runat="server" 
                            text='<%# Eval("MatchingForRetail") %>' />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:datalist></td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 100%" id="tblParser" runat="server">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top">
                <asp:detailsview ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataSourceID="AccessDataSource2" BackColor="White" BorderColor="#DEDFDE" 
                    BorderStyle="None" BorderWidth="1px" Font-Size="10pt" CellPadding="4" 
                    ForeColor="Black" GridLines="Vertical" Width="500px" 
                    ondatabound="DetailsView1_DataBound">
                    <Fields>
                        <asp:BoundField DataField="ConfigurationNumber" 
                            HeaderText="Config" SortExpression="ConfigurationNumber">
                        </asp:BoundField>
                        <asp:boundfield datafield="RowItem" headertext="Description" 
                            sortexpression="RowItem" />
                    </Fields>
                    <FooterStyle BackColor="#CCCC99" />
                    <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EEEEEE" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:detailsview>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr id="myRowDropDown">
            <td colspan="2" bgcolor="white" style="font-size: 10pt; padding: 2px;">
                Show:
                <asp:dropdownlist ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem>Customer's Choices Highlighted</asp:ListItem>
                    <asp:ListItem>Customer's Choices Only</asp:ListItem>
                    <asp:ListItem>All Choices</asp:ListItem>
                </asp:dropdownlist></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 231px; vertical-align: top;">
                <asp:gridview ID="GridView1" runat="server" 
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataSourceID="AccessDataSource2" Font-Size="10pt" 
                    ForeColor="Black" GridLines="Vertical" OnRowDataBound="GridView1_RowDataBound" 
                    Width="500px" autogeneratecolumns="False">
                    <FooterStyle BackColor="#CCCC99" />
                    <Columns>
                        <asp:BoundField DataField="ColumnNumber" 
                            HeaderText="Col" SortExpression="ColumnNumber" />
                        <asp:BoundField DataField="RowNumber" HeaderText="Row" 
                            SortExpression="RowNumber" />
                        <asp:BoundField DataField="ColumnName" HeaderText="Option" 
                            SortExpression="ColumnName" />
                        <asp:BoundField DataField="RowItem" HeaderText="Choice" 
                            SortExpression="RowItem" />
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:gridview>
            </td>
        </tr>
    </table>
    </div>
    <asp:accessdatasource ID="AccessDataSource2" runat="server" 
        DataFile="~/App_Data/LookUpTableDB.mdb" 
        SelectCommand="SELECT LUTconfig AS ConfigurationNumber, ColKey AS ColumnNumber, RowKey AS RowNumber, ColItem AS ColumnName, RowItem FROM LUTauto WHERE (LUTconfig = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="AX6" Name="cpn" 
                QueryStringField="cpn" Type="String" />
        </SelectParameters>
    </asp:accessdatasource>
    <asp:accessdatasource ID="AccessDataSourceInsert" runat="server" 
        ConflictDetection="CompareAllValues" DataFile="~/App_Data/LookUpTableDB.mdb" 
        InsertCommand="INSERT INTO [Searched] ([textEntered], [View], [Who]) VALUES (?, ?, ?)">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="textEntered" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="View" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="Who" Type="String" />
        </InsertParameters>
    </asp:accessdatasource>
    <asp:accessdatasource ID="AccessDataSourceRetailCheck" runat="server" 
        DataFile="~/App_Data/LookUpTableDB.mdb" 
        SelectCommand="SELECT [ConfigurationNumber], [MatchingForRetail] FROM [Model] WHERE ([ConfigurationNumber] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="ConfigurationNumber" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:accessdatasource>
</asp:content>
