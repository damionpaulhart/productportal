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

public partial class partsbyname : System.Web.UI.Page
{
    public ContentPlaceHolder cph;
    public GridView gv;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label1.Text = Request.QueryString["partname"];
            // For Useability, repopulate the TextBox that was used to search:
            Control mpSearchRight = Master.FindControl("SearchRight1");
            TextBox mpTextBox = (TextBox)mpSearchRight.FindControl("TextBoxPartsByName");
            if (mpTextBox != null)
            {
                mpTextBox.Text = Request.QueryString["partname"];
            }
        }
    }
    protected void btnExportToExcel_Click(object sender, System.EventArgs e)
    {
        //GridViewExportUtil.Export("sandsReport.xls", this.GridView1);
        //HyperLink hl = (HyperLink)FormView1.FindControl("HyperLinkBOMParts");
        //GridViewExportUtil.Export("sandsReport.xls", (GridView)this.FindControl("Content2").FindControl("GridView1"));
        cph = (ContentPlaceHolder)Master.FindControl("Content2");
        Trace.Write("can I trace, please");
        if (cph != null)
        {
            Trace.Write("runGridViewExportUtil");
            gv = (GridView)cph.FindControl("GridView1");
            if (gv != null)
            {
                Trace.Write("runGridViewExportUtil");
                 GridViewExportUtil.Export("sandsReport.xls", gv);
                 Trace.Write("ranGridViewExportUtil");
            }
        }
    }
}
