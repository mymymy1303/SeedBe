<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="collection-detail-1">
			<div class="product-detail">
				<div class="product-detail-slider">
					<div class="swiper-container slider">
						<div class="swiper-wrapper">
							<xsl:if test="count(/ProductDetail/ProductImages)>0">
								<xsl:apply-templates select="/ProductDetail/ProductImages" mode="Image"></xsl:apply-templates>
							</xsl:if>
						</div>
						<div class="swiper-button-next"><i class="lnr lnr-chevron-right"></i></div>
						<div class="swiper-button-prev"><i class="lnr lnr-chevron-left"></i></div>
					</div>
					<div class="swiper-container thumbnail">
						<div class="swiper-wrapper">
							<xsl:if test="count(/ProductDetail/ProductImages)>0">
								<xsl:apply-templates select="/ProductDetail/ProductImages" mode="Thumbnail"></xsl:apply-templates>
							</xsl:if>
						</div>
					</div>
				</div>
				<div class="product-info">
					<div class="title">
						<h1>
							<xsl:value-of select="/ProductDetail/Title"></xsl:value-of>
							<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
					</div>
					<div class="subtitle">
						<h2>
							<xsl:value-of select="/ProductDetail/SubTitle" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<div class="prices">
						<div class="price">
							<p>
								<xsl:value-of select="/ProductDetail/Price" disable-output-escaping="yes"></xsl:value-of>
							</p>
							<p>Chưa bao gồm VAT</p>
						</div>
					</div>
					<div class="sharer">
						<p>Chia sẻ qua</p>
						<a href="javascript:void(0)">
							<i class="fab fa-facebook-f"></i>
						</a>
					</div>
					<div class="brief-content">
						<p>
							<xsl:value-of select="/ProductDetail/BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</div>
				</div>
			</div>
			<div class="row products">
				<xsl:if test="count(/ProductDetail/ProductRelated)>0">
					<xsl:apply-templates select="/ProductDetail/ProductRelated"></xsl:apply-templates>
				</xsl:if>
			</div>
		</section>
	</xsl:template>

	<!-- <xsl:template match="ProductProperties">
		<xsl:if test="FieldId=4">
			<div class="product-size">
				<strong>
					<xsl:value-of select="Title"></xsl:value-of>
				</strong>
				<select>
					<xsl:attribute name="name">
						<xsl:text>product_attribute_</xsl:text>
						<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
						<xsl:text>_</xsl:text>
						<xsl:value-of select="FieldId"></xsl:value-of>
					</xsl:attribute>
					<xsl:apply-templates select="Options"></xsl:apply-templates>
				</select>
				<a href="/cham-soc-khach-hang/huong-dan-chon-size/so-mi-tay-ngan-kieu-body" class="viewsize">Hướng dẫn chọn size</a>
			</div>
		</xsl:if>
	</xsl:template> -->

	<!-- <xsl:template match="Options">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template> -->

	<xsl:template match="ProductImages" mode="Image">
		<xsl:if test="position() &gt; 1">
			<div class="swiper-slide">
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</xsl:if>
	</xsl:template>


	<xsl:template match="ProductImages" mode="Thumbnail">
		<xsl:if test="position() &gt; 1">
			<div class="swiper-slide">
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ProductRelated">
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
								<xsl:apply-templates select="/ProductDetail/ProductAttributes"></xsl:apply-templates>
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