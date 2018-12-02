<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin Zone-->
	<xsl:template match="/">
		<ul class="main-nav-item-wrapper">
			<!--Call Zone Child-->
			<xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
		</ul>
	</xsl:template>

	<!--Begin Zone Child-->
	<xsl:template match="Zone" mode="Zone1">
		<li class="main-nav-item">
			<a href="javascript:void(0)">
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
				<i class="lnr lnr-chevron-down"></i>
			</a>
			<div class="megamenu">
				<div class="row">
					<xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
				</div>
				<div class="row shipping-info">
					<div class="col-12"><i class="fa fa-shipping-fast"></i>
						<p>
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						</p>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Description"></xsl:value-of>
							</xsl:attribute>
							Tìm hiểu thêm
						</a>
					</div>
				</div>
				<div class="megamenu-background"></div>
			</div>
		</li>
	</xsl:template>

	<xsl:template match="Zone" mode="Zone2">
		<div class="col-lg-2 megamenu-item">
			<img>
			<xsl:attribute name="src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			</img>
			<a class="megamenu-item-title">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				<i class="lnr lnr-layers"></i>
			</a>
			<ul>
				<xsl:apply-templates select="Zone" mode="Zone3"></xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="Zone" mode="Zone3">
		<li>
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
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>