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

public partial class configuration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StyleSheetAdder.AddLinkedStyleSheet(this, "StyleSheetForTabs.css");
        if (Request.QueryString["Configuration"] != null)
        { Label1.Text = "Configuration: " +  Request.QueryString[0]; }
        //HyperLink hl = (HyperLink)FormView1.FindControl("HyperLinkBOMParts");

        if (Page.IsPostBack)
        {
            // Check querystring is valid for later SelectCommand
            if ((Request.QueryString["Configuration"] != null) && (CheckBox1 != null))
            {
                String includedparts = "";
                if (CheckBox1.Checked == false) { includedparts += "AND (PartsBOM.PRTEUREPAI = false)"; }
                else if (CheckBox2.Checked == false) { includedparts += "AND (PartsBOM.PRTEUREPAI = true)"; }
                else { includedparts = ""; }

                String querystring = Request.QueryString["Configuration"];
                String col = DropDownList1.SelectedValue;
                String val = TextBox1.Text;
                // If TextBox is cleared, set as wildcard:
                if (val == "")
                {
                    RunFilter(querystring, col, "%", includedparts);
                }
                else
                { RunFilter(querystring, col, val, includedparts); }
            }
        }
    }
    protected void RunFilter(String querystring, String col, String val, String includedparts)
    {
        //AccessDataSource1.SelectCommand = "SELECT [ProductLine], [Series], [Codename], [ModelName], [ConfigurationNumber], [ReleaseDate], [CodenameInSpareParts] FROM [Products_Basic] WHERE (Series = '" + currentseries + "') AND (" + col + " LIKE '%" + val + "%') ORDER BY [ReleaseDate] DESC, [Codename], [ConfigurationNumber]";
        AccessDataSource3.SelectCommand = "SELECT ProductConfiguration.ConfigurationNumber, PartsBOM.PRTNUM, PartsBOM.PRTEUREPAI, PartsBOM.COLVAL, PartsOrdPart.DESCRIPTION, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PRTNUM = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION <> 'ZERO') AND (ProductConfiguration.ConfigurationNumber = '" + querystring + "') AND (" + col + " LIKE '%" + val + "%')" + includedparts + " ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PRTNUM";
        AccessDataSource3.DataBind();
        GridView1.DataBind();
    }
    protected void btnExportToExcel_Click(object sender, System.EventArgs e)
    {
        GridViewExportUtil.Export("sandsReport.xls", this.GridView1);
    }
}
