<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="arrow_sym">
		<symbol id="arrow" viewBox="0 0 1 1" preserveAspectRatio="none">
	    <rect x=".25" y=".25" width=".5" height=".5" fill="none" stroke-width=".5" />
			<path stroke="none" stroke-width="0"
						d="M.4,.05 l0,.65 l-.3,0 l.4,.25 l.4,-.25 l-.3,0 l0,-.65 z" />
		</symbol>
	</xsl:template>

	<xsl:template match="arrow" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<use class="arrow">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#arrow</xsl:text>
 	  	</xsl:attribute>
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_xylw">
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
					<xsl:call-template name="attr_rot90lw">
						<xsl:with-param name="x">
		  	    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
		      		<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="r"'>
					<xsl:call-template name="attr_rot270lw">
						<xsl:with-param name="x">
		  	    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
		      		<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
        </xsl:when>
        <xsl:when test='@o="t"'>
					<xsl:call-template name="attr_rot180lw">
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

