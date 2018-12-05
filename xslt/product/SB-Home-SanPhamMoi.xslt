<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="home-product-slider">
			<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
		</div>
	</xsl:template>


	<xsl:template match="Product">
		<div class="item">
			<div class="product">
				<figure>
					<div class="product-image">
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
						<div class="product-title">
							<h3>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h3>
						</div>
						<div class="product-description">
							<p>
								<xsl:apply-templates select="ProductAttributes"></xsl:apply-templates>
							</p>
						</div>
						<div class="product-price">
							<p>
								<xsl:value-of select="Price"></xsl:value-of>
							</p>
						</div>
					</figcaption>
					<div class="product-controls">
						<a href="javascript:void(0)" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
							<xsl:attribute name="data-productid">
								<xsl:value-of select="ProductId"></xsl:value-of>
							</xsl:attribute>
							<xsl:text>Thêm vào giỏ hàng</xsl:text>
						</a>
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
							<xsl:text>
								Chi tiết
							</xsl:text>
						</a>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</figure>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductAttributes">
		<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
	</xsl:template>

	<xsl:template name="strip-end-characters">
		<xsl:param name="text" />
		<xsl:param name="strip-count" />
		<xsl:value-of select="substring($text, 1, string-length($text) - $strip-count)" />
	</xsl:template>
</xsl:stylesheet>