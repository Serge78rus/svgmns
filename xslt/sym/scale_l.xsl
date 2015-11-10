<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="scale_l_sym">
		<symbol id="scale_l" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="//defs//scale_l" />
	<xsl:template match="scale_l" mode="dyn0" />
	<xsl:template match="scale_l" mode="dyn" />
	<xsl:template match="scale_l" mode="int" />
	<xsl:template match="scale_l" mode="hlp" />

	<xsl:template match="scale_l" mode="stat">
		<g class="scale_l">
			<xsl:call-template name="attr_c2f" />
			<xsl:call-template name="attr_c2s" />
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#scale_l</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xylw" />
				<xsl:if test='@o="h"'>
					<xsl:call-template name="attr_rot90lw" />
				</xsl:if>
			</use>
			<xsl:variable name="x_" select="@x" />
			<xsl:variable name="y_" select="@y" />
			<xsl:variable name="l_" select="@l" />
			<xsl:variable name="w_" select="@w" />
   		<xsl:choose>
       	<xsl:when test='@o="v"'>
					<xsl:for-each select="./mark">
						<xsl:call-template name="scale_l_vm">
							<xsl:with-param name="x" select="$x_" />
							<xsl:with-param name="y" select="$y_" />
							<xsl:with-param name="l" select="$l_" />
							<xsl:with-param name="w" select="$w_" />
						</xsl:call-template>
					</xsl:for-each>
      	</xsl:when>
       	<xsl:when test='@o="h"'>
					<xsl:for-each select="./mark">
						<xsl:call-template name="scale_l_hm">
							<xsl:with-param name="x" select="$x_" />
							<xsl:with-param name="y" select="$y_" />
							<xsl:with-param name="l" select="$l_" />
							<xsl:with-param name="w" select="$w_" />
						</xsl:call-template>
					</xsl:for-each>
      	</xsl:when>
			</xsl:choose>
		</g>
	</xsl:template>

	<xsl:template name="scale_l_vm">
	  <xsl:param name="x" />
	  <xsl:param name="y" />
	  <xsl:param name="l" />
	  <xsl:param name="w" />
		<line>
			<xsl:attribute name="x1">
				<xsl:value-of select="$x + $w" />
  		</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$x + $w + @l" />
  		</xsl:attribute>
			<xsl:attribute name="y1">
				<xsl:value-of select="$y + $l - @v div 100 * $l" />
  		</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$y + $l - @v div 100 * $l" />
  		</xsl:attribute>
			<xsl:attribute name="stroke-width">
				<xsl:value-of select="@w" />
 			</xsl:attribute>
			<xsl:if test="@c">
				<xsl:attribute name="stroke">
					<xsl:value-of select="@c" />
				</xsl:attribute>
			</xsl:if>
		</line>
		<text stroke="none">
			<xsl:attribute name="font-size">
	  		<xsl:value-of select="@s" />
			</xsl:attribute>
			<xsl:attribute name="x">
  	 		<xsl:value-of select="$x + $w + @l + @s * .3" />
			</xsl:attribute>
			<xsl:attribute name="y">
				<xsl:value-of select="$y + $l - @v div 100 * $l + @s * .3" />
  		</xsl:attribute>
			<xsl:if test="@c">
				<xsl:attribute name="fill">
					<xsl:value-of select="@c" />
				</xsl:attribute>
			</xsl:if>
  		<xsl:value-of select="." />
		</text>
	</xsl:template>

	<xsl:template name="scale_l_hm">
	  <xsl:param name="x" />
	  <xsl:param name="y" />
	  <xsl:param name="l" />
	  <xsl:param name="w" />
		<line>
			<xsl:attribute name="x1">
				<xsl:value-of select="$x + @v div 100 * $l" />
  		</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$x + @v div 100 * $l" />
  		</xsl:attribute>
			<xsl:attribute name="y1">
				<xsl:value-of select="$y + $w" />
  		</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$y + $w + @l" />
  		</xsl:attribute>
			<xsl:attribute name="stroke-width">
				<xsl:value-of select="@w" />
 			</xsl:attribute>
			<xsl:if test="@c">
				<xsl:attribute name="stroke">
					<xsl:value-of select="@c" />
				</xsl:attribute>
			</xsl:if>
		</line>
		<text text-anchor="middle" stroke="none">
			<xsl:attribute name="font-size">
	  		<xsl:value-of select="@s" />
			</xsl:attribute>
			<xsl:attribute name="x">
				<xsl:value-of select="$x + @v div 100 * $l" />
			</xsl:attribute>
			<xsl:attribute name="y">
  	 		<xsl:value-of select="$y + $w + @l + @s" />
  		</xsl:attribute>
			<xsl:if test="@c">
				<xsl:attribute name="fill">
					<xsl:value-of select="@c" />
				</xsl:attribute>
			</xsl:if>
  		<xsl:value-of select="." />
		</text>
	</xsl:template>

</xsl:stylesheet>

