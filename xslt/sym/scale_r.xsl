<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="scale_r_sym">
		<symbol id="scale_r120" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<path d="M0.066,.257 A.5,.5 0 0,1 .934,.257" fill="none" stroke-width=".0125" />
    </symbol>
		<symbol id="scale_r240" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<path d="M0.073,.747 A.49,.497 0 1,1 .927,.747" fill="none" stroke-width=".0125" />
    </symbol>
		<symbol id="scale_r360" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<circle cx=".5" cy=".5" r=".49375" fill="none" stroke-width=".0125" />
    </symbol>
	</xsl:template>

	<xsl:template match="//defs//scale_r120" />
	<xsl:template match="scale_r120" mode="dyn0" />
	<xsl:template match="scale_r120" mode="dyn" />
	<xsl:template match="scale_r120" mode="int" />
	<xsl:template match="scale_r120" mode="hlp" />

	<xsl:template match="scale_r120" mode="stat">
		<g class="scale_r120">
			<xsl:call-template name="attr_c2s" />
			<xsl:call-template name="attr_c2f" />
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#scale_r120</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys" />
			</use>
			<xsl:variable name="x_" select="@x" />
			<xsl:variable name="y_" select="@y" />
			<xsl:variable name="s_" select="@s" />
			<xsl:for-each select="./mark">
				<xsl:call-template name="scale_r_m">
					<xsl:with-param name="x" select="$x_" />
					<xsl:with-param name="y" select="$y_" />
					<xsl:with-param name="s" select="$s_" />
					<xsl:with-param name="a" select="@v * 1.2 - 60" />
				</xsl:call-template>
			</xsl:for-each>
		</g>
	</xsl:template>

	<xsl:template match="//defs//scale_r240" />
	<xsl:template match="scale_r240" mode="dyn0" />
	<xsl:template match="scale_r240" mode="dyn" />
	<xsl:template match="scale_r240" mode="int" />
	<xsl:template match="scale_r240" mode="hlp" />

	<xsl:template match="scale_r240" mode="stat">
		<g class="scale_r240">
			<xsl:call-template name="attr_c2s" />
			<xsl:call-template name="attr_c2f" />
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#scale_r240</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys" />
			</use>
			<xsl:variable name="x_" select="@x" />
			<xsl:variable name="y_" select="@y" />
			<xsl:variable name="s_" select="@s" />
			<xsl:for-each select="./mark">
				<xsl:call-template name="scale_r_m">
					<xsl:with-param name="x" select="$x_" />
					<xsl:with-param name="y" select="$y_" />
					<xsl:with-param name="s" select="$s_" />
					<xsl:with-param name="a" select="@v * 2.4 - 120" />
				</xsl:call-template>
			</xsl:for-each>
		</g>
	</xsl:template>

	<xsl:template match="//defs//scale_r360" />
	<xsl:template match="scale_r360" mode="dyn0" />
	<xsl:template match="scale_r360" mode="dyn" />
	<xsl:template match="scale_r360" mode="int" />
	<xsl:template match="scale_r360" mode="hlp" />

	<xsl:template match="scale_r360" mode="stat">
		<g class="scale_r360">
			<xsl:call-template name="attr_c2s" />
			<xsl:call-template name="attr_c2f" />
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#scale_r360</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys" />
			</use>
			<xsl:variable name="x_" select="@x" />
			<xsl:variable name="y_" select="@y" />
			<xsl:variable name="s_" select="@s" />
			<xsl:for-each select="./mark">
				<xsl:call-template name="scale_r_m">
					<xsl:with-param name="x" select="$x_" />
					<xsl:with-param name="y" select="$y_" />
					<xsl:with-param name="s" select="$s_" />
					<xsl:with-param name="a" select="@v * 3.6 - 180" />
				</xsl:call-template>
			</xsl:for-each>
		</g>
	</xsl:template>

	<xsl:template name="scale_r_m">
	  <xsl:param name="x" />
	  <xsl:param name="y" />
	  <xsl:param name="s" />
	  <xsl:param name="a" />
		<line>
			<xsl:attribute name="x1">
				<xsl:value-of select="$x + $s div 2" />
			</xsl:attribute>
			<xsl:attribute name="x2">
				<xsl:value-of select="$x + $s div 2" />
			</xsl:attribute>
			<xsl:attribute name="y1">
				<xsl:value-of select="$y - @l" />
			</xsl:attribute>
			<xsl:attribute name="y2">
				<xsl:value-of select="$y" />
			</xsl:attribute>
			<xsl:attribute name="stroke-width">
				<xsl:value-of select="@w" />
			</xsl:attribute>
			<xsl:attribute name="transform">
   			<xsl:text>rotate(</xsl:text>
				<xsl:value-of select="$a" />
   			<xsl:text>,</xsl:text>
				<xsl:value-of select="$x + $s div 2" />
   			<xsl:text>,</xsl:text>
				<xsl:value-of select="$y + $s div 2" />
   			<xsl:text>)</xsl:text>
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
  	 		<xsl:value-of select="$x + $s div 2" />
			</xsl:attribute>
			<xsl:attribute name="y">
				<xsl:value-of select="$y - @l - @s * .3" />
  		</xsl:attribute>
			<xsl:attribute name="transform">
   			<xsl:text>rotate(</xsl:text>
				<xsl:value-of select="$a" />
   			<xsl:text>,</xsl:text>
				<xsl:value-of select="$x + $s div 2" />
   			<xsl:text>,</xsl:text>
				<xsl:value-of select="$y + $s div 2" />
   			<xsl:text>)</xsl:text>
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
