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
  	     	<xsl:text>switch_grd</xsl:text>
    	  </xsl:attribute>
				<xsl:call-template name="make_grd" />
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template name="make_grd">
		<radialGradient id="switch_rg" cx=".5" cy=".5" r="1" fx=".12" fy=".12">
      <stop offset="0" stop-color="white"/>
      <stop offset=".7" stop-color="#202020"/>
		</radialGradient>
	</xsl:template>

	<xsl:template name="switch_sym">
		<symbol id="switch_b" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<rect x=".25" y=".25" width=".5" height=".5" fill="none" stroke-width=".5" />
			<circle cx=".5" cy=".5" r=".2" fill="black" stroke="url(#switch_rg)" stroke-width=".05" />
		</symbol>
		<symbol id="switch_f" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<polygon points=".46,.2 .4,.8 .6,.8 .54,.2" fill="black" stroke="gray" stroke-width=".01" />
			<polygon points=".5,.22 .48,.28 .52,.28" fill="white" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="switch2" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="switch2">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#switch_b</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys">
					<xsl:with-param name="x">
	  	    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
	      		<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="attr_c2s" />
			</use>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#switch_f</xsl:text>
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
        	<xsl:when test='@v="1"'>
						<xsl:call-template name="attr_rots">
							<xsl:with-param name="ang">-45</xsl:with-param>
							<xsl:with-param name="x">
			  	    	<xsl:value-of select="$x" />
							</xsl:with-param>
							<xsl:with-param name="y">
			      		<xsl:value-of select="$y" />
							</xsl:with-param>
						</xsl:call-template>
        	</xsl:when>
        	<xsl:when test='@v="2"'>
						<xsl:call-template name="attr_rots">
							<xsl:with-param name="ang">45</xsl:with-param>
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
			<xsl:call-template name="switch_txt">
				<xsl:with-param name="txt">
	  			<xsl:value-of select="@t1" />
				</xsl:with-param>
				<xsl:with-param name="ang">
   				<xsl:text>-45</xsl:text>
				</xsl:with-param>
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="switch_txt">
				<xsl:with-param name="txt">
	  			<xsl:value-of select="@t2" />
				</xsl:with-param>
				<xsl:with-param name="ang">
   				<xsl:text>45</xsl:text>
				</xsl:with-param>
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
		</g>
	</xsl:template>

	<xsl:template match="switch3" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="switch3">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#switch_b</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys">
					<xsl:with-param name="x">
	  	    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
	      		<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="attr_c2s" />
			</use>
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#switch_f</xsl:text>
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
        	<xsl:when test='@v="1"'>
						<xsl:call-template name="attr_rots">
							<xsl:with-param name="ang">-60</xsl:with-param>
							<xsl:with-param name="x">
			  	    	<xsl:value-of select="$x" />
							</xsl:with-param>
							<xsl:with-param name="y">
			      		<xsl:value-of select="$y" />
							</xsl:with-param>
						</xsl:call-template>
        	</xsl:when>
        	<xsl:when test='@v="3"'>
						<xsl:call-template name="attr_rots">
							<xsl:with-param name="ang">60</xsl:with-param>
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
			<xsl:call-template name="switch_txt">
				<xsl:with-param name="txt">
	  			<xsl:value-of select="@t1" />
				</xsl:with-param>
				<xsl:with-param name="ang">
   				<xsl:text>-65</xsl:text>
				</xsl:with-param>
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="switch_txt">
				<xsl:with-param name="txt">
	  			<xsl:value-of select="@t2" />
				</xsl:with-param>
				<xsl:with-param name="ang">
   				<xsl:text>0</xsl:text>
				</xsl:with-param>
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="switch_txt">
				<xsl:with-param name="txt">
	  			<xsl:value-of select="@t3" />
				</xsl:with-param>
				<xsl:with-param name="ang">
   				<xsl:text>60</xsl:text>
				</xsl:with-param>
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
		</g>
	</xsl:template>

	<xsl:template name="switch_txt">
	  <xsl:param name="txt" />
	  <xsl:param name="ang" />
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<text text-anchor="middle" fill="black" stroke="none">
			<xsl:attribute name="font-size">
	  		<xsl:value-of select="@s * .12" />
			</xsl:attribute>
			<xsl:attribute name="x">
  	 		<xsl:value-of select="@x + $x + @s * .5" />
			</xsl:attribute>
			<xsl:attribute name="y">
     		<xsl:value-of select="@y + $y + @s * .15" />
  		</xsl:attribute>
			<xsl:call-template name="attr_rots">
				<xsl:with-param name="ang"><xsl:value-of select="$ang" /></xsl:with-param>
				<xsl:with-param name="x">
  	    	<xsl:value-of select="$x" />
				</xsl:with-param>
				<xsl:with-param name="y">
      		<xsl:value-of select="$y" />
				</xsl:with-param>
			</xsl:call-template>
  		<xsl:value-of select="$txt" />
		</text>
	</xsl:template>

</xsl:stylesheet>


