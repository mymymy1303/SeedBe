<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="dropdown">
			<xsl:apply-templates select="/LanguageList/Language" mode="Active"></xsl:apply-templates>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
				<xsl:apply-templates select="/LanguageList/Language" mode="Chooser"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Language" mode="Active">
		<xsl:if test="IsActive='true'">
			<a class="dropdown-toggle" id="dropdownMenuLink" href="javascript:void(0)" role="button" data-toggle="dropdown"
			 aria-haspopup="true" aria-expanded="false">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Language" mode="Chooser">
		<a class="dropdown-item ml-0 text-center text-capitalize">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>dropdown-item active ml-0 text-center text-capitalize</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			<!-- <img class="ml-2 w-100">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img> -->
		</a>
	</xsl:template>
</xsl:stylesheet>