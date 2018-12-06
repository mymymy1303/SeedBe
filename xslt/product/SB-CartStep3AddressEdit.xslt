<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="row validator">
			<div class="col-lg-12">
				<div class="box-resume">
					<div class="box-resume-title">
						<h3>
							<span class="fa fa-shopping-cart"></span>
							<span>
								<span>ĐỊA CHỈ NHẬN HÀNG</span>
									<!-- <xsl:value-of select="/CheckoutAddress/CustomerInformationText"></xsl:value-of> -->
							</span>
						</h3>
					</div>
					<div class="box-resume-content">
						<div class="form-group row align-items-center">
							<label class="col-form-label col-sm-4" for="name">
								<xsl:value-of select="/CheckoutAddress/FullNameText"></xsl:value-of>
								<span class="text-danger">(*)</span>
							</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" name="Address_FirstName" placeholder="Ví dụ: Nguyễn Văn C" required="" data-error="Vui lòng nhập thông tin">
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/FirstName"></xsl:value-of>
									</xsl:attribute>
								</input>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<div class="form-group row align-items-center">
							<label class="col-form-label col-sm-4" for="tel">
								<xsl:value-of select="/CheckoutAddress/PhoneText"></xsl:value-of>
								<span class="text-danger">(*)
								</span>
							</label>
							<div class="col-sm-8 col-md-4">
								<input class="form-control" type="text" name="Address_Phone" placeholder="Ví dụ: 012345678910" required="" data-error="Vui lòng nhập thông tin">
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/Phone"></xsl:value-of>
									</xsl:attribute>
								</input>
								<div class="help-block with-errors"></div>
							</div>
							<div class="col-md-4 text-mini">(Nhân viên giao dịch sẽ liên hệ với SĐT này)</div>
								<!-- <xsl:value-of select="/CheckoutAddress/ContactNumberText"></xsl:value-of> -->
						</div>
						<div class="form-group row">
							<label class="col-form-label col-sm-4" for="Email">Email</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" name="Address_Email" placeholder="Email" data-error="Ví dụ: nguyenvanc@gmail.com" required="">
									<xsl:attribute name="value">
										<xsl:value-of select="/CheckoutAddress/Email"></xsl:value-of>
									</xsl:attribute>
								</input>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<hr>
						</hr>
						<div class="form-group row">
							<label class="col-form-label col-sm-4" for="Country">
								<xsl:value-of select="/CheckoutAddress/ProvinceText"></xsl:value-of>
							</label>
							<div class="col-sm-8">
								<select class="form-control" id="Country" type="text" placeholder="Country" data-error="Vui lòng nhập thông tin" required="" onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'Address_District-1')">
									<option value=""> -- Chọn Tỉnh/Thành Phố -- </option>
									<xsl:apply-templates select="/CheckoutAddress/Provinces"></xsl:apply-templates>
								</select>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-form-label col-sm-4" for="Country">
								<xsl:value-of select="/CheckoutAddress/DistrictText"></xsl:value-of>
							</label>
							<div class="col-sm-8">
								<select class="form-control" name="Address_District-1" type="text" placeholder="Quận" data-error="Vui lòng nhập thông tin" required="">
									<option value=""> -- Chọn Quận/Huyện -- </option>
									<xsl:apply-templates select="/CheckoutAddress/Districts"></xsl:apply-templates>
								</select>
								<div class="help-block with-errors"></div>
							</div>
						</div>


						<div class="form-group row">
							<label class="col-form-label col-sm-4" for="Address">Địa chỉ</label>
							<div class="col-sm-8">
								<input class="form-control" name="Address_Address" placeholder="Ví dụ: 156 Nguyễn Văn Thủ, P. Da Kao, Quận" data-error="Vui lòng nhập thông tin" required="" value="">
								</input>
								<div class="help-block with-errors"></div>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-form-label col-sm-4" for="Message">
								Lời nhắn
								<div class="text-mini">(Không bắt buộc)
									<!-- <xsl:value-of select="/CheckoutAddress/NotRequireText"></xsl:value-of> -->
								</div>
							</label>
							<div class="col-sm-8">
								<textarea class="form-control" id="Message" name="OrderNote" cols="30" rows="2">
									<xsl:attribute name="placeholder">
										<xsl:text>Ví dụ: Giao hàng ngoài giờ hành chính</xsl:text>
									</xsl:attribute>
								</textarea>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<hr>
						</hr>
						<div class="row">
							<div class="col">
								<div class="form-check abc-checkbox">
									<input class="form-check-input" name="Address_SameBilling" id="checkbox" type="checkbox" expand-to="infomem" checked="checked">
									</input>
									<label class="form-check-label" for="checkbox">Thông tin người mua hàng giống như trên
										<!-- <xsl:value-of select="/CheckoutAddress/SameInfoText"></xsl:value-of> -->
									</label>
								</div>
								<div class="row mt-4 mb-4" id="infomem" style="display:none">
									<div class="col-12">
										<div class="form-group row align-items-center">
											<label class="col-form-label col-sm-4" for="name">
												<xsl:value-of select="/CheckoutAddress/FullNameText"></xsl:value-of>
												<span class="text-danger">(*)</span>
											</label>
											<div class="col-sm-8">
												<input class="form-control" id="name" placeholder="Ví dụ: Nguyễn Văn E" name="ShippingAddress_FirstName" data-error="Nhập họ tên">
												</input>
												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group row align-items-center">
											<label class="col-form-label col-sm-4" for="tel">
												<xsl:value-of select="/CheckoutAddress/PhoneText"></xsl:value-of>
												<span class="text-danger">(*)
												</span>
											</label>
											<div class="col-sm-8 col-md-4">
												<input class="form-control" type="text" name="Address_Phone" placeholder="Ví dụ: 012345678910" required="">
												</input>
												<div class="help-block with-errors"></div>
											</div>
											<div class="col-md-4 text-mini">
												<xsl:value-of select="/CheckoutAddress/ContactNumberText"></xsl:value-of>
											</div>
										</div>
									</div>
									<hr>
									</hr>
									<div class="col-12">
										<div class="form-group row">
											<label class="col-form-label col-sm-4" for="Email">Email</label>
											<div class="col-sm-8">
												<input class="form-control" placeholder="Email" data-error="Vui lòng nhập thông tin" required="">
												</input>
												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>
									<hr>
									</hr>
									<div class="col-12">
										<div class="form-group row">
											<label class="col-form-label col-sm-4" for="Country">
												<xsl:value-of select="/CheckoutAddress/ProvinceText"></xsl:value-of>
											</label>
											<div class="col-sm-8">
												<select class="form-control" id="Country" type="text" placeholder="Country" data-error="Vui lòng nhập thông tin" required="" onchange="AjaxCheckout.getdistrictsbyprovinceguid(this, 'Address_District-2')">
													<option value=""> -- Chọn Tỉnh/Thành Phố -- </option>
													<xsl:apply-templates select="/CheckoutAddress/Provinces"></xsl:apply-templates>
												</select>
												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group row">
											<label class="col-form-label col-sm-4" for="Country">
												<xsl:value-of select="/CheckoutAddress/DistrictText"></xsl:value-of>
											</label>
											<div class="col-sm-8">
												<select class="form-control" name="Address_District-2" type="text" placeholder="Quận" data-error="Vui lòng nhập thông tin" required="">
													<option value=""> -- Chọn Quận/Huyện -- </option>
													<xsl:apply-templates select="/CheckoutAddress/Districts"></xsl:apply-templates>
												</select>
												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>

									<div class="col-12">
										<div class="form-group row">
											<label class="col-form-label col-sm-4" for="Address">Địa chỉ</label>
											<div class="col-sm-8">
												<input class="form-control" name="Address_Address" placeholder="Địa chỉ" data-error="Vui lòng nhập thông tin" required="">
												</input>
												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="form-check abc-checkbox mb-0">
											<input class="form-check-input" name="IsChecked1" id="checkbox1" type="checkbox" checked="checked">
											</input>
											<label class="form-check-label" for="checkbox1">Cập nhật thông tin trên làm địa chỉ hiện tại của tôi </label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="row mt-4">
			<div class="col">
				<div class="form-check abc-checkbox mb-0">
					<input class="form-check-input" name="IsChecked1" id="checkbox2" type="checkbox" expand-to-invert="vatview">
					</input>
					<label class="form-check-label" for="checkbox2">
						<xsl:value-of select="/CheckoutAddress/RequireVATText"></xsl:value-of>
					</label>
				</div>
				<div class="row mt-4" id="vatview" style="display:none">
					<div class="col">
						<div class="box-resume">
							<div class="box-resume-content box-resume-content-top">
								<h6 class="mb-3">
									<xsl:value-of select="/CheckoutAddress/VATFormText"></xsl:value-of>
								</h6>
								<div class="form-group row align-items-center">
									<label class="col-form-label col-sm-4" for="taxID">
										<xsl:value-of select="/CheckoutAddress/taxIDText"></xsl:value-of>

									</label>
									<div class="col-sm-8">
										<input class="form-control" id="taxID" data-error="Vui lòng nhập thông tin" required="">
										</input>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group row align-items-center">
									<label class="col-form-label col-sm-4" for="nameCompany">
										<xsl:value-of select="/CheckoutAddress/CompanyNameText"></xsl:value-of>
									</label>
									<div class="col-sm-8">
										<input class="form-control" id="nameCompany" placeholder="Tên công ty" data-error="Vui lòng nhập thông tin" required="">
										</input>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group row align-items-center">
									<label class="col-form-label col-sm-4" for="addressCompany">Địa chỉ công ty
									</label>
									<div class="col-sm-8">
										<input class="form-control" id="addressCompany" data-error="Vui lòng nhập thông tin" required="">
										</input>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="text-mini">Note: The invoice value does not include the discounted value</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col">
				<div class="box-resume">
					<div class="box-resume-title">
						<h3 class="h6"><i class="fa fa-shopping-cart fa-fw"></i> <span><span>
									<xsl:value-of select="/CheckoutAddress/DiscountText"></xsl:value-of>
								</span></span>
						</h3>
					</div>
					<div class="box-resume-content">
						<div class="form-inline">
							<div class="input-group mb-3">
								<input class="form-control" placeholder="CODE" aria-label="CODE" aria-describedby="button-addon2">
								</input>
								<div class="input-group-append"><button class="btn btn-primary" id="button-addon2" type="button" onclick="AjaxCart.applycoupon();return false;">Button</button></div>
							</div>
						</div>
						<p class="text-mini">
							<xsl:value-of select="/CheckoutAddress/DiscountText2"></xsl:value-of>
						</p>
						<p class="mb-0">
							<xsl:value-of select="/CheckoutAddress/DiscountText3"></xsl:value-of>
						</p>
					</div>
				</div>
			</div>
		</div> -->
		<div class="row mb-4 navi mt-5">
			<div class="col mb-3 text-center text-sm-left">
				<a class="btn btn-secondary text-white" href="dang-nhap">
					<i class="fa fa-chevron-left mr-2"></i>
					Quay lại
				</a>
			</div>
			<div class="col mb-3 text-center text-sm-right">
				<a class="btn btn-primary text-white" id="checkout" name="checkout">
					<xsl:attribute name="onclick">
						<xsl:text>AjaxCheckout.saveorder(false, '</xsl:text>
						<xsl:value-of select="/CheckoutAddress/NextPageUrl"></xsl:value-of>
						<xsl:text>');return false;</xsl:text>
					</xsl:attribute>Tiếp tục
					<i class="fa fa-chevron-right ml-2">
					</i>
				</a>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Provinces">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Provinces" mode="Shipping">
		<option>
			<xsl:if test="ShippingIsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Districts">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Districts" mode="Shipping">
		<option>
			<xsl:if test="ShippingIsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Guid"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
</xsl:stylesheet>