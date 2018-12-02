<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin News-->
	<xsl:template match="/">
		<section class="blogs-detail-1">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-xl-9">
						<div class="title">
							<h1>
								<xsl:value-of select="/NewsDetail/Title"></xsl:value-of>
								<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
							</h1>
						</div>
						<div class="timeline">
							<div class="social">
								<xsl:value-of select="/NewsDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
								<xsl:value-of select="/NewsDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
								<xsl:value-of select="/NewsDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
							</div>
							<div class="time">
								<i class="fas fa-calendar-alt"></i>
								<xsl:value-of select="/NewsDetail/CreatedDate"></xsl:value-of>
							</div>
						</div>
						<div class="content">
							<xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
						</div>
						<div class="timeline">
							<div class="social">
								<xsl:value-of select="/NewsDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
								<xsl:value-of select="/NewsDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
								<xsl:value-of select="/NewsDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
							</div>
							<div class="time">
								<i class="fas fa-calendar-alt"></i>
								<xsl:value-of select="/NewsDetail/CreatedDate"></xsl:value-of>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-xl-3 side-blog-detail-wrapper">
						<div class="side-blog-detail">
							<xsl:if test="count(/NewsDetail/NewsOther) > 0">
								<!--Call News Child-->
								<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
							</xsl:if>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<!--Begin News Other Child-->
	<xsl:template match="NewsOther">
		<!--item-->
		<div class="blog-detail-small">
			<div class="title">
				<h2>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</h2>
			</div>
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
				<figure>
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
				</figure>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>