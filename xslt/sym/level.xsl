<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:template name="level_sym">
		<symbol id="level" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="level" mode="dyn0">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="level">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use>
				<xsl:attribute name="xlink:href"><xsl:text>#level</xsl:text></xsl:attribute>
				<xsl:call-template name="attr_f2f" />
				<xsl:call-template name="attr_xywh">
					<xsl:with-param name="x"><xsl:value-of select="$x" /></xsl:with-param>
					<xsl:with-param name="y"><xsl:value-of select="$y" /></xsl:with-param>
				</xsl:call-template>
			</use>
			<use>
				<xsl:attribute name="xlink:href"><xsl:text>#level</xsl:text></xsl:attribute>
				<xsl:call-template name="attr_b2f" />
				<xsl:call-template name="attr_xywh">
					<xsl:with-param name="x"><xsl:value-of select="$x" /></xsl:with-param>
					<xsl:with-param name="y"><xsl:value-of select="$y" /></xsl:with-param>
				</xsl:call-template>
		   	<xsl:if test="@v">
					<xsl:attribute name="transform">
						<xsl:text>translate(0,</xsl:text>
						<xsl:value-of select="(@y + $y) * @v div 100" />
						<xsl:text>) scale(1,</xsl:text>
						<xsl:value-of select="1 - @v div 100" />
						<xsl:text>)</xsl:text>
					</xsl:attribute>
   			</xsl:if>
			</use>
		</g>
	</xsl:template>

</xsl:stylesheet>

