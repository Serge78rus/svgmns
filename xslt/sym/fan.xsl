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
  	     	<xsl:text>fan_grd</xsl:text>
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
       	<xsl:text>fan_lg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset="0" stop-color="white" />
			<stop offset="1">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
		</linearGradient>
	</xsl:template>

	<xsl:template name="fan_sym">
		<symbol id="fan_b" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<rect x=".25" y=".25" width=".5" height=".5" fill="none" stroke-width=".5" />
			<circle cx=".5" cy=".5" r=".2" stroke="none" />
		</symbol>
		<symbol id="fan_f" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<path stroke="none" d="
					M.4,.32
					a.3,.3 0 0,1 .2,.08
					L.7,.1
					a.4,.4 0 0,0 -.4,0
					z" />
			<path stroke="none" transform="rotate(72,.5,.5)" d="
					M.4,.32
					a.3,.3 0 0,1 .2,.08
					L.7,.1
					a.4,.4 0 0,0 -.4,0
					z" />
			<path stroke="none" transform="rotate(144,.5,.5)" d="
					M.4,.32
					a.3,.3 0 0,1 .2,.08
					L.7,.1
					a.4,.4 0 0,0 -.4,0
					z" />
			<path stroke="none" transform="rotate(216,.5,.5)" d="
					M.4,.32
					a.3,.3 0 0,1 .2,.08
					L.7,.1
					a.4,.4 0 0,0 -.4,0
					z" />
			<path stroke="none" transform="rotate(288,.5,.5)" d="
					M.4,.32
					a.3,.3 0 0,1 .2,.08
					L.7,.1
					a.4,.4 0 0,0 -.4,0
					z" />
		</symbol>
	</xsl:template>

	<xsl:template match="fan" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="fan">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#fan_b</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys">
					<xsl:with-param name="x">
	  	    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
	      		<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="attr_b2s" />
	     	<xsl:choose>
  	    	<xsl:when test="@f">
						<xsl:attribute name="fill">
		  	   		<xsl:text>url(#ball_rg_</xsl:text>
 					  	<xsl:value-of select="@f" />
     					<xsl:text>)</xsl:text>
 						</xsl:attribute>
        	</xsl:when>
        	<xsl:otherwise>
						<xsl:attribute name="fill">
 				  		<xsl:text>none</xsl:text>
 						</xsl:attribute>
        	</xsl:otherwise>
     		</xsl:choose>
			</use>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#fan_f</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys">
					<xsl:with-param name="x">
	  	    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
	      		<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
	     	<xsl:choose>
  	    	<xsl:when test="@f">
						<xsl:attribute name="fill">
		  	   		<xsl:text>url(#fan_lg_</xsl:text>
 					  	<xsl:value-of select="@f" />
     					<xsl:text>)</xsl:text>
 						</xsl:attribute>
        	</xsl:when>
        	<xsl:otherwise>
						<xsl:attribute name="fill">
 				  		<xsl:text>none</xsl:text>
 						</xsl:attribute>
        	</xsl:otherwise>
     		</xsl:choose>
			</use>
		</g>
	</xsl:template>

</xsl:stylesheet>

