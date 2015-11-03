<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:output
  media-type="text/html" method="html" encoding="utf-8" indent="no"
  omit-xml-declaration="yes"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
/>

<xsl:template match="/">
	<html>
		<head>
			<meta charset="UTF-8" />
			<title>mns.xml</title>
		</head>
		<body>
			<xmp style="tab-size:2;-moz-tab-size:2;-o-tab-size:2;-webkit-tab-size:2;">
				<xsl:copy-of select="." />
			</xmp>
  	</body>
  </html>
</xsl:template>


</xsl:stylesheet>


