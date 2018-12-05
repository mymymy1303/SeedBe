<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="home-product-sale-slider">
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
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</p>
						</div>
					</figcaption>
					<xsl:if test="floor(ShowOption div 2) mod 2 = 1">
						<div class="product-onsales">
							<p>
								<xsl:text>-</xsl:text>
								<xsl:call-template name="get-discount-percentage">
									<xsl:with-param name="param-currentPrice" select="Price" />
									<xsl:with-param name="param-oldPrice" select="OldPrice" />
								</xsl:call-template>
								<xsl-text>%</xsl-text>
							</p>
						</div>
					</xsl:if>
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

	<xsl:template name="get-discount-percentage">
		<xsl:param name="param-currentPrice" />
		<xsl:param name="param-oldPrice" />
		<xsl:variable name="currentPriceFormated">
			<xsl:call-template name="strip-end-characters">
				<xsl:with-param name="text" select="Price" />
				<xsl:with-param name="strip-count" select="2" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="oldPriceFormated">
			<xsl:call-template name="strip-end-characters">
				<xsl:with-param name="text" select="OldPrice" />
				<xsl:with-param name="strip-count" select="2" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="currentPriceNumber" select="number(translate($currentPriceFormated, '.', ''))">
		</xsl:variable>
		<xsl:variable name="oldPriceNumber" select="number(translate($oldPriceFormated, '.', ''))">
		</xsl:variable>
		<xsl:value-of select="round((1 - ($currentPriceNumber div $oldPriceNumber))*100)"></xsl:value-of>
	</xsl:template>

	<xsl:template name="strip-end-characters">
		<xsl:param name="text" />
		<xsl:param name="strip-count" />
		<xsl:value-of select="substring($text, 1, string-length($text) - $strip-count)" />
	</xsl:template>
</xsl:stylesheet>