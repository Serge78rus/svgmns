<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:output
  media-type="text/html" method="html" encoding="utf-8" indent="yes"
  omit-xml-declaration="yes"
/>

<xsl:template match="/root">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html>
	</xsl:text>
	<html>
		<head>
			<meta charset="UTF-8" />
			<link rel="stylesheet" type="text/css" href="menu.css" />
			<script type="text/javascript" src="menu.js"></script>
			<title>Меню выбора мнемосхем</title>
		</head>
		<body>
			<xsl:comment>begin menu</xsl:comment>
			<div onclick="tree_toggle(arguments[0])">
				<div>
				  <xsl:value-of select="@label" />
				</div>
				<ul class="Container">
  				<xsl:apply-templates />
				</ul>
  		</div>
			<xsl:comment>end menu</xsl:comment>
  	</body>
  </html>
</xsl:template>

<xsl:template match="//tree">
  <li>
   	<xsl:choose>
 		  <xsl:when test="name(..)='root'">
				<xsl:attribute name="class">
					<xsl:text>Node IsRoot ExpandClosed</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="class">
					<xsl:text>Node ExpandClosed</xsl:text>
				</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
    <div class="Expand"></div>
    <div class="Content">
      <xsl:if test="@img">
				<img align="left">
					<xsl:attribute name="src">
					  <xsl:value-of select="@img" />
					</xsl:attribute>
				</img>
			</xsl:if>
		  <xsl:value-of select="@label" />
		</div>
    <ul class="Container">
			<xsl:apply-templates />
		</ul>
	</li>
</xsl:template>

<xsl:template match="//item">
  <li>
   	<xsl:choose>
 		  <xsl:when test="name(..)='root'">
				<xsl:attribute name="class">
					<xsl:text>Node IsRoot ExpandLeaf</xsl:text>
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="class">
					<xsl:text>Node ExpandLeaf</xsl:text>
				</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
    <div class="Expand"></div>
    <div class="Content">
      <xsl:if test="@img">
				<img align="left">
					<xsl:attribute name="src">
					  <xsl:value-of select="@img" />
					</xsl:attribute>
				</img>
			</xsl:if>
      <xsl:if test="@new">
				<b>
					<span class="red">
						<xsl:text>New! </xsl:text>
					</span>
				</b>
			</xsl:if>
      <a>
				<xsl:attribute name="href">
				  <xsl:value-of select="@ref" />
				</xsl:attribute>
	      <xsl:if test="@target">
					<xsl:attribute name="target">
					  <xsl:value-of select="@target" />
					</xsl:attribute>
				</xsl:if>
			  <xsl:value-of select="@label" />
		  </a>
		</div>
	</li>
</xsl:template>

</xsl:stylesheet>

