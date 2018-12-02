<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin Banner-->
	<xsl:template match="/">
		<xsl:if test="count(/BannerList/Banner) > 0">
			<section class="banner-2">
				<div class="banner-2-wrapper">
					<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
				</div>
			</section>
		</xsl:if>
	</xsl:template>

	<!--Begin Banner Child-->
	<xsl:template match="Banner">
		<!--item-->
		<div class="item">
			<figure>
				<div class="box-zoom">
					<xsl:attribute name="bg-img">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
				</div>
				<figcaption>
					<div class="title">
						<h1>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h1>
					</div>
					<div class="description">
						<p>
							<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</div>
				</figcaption>
			</figure>
		</div>
	</xsl:template>
</xsl:stylesheet>