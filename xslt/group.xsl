<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template match="//defs//group">
		<g class="group">
			<xsl:attribute name="id">
   			<xsl:value-of select="@i" />
			</xsl:attribute>
			<xsl:apply-templates mode="stat" />
		</g>
	</xsl:template>

	<xsl:template match="use" mode="stat" >
		<use class="group">
			<xsl:attribute name="xlink:href">
				<xsl:text>#</xsl:text>
   			<xsl:value-of select="@r" />
 	  	</xsl:attribute>
			<xsl:if test="@x">
				<xsl:attribute name="x">
      		<xsl:value-of select="@x" />
 	  		</xsl:attribute>
 	  	</xsl:if>
			<xsl:if test="@y">
				<xsl:attribute name="y">
      		<xsl:value-of select="@y" />
 	  		</xsl:attribute>
 	  	</xsl:if>
 	  	<xsl:choose>
 	  		<xsl:when test="@s">
					<xsl:attribute name="width">
    		  	<xsl:value-of select="@s" />
 	  			</xsl:attribute>
					<xsl:attribute name="height">
    		  	<xsl:value-of select="@s" />
 	  			</xsl:attribute>
 	  		</xsl:when>
 	  		<xsl:otherwise>
					<xsl:if test="@w">
						<xsl:attribute name="width">
  	  		  	<xsl:value-of select="@w" />
 	  				</xsl:attribute>
					</xsl:if>
					<xsl:if test="@h">
						<xsl:attribute name="height">
  	  		  	<xsl:value-of select="@h" />
 	  				</xsl:attribute>
					</xsl:if>
 	  		</xsl:otherwise>
 	  	</xsl:choose>
		</use>
	</xsl:template>

	<xsl:template match="use" mode="dyn0" >
		<xsl:variable name="r">
     	<xsl:value-of select="@r" />
		</xsl:variable>
		<xsl:variable name="i">
     	<xsl:value-of select="@i" />
		</xsl:variable>
		<xsl:variable name="x">
     	<xsl:value-of select="@x" />
		</xsl:variable>
		<xsl:variable name="y">
     	<xsl:value-of select="@y" />
		</xsl:variable>
		<xsl:apply-templates select="//defs//group[@i=$r]/*" mode="dyn0">
			<xsl:with-param name="i">
      	<xsl:value-of select="$i" />
			</xsl:with-param>
			<xsl:with-param name="x">
      	<xsl:value-of select="$x" />
			</xsl:with-param>
			<xsl:with-param name="y">
      	<xsl:value-of select="$y" />
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="use" mode="dyn" >
		<xsl:variable name="r">
     	<xsl:value-of select="@r" />
		</xsl:variable>
		<xsl:variable name="i">
     	<xsl:value-of select="@i" />
		</xsl:variable>
		<xsl:variable name="x">
     	<xsl:value-of select="@x" />
		</xsl:variable>
		<xsl:variable name="y">
     	<xsl:value-of select="@y" />
		</xsl:variable>
		<xsl:apply-templates select="//defs//group[@i=$r]/*" mode="dyn">
			<xsl:with-param name="i">
      	<xsl:value-of select="$i" />
			</xsl:with-param>
			<xsl:with-param name="x">
      	<xsl:value-of select="$x" />
			</xsl:with-param>
			<xsl:with-param name="y">
      	<xsl:value-of select="$y" />
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="use" mode="int" >
		<xsl:variable name="r">
     	<xsl:value-of select="@r" />
		</xsl:variable>
		<xsl:variable name="i">
     	<xsl:value-of select="@i" />
		</xsl:variable>
		<xsl:variable name="x">
     	<xsl:value-of select="@x" />
		</xsl:variable>
		<xsl:variable name="y">
     	<xsl:value-of select="@y" />
		</xsl:variable>
		<xsl:apply-templates select="//defs//group[@i=$r]/*" mode="int">
			<xsl:with-param name="i">
      	<xsl:value-of select="$i" />
			</xsl:with-param>
			<xsl:with-param name="x">
      	<xsl:value-of select="$x" />
			</xsl:with-param>
			<xsl:with-param name="y">
      	<xsl:value-of select="$y" />
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="use" mode="hlp" />

</xsl:stylesheet>

