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

public partial class techspec : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label TechSpecUrl = (Label)FormView1.FindControl("TechSpecUrlLocationLabel");
        if (TechSpecUrl != null)
        {
            String url = TechSpecUrl.Text;
            Response.Redirect("http://www.computers.us.fujitsu.com" + url);
        }
        else { Response.Write("TechSpec not yet available on sands, visit the support site: <a href=http://support.fujitsupc.com/CS/Portal/support.do?srch=TECHSPECS>Tech Specs online</a>"); }
    }
}
