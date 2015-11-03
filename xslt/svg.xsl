<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template match="//defs//svg">
		<xsl:if test="@f">
			<xsl:copy-of select="document(@f)/svg/*" />
		</xsl:if>
		<xsl:copy-of select="*" />
	</xsl:template>

	<xsl:template match="svg" mode="stat">
		<xsl:if test="not(@i)">
			<xsl:if test="@f">
				<xsl:copy-of select="document(@f)/svg/*" />
			</xsl:if>
			<xsl:copy-of select="*" />
		</xsl:if>
	</xsl:template>

	<xsl:template match="svg" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:if test="@i">
			<g class="svg">
				<xsl:call-template name="attr_i">
					<xsl:with-param name="i">
  		    	<xsl:value-of select="$i" />
					</xsl:with-param>
				</xsl:call-template>
				<g>
					<xsl:attribute name="transform">
						<xsl:text>translate(</xsl:text>
	    		 	<xsl:value-of select="$x" />
						<xsl:text>,</xsl:text>
	    		 	<xsl:value-of select="$y" />
						<xsl:text>)</xsl:text>
	  			</xsl:attribute>
					<xsl:if test="@f">
						<xsl:copy-of select="document(@f)/svg/*" />
					</xsl:if>
					<xsl:copy-of select="*" />
				</g>
			</g>
		</xsl:if>
	</xsl:template>

	<xsl:template match="svg" mode="dyn0" />
	<xsl:template match="svg" mode="int" />
	<xsl:template match="svg" mode="hlp" />

</xsl:stylesheet>
