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
  	     	<xsl:text>border_grd</xsl:text>
    	  </xsl:attribute>
				<xsl:for-each select="//color">
					<xsl:call-template name="make_grd" />
				</xsl:for-each>
	    </xsl:element>
    </xsl:element>
	</xsl:template>

	<xsl:template name="make_grd">
		<radialGradient cx=".5" cy=".5" r="1">
			<xsl:attribute name="id">
       	<xsl:text>border_rg_</xsl:text>
       	<xsl:value-of	select="@name" />
      </xsl:attribute>
			<stop offset=".45">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
			<stop offset=".475" stop-color="white" />
			<stop offset=".5">
				<xsl:attribute name="stop-color">
    	   	<xsl:value-of select="@name" />
      	</xsl:attribute>
			</stop>
		</radialGradient>
	</xsl:template>

	<xsl:template name="border_sym">
		<symbol id="border" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" stroke="none" />
		</symbol>
		<symbol id="border_c_f" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<circle cx=".5" cy=".5" r=".5" stroke="none" />
		</symbol>
		<symbol id="border_c_b" viewBox="0 0 1 1" preserveAspectRatio="xMidYMid meet">
			<circle cx=".5" cy=".5" r=".45" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="border" mode="stat">
		<g class="border" filter="url(#shadow)">
			<use>
				<xsl:attribute name="xlink:href">
	       	<xsl:text>#border</xsl:text>
	 	  	</xsl:attribute>
				<xsl:attribute name="x">
    		 	<xsl:value-of select="@x + @s" />
  			</xsl:attribute>
				<xsl:attribute name="y">
     			<xsl:value-of select="@y + @s" />
  			</xsl:attribute>
				<xsl:attribute name="width">
	  			<xsl:value-of select="@w - 2 * @s" />
				</xsl:attribute>
				<xsl:attribute name="height">
	  			<xsl:value-of select="@h - 2 * @s" />
				</xsl:attribute>
				<xsl:call-template name="attr_b2f" />
			</use>
			<g>
				<xsl:attribute name="fill">
	     		<xsl:text>url(#tube_lg_</xsl:text>
	 		  	<xsl:value-of select="@f" />
	     		<xsl:text>)</xsl:text>
	 			</xsl:attribute>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + @s" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@h - 2 * @s" />
	 				</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + @w - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + @s" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@h - 2 * @s" />
	 				</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@w - 2 * @s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			   		<xsl:text>translate(</xsl:text>
				  	<xsl:value-of select="@w - 2 * @s" />
			   		<xsl:text>,0) rotate(90,</xsl:text>
				  	<xsl:value-of select="@x + @s" />
			   		<xsl:text>,</xsl:text>
				  	<xsl:value-of select="@y" />
			   		<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + @h - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@w - 2 * @s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			   		<xsl:text>translate(</xsl:text>
				  	<xsl:value-of select="@w - 2 * @s" />
			   		<xsl:text>,0) rotate(90,</xsl:text>
				  	<xsl:value-of select="@x + @s" />
			   		<xsl:text>,</xsl:text>
				  	<xsl:value-of select="@y + @h - @s" />
			   		<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
			</g>
			<g>
				<xsl:attribute name="fill">
  	   		<xsl:text>url(#tube_l_rg_</xsl:text>
 			  	<xsl:value-of select="@f" />
     			<xsl:text>)</xsl:text>
 				</xsl:attribute>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			 	 		<xsl:text>rotate(180,</xsl:text>
			  		<xsl:value-of select="@x + @s * .5" />
			 			<xsl:text>,</xsl:text>
			  		<xsl:value-of select="@y + @s * .5" />
			 			<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + @h - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			 	 		<xsl:text>rotate(90,</xsl:text>
			  		<xsl:value-of select="@x + @s * .5" />
			 			<xsl:text>,</xsl:text>
			  		<xsl:value-of select="@y + @h - @s * .5" />
			 			<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + @w - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			 	 		<xsl:text>rotate(270,</xsl:text>
			  		<xsl:value-of select="@x + @w - @s * .5" />
			 			<xsl:text>,</xsl:text>
			  		<xsl:value-of select="@y + @s * .5" />
			 			<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + @w - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + @h - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
				</use>
			</g>
		</g>
	</xsl:template>

	<xsl:template match="//border_c" mode="stat">
		<g class="border_c" filter="url(#shadow)">
			<use>
				<xsl:attribute name="xlink:href">
	       	<xsl:text>#border_c_f</xsl:text>
	 	  	</xsl:attribute>
				<xsl:attribute name="fill">
	     		<xsl:text>url(#border_rg_</xsl:text>
	 		  	<xsl:value-of select="@f" />
	     		<xsl:text>)</xsl:text>
	 			</xsl:attribute>
				<xsl:call-template name="attr_xys" />
			</use>
			<use>
				<xsl:attribute name="xlink:href">
	       	<xsl:text>#border_c_b</xsl:text>
	 	  	</xsl:attribute>
				<xsl:call-template name="attr_xys" />
				<xsl:call-template name="attr_b2f" />
			</use>
		</g>
	</xsl:template>

</xsl:stylesheet>
