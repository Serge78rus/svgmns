<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="pwr_b_sym">
		<symbol id="pwr_b" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
	    <rect x=".25" y=".25" width=".5" height=".5" fill="none" stroke-width=".5" />
			<circle cx=".5" cy=".5" r=".4" stroke="black" stroke-width=".05"/>
			<line stroke="black" stroke-width=".08" x1=".18" y1=".5" x2=".38" y2=".5" />
			<line stroke="black" stroke-width=".12" x1=".38" y1=".3" x2=".38" y2=".7" />
			<line stroke="black" stroke-width=".08" x1=".56" y1=".18" x2=".56" y2=".82" />
			<line stroke="black" stroke-width=".08" x1=".56" y1=".5" x2=".82" y2=".5" />
		</symbol>
	</xsl:template>

	<xsl:template match="pwr_b" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<use class="pwr_b">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#pwr_b</xsl:text>
 	  	</xsl:attribute>
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_xys">
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_b2s" />
			<xsl:call-template name="attr_f2f" />
		</use>
	</xsl:template>

</xsl:stylesheet>


