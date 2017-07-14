<?xml version="1.0" ?>
<xsl:stylesheet	version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="/index">
<html>

<head>
<title>Falcon BMS cockpit</title>
<link rel="stylesheet" type="text/css" href="css/cockpit.css" />
<script type="text/javascript" src="js/jquery.min.js" />
<script type="text/javascript" src="js/jquery.maphilight.min.js"></script>
<script type="text/javascript" src="js/cockpit.js"></script>
<script type="text/javascript">
<xsl:if test="/index/@debug='yes'">
	if (window.Event) {
		document.captureEvents(Event.MOUSEMOVE);
	}
	document.onmousemove = getCursorXY;

	function getCursorXY(e) {
		var rect = document.getElementById("image").getBoundingClientRect();

		document.getElementById('cursorX').value = ((window.Event) ? e.pageX : event.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft)) - Math.round(rect.left);
		document.getElementById('cursorY').value = ((window.Event) ? e.pageY : event.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop)) - Math.round(rect.top) - window.scrollY;
	}
</xsl:if>
	var title = new Array();
<xsl:for-each select="area">	title[<xsl:value-of select="position()" />] = `<xsl:value-of select="@title" />`;
</xsl:for-each>
	var desc = new Array();
<xsl:for-each select="area"><xsl:if test=".!=''">	desc[<xsl:value-of select="position()" />] = `<xsl:copy-of select="node()" />`;
</xsl:if></xsl:for-each>
	var impl = new Array();
<xsl:for-each select="area"><xsl:if test="@impl!=''">	impl[<xsl:value-of select="position()" />] = `<xsl:value-of select="@impl" />`;
</xsl:if></xsl:for-each>
</script>
</head>

<body>
<xsl:if test="/index/@debug='yes'">
<div style="position:absolute ; top:10px ; left:10px">x: <input type="text" id="cursorX" /><br />y: <input type="text" id="cursorY" /></div>
</xsl:if>
<div class="wrapper">
<xsl:if test="title"><h1><xsl:value-of select="title" /></h1></xsl:if>
<xsl:if test="@back"><a href="{@back}" class="back">Back</a></xsl:if>
<div class="panel">
<img src="images/{@image}" id="image" class="map" usemap="#cockpit" />
<map name="cockpit">
<xsl:for-each select="area">
<area shape="{@shape}" coords="{@coords}">
<xsl:if test="@title"><xsl:attribute name="onMouseOver">javascript:show_info(<xsl:value-of select="position()" />)</xsl:attribute></xsl:if>
<xsl:if test="@title"><xsl:attribute name="onMouseOut">javascript:hide_info()</xsl:attribute></xsl:if>
<xsl:if test="@href"><xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute></xsl:if>
</area>
</xsl:for-each>
</map>
<div id="info" class="info">info</div>
</div>
</div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>
