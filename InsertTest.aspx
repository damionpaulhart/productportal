<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        AccessDataSource1.Insert();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/SandsChangeLog.mdb" 
        DeleteCommand="DELETE FROM [Table1] WHERE [HowID] = ?" 
        InsertCommand="INSERT INTO [Table1] ([HOW], [HOW2]) VALUES (?, ?)" 
        SelectCommand="SELECT [HOW], [HOW2], [HowID] FROM [Table1] WHERE ([HOW] LIKE '%' + ? + '%')" 
        UpdateCommand="UPDATE [Table1] SET [HOW] = ?, [HOW2] = ? WHERE [HowID] = ?">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="HOW" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="HowID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HOW" Type="String" />
            <asp:Parameter Name="HOW2" Type="String" />
            <asp:Parameter Name="HowID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="HOW" Type="String"  />
            <asp:ControlParameter ControlID="TextBox1" Name="HOW" Type="String" />
            <asp:ControlParameter ControlID="TextBox2" Name="HOW2" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <br />
    </form>
</body>
</html>
