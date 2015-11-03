<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="filter">

    <filter id="shadow"  filterUnits="userSpaceOnUse" x="0" y="0" width="1000" height="1000" >
 	    <feOffset result="offOut" in="SourceAlpha" dx="5" dy="5" />
   	  <feGaussianBlur result="blurOut" in="offOut" stdDeviation="3" />
     	<feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
   	</filter>

	</xsl:template>

</xsl:stylesheet>

