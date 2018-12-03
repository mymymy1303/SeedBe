<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="product-detail-1">
			<div class="container">
				<div class="row">
					<div class="col">
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
								<div class="code">
									<p>
										<xsl:value-of select="/ProductDetail/Code" disable-output-escaping="yes"></xsl:value-of>
									</p>
								</div>
								<div class="prices">
									<div class="price">
										<p>
											<xsl:value-of select="/ProductDetail/Price" disable-output-escaping="yes"></xsl:value-of>
										</p>
										<p>Chưa bao gồm VAT</p>
									</div>
								</div>
								<div class="quantity">
									<p>SL</p>
									<input type="text" value="1"></input>
								</div>
								<div class="coupon">
									<a href="javascript:void(0)">Code giảm giá</a>
								</div>
								<div class="sharer">
									<p>Chia sẻ qua</p>
									<a href="javascript:void(0)">
										<i class="fab fa-facebook-f"></i>
									</a>
								</div>
								<div class="buy">
									<a href="javascript:void(0)">Mua hàng</a>
								</div>
								<div class="brief-content">
									<p>
										<xsl:value-of select="/ProductDetail/BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="product-detail-2">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="block-title">
							<h2>Thông tin sản phẩm</h2>
						</div>
						<div class="product-tabs">
							<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="tabs"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="product-detail-3">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="tagline-6">
							<div class="title">
								<h2>Cùng bộ sưu tập</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="row products">
					<xsl:if test="count(/ProductDetail/ProductRelated)>0">
						<xsl:apply-templates select="/ProductDetail/ProductRelated"></xsl:apply-templates>
					</xsl:if>
				</div>
			</div>
		</section>

		<section class="product-detail-4">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="tagline-1">
							<div class="title">
								<h2>Bạn cũng có thể thích</h2>
							</div>
							<div class="link"><a href="javascript:void(0)"><span>Xem tất cả</span><i class="lnr lnr-arrow-right"></i></a></div>
						</div>
					</div>
				</div>
				<div class="like-product-slider">
					<xsl:if test="count(/ProductDetail/ProductOther)>0">
						<xsl:apply-templates select="/ProductDetail/ProductOther"></xsl:apply-templates>
					</xsl:if>
				</div>
			</div>
		</section>
	</xsl:template>

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

	<xsl:template match="ProductAttributes" mode="tabs">
		<xsl:if test="position() &gt; 1">
			<div class="tab">
				<div class="title">
					<h3>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h3>
					<i class="lnr lnr-chevron-down"></i>
				</div>
				<div class="content">
					<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ProductRelated">
		<div class="col-6 col-md-3">
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
								<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="size"></xsl:apply-templates>
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

	<xsl:template match="ProductAttributes" mode="size">
		<xsl:if test="position() = 1">
			<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
		</xsl:if>
	</xsl:template>


	<xsl:template match="ProductOther">
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
								<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="size"></xsl:apply-templates>
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
</xsl:stylesheet>