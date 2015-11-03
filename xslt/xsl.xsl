<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="xsl_attr">
		<xsl:attribute name="version">
     	<xsl:text>1.0</xsl:text>
    </xsl:attribute>
	</xsl:template>

	<xsl:template name="xsl_output">
		<xsl:element name="xsl:output">
			<xsl:attribute name="method">
  	     	<xsl:text>xml</xsl:text>
    	</xsl:attribute>
			<xsl:attribute name="encoding">
  	     	<xsl:text>utf-8</xsl:text>
    	</xsl:attribute>
			<xsl:attribute name="indent">
  	     	<xsl:text>yes</xsl:text>
    	</xsl:attribute>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>
