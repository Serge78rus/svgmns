<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="pump_sym">
		<symbol id="pump" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
	    <rect x=".25" y=".25" width=".5" height=".5" fill="none" stroke-width=".5" />
			<circle cx=".5" cy=".5" r=".4" stroke="black" stroke-width=".05"/>
			<polygon points=".4,.7 .6,.7 .5,.85" fill="black" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="pump" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<use class="pump">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#pump</xsl:text>
 	  	</xsl:attribute>
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_xys">
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_b2s" />
			<xsl:call-template name="attr_f2f" />
     	<xsl:choose>
        <xsl:when test='@o="l"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">90</xsl:with-param>
						<xsl:with-param name="x">
		  	    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
		      		<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="r"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">270</xsl:with-param>
						<xsl:with-param name="x">
		  	    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
		      		<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="t"'>
					<xsl:call-template name="attr_rots">
						<xsl:with-param name="ang">180</xsl:with-param>
						<xsl:with-param name="x">
		  	    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
		      		<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
     	</xsl:choose>
		</use>
	</xsl:template>

</xsl:stylesheet>

