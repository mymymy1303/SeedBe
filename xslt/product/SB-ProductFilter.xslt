<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="desktop-filter-nav">
			<div class="filter-nav ajaxfilterresponse">
				<div class="title">
					<h2>chọn lọc theo</h2>
				</div>
				<xsl:apply-templates select="/ProductFilter/Group"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Group">
		<div class="filter">
			<div class="name">
				<span>
					<xsl:value-of select="Title"></xsl:value-of>
				</span>
				<i class="lnr lnr-chevron-down"></i>
			</div>
			<div class="attributes">
				<xsl:choose>
					<xsl:when test="FieldType='1'">
						<xsl:attribute name="class">
							<xsl:text>attributes filter-color</xsl:text>
						</xsl:attribute>
						<xsl:apply-templates select="Option" mode="Color"></xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="Option" mode="Default"></xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Option" mode="Color">
		<a class="ajaxlink">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>ajaxlink active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="style">
				<xsl:text>background-color:</xsl:text>
				<xsl:value-of select="Color"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		</a>
	</xsl:template>

	<xsl:template match="Option" mode="Default">
		<a class="ajaxlink">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>ajaxlink active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</a>
	</xsl:template>

</xsl:stylesheet>