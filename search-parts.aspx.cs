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

public partial class searchparts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            // Check querystring is valid for later SelectCommand
            if (TextBoxMainSearch.Text != "")
            {
                String availability = "";
                if (CheckBoxRetail.Checked == true) { availability += "AND (PartsOrdPart.LISTEACH = 0)"; }
                if (CheckBoxCost.Checked == true) { availability += "AND (PartsOrdPart.COSTEACH = 0)"; }
                //if (CheckBoxRC.Checked == true) { availability += "AND (PartsBOM.PrtDeRepai = true)"; }
                //if (CheckBoxASP.Checked == true) { availability += "AND (PartsBOM.PrtASCRepair = true)"; }
                //if (CheckBoxEU.Checked == true) { availability += "AND (PartsBOM.PrtEURepai = true)"; }

                String querystring = TextBoxMainSearch.Text;
                //String col = DropDownList1.SelectedValue;
                String filter = "";

                if (TextBox1.Text != "")
                {
                    filter += " AND (PartsOrdPart.DESCRIPTION LIKE '%" + TextBox1.Text + "%')";
                }
                if (TextBox2.Text != "")
                {
                    filter += " AND (PartsBOM.PrtNum LIKE '%" + TextBox2.Text + "%')";
                }
                //if (TextBox3.Text != "")
                //{
                //    filter += " AND (PartsBOM.colval LIKE '%" + TextBox3.Text + "%')";
                //}

                RunFilter(querystring, filter, availability);

            }
        }

        //else if (Request.QueryString["config"] != null)
        //{
        //    String availability = "";
        //    if (CheckBoxEU.Checked == false) { availability += "AND (PartsBOM.PrtEURepai = false)"; }
        //    else if (CheckBoxEU.Checked == false) { availability += "AND (PartsBOM.PrtEURepai = true)"; }
        //    else { availability = ""; }

        //    String querystring = Request.QueryString["config"];
        //    //String col = DropDownList1.SelectedValue;
        //    String col = "PartsOrdPart.DESCRIPTION";
        //    //<asp:ListItem Value="PartsOrdPart.DESCRIPTION">Part Name</asp:ListItem>
        //    //<asp:ListItem Value="PartsBOM.PrtNum">Part Number</asp:ListItem>
        //    //<asp:ListItem Value="PartsBOM.colval">colval</asp:ListItem>
        //        String val = TextBox1.Text;
        //    // If TextBox is cleared, set as wildcard:
        //    if (val == "")
        //    {
        //        RunFilter(querystring, col, "%", availability);
        //    }
        //    else
        //    { RunFilter(querystring, col, val, availability); }
        //}
        
    }
    protected void RunFilter(String querystring, String filter, String availability)
    {
        //AccessDataSource1.SelectCommand = "SELECT [ProductLine], [Series], [Codename], [ModelName], [ConfigurationNumber], [ReleaseDate], [CodenameInSpareParts] FROM [Products_Basic] WHERE (Series = '" + currentseries + "') AND (" + col + " LIKE '%" + val + "%') ORDER BY [ReleaseDate] DESC, [Codename], [ConfigurationNumber]";
        //AccessDataSource1.SelectCommand = "SELECT ProductConfiguration.ConfigurationNumber, PartsBOM.PrtNum, PartsBOM.prtperunit, PartsBOM.PrtEURepai, PartsBOM.colval, PartsOrdPart.SANDS_Category, PartsOrdPart.DESCRIPTION, PartsOrdPart.SANDS_MEMO_OrdPart, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY                                                                                                                                                                                                        FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PrtNum = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION <> 'ZERO') AND (ProductConfiguration.ConfigurationNumber = '" + querystring + "') AND (" + col + " LIKE '%" + val + "%')" + includedparts + " ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PrtNum";
        //AccessDataSource1.SelectCommand = "SELECT ProductConfiguration.ConfigurationNumber, PartsBOM.PrtNum, PartsBOM.prtperunit, PartsBOM.PrtEURepai, PartsBOM.colval, PartsOrdPart.SANDS_Category, PartsOrdPart.DESCRIPTION, PartsOrdPart.SANDS_MEMO_OrdPart, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY, ProductConfiguration.ReleaseDate, ProductConfiguration.dbMemo, PartsBOM.FG_P_N, PartsBOM.PrtDeRepai, PartsBOM.PrtASCRepair, PartsBOM.PrtReimb, PartsOrdPart.INVENTORY_ITEM_ID, PartsOrdPart.COSTEACH FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PrtNum = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION <> 'ZERO') AND (ProductConfiguration.ConfigurationNumber = '" + querystring + "') AND (" + col + " LIKE '%" + val + "%')" + availability + " ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PrtNum";
        AccessDataSource1.SelectCommand = "SELECT DISTINCT PartsBOM.PrtNum, ProductConfiguration.ConfigurationNumber, PartsBOM.prtperunit, PartsBOM.PrtEURepai, PartsOrdPart.SANDS_Category, PartsOrdPart.DESCRIPTION, PartsOrdPart.SANDS_MEMO_OrdPart, PartsOrdPart.LOCATION, PartsOrdPart.LISTEACH, PartsOrdPart.QUANTITY, ProductConfiguration.ReleaseDate, ProductConfiguration.dbMemo, PartsBOM.FG_P_N, PartsBOM.PrtDeRepai, PartsBOM.PrtASCRepair, PartsBOM.PrtReimb, PartsOrdPart.INVENTORY_ITEM_ID, PartsOrdPart.COSTEACH FROM ((PartsBOM INNER JOIN PartsOrdPart ON PartsBOM.PrtNum = PartsOrdPart.PARTNUM) INNER JOIN ProductConfiguration ON PartsBOM.MDLCONFIG = ProductConfiguration.ConfigurationNumber) WHERE (PartsOrdPart.DESCRIPTION <> 'ZERO') AND (ProductConfiguration.ConfigurationNumber = '" + querystring + "')" + filter + availability + " ORDER BY PartsOrdPart.DESCRIPTION, PartsBOM.PrtNum";

        AccessDataSource1.DataBind();
        GridView1.DataBind();
    }

}
