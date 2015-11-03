<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template match="//body//lib" priority="6" mode="stat">
		<xsl:if test="not(@i)">
			<xsl:apply-imports select="document(@f)/lib/*" />
		</xsl:if>
	</xsl:template>


</xsl:stylesheet>
