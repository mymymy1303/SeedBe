<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<!--Begin Zone-->
	<xsl:template match="/">
		<section class="home-2">
			<div class="container">
				<div class="blocks">
					<xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>
	<!--Begin Zone Child-->
	<xsl:template match="Zone" mode="Zone1">
		<xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone2">
		<xsl:apply-templates select="Zone" mode="Zone3"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="Zone3">
		<div class="block">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<figure>
					<div class="box-zoom">
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
					</div>
					<figcaption>
						<div class="title">
							<h2>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h2>
						</div>
					</figcaption>
				</figure>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>