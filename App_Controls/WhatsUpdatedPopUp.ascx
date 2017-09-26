<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WhatsUpdatedPopUp.ascx.cs" Inherits="App_Controls_WhatsUpdatedPopUp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Label ID="LinkButton1" runat="server" Text="What's New&nbsp;&nbsp;|&nbsp;&nbsp;" Font-Bold="true"></asp:Label>
<asp:Panel ID="Panel1" runat="server" Width="500px" CssClass="WhatsUpdatedPopUp" Height="200px" ScrollBars="Vertical" BorderColor="ControlDark" BorderStyle="Solid" BorderWidth="1px" >
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="AccessDataSource1">
<HeaderTemplate>
            <table cellspacing="1">
                <tr>
                    <th align="left">
                        Event</th>
                    <th align="left">
                        Note</th>
                    <th>
                        Date</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td align="left">
                    <asp:Label ID="ChangeTypeLabel" runat="server" Text='<%# Eval("ChangeType") %>'></asp:Label></td>
                <td align="left">
                    <asp:Label ID="ChangeEntryLabel" runat="server" Text='<%# Eval("ChangeEntry") %>'></asp:Label></td>
                <td nowrap="nowrap">
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date", "{0:yyyy-MMM-d}") %>'></asp:Label><asp:Label ID="ChangeEntryIDLabel" runat="server" Text='<%# " (" + Eval("ChangeEntryID") + ")" %>'></asp:Label></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SandsChangeLog.mdb" SelectCommand="SELECT [ChangeEntryID], [ChangeEntry], [Date], [ChangeType] FROM [ChangeEntrys] ORDER BY [Date] DESC"></asp:AccessDataSource>
</asp:Panel>
<cc1:HoverMenuExtender ID="HoverMenuExtender1" runat="server" TargetControlID="LinkButton1" PopupControlID="Panel1" PopupPosition="Left" OffsetX="0" OffsetY="0">
</cc1:HoverMenuExtender>
