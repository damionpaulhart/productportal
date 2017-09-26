<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test-upload.aspx.cs" Inherits="test_upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:fileupload id="FileUpload1" runat="server" />&nbsp;
        <asp:button id="UploadBtn" Text="Upload File" OnClick="UploadBtn_Click" 
            runat="server" Width="105px" />
    
    </div>
    <asp:label id="Label1" runat="server" text="Label"></asp:label>
    </form>
</body>
</html>
