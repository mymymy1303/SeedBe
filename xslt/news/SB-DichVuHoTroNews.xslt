<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<!--Begin News-->
	<xsl:template match="/">
		<div class="tagline-2">
			<div class="title">
				<h1>
					<xsl:value-of select="/ZoneList/Title" disable-output-escaping="yes"></xsl:value-of>
				</h1>
			</div>
		</div>
		<div class="content">
			<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<h2>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</h2>
		<xsl:apply-templates select="News"></xsl:apply-templates>

	</xsl:template>

	<xsl:template match="News">
		<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
	</xsl:template>


</xsl:stylesheet>