<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchRight.ascx.cs" Inherits="App_Controls_SearchRight" %>
<div>
<asp:Panel ID="PanelConfigReader" DefaultButton="ButtonConfigReader" runat="server" CssClass="no">Configuration<br />
<asp:TextBox ID="TextBoxConfigReader" runat="server" Width="100px"></asp:TextBox>
<asp:Button ID="ButtonConfigReader" runat="server" Text=">>" OnClick="ButtonConfigReader_Click" Width="30px" /><br />
</asp:Panel>
<%--<br />
<asp:Panel ID="PanelConfigDetails" DefaultButton="ButtonConfigDetails" runat="server" CssClass="no">Config Details Page:<br />
<asp:TextBox ID="TextBoxConfigDetails" runat="server" Width="100px"></asp:TextBox>
<asp:Button ID="ButtonConfigDetails" runat="server" Text=">>" OnClick="ButtonConfigDetails_Click" Width="30px" /><br />
</asp:Panel>--%>
<br />
<asp:Panel ID="PanelPartsByNumber" DefaultButton="ButtonPartsByNumber" runat="server" CssClass="no">Part Number<br />
<asp:TextBox ID="TextBoxPartsByNumber" runat="server" Width="100px"></asp:TextBox>
<asp:Button ID="ButtonPartsByNumber" runat="server" Text=">>" OnClick="ButtonPartsByNumber_Click" Width="30px" /><br />
</asp:Panel>
<br />
<asp:Panel ID="PanelPartsByName" DefaultButton="ButtonPartsByName" runat="server" CssClass="no">Part Name<br />
<asp:TextBox ID="TextBoxPartsByName" runat="server" Width="100px"></asp:TextBox>
<asp:Button ID="ButtonPartsByName" runat="server" Text=">>" OnClick="ButtonPartsByName_Click" Width="30px" /><br />
</asp:Panel>
<br />
<%--<asp:Panel ID="PanelPartsByNameForModel" runat="server" CssClass="no">
Find Part Name:<br />
<asp:TextBox ID="TextBoxPartsByNameForModel" runat="server" Width="128px"></asp:TextBox>
Of Model:<br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AccessDataSource1" DataTextField="ModelName" DataValueField="ModelNameID" Width="128px" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList></asp:Panel>--%>
    
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SANDS.mdb" SelectCommand="SELECT DISTINCT ModelName, ModelNameID FROM ProductModelname"></asp:AccessDataSource>

</div>
<br />