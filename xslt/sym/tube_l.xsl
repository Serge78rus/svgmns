<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template match="/colors">
    <xsl:element name="xsl:stylesheet">
			<xsl:call-template name="xsl_attr" />
			<xsl:call-template name="xsl_output" />
    	<xsl:element name="xsl:template">
				<xsl:attribute name="name">
  	     	<xsl:text>tube_l_grd</xsl:text>
    	  </xsl:attribute>
				<xsl:for-each select="//color">
					<xsl:call-template name="make_grd" />
				</xsl:for-each>
	    </xsl:element>
    </xsl:element>
	</xsl:template>

	<xsl:template name="make_grd">
		<radialGradient cx="0" cy="0" r="1">
			<xsl:attribute name="id">
       	<xsl:text>tube_l_rg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset="0">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
			<stop offset=".5" stop-color="white" />
			<stop offset="1">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
		</radialGradient>
	</xsl:template>

	<xsl:template name="tube_l_sym">
		<symbol id="tube_l" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<path d="M0,0 L1,0 A1,1 0 0,1 0,1 z" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="tube_l" mode="stat">
		<use class="tube_l">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#tube_l</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#tube_l_rg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xys" />
     	<xsl:choose>
        <xsl:when test='@o="lb"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">270</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="rt"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">90</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="rb"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">180</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
     	</xsl:choose>
		</use>
	</xsl:template>

</xsl:stylesheet>


