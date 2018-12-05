<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin Banner-->
	<xsl:template match="/">
		<xsl:if test="count(/BannerList/Banner) > 0">
			<section class="canhcam-banner-1">
				<div class="banner-home">
					<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
				</div>
			</section>
		</xsl:if>
	</xsl:template>

	<!--Begin Banner Child-->
	<xsl:template match="Banner">
		<!--item-->
		<div class="item">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>