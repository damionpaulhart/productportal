using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class App_Controls_SearchRight : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonConfigReader_Click(object sender, EventArgs e)
    {
        String config = TextBoxConfigReader.Text.ToUpper();
        //Response.Redirect("ConfigReader.aspx?cpn=" + config);
        Response.Redirect("http://fuse.corp.fc.local/search.php?q=" + config);
        //Server.Transfer("partsbynumber.aspx?partnumber=" + TextBoxPartsByNumber.Text);
    }
    //protected void ButtonConfigDetails_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("configuration.aspx?Configuration=" + TextBoxConfigDetails.Text);
    //    //Server.Transfer("configuration.aspx?Configuration=" + TextBoxPartsByNumber.Text);
    //}
    protected void ButtonPartsByNumber_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://fuse.corp.fc.local/search.php?q=" + TextBoxPartsByNumber.Text);
        //Server.Transfer("partsbynumber.aspx?partnumber=" + TextBoxPartsByNumber.Text);
    }
    protected void ButtonPartsByName_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://fuse.corp.fc.local/fuseinfo/part_details.php?pnam=" + TextBoxPartsByName.Text);
        //Server.Transfer("partsbynumber.aspx?partnumber=" + TextBoxPartsByNumber.Text);
    }
  
}
