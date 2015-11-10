<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="help_sym">
		<symbol id="help" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<circle cx=".5" cy=".5" r=".5" stroke="none" fill="rgba(0,255,0,.5)" />
			<text text-anchor="middle" x=".5" y=".83" font-size="1" stroke="none"
						fill="white"
style="cursor:help;-moz-user-select:-moz-none;-o-user-select:none;-khtml-user-select:none;-webkit-user-select:none;user-select:none;"
			>?</text>
		</symbol>
	</xsl:template>

	<xsl:template match="//defs//help" />
	<xsl:template match="help" mode="dyn0" />
	<xsl:template match="help" mode="stat" />
	<xsl:template match="help" mode="dyn" />
	<xsl:template match="help" mode="int" />

	<xsl:template match="help" mode="hlp">
		<use>
			<xsl:attribute name="xlink:href">
       	<xsl:text>#help</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="onmouseover">
       	<xsl:text>showhlp(evt);</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="onmouseout">
				<xsl:text>hidehlp(evt);</xsl:text>
 	  	</xsl:attribute>
			<xsl:call-template name="attr_xys" />
			<desc>
				<xsl:value-of select="." />
			</desc>
		</use>
	</xsl:template>

</xsl:stylesheet>
