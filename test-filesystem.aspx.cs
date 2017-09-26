using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.IO;

public partial class MessageBox : System.Web.UI.Page
{
    private System.Web.UI.Page p;

    public MessageBox(System.Web.UI.Page page)
    {
        p = page;
    }
    public void Show(string Message)
    {
        string script = "<script>alert('" + Message + "')</script>";
        p.Response.Write(script);
    }
}
public partial class test_filesystem : System.Web.UI.Page
{
    MessageBox MB = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        MB = new MessageBox(this);
    }
    /// <summary>
    /// Create Directory
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        if (Directory.Exists(this.txtDirectory.Text.Trim()))
        {
            MB.Show("Directory Exists.");
        }
        else
        {

            Directory.CreateDirectory(this.txtDirectory.Text.Trim());
        }
    }
    /// <summary>
    /// Delete Directory
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDelDirectory_Click(object sender, EventArgs e)
    {
        if (Directory.Exists(this.txtDeleteDirectory.Text.Trim()))
        {
            Directory.Delete(this.txtDeleteDirectory.Text.Trim());
        }
        else
        {
            MB.Show("Directory does Exist.");
        }
    }
    /// <summary>
    /// Move Directory
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnMove_Click(object sender, EventArgs e)
    {
        if (Directory.Exists(this.txtFrom.Text.Trim()))
        {
            if (Directory.Exists(this.txtTo.Text.Trim()))
            {
                MB.Show("destDirectory Exists.");
            }
            else
            {
                Directory.Move(this.txtFrom.Text.Trim(), this.txtTo.Text.Trim());
            }
        }
        else
        {
            MB.Show("Directory does not Exist.");
        }
    }
    /// <summary>
    /// Set Directory Attribute
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnAttribute_Click(object sender, EventArgs e)
    {
        if (Directory.Exists(this.txtDirAttribute.Text.Trim()))
        {
            DirectoryInfo DirInfo = new DirectoryInfo(this.txtDirAttribute.Text.Trim());
            if (this.RbDirecotry.Checked)
            {
                DirInfo.Attributes = FileAttributes.ReadOnly;
            }
            else if (this.RbDirecotry1.Checked)
            {
                DirInfo.Attributes = FileAttributes.Hidden;
            }
        }
        else
        {
            MB.Show("Directory does not Exist.");
        }

    }
    /// <summary>
    /// Create File
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCreateFile_Click(object sender, EventArgs e)
    {
        if (File.Exists(this.txtCreateFile.Text.Trim()))
        {
            MB.Show("File Exists.");
        }
        else
        {
            FileStream fs = File.Create(this.txtCreateFile.Text.Trim());
            fs.Close();
        }
    }
    /// <summary>
    /// Delete File
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDelFile_Click(object sender, EventArgs e)
    {
        if (File.Exists(this.txtDelFile.Text.Trim()))
        {
            File.Delete(this.txtDelFile.Text.Trim());
        }
        else
        {
            MB.Show("File does not Exist.");
        }
    }
    /// <summary>
    /// Move File
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnMoveFile_Click(object sender, EventArgs e)
    {
        if (File.Exists(this.txtFromFile.Text.Trim()))
        {
            if (File.Exists(this.txtTOFile.Text.Trim()))
            {
                MB.Show("DestFile Exists.");
            }
            else
            {
                File.Move(this.txtFromFile.Text.Trim(), this.txtTOFile.Text.Trim());
            }
        }
        else
        {
            MB.Show("File does not Exist.");
        }
    }
    /// <summary>
    /// Set File Attribute
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnFileSetAtb_Click(object sender, EventArgs e)
    {
        if (File.Exists(this.txtFileAttribute.Text.Trim()))
        {

            if (this.rbFileReadOnly.Checked)
            {
                File.SetAttributes(this.txtFileAttribute.Text.Trim(), FileAttributes.ReadOnly);
            }
            else if (this.rbFileReadHide.Checked)
            {
                File.SetAttributes(this.txtFileAttribute.Text.Trim(), FileAttributes.Hidden);
            }
        }
        else
        {
            MB.Show("File does not Exist.");
        }
    }
    /// <summary>
    /// Show message from file
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (File.Exists(this.TextBox1.Text.Trim()))
        {
            StreamReader sr = new StreamReader(this.TextBox1.Text.Trim());
            this.txtMsg.Text = sr.ReadToEnd();
            sr.Close();
        }
        else
        {
            MB.Show("File does not exist.");
        }
    }
    /// <summary>
    /// Write content of the control txtMsg to File.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (File.Exists(this.TextBox1.Text.Trim()))
        {
            StreamWriter sw = new StreamWriter(this.TextBox1.Text.Trim());
            sw.WriteLine(this.txtMsg.Text.Trim());
            sw.Close();
            this.txtMsg.Text = "";
        }
        else
        {
            MB.Show("File does not exist.");
        }
    }
}