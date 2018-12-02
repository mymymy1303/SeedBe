<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<!--<FAQsList>
    <ModuleTitle>Hỏi đáp</ModuleTitle>
    <PageTitle>Hỏi đáp</PageTitle>
    <SubmitLink>Hỏi đáp</SubmitLink>
    <Culture>vi-VN</Culture>
    <FAQs>
      <Question>Câu hỏi</Question>
      <Answer>Trả lời</Answer>
      <Viewed>0</Viewed>
    </FAQs>
  </FAQsList>-->

	<xsl:template match="/">
		<div style="display: flex">
			<div class="tagline-5">
				<div class="title">
					<h1>
						<xsl:value-of select="/FAQsList/ZoneTitle"></xsl:value-of>
					</h1>
				</div>
			</div>
			<div class="sort">
				<select bg-img="/Data/Sites/1/skins/default/img/global/selectarrow.png">
					<option>Sắp xếp theo</option>
					<option>Giá</option>
				</select>
			</div>
		</div>
		<div class="content">
			<xsl:apply-templates select="/FAQsList/FAQs"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="FAQs">
		<h2>
			<xsl:value-of select="Question" disable-output-escaping="yes"></xsl:value-of>
		</h2>
		<p>
			<xsl:value-of select="Answer" disable-output-escaping="yes"></xsl:value-of>
		</p>
		<br></br>
		<br></br>
	</xsl:template>
</xsl:stylesheet>