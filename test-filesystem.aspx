<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test-filesystem.aspx.cs" Inherits="test_filesystem" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>Default</title>
</head>
<body>
<form id="form1" runat="server">
<div> 
<fieldset>
<legend>Create Directory</legend>
Create Directory:<asp:TextBox ID="txtDirectory" runat="server" Width="181px">c:\\NewDirectory</asp:TextBox>
<asp:Button ID="btnCreate" runat="server" Text="Create Directory" OnClick="btnCreate_Click" />
<br />
Delete Directory:
<asp:TextBox ID="txtDeleteDirectory" runat="server" Width="178px">c:\\NewDirectory</asp:TextBox>
<asp:Button ID="btnDelDirectory" runat="server" Text="Delete Directory" OnClick="btnDelDirectory_Click" /><br />
Move Directory: From<asp:TextBox ID="txtFrom" runat="server">c:\\NewDirectory</asp:TextBox>TO<asp:TextBox ID="txtTo" runat="server">c:\\NewOtherDirectory</asp:TextBox>
<asp:Button ID="btnMove" runat="server" Text="Move Directory" Width="136px" OnClick="btnMove_Click" />
<br />
Set Directory Attribute:<asp:TextBox ID="txtDirAttribute" runat="server">c:\\NewDirectory</asp:TextBox>
&nbsp; &nbsp; &nbsp;<asp:RadioButton ID="RbDirecotry" runat="server" GroupName="Direcotry"
Text="ReadOnly" />
<asp:RadioButton ID="RbDirecotry1" runat="server" GroupName="Direcotry" Text="Hide" />&nbsp;
<asp:Button ID="btnAttribute" runat="server" Text="Set Attribute" OnClick="btnAttribute_Click" />
<br />
<legend style="width: 73px">Create File</legend>Create File:<asp:TextBox ID="txtCreateFile"
runat="server" Width="215px">c:\\NewDirectory\\NewFile.txt</asp:TextBox>&nbsp;<asp:Button ID="btnCreateFile" runat="server" OnClick="btnCreateFile_Click" Text="Create File" />
<br />
Delete File:<asp:TextBox ID="txtDelFile" runat="server" Width="217px">c:\\NewDirectory\\NewFile.txt</asp:TextBox>&nbsp;<asp:Button ID="btnDelFile" runat="server" OnClick="btnDelFile_Click" Text="Delete File" />
<br />
Move File: From<asp:TextBox ID="txtFromFile" runat="server" Width="206px">c:\\NewDirectory\\NewFile.txt</asp:TextBox>TO<asp:TextBox ID="txtTOFile" runat="server" Width="243px">c:\\NewFile.txt</asp:TextBox>
<asp:Button ID="btnMoveFile" runat="server" OnClick="btnMoveFile_Click" Text="Move File" />
<br />
Set File Attribute:<asp:TextBox ID="txtFileAttribute" runat="server" Width="291px">c:\\NewDirectory\\NewFile.txt</asp:TextBox>
&nbsp;<asp:RadioButton ID="rbFileReadOnly" runat="server" GroupName="File" Text="ReadOnly" />
<asp:RadioButton ID="rbFileReadHide" runat="server" GroupName="File" Text="Hide" />&nbsp;
<asp:Button ID="btnFileSetAtb" runat="server" OnClick="btnFileSetAtb_Click" Text="Set Attribute" />
<legend>Test File</legend>File Name:<asp:TextBox ID="TextBox1" runat="server" Width="253px">c:\\NewDirectory\\NewFile.txt</asp:TextBox>
<br />
<asp:TextBox ID="txtMsg" runat="server" Height="109px" TextMode="MultiLine" Width="342px"></asp:TextBox>
<br />
<asp:Button ID="Button1" runat="server" Text="Write to File" OnClick="Button1_Click" />
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Read From File" /><br />
</fieldset>
</div>
</form>
</body>
</html>