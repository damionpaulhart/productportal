<%@ Page Language="C#" ContentType="text/html" %>
<html><!-- InstanceBegin template="/Templates/Main_Template.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- #BeginEditable "doctitle" -->
<title>Videos : SANDS</title>
<!-- #EndEditable -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.02 Transitional//EN"
"http://www.w3.org/TR/html3.2/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="shortcut icon" href="http://sands.fjcs.net/favicon.ico" type="image/x-icon"> 
<link rel="icon" href="http://sands.fjcs.net/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link href="SANDS.css" rel="stylesheet" type="text/css">
<link href="css/list.css" rel="stylesheet" type="text/css">
<link href="css/menu-right.css" rel="stylesheet" type="text/css">
</head>
<!-- InstanceBeginEditable name="EditRegionForScripts" --><!-- InstanceEndEditable -->
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><!--Header -->
  <tr>
    <td colspan="3"><table style="width:100%;" cellpadding="0px" cellspacing="0px">
        <tr>
          <td><img src="images/logo-fpc-415x641.gif" alt="Fujitsu Computer Systems" width="415" height="64" /></td>
          <td class="greyItalic" style="text-align:right; white-space:nowrap; vertical-align:bottom; white-space:nowrap";>Fujitsu Computer Systems</td>
        </tr>
        <tr>
          <td colspan="2" style="margin:0px; padding:0px"><div id="navbox"><ul><li><a href="main.aspx">Home</a></li><li><a href="prod_Series.aspx">Products</a></li><li><a href="doclistLookUpTables.aspx">Look Up Tables</a></li><li><a href="file:\\mem-fs02\common\Service & Support\Level 3\Exploded Drawings" target="_blank">Exploded Diagrams</a></li><li><a href="file:\\mem-fs02\common\Service & Support\Level 3\BIOS Information\BIOS Files" target="_blank">BIOS Files</a></li></ul></div></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td id="linkbar"><!-- InstanceBeginEditable name="LinkBar" -->&nbsp;<!-- InstanceEndEditable --></td>
    <td id="linkbar" align="right"><!-- InstanceBeginEditable name="Counter" -->&nbsp;<!-- InstanceEndEditable --></td>
  </tr>
  <tr>

    <!-- Center Column -->
    <td valign="top" width="100%">
      <div id="titlebar">
        <h2><!-- #BeginEditable "PageHeader" --> Videos <!-- #EndEditable --></h2>
      </div>
      <div id="contentwrapper">
        <div id="content"> <!-- #BeginEditable "Content" -->
          <h3>Inside A Hard Drive</h3>
          <object width="425" height="350"><param name="movie" value="http://www.youtube.com/v/9eMWG3fwiEU"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/9eMWG3fwiEU" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350"></embed></object>
        <!-- #EndEditable --> </div>
      </div>
      <!---
          </div></td>
        <!-- right col -->
    <td style="width:155px; vertical-align:top; background-image:url(images/bg-rightcol2.jpg); background-repeat: repeat-y; padding:0px;"><img src="images/img_dot.gif"> <a href="http://diamond.ftsi.fujitsu.com/eservice/iview/ui/eserver.asp" target="_blank"><img src="images/PrimusRM.gif" width="155" height="38" vspace="8" border="0"></a>
      <table>
        <tr>
          <td style="padding-left:4px"><table class="rm">
              <tr>
                <td colspan="2" class="rmTitle">Model Search  </td>
              </tr>
              <tr>
                <th colspan="2">Config Reader:</th>
              </tr>
              <form action="lut_temp.aspx" method="get" name="form_16digit">
                <tr>
                  <td align="right"><input name="cpn" type="text" id="16digit" title="enter 16 digit CTO Number to Parse" maxlength="16" size="12"></td>
                  <td><input name="go" type="submit" class="button" value="&gt;&gt;"></td>
                </tr>
              </form>
              <tr>
                <th colspan="2">Config Parts & Specs: </th>
              </tr>
              <form action="prod_ConfigDetail.aspx" method="get" name="form_FPC">
                <tr>
                  <td align="right"><input name="ConfigurationNumber" type="text" id="fpc" title="Enter configuration for Parts and Specs" size="12" maxlength="16"></td>
                  <td><input name="go" type="submit" class="button" value="&gt;&gt;"></td>
                </tr>
              </form>
            </table>
            <table class="rm" style="margin-top:10px">
              <tr>
                <td colspan="2" class="rmTitle">Part Search </td>
              </tr>
              <tr>
                <th colspan="2">Enter part number </th>
              </tr>
              <form action="parts_ByNumber.aspx" method="get" name="form_GetPartsByNumber">
                <tr>
                  <td align="right"><input name="PARTNUM" type="text" id="num" title="enter entire part number" size="12" maxlength="16"></td>
                  <td><input name="go" type="submit" class="button" value="&gt;&gt;"></td>
                </tr>
              </form>
              <tr>
                <th colspan="2">Enter part name </th>
              </tr>
              <form action="parts_ByDescription.aspx" method="get" name="form_GetPartsByDesc">
                <tr>
                  <td align="right"><input name="DESCRIPTION" type="text" id="desc" title="enter partial or full word of part description" size="12" maxlength="16"></td>
                  <td><input name="go" type="submit" class="button" value="&gt;&gt;"></td>
                </tr>
              </form>
              <tr>
                <th colspan="2">Enter part and model </th>
              </tr>
              <form action="parts_ByDescriptionForModel.aspx" method="get" name="form_GetPartsByDescAndModel">
                <tr>
                  <td align="right"><input name="DESCRIPTION" type="text" class="form" id="pname" title="enter part Description (HDD, CD, Upper)" value="&lt;part name&gt;" size="12" maxlength="16">
                    <br>
                    <input name="ModelName" type="text" class="form" id="modeln" title="enter Model Name : (C340, E6556)" value="&lt;model name&gt;" size="12" maxlength="16"></td>
                  <td><input name="go" type="submit" class="button" value="&gt;&gt;"></td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <!-- footer -->
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="lineRed">&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">All Rights Reserved, Copyright &#169; Fujitsu Computer Systems Corporation 2001-2005</font><img src="file:///D|/images/space.gif" width="3" height="8" alt=""></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
