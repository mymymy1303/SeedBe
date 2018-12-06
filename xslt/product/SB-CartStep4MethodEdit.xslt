<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="box-resume mb-4">
			<div class="box-resume-title">
				<h3>
					<span class="fa fa-shopping-cart"></span>
					<span>PHƯƠNG THỨC THANH TOÁN</span>
				</h3>
			</div>
			<div class="box-resume-content">
				<xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
				<div class="agree">
					<input id="PaymentAgree" type="checkbox" checked="checked" name="PaymentAgree" />
					<label for="PaymentAgree">Tôi đã đọc và đồng ý điều khoản trên</label>
					
					<!-- <input class="form-check-input" name="IsChecked1" id="checkbox2" type="checkbox"></input>
					<label class="form-check-label" for="checkbox2">Tôi đã đọc và đồng ý với các điều khoản trên</label> -->
				</div>
			</div>
			
		</div>

		<div class="row mb-4 navi mt-5">
			<div class="col mb-3 text-center text-sm-left">
				<a class="btn btn-secondary text-white" href="dang-nhap">
					<i class="fa fa-chevron-left mr-2"></i>
					Quay lại
				</a>
			</div>
			<div class="col mb-3 text-center text-sm-right">
				<a class="btn btn-primary text-white" id="checkout" name="giao-hang">
					<xsl:attribute name="onclick">
						<xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
						<xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of>
						<xsl:text>');return false;</xsl:text>
					</xsl:attribute>Tiếp tục
					<i class="fa fa-chevron-right ml-2">
					</i>
				</a>
			</div>
		</div>
	</xsl:template>

	<!-- <xsl:template match="Shipping">
		<div class="form-group">
			<input type="radio" name="ShippingMethod" onchange="AjaxCheckout.getshippingtotal(this)">
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			</input>
			<label>
				<xsl:value-of select="Title"></xsl:value-of>
			</label>
			<xsl:if test="Description!=''">
				<div class="des">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</xsl:if>
		</div>
	</xsl:template> -->

	<xsl:template match="Payment">
		<div class="form-check abc-checkbox abc-checkbox-circle">
			<input type="radio" name="PaymentMethod" class="form-check-input">
				<xsl:attribute name="id">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="value">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<xsl:if test="position()=1">
					<xsl:attribute name="checked">
						<xsl:text>checked</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select="Id"></xsl:value-of>
					</xsl:attribute>
				</xsl:if>
			</input>
			<label class="form-check-label">
				<xsl:attribute name="for">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<div class="content-wrap d-flex">
					<xsl:if test="Description!=''">
						<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
					</xsl:if>
				</div>
			</label>
			<!-- <xsl:if test="Id=3"> -->
			<!-- </xsl:if> -->
		</div>
	</xsl:template>

</xsl:stylesheet>