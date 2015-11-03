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
  	     	<xsl:text>tube_grd</xsl:text>
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
       	<xsl:text>tube_lg_</xsl:text>
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
	</xsl:template>

	<xsl:template name="tube_sym">
		<symbol id="tube" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="tube" mode="stat">
		<use class="tube">
			<xsl:attribute name="xlink:href">
       	<xsl:text>#tube</xsl:text>
 	  	</xsl:attribute>
			<xsl:attribute name="fill">
     		<xsl:text>url(#tube_lg_</xsl:text>
 		  	<xsl:value-of select="@c" />
     		<xsl:text>)</xsl:text>
 			</xsl:attribute>
			<xsl:call-template name="attr_xylw" />
			<xsl:if test='@o="h"'>
				<xsl:call-template name="attr_rot90lw" />
			</xsl:if>
		</use>
	</xsl:template>

	<xsl:template match="//defs//tubes" />
	<xsl:template match="tubes" mode="dyn" />
	<xsl:template match="tubes" mode="int" />
	<xsl:template match="tubes" mode="hlp" />

	<xsl:template match="tubes" mode="stat">
		<xsl:variable name="x" select="@x" />
		<xsl:variable name="y" select="@y" />
		<xsl:variable name="w" select="@w" />
		<xsl:variable name="lg">
   		<xsl:text>url(#tube_lg_</xsl:text>
	  	<xsl:value-of select="@c" />
   		<xsl:text>)</xsl:text>
		</xsl:variable>
		<xsl:variable name="rg">
   		<xsl:text>url(#tube_l_rg_</xsl:text>
	  	<xsl:value-of select="@c" />
   		<xsl:text>)</xsl:text>
		</xsl:variable>
		<g class="tubes">
			<xsl:for-each select="./*">
				<xsl:if test="position()=1">
					<xsl:call-template name="tubes_seg">
						<xsl:with-param name="x"><xsl:value-of select="$x"/></xsl:with-param>
						<xsl:with-param name="y"><xsl:value-of select="$y"/></xsl:with-param>
						<xsl:with-param name="w"><xsl:value-of select="$w"/></xsl:with-param>
						<xsl:with-param name="lg"><xsl:value-of select="$lg"/></xsl:with-param>
						<xsl:with-param name="rg"><xsl:value-of select="$rg"/></xsl:with-param>
						<xsl:with-param name="o"><xsl:value-of select="@o"/></xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</g>
	</xsl:template>

	<xsl:template name="tubes_seg">
		<xsl:param name="x" />
		<xsl:param name="y" />
		<xsl:param name="w" />
		<xsl:param name="lg" />
		<xsl:param name="rg" />
		<xsl:param name="o" />

		<xsl:choose>
			<xsl:when test='$o="r"'>
				<xsl:choose>
					<xsl:when test='@o="t"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
						</use>
					</xsl:when>
					<xsl:when test='@o="b"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="transform">
					 	 		<xsl:text>rotate(270,</xsl:text>
					  		<xsl:value-of select="$x + $w * .5" />
					 			<xsl:text>,</xsl:text>
					  		<xsl:value-of select="$y + $w * .5" />
					 			<xsl:text>)</xsl:text>
							</xsl:attribute>
						</use>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="l"'>
				<xsl:choose>
					<xsl:when test='@o="t"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x - $w" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="transform">
					 	 		<xsl:text>rotate(90,</xsl:text>
					  		<xsl:value-of select="$x - $w * .5" />
					 			<xsl:text>,</xsl:text>
					  		<xsl:value-of select="$y + $w * .5" />
					 			<xsl:text>)</xsl:text>
							</xsl:attribute>
						</use>
					</xsl:when>
					<xsl:when test='@o="b"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x - $w" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="transform">
					 	 		<xsl:text>rotate(180,</xsl:text>
					  		<xsl:value-of select="$x - $w * .5" />
					 			<xsl:text>,</xsl:text>
					  		<xsl:value-of select="$y + $w * .5" />
					 			<xsl:text>)</xsl:text>
							</xsl:attribute>
						</use>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="t"'>
				<xsl:choose>
					<xsl:when test='@o="r"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y - $w" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="transform">
					 	 		<xsl:text>rotate(180,</xsl:text>
					  		<xsl:value-of select="$x + $w * .5" />
					 			<xsl:text>,</xsl:text>
					  		<xsl:value-of select="$y - $w * .5" />
					 			<xsl:text>)</xsl:text>
							</xsl:attribute>
						</use>
					</xsl:when>
					<xsl:when test='@o="l"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y - $w" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="transform">
					 	 		<xsl:text>rotate(270,</xsl:text>
					  		<xsl:value-of select="$x + $w * .5" />
					 			<xsl:text>,</xsl:text>
					  		<xsl:value-of select="$y - $w * .5" />
					 			<xsl:text>)</xsl:text>
							</xsl:attribute>
						</use>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="b"'>
				<xsl:choose>
					<xsl:when test='@o="r"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="transform">
					 	 		<xsl:text>rotate(90,</xsl:text>
					  		<xsl:value-of select="$x + $w * .5" />
					 			<xsl:text>,</xsl:text>
					  		<xsl:value-of select="$y + $w * .5" />
					 			<xsl:text>)</xsl:text>
							</xsl:attribute>
						</use>
					</xsl:when>
					<xsl:when test='@o="l"'>
						<use class="tube_l">
							<xsl:attribute name="xlink:href"><xsl:text>#tube_l</xsl:text></xsl:attribute>
							<xsl:attribute name="fill"><xsl:value-of select="$rg" /></xsl:attribute>
							<xsl:attribute name="x"><xsl:value-of select="$x" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y" /></xsl:attribute>
							<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
							<xsl:attribute name="height"><xsl:value-of select="$w" /></xsl:attribute>
						</use>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>

		<xsl:variable name="x_"><xsl:choose>
			<xsl:when test='$o="r"'><xsl:value-of select="$x" /></xsl:when>
			<xsl:when test='$o="l"'>
				<xsl:choose>
					<xsl:when test='@o="t"'><xsl:value-of select="$x - $w" /></xsl:when>
					<xsl:when test='@o="b"'><xsl:value-of select="$x - $w" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="$x" /></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="t"'>
				<xsl:choose>
					<xsl:when test='@o="r"'><xsl:value-of select="$x + $w" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="$x" /></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="b"'>
				<xsl:choose>
					<xsl:when test='@o="r"'><xsl:value-of select="$x + $w" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="$x" /></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$x" /></xsl:otherwise>
		</xsl:choose></xsl:variable>
		<xsl:variable name="y_"><xsl:choose>
			<xsl:when test='$o="r"'>
				<xsl:choose>
					<xsl:when test='@o="b"'><xsl:value-of select="$y + $w" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="$y" /></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="l"'>
				<xsl:choose>
					<xsl:when test='@o="b"'><xsl:value-of select="$y + $w" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="$y" /></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="t"'>
				<xsl:choose>
					<xsl:when test='@o="l"'><xsl:value-of select="$y - $w" /></xsl:when>
					<xsl:when test='@o="r"'><xsl:value-of select="$y - $w" /></xsl:when>
					<xsl:otherwise><xsl:value-of select="$y" /></xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test='$o="b"'><xsl:value-of select="$y" /></xsl:when>
			<xsl:otherwise><xsl:value-of select="$y" /></xsl:otherwise>
		</xsl:choose></xsl:variable>

		<xsl:choose>
			<xsl:when test='name()="seg"'>
				<use class="tube">
					<xsl:attribute name="xlink:href"><xsl:text>#tube</xsl:text></xsl:attribute>
					<xsl:attribute name="fill"><xsl:value-of select="$lg" /></xsl:attribute>
					<xsl:attribute name="width"><xsl:value-of select="$w" /></xsl:attribute>
					<xsl:attribute name="height"><xsl:value-of select="@l" /></xsl:attribute>
			   	<xsl:choose>
			      <xsl:when test='@o="r"'>
							<xsl:attribute name="x"><xsl:value-of select="$x_" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y_" /></xsl:attribute>
							<xsl:attribute name="transform">
					   		<xsl:text>translate(</xsl:text>
						  	<xsl:value-of select="@l" />
					   		<xsl:text>,0) rotate(90,</xsl:text>
						  	<xsl:value-of select="$x_" />
					   		<xsl:text>,</xsl:text>
						  	<xsl:value-of select="$y_" />
					   		<xsl:text>)</xsl:text>
							</xsl:attribute>
			      </xsl:when>
			      <xsl:when test='@o="l"'>
							<xsl:attribute name="x"><xsl:value-of select="$x_ - @l" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y_" /></xsl:attribute>
							<xsl:attribute name="transform">
					   		<xsl:text>translate(</xsl:text>
						  	<xsl:value-of select="@l" />
					   		<xsl:text>,0) rotate(90,</xsl:text>
						  	<xsl:value-of select="$x_ - @l" />
					   		<xsl:text>,</xsl:text>
						  	<xsl:value-of select="$y_" />
					   		<xsl:text>)</xsl:text>
							</xsl:attribute>
			      </xsl:when>
			      <xsl:when test='@o="t"'>
							<xsl:attribute name="x"><xsl:value-of select="$x_" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y_ - @l" /></xsl:attribute>
			      </xsl:when>
			      <xsl:when test='@o="b"'>
							<xsl:attribute name="x"><xsl:value-of select="$x_" /></xsl:attribute>
							<xsl:attribute name="y"><xsl:value-of select="$y_" /></xsl:attribute>
			      </xsl:when>
			   	</xsl:choose>
				</use>
			</xsl:when>
			<xsl:when test='name()="br"'></xsl:when>
		</xsl:choose>

    <xsl:if test="not (position()=last())">
			<xsl:variable name="dx"><xsl:choose>
	      <xsl:when test='@o="r"'><xsl:value-of select="@l" /></xsl:when>
	      <xsl:when test='@o="l"'><xsl:value-of select="-@l" /></xsl:when>
	      <xsl:otherwise>0</xsl:otherwise>
		  </xsl:choose></xsl:variable>
			<xsl:variable name="dy"><xsl:choose>
	      <xsl:when test='@o="t"'><xsl:value-of select="-@l" /></xsl:when>
	      <xsl:when test='@o="b"'><xsl:value-of select="@l" /></xsl:when>
	      <xsl:otherwise>0</xsl:otherwise>
		  </xsl:choose></xsl:variable>
			<xsl:variable name="o_">
				<xsl:value-of select="@o" />
			</xsl:variable>
			<xsl:for-each select="following-sibling::*">
				<xsl:if test="position()=1">
					<xsl:call-template name="tubes_seg">
						<xsl:with-param name="x"><xsl:value-of select="$x_ + $dx"/></xsl:with-param>
						<xsl:with-param name="y"><xsl:value-of select="$y_ + $dy"/></xsl:with-param>
						<xsl:with-param name="w"><xsl:value-of select="$w"/></xsl:with-param>
						<xsl:with-param name="lg"><xsl:value-of select="$lg"/></xsl:with-param>
						<xsl:with-param name="rg"><xsl:value-of select="$rg"/></xsl:with-param>
						<xsl:with-param name="o"><xsl:value-of select="$o_"/></xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
    </xsl:if>
	</xsl:template>

</xsl:stylesheet>

