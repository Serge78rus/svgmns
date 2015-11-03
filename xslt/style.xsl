<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" cdata-section-elements="style" />

	<xsl:template name="style">
		<style type="text/css"><![CDATA[
/*
#hlp .message {
	-moz-transition-property:fill-opacity;
  -moz-transition-duration:1s;
	-webkit-transition-property:fill-opacity;
  -webkit-transition-duration:1s;
	transition-property:fill-opacity;
  transition-duration:1s;
}

#hlp .message.hide {
	fill-opacity:0;
}

#hlp .message.show {
	fill-opacity:1;
}
*/

#int .button {
	cursor:pointer;
  -moz-user-select:-moz-none;
  -o-user-select:none;
  -khtml-user-select:none;
  -webkit-user-select:none;
  user-select:none;
}
text {font-family: "Times New Roman", "Times CY", "Nimbus Roman No9 L", serif;}

		]]></style>
	</xsl:template>

</xsl:stylesheet>
