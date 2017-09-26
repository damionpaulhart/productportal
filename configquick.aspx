<%@ Page Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="configquick.aspx.cs" Inherits="configquick" Title="Untitled Page" %>

<asp:content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:content>
<asp:content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
Quick Config Checker
</asp:content>
<asp:content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
<p>Note: This page displays the is in active development. If you do not see any results, please go back.... new features are being developed.</p>
<p></p>
    <asp:detailsview id="DetailsView1" runat="server" autogeneraterows="False" 
        datasourceid="AccessDataSource1" height="50px" width="100%" cssclass="RowStyle">
        <fields>
            <asp:boundfield datafield="PARTNUM" headertext="PARTNUM" 
                sortexpression="PARTNUM" />
            <asp:boundfield datafield="DESCRIPTION" headertext="DESCRIPTION" 
                sortexpression="DESCRIPTION" />
        </fields>
    </asp:detailsview>
    <asp:accessdatasource id="AccessDataSource1" runat="server" 
        datafile="~/App_Data/SANDS.mdb" 
        selectcommand="SELECT [PARTNUM], [DESCRIPTION] FROM [PartsOrdPart] WHERE ([PARTNUM] = ?)">
        <selectparameters>
            <asp:querystringparameter name="PARTNUM" querystringfield="cpn" type="String" />
        </selectparameters>
    </asp:accessdatasource>

</asp:content>

