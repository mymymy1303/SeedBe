<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="cart">
			<span>Cart</span>
			<span class="cart-item-count">
				<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
			</span>
		</div>
		<div class="cart-expand">
			<xsl:choose>
				<xsl:when test="count(/ShoppingCart/CartItem)=0">
					<div class="cart-header">
						<div class="cart-title"> Có <span>0 </span>sản phẩm trong giỏ hàng</div>
						<div class="cart-close-button"><i class="lnr lnr-cross"></i></div>
					</div>
					<div class="cart-list">
						<ul>
							<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
						</ul>
					</div>
					<div class="cart-checkout">
						<div class="cart-total">
							<xsl:text>Tạm tính: </xsl:text>
							<span>
								<xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
							</span>
						</div>
						<div class="cart-button">
							<a class="btn-viewcart" href="javascript:void(0)">
								<xsl:attribute name="onclick">
									<xsl:text>setLocation('</xsl:text>
									<xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
									<xsl:text>');return false;</xsl:text>
								</xsl:attribute>
								<xsl:text>Tiến hành thanh toán</xsl:text>
							</a>
						</div>
					</div>
				</xsl:when>

				<xsl:otherwise>
					<div class="cart-header">
						<div class="cart-title"> Có <span>
								<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
							</span> sản phẩm trong giỏ hàng</div>
						<div class="cart-close-button"><i class="lnr lnr-cross"></i></div>
					</div>
					<div class="cart-list">
						<ul>
							<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
						</ul>
					</div>
					<div class="cart-checkout">
						<div class="cart-total">
							<xsl:text>Tạm tính: </xsl:text>
							<span>
								<xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
							</span>
						</div>
						<div class="cart-button">
							<a class="btn-viewcart" href="javascript:void(0)">
								<xsl:attribute name="onclick">
									<xsl:text>setLocation('</xsl:text>
									<xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
									<xsl:text>');return false;</xsl:text>
								</xsl:attribute>
								<xsl:text>Tiến hành thanh toán</xsl:text>
							</a>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template match="CartItem">
		<li>
			<a class="product-img" href="javascript:void(0)">
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</a>
			<div class="product-info">
				<div class="product-name">
					<a href="javascript:void(0)">
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
				</div>
				<div class="amount">
					<xsl:value-of select="OriginalPrice"></xsl:value-of>
					<xsl:text> x </xsl:text>
					<xsl:value-of select="Quantity"></xsl:value-of>
				</div>
			</div>
			<div class="remove-product" onclick="AjaxCart.removefromcart(this);return false;"><i class="fa fa-trash-o"></i></div>
		</li>
	</xsl:template>
</xsl:stylesheet>