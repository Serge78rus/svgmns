<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:template name="label_sym">
		<symbol id="label" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" rx=".1" ry=".1" />
		</symbol>
	</xsl:template>

	<xsl:template match="label" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="label">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use filter="url(#shadow)">
				<xsl:attribute name="xlink:href">
       		<xsl:text>#label</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xywh">
					<xsl:with-param name="x">
  		    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
      			<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="attr_b2f" />
			</use>
			<text text-anchor="middle">
				<xsl:attribute name="font-size">
 		  		<xsl:value-of select="@h * .8" />
 				</xsl:attribute>
				<xsl:attribute name="x">
 	    		<xsl:value-of select="@x + $x + @w * .5" />
  			</xsl:attribute>
				<xsl:attribute name="y">
     			<xsl:value-of select="@y + $y + @h * .75" />
  			</xsl:attribute>
				<xsl:call-template name="attr_f2f" />
  			<xsl:value-of select="@t" />
			</text>
		</g>
	</xsl:template>

</xsl:stylesheet>

