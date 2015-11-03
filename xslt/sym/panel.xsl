<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:template match="/colors">
    <xsl:element name="xsl:stylesheet">
			<xsl:call-template name="xsl_attr" />
			<xsl:call-template name="xsl_output" />
<!--
    	<xsl:element name="xsl:template">
				<xsl:attribute name="name">
  	     	<xsl:text>panel_flt</xsl:text>
    	  </xsl:attribute>
				<xsl:call-template name="make_flt" />
	    </xsl:element>
-->
    	<xsl:element name="xsl:template">
				<xsl:attribute name="name">
  	     	<xsl:text>panel_grd</xsl:text>
    	  </xsl:attribute>
				<xsl:for-each select="//color">
					<xsl:call-template name="make_grd" />
				</xsl:for-each>
	    </xsl:element>
    </xsl:element>
	</xsl:template>
<!--
	<xsl:template name="make_flt">
    <filter id="panel_f" x="-.1" y="-.1" width="1.2" height="1.2">
      <feOffset result="offOut" in="SourceAlpha" dx=".04" dy=".04" />
      <feGaussianBlur result="blurOut" in="offOut" stdDeviation=".02" />
      <feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
    </filter>
	</xsl:template>
-->
	<xsl:template name="make_grd">
		<linearGradient x1="0" y1="0" x2="1" y2="1">
			<xsl:attribute name="id">
       	<xsl:text>panel_lg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset=".45" stop-color="rgba(255,255,255,.7)" />
			<stop offset=".5">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
			<stop offset=".55" stop-color="rgba(0,0,0,.3)" />
		</linearGradient>
	</xsl:template>

	<xsl:template name="panel_sym">
		<symbol id="panel" viewBox="0 0 1 1" preserveAspectRatio="none">
	    <rect x="0" y="0" width="1" height="1" rx=".12" ry=".12" stroke="none" />
	    <rect x="0.02" y="0.02" width=".96" height=".96" rx=".1" ry=".1" stroke-width=".04" fill="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="panel" mode="stat">
		<use class="panel" filter="url(#shadow)">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#panel</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="stroke">
     		<xsl:text>url(#panel_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_i" />
			<xsl:call-template name="attr_xywh" />
			<xsl:call-template name="attr_c2f" />
		</use>
	</xsl:template>

</xsl:stylesheet>



