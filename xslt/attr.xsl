<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template name="attr_i">
		<xsl:param name="i"></xsl:param>
    <xsl:if test="@i">
			<xsl:attribute name="id">
   			<xsl:value-of select="$i" />
   			<xsl:value-of select="@i" />
			</xsl:attribute>
    </xsl:if>
	</xsl:template>

	<xsl:template name="attr_xywh">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="width">
	  	<xsl:value-of select="@w" />
		</xsl:attribute>
		<xsl:attribute name="height">
	  	<xsl:value-of select="@h" />
		</xsl:attribute>
		<xsl:call-template name="attr_xy">
			<xsl:with-param name="x">
      	<xsl:value-of select="$x" />
			</xsl:with-param>
			<xsl:with-param name="y">
      	<xsl:value-of select="$y" />
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="attr_xylw">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="width">
	  	<xsl:value-of select="@w" />
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
	</xsl:template>

	<xsl:template name="attr_xys">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="width">
	  	<xsl:value-of select="@s" />
		</xsl:attribute>
		<xsl:attribute name="height">
	  	<xsl:value-of select="@s" />
		</xsl:attribute>
		<xsl:call-template name="attr_xy">
			<xsl:with-param name="x">
      	<xsl:value-of select="$x" />
			</xsl:with-param>
			<xsl:with-param name="y">
      	<xsl:value-of select="$y" />
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="attr_xy">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="x">
     	<xsl:value-of select="@x + $x" />
  	</xsl:attribute>
		<xsl:attribute name="y">
     	<xsl:value-of select="@y + $y" />
  	</xsl:attribute>
	</xsl:template>

	<xsl:template name="attr_b2s">
   	<xsl:choose>
     	<xsl:when test="@b">
				<xsl:attribute name="stroke">
			  	<xsl:value-of select="@b" />
				</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
				<xsl:attribute name="stroke">
			  	<xsl:text>none</xsl:text>
				</xsl:attribute>
      </xsl:otherwise>
   	</xsl:choose>
	</xsl:template>

	<xsl:template name="attr_b2f">
   	<xsl:choose>
     	<xsl:when test="@b">
				<xsl:attribute name="fill">
			  	<xsl:value-of select="@b" />
				</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
				<xsl:attribute name="fill">
			  	<xsl:text>none</xsl:text>
				</xsl:attribute>
      </xsl:otherwise>
   	</xsl:choose>
	</xsl:template>

	<xsl:template name="attr_f2f">
   	<xsl:choose>
     	<xsl:when test="@f">
				<xsl:attribute name="fill">
			  	<xsl:value-of select="@f" />
				</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
				<xsl:attribute name="fill">
			  	<xsl:text>none</xsl:text>
				</xsl:attribute>
      </xsl:otherwise>
   	</xsl:choose>
	</xsl:template>

	<xsl:template name="attr_f2s">
   	<xsl:choose>
     	<xsl:when test="@f">
				<xsl:attribute name="stroke">
			  	<xsl:value-of select="@f" />
				</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
				<xsl:attribute name="stroke">
			  	<xsl:text>none</xsl:text>
				</xsl:attribute>
      </xsl:otherwise>
   	</xsl:choose>
	</xsl:template>

	<xsl:template name="attr_c2f">
   	<xsl:choose>
     	<xsl:when test="@c">
				<xsl:attribute name="fill">
			  	<xsl:value-of select="@c" />
				</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
				<xsl:attribute name="fill">
			  	<xsl:text>none</xsl:text>
				</xsl:attribute>
      </xsl:otherwise>
   	</xsl:choose>
	</xsl:template>

	<xsl:template name="attr_c2s">
		<xsl:choose>
			<xsl:when test="@c">
				<xsl:attribute name="stroke">
		  		<xsl:value-of select="@c" />
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="stroke">
		  		<xsl:text>none</xsl:text>
				</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="attr_rots">
	  <xsl:param name="ang" />
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="transform">
 	 		<xsl:text>rotate(</xsl:text>
  		<xsl:value-of select="$ang" />
 	 		<xsl:text>,</xsl:text>
  		<xsl:value-of select="@x + $x + @s * .5" />
 			<xsl:text>,</xsl:text>
  		<xsl:value-of select="@y + $y + @s * .5" />
 			<xsl:text>)</xsl:text>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="attr_rotwh">
	  <xsl:param name="ang" />
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="transform">
 	 		<xsl:text>rotate(</xsl:text>
  		<xsl:value-of select="$ang" />
 	 		<xsl:text>,</xsl:text>
  		<xsl:value-of select="@x + $x + @w * .5" />
 			<xsl:text>,</xsl:text>
  		<xsl:value-of select="@y + $y + @h * .5" />
 			<xsl:text>)</xsl:text>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="attr_rot90lw">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="transform">
   		<xsl:text>translate(</xsl:text>
	  	<xsl:value-of select="@l" />
   		<xsl:text>,0) rotate(90,</xsl:text>
	  	<xsl:value-of select="@x + $x" />
   		<xsl:text>,</xsl:text>
	  	<xsl:value-of select="@y + $y" />
   		<xsl:text>)</xsl:text>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="attr_rot180lw">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="transform">
   		<xsl:text>translate(</xsl:text>
	  	<xsl:value-of select="@w" />
   		<xsl:text>,</xsl:text>
	  	<xsl:value-of select="@l" />
   		<xsl:text>) rotate(180,</xsl:text>
	  	<xsl:value-of select="@x + $x" />
   		<xsl:text>,</xsl:text>
	  	<xsl:value-of select="@y + $y" />
   		<xsl:text>)</xsl:text>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="attr_rot270lw">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="transform">
   		<xsl:text>translate(0,</xsl:text>
	  	<xsl:value-of select="@w" />
   		<xsl:text>) rotate(270,</xsl:text>
	  	<xsl:value-of select="@x + $x" />
   		<xsl:text>,</xsl:text>
	  	<xsl:value-of select="@y + $y" />
   		<xsl:text>)</xsl:text>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="attr_rot90wh">
		<xsl:param name="x">0</xsl:param>
		<xsl:param name="y">0</xsl:param>
		<xsl:attribute name="transform">
   		<xsl:text>translate(</xsl:text>
	  	<xsl:value-of select="@x + $x - ((@x + $x) * @w div @h) + @w" />
   		<xsl:text>,</xsl:text>
	  	<xsl:value-of select="@y + $y - ((@y + $y) * @h div @w)" />
   		<xsl:text>) scale(</xsl:text>
	  	<xsl:value-of select="@w div @h" />
   		<xsl:text>,</xsl:text>
	  	<xsl:value-of select="@h div @w" />
   		<xsl:text>) rotate(90,</xsl:text>
	  	<xsl:value-of select="@x + $x" />
   		<xsl:text>,</xsl:text>
	  	<xsl:value-of select="@y + $y" />
   		<xsl:text>)</xsl:text>
		</xsl:attribute>
	</xsl:template>

</xsl:stylesheet>