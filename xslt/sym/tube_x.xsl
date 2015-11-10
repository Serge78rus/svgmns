<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="tube_x_sym">
		<symbol id="tube_x" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
	    <rect x="0" y="0" width="1" height="1" stroke="none" />
			<polygon points="0,0 .5,.5 1,0" transform="rotate(90, .5, .5)" stroke="none" />
			<polygon points="0,0 .5,.5 1,0" transform="rotate(270, .5, .5)" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="tube_x" mode="stat">
		<use class="tube_x">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#tube_x</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#tube_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xys" />
		</use>
	</xsl:template>

</xsl:stylesheet>



