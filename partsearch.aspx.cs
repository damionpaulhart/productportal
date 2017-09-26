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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "(" + Application.Get("userCount").ToString() + " users)";
        
        if (Page.IsPostBack)
        {
            String val = TextBox1.Text;
            // If TextBox is cleared, set as wildcard:
            if (val == "")
            {
                RunFilter("%");
            }
            else
            { RunFilter(val); }
        }
    }

    // Make Nivce Visual feature on headers for sorting:
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView gridView = (GridView)sender;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            int cellIndex = -1;
            foreach (DataControlField field in gridView.Columns)
            {
                e.Row.Cells[gridView.Columns.IndexOf(field)].CssClass = "headerstyle";

                if (field.SortExpression == gridView.SortExpression)
                {
                    cellIndex = gridView.Columns.IndexOf(field);
                }
            }

            if (cellIndex > -1)
            {
                //  this is a header row,
                //  set the sort style
                e.Row.Cells[cellIndex].CssClass =
                    gridView.SortDirection == SortDirection.Ascending
                    ? "sortascheaderstyle" : "sortdescheaderstyle";
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            // Get the text (control or not depends the field type...)
            //String col = ((HyperLink)e.Row.Cells[2].Controls[0]).Text;
            //String col = e.Row.Cells[3].Text;
            String col = ((LiteralControl)e.Row.Cells[3].Controls[0]).Text;


            if (col.Substring(0,3) == "TBD")
            {
                e.Row.Cells[3].Text = col;
                e.Row.ForeColor = System.Drawing.Color.Gray;
                
           }
        }
    }

    protected void RunFilter(String val)
    {

        //AccessDataSource1.SelectCommand = "SELECT Codename, ModelName, ConfigurationNumber, ReleaseDate, Season, dbMemo FROM Products_Basic WHERE ((ReleaseDate LIKE '%2008' OR ReleaseDate LIKE '%2007' OR ReleaseDate LIKE '%2006')) AND (" + col + " LIKE '%" + val + "%') ORDER BY ReleaseDate DESC";
        AccessDataSource1.SelectCommand = "SELECT Codename, ModelName, ConfigurationNumber, ReleaseDate, Season, dbMemo FROM Products_Basic WHERE (ModelName LIKE '%" + val + "%') OR (Codename LIKE '%" + val + "%') OR (ConfigurationNumber LIKE '%" + val + "%') OR (Season LIKE '%" + val + "%') OR (dbMemo LIKE '%" + val + "%')   ORDER BY ReleaseDate DESC";

        AccessDataSource1.DataBind();
        GridView1.DataBind();
    }


    protected void btnExportToExcel_Click(object sender, System.EventArgs e)
    {
        //GridViewExportUtil.Export("sandsReport.xls", this.GridView1);
        //HyperLink hl = (HyperLink)FormView1.FindControl("HyperLinkBOMParts");
        GridViewExportUtil.Export("sandsReport.xls", (GridView)this.TabContainer1.FindControl("GridView1"));

        
    }
    //protected void ButtonQuickConfig_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("configquick.aspx?cpn=" + TextBoxQuickConfig.Text);
    //    //Server.Transfer("partsbynumber.aspx?partnumber=" + TextBoxPartsByNumber.Text);
    //}


}
