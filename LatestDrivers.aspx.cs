using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestDrivers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack)
        {

            String os = DropDownListOS.SelectedValue;
            String type = DropDownListType.SelectedValue;

            // If TextBox is cleared, set as wildcard:
            String desc = TextBox2.Text;
            if (desc == "") { desc = "%"; }
            
            String val = TextBox1.Text;
            if (val == ""){val = "%";}

            
     
            RunFilter(val, os, type, desc);
        }

    }

    protected void RunFilter(String val, String os, String type, String desc)
    {

        //AccessDataSource1.SelectCommand = "SELECT Codename, ModelName, ConfigurationNumber, ReleaseDate, Season, dbMemo FROM Products_Basic WHERE ((ReleaseDate LIKE '%2008' OR ReleaseDate LIKE '%2007' OR ReleaseDate LIKE '%2006')) AND (" + col + " LIKE '%" + val + "%') ORDER BY ReleaseDate DESC";
        //AccessDataSource1.SelectCommand = "SELECT Codename, ModelName, ConfigurationNumber, ReleaseDate, Season, dbMemo FROM Products_Basic WHERE (ModelName LIKE '%" + val + "%') OR (Codename LIKE '%" + val + "%') OR (ConfigurationNumber LIKE '%" + val + "%') OR (Season LIKE '%" + val + "%') OR (dbMemo LIKE '%" + val + "%') ORDER BY ReleaseDate DESC";
        //AccessDataSource1.SelectCommand = "SELECT [SS-date-created] AS column1, [ModelName], [SS-OS-Abbreviation] AS column2, [SS-Description] AS column3, [SS-Version] AS column4, [SS-Size] AS column5, [SS-URLLocation] AS column6, [SS-Type] AS column7 FROM [LatestSilverStreamDrivers] WHERE ([SS-Type] = "UP") OR (ModelName LIKE '%" + val + "%')  ORDER BY ReleaseDate DESC";
        AccessDataSource1.SelectCommand = "SELECT DISTINCT [SS-Description] AS column3, [SS-date-created] AS column1, [ModelName], [SS-OS-Abbreviation] AS column2,  [SS-Version] AS column4, [SS-Size] AS column5, [SS-URLLocation] AS column6, [SS-Type] AS column7, [SS-URLLocation] AS column8  FROM [LatestSilverStreamDrivers] WHERE (ModelName LIKE '%" + val + "%') AND ([SS-Type] LIKE '" + type + "') AND ([SS-OS-Abbreviation] LIKE '" + os + "')  AND ([SS-Description] LIKE '%" + desc + "%') ORDER BY [SS-date-created] DESC";
        AccessDataSource1.DataBind();
        GridView1.DataBind();
    }
}
