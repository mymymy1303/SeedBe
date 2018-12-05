<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--Begin News-->
	<xsl:template match="/">
		<section class="blog-1">
			<div class="container ajaxresponsewrap">
				<div class="row ajaxresponse">
					<xsl:if test="count(/NewsList/News) > 0">
						<!--Call News Child-->
						<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
					</xsl:if>
				</div>
				<div class="row">
					<div class="col-lg-8 col-xl-9">
						<xsl:if test="/NewsList/NextPageUrl!=''">
							<div class="viewmorelink">
								<a class="viewmore-btn ajaxpagerlinknews">
									<xsl:attribute name="href">
										<xsl:value-of select="/NewsList/NextPageUrl" />
									</xsl:attribute>
									<xsl:text>Xem thêm</xsl:text>
									<span class="lnr lnr-arrow-right"></span>
								</a>
							</div>
						</xsl:if>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="mobile-blog-form"></div>
						<div class="mobile-social-follow"></div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<!--Begin News Child-->
	<xsl:template match="News">
		<xsl:choose>
			<xsl:when test="position() = 1">
				<xsl:text disable-output-escaping="yes">&lt;div class=&quot;col-12 col-lg-8 col-xl-9&quot;&gt;</xsl:text>
				<div class="blog-big">
					<div class="title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="box-zoom">
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
							</div>
							<figcaption>
								<div class="description">
									<p>
										<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</p>
								</div>
								<div class="info">
									<div class="social">
										<xsl:value-of select="FacebookLike" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="PlusOne" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="TweetThis" disable-output-escaping="yes"></xsl:value-of>
									</div>
									<div class="timeline">
										<div class="time">
											<i class="fas fa-calendar-alt"></i>
											<span>
												<xsl:value-of select="CreatedDate"></xsl:value-of>
											</span>
										</div>
										<div class="viewmore">
											<span>Chi tiết</span>
											<i class="lnr lnr-arrow-right"></i>
										</div>
									</div>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:when>
			<xsl:when test="position() = 2">
				<div class="blog-big">
					<div class="title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="box-zoom">
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
							</div>
							<figcaption>
								<div class="description">
									<p>
										<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</p>
								</div>
								<div class="info">
									<div class="social">
										<xsl:value-of select="FacebookLike" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="PlusOne" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="TweetThis" disable-output-escaping="yes"></xsl:value-of>
									</div>
									<div class="timeline">
										<div class="time">
											<i class="fas fa-calendar-alt"></i>
											<span>
												<xsl:value-of select="CreatedDate"></xsl:value-of>
											</span>
										</div>
										<div class="viewmore">
											<span>Chi tiết</span>
											<i class="lnr lnr-arrow-right"></i>
										</div>
									</div>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:when>
			<xsl:when test="position() = 3">
				<div class="blog-big">
					<div class="title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="box-zoom">
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
							</div>
							<figcaption>
								<div class="description">
									<p>
										<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</p>
								</div>
								<div class="info">
									<div class="social">
										<xsl:value-of select="FacebookLike" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="PlusOne" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="TweetThis" disable-output-escaping="yes"></xsl:value-of>
									</div>
									<div class="timeline">
										<div class="time">
											<i class="fas fa-calendar-alt"></i>
											<span>
												<xsl:value-of select="CreatedDate"></xsl:value-of>
											</span>
										</div>
										<div class="viewmore">
											<span>Chi tiết</span>
											<i class="lnr lnr-arrow-right"></i>
										</div>
									</div>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
			</xsl:when>
			<xsl:when test="position() = 4">
				<xsl:text disable-output-escaping="yes">&lt;div class=&quot;col-12 col-lg-4 col-xl-3&quot;&gt;&lt;div
					class=&quot;side-blog&quot;&gt;</xsl:text>
				<div class="blog-small">
					<div class="title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="box-zoom">
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
							</div>
						</figure>
					</a>
				</div>
			</xsl:when>
			<xsl:when test="position() = 5">
				<div class="blog-small">
					<div class="title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="box-zoom">
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
							</div>
						</figure>
					</a>
				</div>
			</xsl:when>
			<xsl:when test="position() = 6">
				<div class="blog-small">
					<div class="title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="box-zoom">
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
							</div>
						</figure>
					</a>
				</div>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;div class=&quot;desktop-blog-form&quot;&gt;&lt;/div&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;div class=&quot;desktop-social-follow&quot;&gt;&lt;/div&gt;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<div class="blog-big">
					<div class="title">
						<h2>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h2>
					</div>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="box-zoom">
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
							</div>
							<figcaption>
								<div class="description">
									<p>
										<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
									</p>
								</div>
								<div class="info">
									<div class="social">
										<xsl:value-of select="FacebookLike" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="PlusOne" disable-output-escaping="yes"></xsl:value-of>
										<xsl:value-of select="TweetThis" disable-output-escaping="yes"></xsl:value-of>
									</div>
									<div class="timeline">
										<div class="time">
											<i class="fas fa-calendar-alt"></i>
											<span>
												<xsl:value-of select="CreatedDate"></xsl:value-of>
											</span>
										</div>
										<div class="viewmore">
											<span>Chi tiết</span>
											<i class="lnr lnr-arrow-right"></i>
										</div>
									</div>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>