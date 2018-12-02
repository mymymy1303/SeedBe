<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin News-->
	<xsl:template match="/">
		<div style="display:flex">
			<div class="tagline-3">
				<div class="title">
					<h1>
						<xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
					</h1>
				</div>
			</div>
			<div class="sort">
				<select bg-img="/Data/sites/1/skins/default/img/global/selectarrow.png">
					<option>Sắp xếp theo</option>
					<option>Giá</option>
				</select>
			</div>
		</div>
		<div class="row news-video">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="col-6 col-md-4">
			<div class="video">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="BriefContent"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="data-fancybox">
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>