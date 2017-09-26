<%@ Page Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="lut-matrix.aspx.cs" Inherits="lut_matrix" Title="Advanced Search" %>
<asp:Content ID="conent3" ContentPlaceHolderID="head" Runat="Server">
    <link href="lut.js" type="application/json" rel="exhibit/data" />

    <script src="http://static.simile.mit.edu/exhibit/api-2.0/exhibit-api.js" type="text/javascript"></script>
    <script src="http://static.simile.mit.edu/exhibit/extensions-2.0/time/time-extension.js"
     type="text/javascript"></script>
   <style>
       body {
           font-family:Arial;
       }
       table.nobelist {
           border:     1px solid #ddd;
           padding:    0.5em;
       }
       div.name {
           font-weight: bold;
           font-size:   120%;
       }
       .discipline {
       }
       .year {
           font-style:  italic;
       }
       .relationship {
           color:  #888;
       }
       .co-winners {
       }
   </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" Runat="Server">Advanced Search
</asp:Content>

    
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table width="100%" bgcolor="white">
    <tr><td>Question, Comment, Problem? <a href="mailto:level3@us.fujitsu.com">email</a></td></tr>
        <tr valign="top">
            <td ex:role="viewPanel">
             <!--<div ex:role="view"
     ex:viewClass="Timeline"
     ex:start=".label"
     ex:colorKey=".ModelName">
 </div>-->
<!--  <div ex:role="exhibit-view"
     ex:viewClass="Exhibit.TabularView"
     ex:columns=".ModelName, .Codename, .label, .DocumentNameNormalized, .MatchingForRetail, .MarketingNumber"
     ex:columnLabels="Model, Codename, Config, LUT, Retail, Marketing"
     ex:columnFormats="list, list, list, list, list"
     ex:sortColumn="0"
     ex:sortAscending="true
     ">
 </div>-->
               <table ex:role="lens" class="nobelist">
       <tr>
           <td>
               <div ex:content=".label" class="name">
               <a ex:content=".ConfigurationNumber" ex:href-subcontent="ConfigReader.aspx?cpn={{.ConfigurationNumber}}" ></a>
               <%--<span ex:content=".ConfigurationNumber" class="discipline"></span>--%>, 
               <span ex:content=".ModelName" class="discipline"></span>, 
               <span ex:content=".Codename" class="year"></span>
               &nbsp;-&nbsp;<a target="_blank" ex:href-subcontent="http://sands.fjcs.net/fcsfiles/lut/{{.DocumentNameNormalized}}" >LUT</a>
               </div>
               <div ex:if-exists=".MatchingForRetail" class="co-winners">Matching 16-digit: 
                   <span ex:content=".MatchingForRetail"></span>
                   
               </div>
               <div ex:if-exists=".MarketingNumber" class="co-winners">Marketing number:
               <span ex:content=".MarketingNumber"></span>
               </div>
           </td>
       </tr>
   </table>
            <!--<div ex:role="view"></div>-->
                        </td>
            <td width="25%">
                <div ex:role="facet" ex:facetclass="TextSearch">
                </div>
                <div ex:role="facet" ex:expression=".label" ex:facetLabel="Config"></div>
                <div ex:role="facet" ex:expression=".ModelName" ex:facetLabel="Model"></div>
                <div ex:role="facet" ex:expression=".Codename" ex:facetLabel="Codename"></div>
               
               
            </td>
        </tr>
    </table>
</asp:Content>

