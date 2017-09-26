using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for AddStyleSheet
/// </summary>
public class StyleSheetAdder
{
    public StyleSheetAdder()
    {
    }
    public static void AddLinkedStyleSheet(Page page, string stylesheet)
    {
        HtmlLink link = new HtmlLink();
        link.Href = page.ResolveUrl(stylesheet);
        link.Attributes["type"] = "text/css";
        link.Attributes["rel"] = "stylesheet";

        page.Header.Controls.Add(link);
    }
    //public static void AddLinkedStyleSheet(MasterPage page, string stylesheet)
    //{ 
    //    this.AddLinkedStyleSheet(page.Page, stylesheet);
    
    //}
}
