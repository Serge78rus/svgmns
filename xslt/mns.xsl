<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" cdata-section-elements="style script" />

	<xsl:import href="gen/symbols.xsl" />
	<xsl:import href="style.xsl" />
	<xsl:import href="script.xsl" />
	<xsl:import href="filter.xsl" />
	<xsl:import href="font.xsl" />
	<xsl:call-template name="sym_imp" />

	<xsl:template match="mnemo">
		<svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink='http://www.w3.org/1999/xlink'
				xmlns:ev="http://www.w3.org/2001/xml-events"
				version="1.1" viewBox="0 0 1000 1000"
				preserveAspectRatio="xMidYMid meet"
				onload="svgload(evt);">
			<defs>
				<desc>Auto generating svg</desc>
				<xsl:comment>Auto generating svg</xsl:comment>
				<xsl:call-template name="style" />
				<xsl:call-template name="script" />
				<xsl:call-template name="filter" />
				<xsl:call-template name="fonts" />
				<xsl:call-template name="sym_def" />
				<xsl:apply-templates select="//defs/*" />
			</defs>
			<g id="dyn0">
				<xsl:apply-templates select="//body/*" mode="dyn0" />
			</g>
			<g id="stat">
				<xsl:apply-templates select="//body/*" mode="stat" />
			</g>
			<g id="dyn">
				<xsl:apply-templates select="//body/*" mode="dyn" />
			</g>
			<g id="int">
				<xsl:apply-templates select="//body/*" mode="int" />
			</g>
			<g id="hlp" display="none">
				<xsl:apply-templates select="//body/*" mode="hlp" />
			</g>
		</svg>
	</xsl:template>

	<xsl:include href="group.xsl"/>
	<xsl:include href="svg.xsl"/>

	<xsl:template match="//def/*|//body/*">
		<xsl:apply-imports/>
	</xsl:template>

</xsl:stylesheet>
