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

public partial class partsforconfig : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check querstring is valid for later SelectCommand
        if (Request.QueryString["config"] != null)
        {
            String includedparts = "";
            if      (CheckBox1.Checked == false){ includedparts += "AND (PartsBOM.PrtEURepai = false)";}
            else if (CheckBox2.Checked == false){ includedparts += "AND (PartsBOM.PrtEURepai = true)";}
            else    {includedparts = ""; }
            
            String querystring = Request.QueryString["config"];
            String col = DropDownList1.SelectedValue;
            String val = TextBox1.Text;
            // If TextBox is cleared, set as wildcard:
            if (val == "")
            {
                RunFilter(querystring, col, "%", includedparts);
            }
            else
            {   RunFilter(querystring, col, val, includedparts); }
        }
    }
    protected void RunFilter(String querystring, String col, String val, String includedparts)
    {
        //AccessDataSource1.SelectCommand = "SELECT [ProductLine], [Series], [Codename], [ModelName], [ConfigurationNumber], [ReleaseDate], [CodenameInSpareParts] FROM [Products_Basic] WHERE (Series = '" + currentseries + "') AND (" + col + " LIKE '%" + val + "%') ORDER BY [ReleaseDate] DESC, [Codename], [ConfigurationNumber]";
        AccessDataSource1.SelectCommand = "SELECT ProductConfiguration.ConfigurationNumber, PartsBOM.PrtNum, PartsBOM.prtperunit, PartsBOM.PrtEURepai, PartsBOM.colval, PartsOrdPart.SANDS_Category, PartsOrdPart.DESCRIPTION, PartsOrdPart.SANDS_MEMO_OrdPart, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PrtNum = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION <> 'ZERO') AND (ProductConfiguration.ConfigurationNumber = '" + querystring + "') AND (" + col + " LIKE '%" + val + "%')" + includedparts + " ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PrtNum";
        AccessDataSource1.DataBind();
        GridView1.DataBind();
    }
}
