<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="gauge_sym">
		<symbol id="gauge" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="//defs//gauge" />
	<xsl:template match="gauge" mode="dyn0" />
	<xsl:template match="gauge" mode="stat" />
	<xsl:template match="gauge" mode="int" />
	<xsl:template match="gauge" mode="hlp" />

	<xsl:template match="gauge" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:variable name="scal" select="count(mark)>0" />
		<g class="gauge">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#gauge</xsl:text>
 	  		</xsl:attribute>
				<xsl:attribute name="fill">
     			<xsl:text>url(#tube_lg_</xsl:text>
 		  		<xsl:value-of select="@b" />
     			<xsl:text>)</xsl:text>
 				</xsl:attribute>
				<xsl:attribute name="height">
	  			<xsl:value-of select="@l" />
				</xsl:attribute>
				<xsl:call-template name="attr_xy">
					<xsl:with-param name="x">
  		    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
      			<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
		   	<xsl:choose>
		     	<xsl:when test="$scal">
						<xsl:attribute name="width">
	  					<xsl:value-of select="@w * .7" />
						</xsl:attribute>
      		</xsl:when>
      		<xsl:otherwise>
						<xsl:attribute name="width">
	  					<xsl:value-of select="@w" />
						</xsl:attribute>
     			</xsl:otherwise>
   			</xsl:choose>
				<xsl:if test='@o="h"'>
					<xsl:call-template name="attr_rot90lw" />
						<xsl:with-param name="x">
  			    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
      				<xsl:value-of select="$y" />
						</xsl:with-param>
				</xsl:if>
			</use>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#gauge</xsl:text>
 	  		</xsl:attribute>
				<xsl:attribute name="fill">
     			<xsl:text>url(#tube_lg_</xsl:text>
 		  		<xsl:value-of select="@f" />
     			<xsl:text>)</xsl:text>
 				</xsl:attribute>
				<xsl:attribute name="x">
 		  		<xsl:value-of select="@x + $x" />
 				</xsl:attribute>
		   	<xsl:choose>
		     	<xsl:when test="@v">
						<xsl:attribute name="y">
 				  		<xsl:value-of select="@y + $y + @l - @v div 100 * @l" />
 						</xsl:attribute>
						<xsl:attribute name="height">
 		  				<xsl:value-of select="@v div 100 * @l" />
 						</xsl:attribute>
      		</xsl:when>
      		<xsl:otherwise>
						<xsl:attribute name="y">
 				  		<xsl:value-of select="@y + $y + @l" />
 						</xsl:attribute>
						<xsl:attribute name="height">
			  			<xsl:text>0</xsl:text>
						</xsl:attribute>
      		</xsl:otherwise>
   			</xsl:choose>
		   	<xsl:choose>
		     	<xsl:when test="$scal">
						<xsl:attribute name="width">
	  					<xsl:value-of select="@w * .7" />
						</xsl:attribute>
      		</xsl:when>
      		<xsl:otherwise>
						<xsl:attribute name="width">
	  					<xsl:value-of select="@w" />
						</xsl:attribute>
     			</xsl:otherwise>
   			</xsl:choose>
				<xsl:if test='@o="h"'>
					<xsl:call-template name="attr_rot90lw" />
				</xsl:if>
			</use>
			<xsl:if test="$scal">
				<xsl:variable name="l_" select="@l" />
				<xsl:variable name="w_" select="@w * .2" />
				<g fill="black" stroke="black">
					<use>
						<xsl:attribute name="xlink:href">
       				<xsl:text>#scale_l</xsl:text>
 	  				</xsl:attribute>
						<xsl:attribute name="height">
	  					<xsl:value-of select="$l_" />
						</xsl:attribute>
						<xsl:attribute name="width">
	  					<xsl:value-of select="$w_" />
						</xsl:attribute>
						<xsl:attribute name="x">
	  					<xsl:value-of select="@x + $x + @w * .8" />
						</xsl:attribute>
						<xsl:attribute name="y">
	  					<xsl:value-of select="@y + $y" />
						</xsl:attribute>
						<xsl:if test='@o="h"'>
							<xsl:call-template name="attr_rot90lw" />
						</xsl:if>
					</use>
		   		<xsl:choose>
    		   	<xsl:when test='@o="v"'>
							<xsl:variable name="x_" select="@x + $x + @w * .8" />
							<xsl:variable name="y_" select="@y + $y" />
							<xsl:for-each select="./mark">
								<xsl:call-template name="scale_l_vm">
									<xsl:with-param name="x" select="$x_" />
									<xsl:with-param name="y" select="$y_" />
									<xsl:with-param name="l" select="$l_" />
									<xsl:with-param name="w" select="$w_" />
								</xsl:call-template>
							</xsl:for-each>
      			</xsl:when>
       			<xsl:when test='@o="h"'>
							<xsl:variable name="x_" select="@x + $x" />
							<xsl:variable name="y_" select="@y + $y + @w * .8" />
							<xsl:for-each select="./mark">
								<xsl:call-template name="scale_l_hm">
									<xsl:with-param name="x" select="$x_" />
									<xsl:with-param name="y" select="$y_" />
									<xsl:with-param name="l" select="$l_" />
									<xsl:with-param name="w" select="$w_" />
								</xsl:call-template>
							</xsl:for-each>
      			</xsl:when>
					</xsl:choose>
				</g>
			</xsl:if>
		</g>
	</xsl:template>

</xsl:stylesheet>

