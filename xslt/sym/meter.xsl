<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:template name="meter_sym">
		<symbol id="meter" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<line x1=".5" x2=".5" y1=".05" y2=".5" stroke-width=".02" />
			<circle cx=".5" cy=".5" r=".05" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="//defs//meter120" />
	<xsl:template match="meter120" mode="dyn0" />
	<xsl:template match="meter120" mode="stat" />
	<xsl:template match="meter120" mode="int" />
	<xsl:template match="meter120" mode="hlp" />

	<xsl:template match="meter120" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="meter120">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_b2s" />
			<xsl:call-template name="attr_b2f" />
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#scale_r120</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys">
					<xsl:with-param name="x">
  		    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
      			<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
			</use>
			<xsl:variable name="x_" select="@x + $x" />
			<xsl:variable name="y_" select="@y + $y" />
			<xsl:variable name="s_" select="@s" />
			<xsl:for-each select="./mark">
				<xsl:call-template name="scale_r_m">
					<xsl:with-param name="x" select="$x_" />
					<xsl:with-param name="y" select="$y_" />
					<xsl:with-param name="s" select="$s_" />
					<xsl:with-param name="a" select="@v * 1.2 - 60" />
				</xsl:call-template>
			</xsl:for-each>
			<g filter="url(#shadow)">
				<use>
					<xsl:attribute name="xlink:href">
	       		<xsl:text>#meter</xsl:text>
	 	  		</xsl:attribute>
					<xsl:call-template name="attr_xys">
						<xsl:with-param name="x">
	  		    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
	      			<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="attr_f2f" />
					<xsl:call-template name="attr_f2s" />
		   		<xsl:choose>
	   		   	<xsl:when test="@v">
							<xsl:attribute name="transform">
				   			<xsl:text>rotate(</xsl:text>
								<xsl:value-of select="@v * 1.2 - 60" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@x + $x + @s div 2" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@y + $y + @s div 2" />
				   			<xsl:text>)</xsl:text>
							</xsl:attribute>
	 		   		</xsl:when>
	      		<xsl:otherwise>
							<xsl:attribute name="transform">
				   			<xsl:text>rotate(-60,</xsl:text>
								<xsl:value-of select="@x + $x + @s div 2" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@y + $y + @s div 2" />
				   			<xsl:text>)</xsl:text>
							</xsl:attribute>
	     			</xsl:otherwise>
		   		</xsl:choose>
				</use>
			</g>
		</g>
	</xsl:template>

	<xsl:template match="//defs//meter240" />
	<xsl:template match="meter240" mode="dyn0" />
	<xsl:template match="meter240" mode="stat" />
	<xsl:template match="meter240" mode="int" />
	<xsl:template match="meter240" mode="hlp" />

	<xsl:template match="meter240" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="meter240">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_b2s" />
			<xsl:call-template name="attr_b2f" />
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#scale_r240</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys">
					<xsl:with-param name="x">
  		    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
      			<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
			</use>
			<xsl:variable name="x_" select="@x + $x" />
			<xsl:variable name="y_" select="@y + $y" />
			<xsl:variable name="s_" select="@s" />
			<xsl:for-each select="./mark">
				<xsl:call-template name="scale_r_m">
					<xsl:with-param name="x" select="$x_" />
					<xsl:with-param name="y" select="$y_" />
					<xsl:with-param name="s" select="$s_" />
					<xsl:with-param name="a" select="@v * 2.4 - 120" />
				</xsl:call-template>
			</xsl:for-each>
			<g filter="url(#shadow)">
				<use>
					<xsl:attribute name="xlink:href">
	       		<xsl:text>#meter</xsl:text>
	 	  		</xsl:attribute>
					<xsl:call-template name="attr_xys">
						<xsl:with-param name="x">
	  		    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
	      			<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="attr_f2f" />
					<xsl:call-template name="attr_f2s" />
		   		<xsl:choose>
	   		   	<xsl:when test="@v">
							<xsl:attribute name="transform">
				   			<xsl:text>rotate(</xsl:text>
								<xsl:value-of select="@v * 2.4 - 120" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@x + $x + @s div 2" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@y + $y + @s div 2" />
				   			<xsl:text>)</xsl:text>
							</xsl:attribute>
	 		   		</xsl:when>
	      		<xsl:otherwise>
							<xsl:attribute name="transform">
				   			<xsl:text>rotate(-120,</xsl:text>
								<xsl:value-of select="@x + $x + @s div 2" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@y + $y + @s div 2" />
				   			<xsl:text>)</xsl:text>
							</xsl:attribute>
	     			</xsl:otherwise>
		   		</xsl:choose>
				</use>
			</g>
		</g>
	</xsl:template>

	<xsl:template match="//defs//meter360" />
	<xsl:template match="meter360" mode="dyn0" />
	<xsl:template match="meter360" mode="stat" />
	<xsl:template match="meter360" mode="int" />
	<xsl:template match="meter360" mode="hlp" />

	<xsl:template match="meter360" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="meter360">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="attr_b2s" />
			<xsl:call-template name="attr_b2f" />
			<use>
				<xsl:attribute name="xlink:href">
       		<xsl:text>#scale_r360</xsl:text>
 	  		</xsl:attribute>
				<xsl:call-template name="attr_xys">
					<xsl:with-param name="x">
  		    	<xsl:value-of select="$x" />
					</xsl:with-param>
					<xsl:with-param name="y">
      			<xsl:value-of select="$y" />
					</xsl:with-param>
				</xsl:call-template>
			</use>
			<xsl:variable name="x_" select="@x + $x" />
			<xsl:variable name="y_" select="@y + $y" />
			<xsl:variable name="s_" select="@s" />
			<xsl:for-each select="./mark">
				<xsl:call-template name="scale_r_m">
					<xsl:with-param name="x" select="$x_" />
					<xsl:with-param name="y" select="$y_" />
					<xsl:with-param name="s" select="$s_" />
					<xsl:with-param name="a" select="@v * 3.6 - 180" />
				</xsl:call-template>
			</xsl:for-each>
			<g filter="url(#shadow)">
				<use>
					<xsl:attribute name="xlink:href">
	       		<xsl:text>#meter</xsl:text>
	 	  		</xsl:attribute>
					<xsl:call-template name="attr_xys">
						<xsl:with-param name="x">
	  		    	<xsl:value-of select="$x" />
						</xsl:with-param>
						<xsl:with-param name="y">
	      			<xsl:value-of select="$y" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:call-template name="attr_f2f" />
					<xsl:call-template name="attr_f2s" />
		   		<xsl:choose>
	   		   	<xsl:when test="@v">
							<xsl:attribute name="transform">
				   			<xsl:text>rotate(</xsl:text>
								<xsl:value-of select="@v * 3.6 - 180" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@x + $x + @s div 2" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@y + $y + @s div 2" />
				   			<xsl:text>)</xsl:text>
							</xsl:attribute>
	 		   		</xsl:when>
	      		<xsl:otherwise>
							<xsl:attribute name="transform">
				   			<xsl:text>rotate(-180,</xsl:text>
								<xsl:value-of select="@x + $x + @s div 2" />
				   			<xsl:text>,</xsl:text>
								<xsl:value-of select="@y + $y + @s div 2" />
				   			<xsl:text>)</xsl:text>
							</xsl:attribute>
	     			</xsl:otherwise>
		   		</xsl:choose>
				</use>
			</g>
		</g>
	</xsl:template>

</xsl:stylesheet>

