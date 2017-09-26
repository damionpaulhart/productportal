using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class searchcodename : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // If you can, search by the TextBox
        if (TextBoxSearch.Text != "")
        { 
            //search    
        }
        else
            // If you can't try the QueryString
        {
            if (Request.QueryString["codename"] != null)
            {
                TextBoxSearch.Text = Request.QueryString["codename"];
            }
            else // ok, start over
            {  }
        }
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        //Response.Redirect("ConfigReader.aspx?cpn=" + TextBoxConfigReader.Text);

    }
}
