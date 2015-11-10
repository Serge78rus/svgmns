<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:import href="xsl.xsl" />

	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:template match="/symbols">
    <xsl:element name="xsl:stylesheet">
			<xsl:call-template name="xsl_attr" />
			<xsl:call-template name="xsl_output" />
    	<xsl:element name="xsl:template">
				<xsl:attribute name="name">
  	     	<xsl:text>sym_imp</xsl:text>
    	  </xsl:attribute>
				<xsl:for-each select="//symbol">
					<xsl:call-template name="make_imp" />
				</xsl:for-each>
	    </xsl:element>
    	<xsl:element name="xsl:template">
				<xsl:attribute name="name">
  	     	<xsl:text>sym_def</xsl:text>
    	  </xsl:attribute>
				<xsl:for-each select="//symbol">
					<xsl:call-template name="make_def" />
				</xsl:for-each>
	    </xsl:element>
    </xsl:element>
	</xsl:template>

	<xsl:template name="make_imp">
		<xsl:if test="@flt|@grd">
	   	<xsl:element name="xsl:import">
				<xsl:attribute name="href">
      	 	<xsl:value-of	select="@name" />
					<xsl:text>.xsl</xsl:text>
   	  	</xsl:attribute>
    	</xsl:element>
		</xsl:if>
   	<xsl:element name="xsl:import">
			<xsl:attribute name="href">
				<xsl:text>../sym/</xsl:text>
       	<xsl:value-of	select="@name" />
				<xsl:text>.xsl</xsl:text>
   	  </xsl:attribute>
    </xsl:element>
	</xsl:template>

	<xsl:template name="make_def">
		<xsl:if test="@flt">
	   	<xsl:element name="xsl:call-template">
				<xsl:attribute name="name">
      	 	<xsl:value-of	select="@name" />
					<xsl:text>_flt</xsl:text>
   	  	</xsl:attribute>
    	</xsl:element>
		</xsl:if>
		<xsl:if test="@grd">
	   	<xsl:element name="xsl:call-template">
				<xsl:attribute name="name">
      	 	<xsl:value-of	select="@name" />
					<xsl:text>_grd</xsl:text>
   	  	</xsl:attribute>
    	</xsl:element>
		</xsl:if>
   	<xsl:element name="xsl:call-template">
			<xsl:attribute name="name">
     	 	<xsl:value-of	select="@name" />
				<xsl:text>_sym</xsl:text>
 	  	</xsl:attribute>
   	</xsl:element>
	</xsl:template>

</xsl:stylesheet>
