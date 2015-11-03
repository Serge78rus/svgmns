<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="utf-8" indent="yes"/>
<xsl:template name="sym_imp">
<xsl:import href="body.xsl"/>
<xsl:import href="../sym/body.xsl"/>
<xsl:import href="tube.xsl"/>
<xsl:import href="../sym/tube.xsl"/>
<xsl:import href="tube_l.xsl"/>
<xsl:import href="../sym/tube_l.xsl"/>
<xsl:import href="../sym/tube_t.xsl"/>
<xsl:import href="../sym/tube_x.xsl"/>
<xsl:import href="../sym/pump.xsl"/>
<xsl:import href="../sym/valve.xsl"/>
<xsl:import href="../sym/valve_b.xsl"/>
<xsl:import href="../sym/valve_w.xsl"/>
<xsl:import href="led.xsl"/>
<xsl:import href="../sym/led.xsl"/>
<xsl:import href="fan.xsl"/>
<xsl:import href="../sym/fan.xsl"/>
<xsl:import href="../sym/pwr_a.xsl"/>
<xsl:import href="../sym/pwr_d.xsl"/>
<xsl:import href="../sym/pwr_b.xsl"/>
<xsl:import href="../sym/arrow.xsl"/>
<xsl:import href="panel.xsl"/>
<xsl:import href="../sym/panel.xsl"/>
<xsl:import href="../sym/label.xsl"/>
<xsl:import href="../sym/display.xsl"/>
<xsl:import href="switch.xsl"/>
<xsl:import href="../sym/switch.xsl"/>
<xsl:import href="tank.xsl"/>
<xsl:import href="../sym/tank.xsl"/>
<xsl:import href="../sym/scale_l.xsl"/>
<xsl:import href="../sym/scale_r.xsl"/>
<xsl:import href="../sym/gauge.xsl"/>
<xsl:import href="../sym/meter.xsl"/>
<xsl:import href="../sym/level.xsl"/>
<xsl:import href="border.xsl"/>
<xsl:import href="../sym/border.xsl"/>
<xsl:import href="button.xsl"/>
<xsl:import href="../sym/button.xsl"/>
<xsl:import href="../sym/help.xsl"/>
</xsl:template>
<xsl:template name="sym_def">
<xsl:call-template name="body_grd"/>
<xsl:call-template name="body_sym"/>
<xsl:call-template name="tube_grd"/>
<xsl:call-template name="tube_sym"/>
<xsl:call-template name="tube_l_grd"/>
<xsl:call-template name="tube_l_sym"/>
<xsl:call-template name="tube_t_sym"/>
<xsl:call-template name="tube_x_sym"/>
<xsl:call-template name="pump_sym"/>
<xsl:call-template name="valve_sym"/>
<xsl:call-template name="valve_b_sym"/>
<xsl:call-template name="valve_w_sym"/>
<xsl:call-template name="led_grd"/>
<xsl:call-template name="led_sym"/>
<xsl:call-template name="fan_grd"/>
<xsl:call-template name="fan_sym"/>
<xsl:call-template name="pwr_a_sym"/>
<xsl:call-template name="pwr_d_sym"/>
<xsl:call-template name="pwr_b_sym"/>
<xsl:call-template name="arrow_sym"/>
<xsl:call-template name="panel_grd"/>
<xsl:call-template name="panel_sym"/>
<xsl:call-template name="label_sym"/>
<xsl:call-template name="display_sym"/>
<xsl:call-template name="switch_grd"/>
<xsl:call-template name="switch_sym"/>
<xsl:call-template name="tank_grd"/>
<xsl:call-template name="tank_sym"/>
<xsl:call-template name="scale_l_sym"/>
<xsl:call-template name="scale_r_sym"/>
<xsl:call-template name="gauge_sym"/>
<xsl:call-template name="meter_sym"/>
<xsl:call-template name="level_sym"/>
<xsl:call-template name="border_grd"/>
<xsl:call-template name="border_sym"/>
<xsl:call-template name="button_grd"/>
<xsl:call-template name="button_sym"/>
<xsl:call-template name="help_sym"/>
</xsl:template>
</xsl:stylesheet>
