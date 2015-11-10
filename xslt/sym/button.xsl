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
  	     	<xsl:text>button_grd</xsl:text>
    	  </xsl:attribute>
				<xsl:for-each select="//color">
					<xsl:call-template name="make_grd" />
				</xsl:for-each>
	    </xsl:element>
    </xsl:element>
	</xsl:template>

	<xsl:template name="make_grd">
		<linearGradient x1="0" y1="0" x2="1" y2="1">
			<xsl:attribute name="id">
       	<xsl:text>button_lg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset=".45" stop-color="rgba(255,255,255,.5)" />
			<stop offset=".5">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
			<stop offset=".55" stop-color="rgba(0,0,0,.5)" />
		</linearGradient>
		<linearGradient x1="0" y1="0" x2="1" y2="1">
			<xsl:attribute name="id">
       	<xsl:text>button_press_lg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset=".45" stop-color="rgba(0,0,0,.5)" />
			<stop offset=".5">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
			<stop offset=".55" stop-color="rgba(255,255,255,.5)" />
		</linearGradient>
	</xsl:template>

	<xsl:template name="button_sym">
		<symbol id="button" viewBox="0 0 1 1" preserveAspectRatio="none">
	    <rect x="0" y="0" width="1" height="1" rx=".12" ry=".12" stroke="none" />
	    <rect x="0.02" y="0.02" width=".96" height=".96" rx=".1" ry=".1" stroke-width=".04" fill="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="button" mode="int">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="button">
			<xsl:attribute name="onclick">
     		<xsl:text>buttonclick('</xsl:text>
	  		<xsl:value-of select="$i" />
	  		<xsl:value-of select="@i" />
     		<xsl:text>');</xsl:text>
  		</xsl:attribute>
			<xsl:attribute name="onmousedown">
     		<xsl:text>btnpress(this);</xsl:text>
  		</xsl:attribute>
			<xsl:attribute name="onmouseup">
     		<xsl:text>btnrelease(this);</xsl:text>
  		</xsl:attribute>
			<xsl:attribute name="onmouseout">
     		<xsl:text>btnrelease(this);</xsl:text>
  		</xsl:attribute>
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use class="button">
				<xsl:attribute name="xlink:href">
       		<xsl:text>#button</xsl:text>
 	  		</xsl:attribute>
				<xsl:attribute name="stroke">
     			<xsl:text>url(#button_lg_</xsl:text>
 		  		<xsl:value-of select="@b" />
     			<xsl:text>)</xsl:text>
 				</xsl:attribute>
				<xsl:call-template name="attr_xywh">
					<xsl:with-param name="x">
  		    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
      			<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="attr_b2f" />
			</use>
			<text text-anchor="middle">
				<xsl:attribute name="font-size">
 		  		<xsl:value-of select="@h * 0.7" />
 				</xsl:attribute>
				<xsl:attribute name="x">
 	    		<xsl:value-of select="@x + $x + @w * .5" />
  			</xsl:attribute>
				<xsl:attribute name="y">
     			<xsl:value-of select="@y + $y + @h * .7" />
  			</xsl:attribute>
				<xsl:call-template name="attr_f2f" />
  			<xsl:value-of select="@t" />
			</text>
		</g>
	</xsl:template>

</xsl:stylesheet>
