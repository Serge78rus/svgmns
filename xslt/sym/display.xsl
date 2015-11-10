<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="../xsl.xsl" />
	<xsl:import href="../attr.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="display_sym">
		<symbol id="display" viewBox="0 0 1 1" preserveAspectRatio="none">
			<rect x="0" y="0" width="1" height="1" stroke="none" />
		</symbol>
	</xsl:template>

	<xsl:template match="display" mode="dyn">
		<xsl:param name="i"></xsl:param>
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<g class="display" filter="url(#shadow)">
			<xsl:call-template name="attr_i">
				<xsl:with-param name="i">
  	    	<xsl:value-of select="$i" />
				</xsl:with-param>
			</xsl:call-template>
			<use>
				<xsl:attribute name="xlink:href">
	       	<xsl:text>#display</xsl:text>
	 	  	</xsl:attribute>
				<xsl:attribute name="x">
    		 	<xsl:value-of select="@x + $x + @s" />
  			</xsl:attribute>
				<xsl:attribute name="y">
     			<xsl:value-of select="@y + $y + @s" />
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
	     		<xsl:text>url(#tube_lg_black)</xsl:text>
	 			</xsl:attribute>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + $x" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y + @s" />
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
	 			  	<xsl:value-of select="@x + $x + @w - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y + @s" />
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
	 			  	<xsl:value-of select="@x + $x + @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y" />
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
				  	<xsl:value-of select="@x + $x + @s" />
			   		<xsl:text>,</xsl:text>
				  	<xsl:value-of select="@y + $y" />
			   		<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + $x + @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y + @h - @s" />
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
				  	<xsl:value-of select="@x + $x + @s" />
			   		<xsl:text>,</xsl:text>
				  	<xsl:value-of select="@y + $y + @h - @s" />
			   		<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
			</g>
			<g>
				<xsl:attribute name="fill">
	     		<xsl:text>url(#tube_l_rg_black)</xsl:text>
 				</xsl:attribute>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + $x" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			 	 		<xsl:text>rotate(180,</xsl:text>
			  		<xsl:value-of select="@x + $x + @s * .5" />
			 			<xsl:text>,</xsl:text>
			  		<xsl:value-of select="@y + $y + @s * .5" />
			 			<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + $x" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y + @h - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			 	 		<xsl:text>rotate(90,</xsl:text>
			  		<xsl:value-of select="@x + $x + @s * .5" />
			 			<xsl:text>,</xsl:text>
			  		<xsl:value-of select="@y + $y + @h - @s * .5" />
			 			<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + $x + @w - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="transform">
			 	 		<xsl:text>rotate(270,</xsl:text>
			  		<xsl:value-of select="@x + $x + @w - @s * .5" />
			 			<xsl:text>,</xsl:text>
			  		<xsl:value-of select="@y + $y + @s * .5" />
			 			<xsl:text>)</xsl:text>
					</xsl:attribute>
				</use>
				<use>
					<xsl:attribute name="xlink:href">
		       	<xsl:text>#tube_l</xsl:text>
	 		  	</xsl:attribute>
					<xsl:attribute name="x">
	 			  	<xsl:value-of select="@x + $x + @w - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="y">
	 			  	<xsl:value-of select="@y + $y + @h - @s" />
	 				</xsl:attribute>
					<xsl:attribute name="width">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
					<xsl:attribute name="height">
	 			  	<xsl:value-of select="@s" />
	 				</xsl:attribute>
				</use>
			</g>
			<text text-anchor="middle">
				<xsl:attribute name="font-size">
 		  		<xsl:value-of select="(@h - 2 * @s) * .8" />
 				</xsl:attribute>
				<xsl:attribute name="x">
 	    		<xsl:value-of select="@x + $x + @w * .5" />
  			</xsl:attribute>
				<xsl:attribute name="y">
     			<xsl:value-of select="@y + $y + @s + @h * .55" />
  			</xsl:attribute>
				<xsl:call-template name="attr_f2f" />
  			<xsl:value-of select="@t" />
			</text>
		</g>
	</xsl:template>

</xsl:stylesheet>
