<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<!-- <xsl:if test="/ShoppingCart/Address != ''">
			<section class="order-summary clearfix">
				<div class="order-title clearfix">
					<h3 class="title">
						<xsl:value-of select="/ShoppingCart/AddressText"></xsl:value-of>
					</h3>
					<a class="btn-edit">
						<xsl:attribute name="href">
							<xsl:text>/checkoutaddress</xsl:text>
						</xsl:attribute>
						<xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
					</a>
				</div>
				<div class="table-responsive table-wrap clearfix">
					<table class="table order-table">
						<tbody>
							<tr class="billing-name">
								<td colspan="2">
									<xsl:value-of select="/ShoppingCart/LastName"></xsl:value-of>
									<xsl:value-of select="/ShoppingCart/FirstName"></xsl:value-of>
								</td>
							</tr>
							<tr class="billing-phone">
								<td>
									<span>
										<xsl:text>Số điện thoại:</xsl:text>
									</span>
								</td>
								<td>
									<xsl:value-of select="/ShoppingCart/Phone"></xsl:value-of>
								</td>
							</tr>
							<tr class="billing-address">
								<td>
									<span>
										<xsl:text>Địa chỉ:</xsl:text>
									</span>
								</td>
								<td>
									<xsl:value-of select="/ShoppingCart/Address"></xsl:value-of>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
		</xsl:if> -->

		<div class="box-resume-title">
			<div class="row align-items-center">
				<div class="col">
					<h3>
						<i class="fa fa-shopping-cart"></i>
						<span> ĐƠN HÀNG
							<xsl:text> (</xsl:text>
							<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
						</span>
						<span>SẢN PHẨM)</span>
					</h3>
				</div>
				<div class="col-auto">
					<a class="btn tbn-sm btn-warning text-dark">
						<xsl:attribute name="href">
							<xsl:value-of select="/ShoppingCart/CartPageUrl"></xsl:value-of>
						</xsl:attribute>
						<span class="fa fa-edit"></span>
						<span>Sửa</span>
					</a>
				</div>
			</div>
		</div>
		<table class="table table-bordered">
			<tbody>
				<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
				<tr>
					<td class="product-details">Tổng tiền</td>
					<td class="product-result">
						<div class="sum">
							<xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
						</div>
					</td>
				</tr>
				<tr>
					<td class="product-details">Giảm giá</td>
					<td class="product-result">
						<div class="sum">
							<xsl:value-of select="/ShoppingCart/DiscountTotal"></xsl:value-of>
						</div>
					</td>
				</tr>
				<tr>
					<td class="product-details">Số tiền phải thanh toán</td>
					<td class="product-result">
						<div class="sum">
							<xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="CartItem">
		<tr>
			<td class="product-details">
				<div class="media">
					<img class="img-fluid">
					<xsl:attribute name="src">
						<xsl:value-of select="ThumbnailUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
					<div class="media-body">
						<div class="more">
							<xsl:value-of select="SubTitle"></xsl:value-of>
						</div>
						<h4>
							<xsl:value-of select="Title"></xsl:value-of>
						</h4>
						<div class="desc">
							<xsl:value-of select="Code"></xsl:value-of>
						</div>
					</div>
				</div>
			</td>
			<td class="product-result">
				<div class="quantity text-right">
					<xsl:value-of select="Price"></xsl:value-of>
					<br>
					</br>
					<xsl:text>x </xsl:text>
					<xsl:value-of select="Quantity"></xsl:value-of>
				</div>
				<div class="sum text-right">
					<xsl:value-of select="ItemTotal"></xsl:value-of>
				</div>
			</td>
		</tr>
		<!-- <div class="group clearfix">
			<div class="product clearfix">
				<div class="productimg">
					<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="productdetail">
					<h3 class="productname">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h3>
				</div>
			</div>
			<div class="amount">
				<div class="price">
					<xsl:value-of select="Price"></xsl:value-of>
				</div>
				<div class="count">
					<xsl:text>x </xsl:text>
					<xsl:value-of select="Quantity"></xsl:value-of>
				</div>
				<div class="total">
					<xsl:value-of select="ItemTotal"></xsl:value-of>
				</div>
			</div>
		</div> -->
	</xsl:template>

</xsl:stylesheet>