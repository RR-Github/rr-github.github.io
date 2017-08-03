<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:for-each select="//row">
			<xsl:element name="div">
				<xsl:attribute name="id">pid<xsl:value-of select="@PropertyId" /></xsl:attribute>
				<xsl:attribute name="class">listing-panel-map<xsl:if test="/PropertyListings/@isAuctionEngine = 'true' and @IsAuction = '1' and @AuctionEnabled = '1'"> Auction</xsl:if></xsl:attribute>
				<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">title-row-map</xsl:attribute>
					<xsl:element name="div">
						<xsl:attribute name="class">project-name-panel project-name-panel-map</xsl:attribute>
						<xsl:element name="a">
							<xsl:attribute name="href"><xsl:value-of select="/PropertyListings/@loginLink" /></xsl:attribute>
							<xsl:attribute name="title">Login to view additional information.</xsl:attribute>
							<xsl:value-of select="substring(@Name, 1, 45)" /><xsl:if test="string-length(@Name) &gt; 45">&#8230;</xsl:if>
						</xsl:element>
					</xsl:element>	
					<xsl:element name="div"><xsl:attribute name="style">clear: both;</xsl:attribute></xsl:element>	
				</xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">project-image-panel</xsl:attribute>
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="/PropertyListings/@loginLink" /></xsl:attribute>
						<xsl:attribute name="title">Login to view additional information.</xsl:attribute>
						<xsl:element name="img">
							<xsl:attribute name="id">img<xsl:value-of select="@PropertyId" /></xsl:attribute>
							<xsl:attribute name="class">project-image</xsl:attribute>
							<xsl:attribute name="src"><xsl:value-of select="@largeimageurl" /></xsl:attribute>
							<xsl:attribute name="alt"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">project-fields-panel</xsl:attribute>
					<xsl:element name="div">
						<xsl:element name="div"><xsl:attribute name="class">field-label</xsl:attribute>Auction:</xsl:element>
						<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute>#<xsl:value-of select="@PropertyId" /></xsl:element>
						<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
						<xsl:if test="@ShowProjectType = 1 and @PropertyType != ''">
							<xsl:element name="div"><xsl:attribute name="class">field-label</xsl:attribute>Type:</xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute><xsl:value-of select="substring-before(@PropertyType,' - ')" /></xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
						</xsl:if>
						<xsl:if test="@ShowSquareFeet = 1 and @Size != ''">
							<xsl:element name="div"><xsl:attribute name="class">field-label</xsl:attribute>Size:</xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute><xsl:value-of select="format-number(@Size, '###,###')" />&#160;SqFt</xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
						</xsl:if>
						<xsl:if test="@ShowUnits = 1 and @Units != ''">
							<xsl:element name="div"><xsl:attribute name="class">field-label</xsl:attribute><xsl:value-of select="@UnitsLabel" />:</xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute><xsl:value-of select="format-number(@Units, '###,###.##')" /></xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
						</xsl:if>
						<xsl:if test="@ShowParcelSize = 1 and @ParcelSize != ''">
							<xsl:element name="div"><xsl:attribute name="class">field-label</xsl:attribute>Lot Size:</xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute><xsl:value-of select="format-number(@ParcelSize, '###,###.##')" />&#160;Acre<xsl:if test="@ParcelSize &gt; 1 or @ParcelSize &lt; 1">s</xsl:if></xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
						</xsl:if>
					</xsl:element>
					<xsl:element name="a">
						<xsl:attribute name="class">more-info-button rounded-corners noPrint</xsl:attribute>
						<xsl:attribute name="href"><xsl:value-of select="/PropertyListings/@loginLink" /></xsl:attribute>
						<xsl:attribute name="title">Login to view additional information.</xsl:attribute>
						More Info
					</xsl:element>
				</xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">contact-panel</xsl:attribute>
					<xsl:for-each select="./Contact">
						<xsl:element name="div">
							<xsl:attribute name="class">individual-contact-panel</xsl:attribute>
							<xsl:element name="div">
								<xsl:element name="a">
									<xsl:attribute name="href">javascript: void(0);</xsl:attribute>
									<xsl:attribute name="onclick">
										<xsl:value-of select="@Compose" />return false;</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="@Email" />
									</xsl:attribute>
									<xsl:value-of select="@FirstName" />&#160;<xsl:value-of select="@LastName" />
								</xsl:element>
							</xsl:element>
							<xsl:element name="div">
								<xsl:value-of select="@Company" />
							</xsl:element>
							<xsl:element name="div">
								<xsl:if test="../@ShowPhone = 1 and @Phone != ''">
								   <xsl:choose>
									 <xsl:when test="string-length(@Phone) = 10">
										  (<xsl:value-of  select="substring(@Phone,1,3)"/>)&#160;<xsl:value-of  select="substring(@Phone,4,3)"/>-<xsl:value-of  select="substring(@Phone,7,4)"/>
									 </xsl:when>
									 <xsl:when test="string-length(@Phone) = 7">
										  <xsl:value-of  select="substring(@Phone,1,3)"/>-<xsl:value-of  select="substring(@Phone,4,4)"/>
									 </xsl:when>
									 <xsl:otherwise>
										  <xsl:value-of select="@Phone"/>
									 </xsl:otherwise>
								   </xsl:choose>
								</xsl:if>
							</xsl:element>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
