<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:template name="button_grd">
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_black">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="black"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_black">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="black"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_blue">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="blue"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_blue">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="blue"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_fuchsia">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="fuchsia"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_fuchsia">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="fuchsia"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_gray">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="gray"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_gray">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="gray"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_green">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="green"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_green">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="green"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_lime">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="lime"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_lime">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="lime"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_maroon">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="maroon"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_maroon">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="maroon"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_navy">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="navy"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_navy">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="navy"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_olive">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="olive"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_olive">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="olive"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_purple">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="purple"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_purple">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="purple"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_red">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="red"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_red">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="red"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_silver">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="silver"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_silver">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="silver"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_teal">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="teal"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_teal">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="teal"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_white">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="white"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_white">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="white"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_lg_yellow">
<stop stop-color="rgba(255,255,255,.5)" offset=".45"/>
<stop offset=".5" stop-color="yellow"/>
<stop stop-color="rgba(0,0,0,.5)" offset=".55"/>
</linearGradient>
<linearGradient y2="1" x2="1" y1="0" x1="0" id="button_press_lg_yellow">
<stop stop-color="rgba(0,0,0,.5)" offset=".45"/>
<stop offset=".5" stop-color="yellow"/>
<stop stop-color="rgba(255,255,255,.5)" offset=".55"/>
</linearGradient>
</xsl:template>
</xsl:stylesheet>
