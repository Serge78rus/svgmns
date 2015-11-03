<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:template name="body_grd">
<linearGradient id="cyl_lg_black">
<stop offset="0" stop-color="black"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="black"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_black">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="black"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_black">
<stop offset="0" stop-color="black"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="black"/>
</radialGradient>
<linearGradient id="cyl_lg_blue">
<stop offset="0" stop-color="blue"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="blue"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_blue">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="blue"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_blue">
<stop offset="0" stop-color="blue"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="blue"/>
</radialGradient>
<linearGradient id="cyl_lg_fuchsia">
<stop offset="0" stop-color="fuchsia"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="fuchsia"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_fuchsia">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="fuchsia"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_fuchsia">
<stop offset="0" stop-color="fuchsia"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="fuchsia"/>
</radialGradient>
<linearGradient id="cyl_lg_gray">
<stop offset="0" stop-color="gray"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="gray"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_gray">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="gray"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_gray">
<stop offset="0" stop-color="gray"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="gray"/>
</radialGradient>
<linearGradient id="cyl_lg_green">
<stop offset="0" stop-color="green"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="green"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_green">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="green"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_green">
<stop offset="0" stop-color="green"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="green"/>
</radialGradient>
<linearGradient id="cyl_lg_lime">
<stop offset="0" stop-color="lime"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="lime"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_lime">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="lime"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_lime">
<stop offset="0" stop-color="lime"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="lime"/>
</radialGradient>
<linearGradient id="cyl_lg_maroon">
<stop offset="0" stop-color="maroon"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="maroon"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_maroon">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="maroon"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_maroon">
<stop offset="0" stop-color="maroon"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="maroon"/>
</radialGradient>
<linearGradient id="cyl_lg_navy">
<stop offset="0" stop-color="navy"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="navy"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_navy">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="navy"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_navy">
<stop offset="0" stop-color="navy"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="navy"/>
</radialGradient>
<linearGradient id="cyl_lg_olive">
<stop offset="0" stop-color="olive"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="olive"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_olive">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="olive"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_olive">
<stop offset="0" stop-color="olive"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="olive"/>
</radialGradient>
<linearGradient id="cyl_lg_purple">
<stop offset="0" stop-color="purple"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="purple"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_purple">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="purple"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_purple">
<stop offset="0" stop-color="purple"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="purple"/>
</radialGradient>
<linearGradient id="cyl_lg_red">
<stop offset="0" stop-color="red"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="red"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_red">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="red"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_red">
<stop offset="0" stop-color="red"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="red"/>
</radialGradient>
<linearGradient id="cyl_lg_silver">
<stop offset="0" stop-color="silver"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="silver"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_silver">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="silver"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_silver">
<stop offset="0" stop-color="silver"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="silver"/>
</radialGradient>
<linearGradient id="cyl_lg_teal">
<stop offset="0" stop-color="teal"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="teal"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_teal">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="teal"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_teal">
<stop offset="0" stop-color="teal"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="teal"/>
</radialGradient>
<linearGradient id="cyl_lg_white">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="white"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_white">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="white"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_white">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="white"/>
</radialGradient>
<linearGradient id="cyl_lg_yellow">
<stop offset="0" stop-color="yellow"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="yellow"/>
</linearGradient>
<radialGradient cx=".5" cy=".5" r="1" fx=".3" fy=".3" id="ball_rg_yellow">
<stop offset="0" stop-color="white"/>
<stop offset=".5" stop-color="yellow"/>
</radialGradient>
<radialGradient cx=".5" cy=".5" r=".5" id="tor_rg_yellow">
<stop offset="0" stop-color="yellow"/>
<stop offset=".5" stop-color="white"/>
<stop offset="1" stop-color="yellow"/>
</radialGradient>
</xsl:template>
</xsl:stylesheet>
