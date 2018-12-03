<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="collection-2">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="tagline-1">
							<div class="title">
								<h2>bộ sưu tập khác</h2>
							</div>
							<div class="link"><a href="javascript:void(0)"><span>Xem tất cả</span><i class="lnr lnr-arrow-right"></i></a></div>
						</div>
					</div>
				</div>
				<div class="row">
					<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="Product">
		<div class="col-12 col-md-4">
			<figure class="other-collection">
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
				<figcaption>
					<div class="title">
						<h3>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h3>
					</div>
					<div class="link">
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
							<xsl:text>Chi tiết</xsl:text>
						</a>
					</div>
				</figcaption>
			</figure>
		</div>
	</xsl:template>
</xsl:stylesheet>