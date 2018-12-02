<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin News-->
	<xsl:template match="/">
		<div class="tagline-3">
			<div class="title">
				<h1>Phối hợp kệ Tivi</h1>
			</div>
			<div class="social-share">
				<xsl:value-of select="/NewsDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
				<xsl:value-of select="/NewsDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
				<xsl:value-of select="/NewsDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
		<xsl:apply-templates select="/NewsDetail/NewsAttributes"></xsl:apply-templates>
		<div class="ytuong-2">
			<div class="tagline-4">
				<div class="title">
					<h2>Tìm hiểu thêm</h2>
				</div>
			</div>
			<div class="row">
				<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsAttributes">
		<xsl:choose>
			<xsl:when test="position() mod 5 = 1">
				<xsl:text disable-output-escaping="yes">&lt;div class=&quot;faq&quot;&gt;</xsl:text>
				<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
			</xsl:when>
			<xsl:when test="position() mod 5 = 2">
				<p class="ask">
					<span class="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<span class="content">
						<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</p>
			</xsl:when>
			<xsl:when test="position() mod 5 = 3">
				<p class="answer">
					<span class="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<span class="content">
						<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</p>
				<xsl:text disable-output-escaping="yes">&lt;div class=&quot;separator&quot;&gt;&lt;/div&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="position() mod 5 = 4">
				<p class="ask">
					<span class="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<span class="content">
						<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</p>
			</xsl:when>
			<xsl:when test="position() mod 5 = 0">
				<p class="answer">
					<span class="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<span class="content">
						<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</p>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="NewsOther">
		<div class="col-sm-4">
			<div class="news-other">
				<figure>
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
						<div class="box-zoom">
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
							<h3>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h3>
						</figcaption>
					</a>
				</figure>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>