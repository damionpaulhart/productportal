<%@ Page Language="C#" MasterPageFile="~/MasterPageSANDS2.master" AutoEventWireup="true" CodeFile="asp-map-google.aspx.cs" Inherits="asp_map_google" Title="Untitled Page" %>

<asp:content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    v\:* {
      behavior:url(#default#VML);
    }
    </style>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAANQeAue-YWSmKjaPii7wgSRTgtLbXbuWW2GdIWd3pIxzaKyth4BRgE42xhny6DcGehaaL6HCobpMNyA"
            type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[
		
	
		
		var map = null;
    var geocoder = null;

    function body_onload() 
		 {
		 alert(window.location.host + ": Inside body_onload")
		 
      if (GBrowserIsCompatible())
			 {
        map = new GMap2(document.getElementById("map"));
        map.addControl(new GLargeMapControl());
				geocoder = new GClientGeocoder();
				showAddress("Ryzex Repair","800-264-7014", "3758 E. Grove St	Phoenix	AZ	85040");
				showAddress("Leading Edge Technology Solutions", "818-569-7028", "2913 N. Ontario St.	Burbank	CA	91504");
				showAddress("Wesco (Notebookshop.com)", "877-640-7707", "16727 S. Parkside Ave	Cerritos	CA	90703");
				showAddress("Premio Computer", "626-839-3100", "918 Radecki Ct	City of Industry	CA	91745");
				showAddress("Adam's Electronics", "714-848-0110", "7128 Edinger Ave	Huntington Beach	CA	92647");
				map.setCenter(new GLatLng(37.4419, -122.1419), 6);
				}
     	}
			
			function goClicked(address)
			{
			alert(window.location.host + ": Inside goClicked")
			 map.setZoom(10);
			 showAddress("1","1",address);			 
			}
			
			function createIcon()
			{
			 var icon = new GIcon();
			 icon.image = "http://labs.google.com/ridefinder/images/mm_20_blue.png";
			 icon.shadow = "http://labs.google.com/ridefinder/images/mm_20_shadow.png";
			 icon.iconSize = new GSize(15, 23);
			 icon.shadowSize = new GSize(35, 33);
			 icon.iconAnchor = new GPoint(16, 30);
			 icon.infoWindowAnchor = new GPoint(5, 1);
			 
			 return icon;
			}
			
			function setMarker(point, aspName, aspPhone, address)
			{
			if (aspName != "1")
			{
			 var marker = new GMarker(point);
			 GEvent.addListener(marker, "click", function(){marker.openInfoWindowHtml(aspName + "<br>" + address + "<br>" + aspPhone)});
			 map.addOverlay(marker);							
			}
			else
			{
			 var marker = new GMarker(point, createIcon());
			 map.addOverlay(marker);
			 GEvent.addListener(marker, "click", function(){marker.openInfoWindowHtml(address)});
			 marker.openInfoWindowHtml(address);
			}
			}
			
			function showAddress(aspName, aspPhone, address) {
      if (geocoder) {
        geocoder.getLatLng(
          address,
          function(point) {
            if (!point) {
              alert(address + " could not be found.");
            } else {
              map.setCenter(point);
							setMarker(point, aspName, aspPhone, address);              
            }
          }
        );
      }
    }

function body_onunload() {GUnload();}
    //]]>
    </script>
</asp:content>
<asp:content ID="Content2" ContentPlaceHolderID="PageHeader" Runat="Server">
</asp:content>
<asp:content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <form action="#" onsubmit="goClicked(this.address.value); return false;">
      <p>Enter the customer's address or zip code:
			<input type="text" size="60" name="address" id="address"  />
        <input type="submit" value="Go!" />
        <%--<a href="javascript:goClicked(address.value); return false;">Go!</a>--%>
        <a href="javascript:alert(this.address.value + ': Inside goClicked');">Go!</a>
      </p>
    <div id="map" style="width: 600px; height: 500px"></div>
	</form>
</asp:content>

