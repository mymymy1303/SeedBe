<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin Zone-->
	<xsl:template match="/">
		<ul class="main-nav-item-wrapper">
			<!--Call Zone Child-->
			<xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
		</ul>
	</xsl:template>

	<!--Begin Zone Child-->
	<xsl:template match="Zone" mode="Zone1">
		<li class="main-nav-item">
			<a href="javascript:void(0)">
				<xsl:if test="count(Zone) = 0">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
				<i class="lnr lnr-chevron-down"></i>
			</a>
			<div class="nth-dropdown">
				<ul>
					<xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
				</ul>
			</div>
		</li>
	</xsl:template>

	<xsl:template match="Zone" mode="Zone2">
		<li>
			<a href="javascript:void(0)">
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
		</li>
	</xsl:template>
</xsl:stylesheet>