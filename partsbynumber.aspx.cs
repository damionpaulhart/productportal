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

public partial class partsbynumber : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label1.Text = Request.QueryString["partnumber"];
            // For Useability, repopulate the TextBox that was used to search:
            Control mpSearchRight = Master.FindControl("SearchRight1");
            TextBox mpTextBox = (TextBox)mpSearchRight.FindControl("TextBoxPartsByNumber");
            if (mpTextBox != null)
            {
                mpTextBox.Text = Request.QueryString["partnumber"];
            }
        }
    }
}
