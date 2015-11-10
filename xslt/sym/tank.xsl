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
  	     	<xsl:text>tank_grd</xsl:text>
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
       	<xsl:text>tank_lv_lg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset="0">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
			<stop offset="1" stop-color="white" />
		</linearGradient>
	</xsl:template>

	<xsl:template name="tank_sym">
		<symbol id="tank" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y=".05" width="1" height=".9" stroke="none" />
			<polygon points="0,.05 1,.05 .5,0" stroke="none" />
			<polygon points="0,.95 1,.95 .5,1" stroke="none" />
		</symbol>
		<symbol id="tank_lv1" viewBox="0 0 1 1" preserveAspectRatio="none">
			<polygon points="0,.05 1,.05 .5,0" stroke="none" />
			<polygon points="0,.95 1,.95 .5,1" stroke="none" />
		</symbol>
		<symbol id="tank_lv2" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y=".05" width=".5" height=".9" stroke="none" />
			<line x1=".995" y1=".05" x2=".995" y2=".95" stroke-width=".01" />
		</symbol>
		<symbol id="tank_lhl" viewBox="0 0 1 1" preserveAspectRatio="none">
			<path stroke="none"
						d="M0,.05 L.5,0 L1,.05 L1,.5 A.7,.7 0 0,0 .5,.5 A.7,.7 0 0,1 0,.5 z"/>
			<line x1=".005" y1=".5" x2=".005" y2=".95" stroke-width=".01" />
			<line x1=".995" y1=".5" x2=".995" y2=".95" stroke-width=".01" />
			<polygon points="0,.95 1,.95 .5,1" stroke="none" />
		</symbol>
		<symbol id="tank_lhr" viewBox="0 0 1 1" preserveAspectRatio="none">
			<path stroke="none"
						d="M0,.95 L.5,1 L1,.95 L1,.5 A.7,.7 0 0,1 .5,.5 A.7,.7 0 0,0 0,.5 z"/>
			<line x1=".005" y1=".5" x2=".005" y2=".05" stroke-width=".01" />
			<line x1=".995" y1=".5" x2=".995" y2=".05" stroke-width=".01" />
			<polygon points="0,.05 1,.05 .5,0" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="tank" mode="stat">
		<use class="tank">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#tank</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#cyl_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xywh" />
			<xsl:if test='@o="h"'>
				<xsl:call-template name="attr_rot90wh" />
			</xsl:if>
		</use>
	</xsl:template>

	<xsl:template match="tank_lv" mode="stat">
		<g class="tank_lv">
			<use>
				<xsl:attribute name="xlink:href">
	       	<xsl:text>#tank_lv1</xsl:text>
	 	  	</xsl:attribute>
				<xsl:attribute name="fill">
	     		<xsl:text>url(#cyl_lg_</xsl:text>
	 		  	<xsl:value-of select="@c" />
	     		<xsl:text>)</xsl:text>
	 			</xsl:attribute>
				<xsl:call-template name="attr_xywh" />
			</use>
			<use>
				<xsl:attribute name="xlink:href">
	       	<xsl:text>#tank_lv2</xsl:text>
	 	  	</xsl:attribute>
				<xsl:attribute name="fill">
	     		<xsl:text>url(#tank_lv_lg_</xsl:text>
	 		  	<xsl:value-of select="@c" />
	     		<xsl:text>)</xsl:text>
	 			</xsl:attribute>
				<xsl:call-template name="attr_xywh" />
				<xsl:call-template name="attr_c2s" />
				<xsl:if test='@o="l"'>
					<xsl:call-template name="attr_rotwh">
						<xsl:with-param name="ang">180</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</use>
		</g>
	</xsl:template>

	<xsl:template match="tank_lh" mode="stat">
		<use class="tank_lh">
			<xsl:attribute name="xlink:href">
				<xsl:choose>
					<xsl:when test='@o="l"'>
		       	<xsl:text>#tank_lhl</xsl:text>
					</xsl:when>
					<xsl:when test='@o="r"'>
		       	<xsl:text>#tank_lhr</xsl:text>
					</xsl:when>
				</xsl:choose>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#cyl_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xywh" />
			<xsl:call-template name="attr_c2s" />
			<xsl:call-template name="attr_rot90wh" />
		</use>
	</xsl:template>

</xsl:stylesheet>
