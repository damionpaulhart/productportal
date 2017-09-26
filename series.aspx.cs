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

public partial class series : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

            if (Request.QueryString["Series"] != null)
            {

                // Check i
                String currentseries = Request.QueryString["Series"];
                String col = ((DropDownList)FormView2.FindControl("DropDownList1")).SelectedValue;
                String val = ((TextBox)FormView2.FindControl("TextBox1")).Text;
                if (val == "")
                {
                    // Clear filter by setting search to wildcard
                    RunFilter(currentseries, col, "%");
                }
                else
                { RunFilter(currentseries, col, val); }
                // Trying to get dropdown to show the current series
                //DropDownList ddl = (DropDownList)FormView2.FindControl("DropDownList2");
                //ddl.SelectedValue = Request.QueryString["Series"];
            }
        
    }
    protected void RunFilter(String currentseries, String col, String val)
    {
        AccessDataSource1.SelectCommand = "SELECT [ProductLine], [Series], [Codename], [ModelName], [ConfigurationNumber], [ReleaseDate], [CodenameInSpareParts] FROM [Products_Basic] WHERE (Series = '" + currentseries + "') AND (" + col + " LIKE '%" + val + "%') ORDER BY [ReleaseDate] DESC, [Codename], [ConfigurationNumber]";
        AccessDataSource1.DataBind();
        GridView1.DataBind();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("series.aspx?Series=" + ((DropDownList)FormView2.FindControl("DropDownList2")).SelectedValue);
    }
}
