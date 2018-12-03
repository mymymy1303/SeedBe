<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div style="display:flex">
			<div class="tagline-5">
				<div class="title">
					<h1>
						<xsl:value-of select="/ProductList/ZoneTitle"></xsl:value-of>
					</h1>
				</div>
			</div>
			<div class="sort">
				<select class="ajaxsort" bg-img="/Data/sites/1/skins/default/img/global/selectarrow.png">
					<xsl:apply-templates select="/ProductList/SortBy"></xsl:apply-templates>
				</select>
			</div>
		</div>
		<div class="collections ajaxresponse">
			<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="SortBy">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="Product">
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
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
			</figure>
		</a>
	</xsl:template>
</xsl:stylesheet>