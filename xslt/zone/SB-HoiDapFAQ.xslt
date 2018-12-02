<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin Zone-->
	<xsl:template match="/">
		<!--Call Zone Child-->
		<div class="desktop-hoidap-nav">
			<xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
		</div>
	</xsl:template>

	<!--Begin Zone Child-->
	<xsl:template match="Zone" mode="Zone1">
		<div class="hoidap-nav">
			<div class="title">
				<h2>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</h2>
			</div>
			<div class="links">
				<xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone" mode="Zone2">
		<a>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="target">
				<xsl:value-of select="Target"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</a>
	</xsl:template>
</xsl:stylesheet>