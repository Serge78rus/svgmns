<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:template name="tube_t_sym">
		<symbol id="tube_t" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
	    <rect x="0" y="0" width="1" height="1" stroke="none" />
			<polygon points="0,0 .5,.5 1,0" transform="rotate(90, .5, .5)" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="tube_t" mode="stat">
		<use class="tube_t">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#tube_t</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#tube_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xys" />
     	<xsl:choose>
        <xsl:when test='@o="l"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">180</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="b"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">90</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="t"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">270</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
     	</xsl:choose>
		</use>
	</xsl:template>

</xsl:stylesheet>



