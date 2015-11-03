<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="xml" encoding="utf-8" indent="yes" cdata-section-elements="script" />

	<xsl:template name="script">
		<script type="application/ecmascript"><![CDATA[

var mns;
function svgload(evt) {
	var w = window;
	while (w && !w.Mns)
		w = w.parent;
	if (w) {
		mns = w.Mns
		mns.svgload(evt);
	}
}

function buttonclick(id) {
	if (mns)
		mns.buttonclick(id);
}
function btnpress(btn) {
	var e = btn.firstElementChild;
	e.setAttribute("stroke", e.getAttribute("stroke").replace("button_", "button_press_"));
}
function btnrelease(btn) {
	var e = btn.firstElementChild;
	e.setAttribute("stroke", e.getAttribute("stroke").replace("button_press_", "button_"));
}

function showhlp(evt) {
	if (mns)
		mns.showhlp(evt);
}
function hidehlp(evt) {
	if (mns)
		mns.hidehlp(evt);
}

		]]></script>
	</xsl:template>

</xsl:stylesheet>

