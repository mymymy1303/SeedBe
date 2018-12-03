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
		<div class="ajaxresponsewrap">
			<div class="row products ajaxresponse">
				<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
			</div>
			<xsl:if test="/ProductList/NextPageUrl!=''">
				<div class="viewmore">
					<a class="ajaxpagerlinkproduct">
						<xsl:attribute name="href">
							<xsl:value-of select="/ProductList/NextPageUrl" />
						</xsl:attribute>
						<xsl:text>Xem thêm</xsl:text>
					</a>
				</div>
			</xsl:if>
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
		<div class="col-6 col-md-4">
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
					</div>
				</figure>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductAttributes">
		<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
	</xsl:template>
</xsl:stylesheet>