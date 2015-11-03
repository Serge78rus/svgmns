<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template match="/symbols">
		<project name="bldsym" default="bldsym" basedir=".">
		<property file="ant.properties"/>
		<target name="bldsym">
			<xsl:for-each select="//symbol[@flt]|//symbol[@grd]">
				<xsl:call-template name="bldsym" />
			</xsl:for-each>
		</target>
		</project>
	</xsl:template>

	<xsl:template name="bldsym">
		<xslt>
			<xsl:attribute name="in">
 	     	<xsl:text>${xslt.src}/colors.xml</xsl:text>
   	  </xsl:attribute>
			<xsl:attribute name="out">
 	     	<xsl:text>${xslt.gen}/</xsl:text>
   	   	<xsl:value-of select="@name" />
 	     	<xsl:text>.xsl</xsl:text>
   	  </xsl:attribute>
			<xsl:attribute name="style">
 	     	<xsl:text>${xslt.sym}/</xsl:text>
   	   	<xsl:value-of select="@name" />
 	     	<xsl:text>.xsl</xsl:text>
   	  </xsl:attribute>
		</xslt>
	</xsl:template>

</xsl:stylesheet>
