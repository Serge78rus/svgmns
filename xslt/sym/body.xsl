<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:template match="/colors">
    <xsl:element name="xsl:stylesheet">
			<xsl:call-template name="xsl_attr" />
			<xsl:call-template name="xsl_output" />
    	<xsl:element name="xsl:template">
				<xsl:attribute name="name">
  	     	<xsl:text>body_grd</xsl:text>
    	  </xsl:attribute>
				<xsl:for-each select="//color">
					<xsl:call-template name="make_grd" />
				</xsl:for-each>
	    </xsl:element>
    </xsl:element>
	</xsl:template>

	<xsl:template name="make_grd">
		<linearGradient>
			<xsl:attribute name="id">
       	<xsl:text>cyl_lg_</xsl:text>
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
		</linearGradient>
		<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3">
			<xsl:attribute name="id">
       	<xsl:text>ball_rg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset="0" stop-color="white" />
			<stop offset=".5">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
		</radialGradient>
		<radialGradient cx=".5" cy=".5" r=".5">
			<xsl:attribute name="id">
       	<xsl:text>tor_rg_</xsl:text>
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

	<xsl:template name="body_sym">
		<symbol id="cyl" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" stroke="none" />
		</symbol>
		<symbol id="cone" viewBox="0 0 1 1" preserveAspectRatio="none">
			<polygon points="0,1 .5,0 1,1" stroke="none" />
		</symbol>
		<symbol id="ball" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<circle cx=".5" cy=".5" r=".5" stroke="none" />
		</symbol>
		<symbol id="tor" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<circle cx=".5" cy=".5" r=".5" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="cyl" mode="stat">
		<use class="cyl">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#cyl</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#cyl_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xylw" />
			<xsl:if test='@o="h"'>
				<xsl:call-template name="attr_rot90lw" />
			</xsl:if>
		</use>
	</xsl:template>

	<xsl:template match="cone" mode="stat">
		<use class="cone">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#cone</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#cyl_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xylw" />
     	<xsl:choose>
        <xsl:when test='@o="l"'>
					<xsl:call-template name="attr_rot270lw" />
        </xsl:when>
        <xsl:when test='@o="r"'>
					<xsl:call-template name="attr_rot90lw" />
        </xsl:when>
        <xsl:when test='@o="b"'>
					<xsl:call-template name="attr_rot180lw" />
        </xsl:when>
     	</xsl:choose>
		</use>
	</xsl:template>

	<xsl:template match="ball" mode="stat">
		<use class="ball">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#ball</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#ball_rg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xys" />
		</use>
	</xsl:template>

	<xsl:template match="tor" mode="stat">
		<use class="tor">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#tor</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#tor_rg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xys" />
		</use>
	</xsl:template>

</xsl:stylesheet>

