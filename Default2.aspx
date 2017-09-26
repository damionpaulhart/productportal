<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<ajaxToolkit:CollapsiblePanelExtender ID="cpe" runat="Server"  
    TargetControlID="Panel1"  
    CollapsedSize="0"  
    ExpandedSize="300"  
    Collapsed="True"  
    ExpandControlID="LinkButton1"  
    CollapseControlID="LinkButton1"  
    AutoCollapse="False"  
    AutoExpand="False"  
    ScrollContents="True"  
    TextLabelID="Label1"  
    CollapsedText="Show Details..."  
    ExpandedText="Hide Details"   
    ImageControlID="Image1"  
    ExpandedImage="~/images/collapse.jpg"  
    CollapsedImage="~/images/expand.jpg"  
    ExpandDirection="Vertical" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
</asp:Content>

