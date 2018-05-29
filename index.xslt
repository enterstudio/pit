<?xml version="1.0" ?>
<xsl:stylesheet	version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="/index">
<html>

<head>
<meta name="author" content="Hugo Leisink - https://github.com/hsleisink/pit" />
<meta name="copyright" content="Copyright (c) by Hugo Leisink" />
<meta name="description" content="Explains the F-16 block 50/52 cockpit as implemented in Falcon BMS." />
<title>Falcon BMS cockpit</title>
<link rel="stylesheet" type="text/css" href="css/cockpit.css" />
<script type="text/javascript" src="js/jquery.min.js" />
<script type="text/javascript" src="js/jquery.maphilight.min.js" />
<script type="text/javascript" src="js/cockpit.js" />
<xsl:if test="/index/@debug='yes'">
<script type="text/javascript" src="js/debug.js" />
</xsl:if>
<script type="text/javascript">
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
<div class="opacity">
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
</div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>
