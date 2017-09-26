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

public partial class ConfigReader2 : System.Web.UI.Page
{
    String shortConfig; // shortens 16-digit config for detail page...
    protected void Page_Load(object sender, EventArgs e)
    {
        // If you can, search by the TextBox
        if ((TextBox1.Text != "") && (TextBox1.Text.Length > 2))
        { ValidateText(TextBox1.Text); }
        else // If you can't try the QueryString
        {
            if ((Request.QueryString["cpn"] != null) && (Request.QueryString["cpn"].Length > 2))
            {
                TextBox1.Text = Request.QueryString["cpn"];
                ValidateText(TextBox1.Text);
            }
            else // if that don't work, hide everything
            { tblParser.Visible = false; }
        }
        GoToDetailHyperLink.Text = shortConfig + " Detail Page";
        GoToDetailHyperLink.NavigateUrl = "http://sands/configuration.aspx?Configuration=" + shortConfig;

    }
    protected void ValidateText(String text)
    {
        TextBox1.Text = text.ToUpper();
        // Fix Refurbished entries:
        if (text.Substring(0, 3) == "RCP")
        {
            TextBox1.Text = text.Remove(0, 1);
        }
        if (text.Substring(0, 1) == "R")
        {
            TextBox1.Text = text.Remove(0, 1);
            TextBox1.Text = text.Insert(0, "A");
        }
        String validatedText = text;
        InsertSearch();
        GetResults(validatedText);
    }
    
    protected Boolean GetResults(String txt)
    {
        if (txt.Substring(0, 2) == "CP")
        {
            shortConfig = txt;
            AccessDataSourceRetailCheck.SelectCommand = "SELECT [MatchingForRetail], [ConfigurationNumber]  FROM [Model] WHERE [ConfigurationNumber] ='" + txt + "'";
            AccessDataSourceRetailCheck.DataBind();
            DataList1.DataBind();
            DataList1.SelectedIndex = 0;
            if (DataList1.HasControls())
            {
                SetView("retail");
            }
            else
            {
                SetView("noResults");
            }
            return true;
        }
        else if (txt.Substring(0, 3) == "FPC")
        {
            shortConfig = txt;
            AccessDataSourceRetailCheck.SelectCommand = "SELECT [MatchingForRetail], [ConfigurationNumber], [MarketingNumber]  FROM [Model] WHERE [MarketingNumber] ='" + txt + "'";
            AccessDataSourceRetailCheck.DataBind();
            DataList1.DataBind();
            DataList1.SelectedIndex = 0;
            if (DataList1.HasControls())
            {
                SetView("retail");
            }
            else
            {
                SetView("noResults");
            }
            return true;
        }
        else if (txt != "")
        {
            txt = txt.Substring(0, 3);
            shortConfig = txt;
            //AccessDataSource2.SelectCommand = "SELECT [ConfigurationNumber], [Codename], [LUT_desc], [ModelName], [FCode], [ColumnNumber], [RowNumber], [ColumnName], [RowItem] FROM [LookUpTableInfo] WHERE [ConfigurationNumber] ='" + txt + "' ORDER BY [ColumnNumber], [RowNumber]";
            AccessDataSource2.SelectCommand = "SELECT LUTconfig AS ConfigurationNumber, ColKey AS ColumnNumber, RowKey AS RowNumber, ColItem AS ColumnName, RowItem FROM LUTauto WHERE LUTconfig ='" + txt + "' ORDER BY ColKey, RowKey";
            DetailsView1.DataBind();
            GridView1.DataBind();
            if (GridView1.Rows.Count > 0)
            {
                SetView("normalResults");
            }
            else
            {
                SetView("noResults");
            }
            return true;
        }
        else
        {
            SetView("noResults");
        }
        return false;
    }
    protected void SetView(String txt)
    {
        switch (txt)
        {
            case "normalResults":
                Table1.Visible = false;
                tblRetail.Visible = false;
                myRowDropDown.Visible = true;
                tblParser.Visible = true;
                break;
            case "retail":
                Table1.Visible = false;
                tblRetail.Visible = true;
                myRowDropDown.Visible = false;
                tblParser.Visible = false;
                break;
            case "noResults":
                Table1.Visible = true;
                tblRetail.Visible = false;
                myRowDropDown.Visible = false;
                tblParser.Visible = false;
                break;
        }

    }
    protected void GridView1_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
        // 
        if (TextBox1.Text != "")
        {
            // Is this a DataRow?
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Yes, Get the ColKey from cell "0" of this row
                int col = int.Parse(e.Row.Cells[0].Text);

                if (col == 2)
                {
                    e.Row.Visible = false;
                }
                else 
                {
                    // If the ColKey is greater than the search text
                    // Or does not match the digit at this place 
                    // then make it Silver
                    // or if the 'show customer choices only' is selected, hide the row....
                    if ((col > TextBox1.Text.Length) || (e.Row.Cells[1].Text != TextBox1.Text.Substring(col - 1, 1)))
                    {
                        if (DropDownList1.SelectedIndex == 0)
                        {
                            e.Row.ForeColor = System.Drawing.Color.Silver;
                        }
                        else if (DropDownList1.SelectedIndex == 1)
                        {
                            e.Row.Visible = false;
                        }
                    }

                }
            }
        }
    }
    protected void InsertSearch()
    {
        String View = DropDownList1.SelectedValue;
        // String Who = Request.UserHostAddress;
        String Who = Request.UserHostName;
        AccessDataSourceInsert.InsertParameters["Who"].DefaultValue = Who;
        AccessDataSourceInsert.Insert();
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {

    }
}
