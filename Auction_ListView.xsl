<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:for-each select="//row">
			<xsl:element name="div">
				<xsl:attribute name="id">pid<xsl:value-of select="@PropertyId" /></xsl:attribute>
				<xsl:choose>
					<xsl:when test="@ProjectType = 'Loan Sale'">
						<xsl:attribute name="class">listing-panel-loan<xsl:if test="/PropertyListings/@isAuctionEngine = 'true' and @IsAuction = '1' and @AuctionEnabled = '1'"> Auction</xsl:if></xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
                       <xsl:attribute name="class">listing-panel<xsl:if test="/PropertyListings/@isAuctionEngine = 'true' and @IsAuction = '1' and @AuctionEnabled = '1'"> Auction</xsl:if></xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
						<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">title-row</xsl:attribute>
					<xsl:element name="div">
						<xsl:attribute name="class">project-name-panel</xsl:attribute>
						<xsl:element name="a">
							<xsl:attribute name="href"><xsl:value-of select="/PropertyListings/@loginLink" /></xsl:attribute>
							<xsl:attribute name="title">Login to view additional information.</xsl:attribute>
							<xsl:value-of select="substring(@Name, 1, 40)" /><xsl:if test="string-length(@Name) &gt; 40">&#8230;</xsl:if>
						</xsl:element>
					</xsl:element>
					<xsl:element name="div">
						<xsl:attribute name="class">assettype-panel</xsl:attribute>
						<xsl:if test="@ShowAssetType = 1 and @PropertyType != ''"><xsl:value-of select="substring(@PropertyType, 1, 40)" /><xsl:if test="string-length(@PropertyType) &gt; 40">&#8230;</xsl:if></xsl:if><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:element>			
					<xsl:element name="div">
						<xsl:attribute name="class">city-panel</xsl:attribute>
						<xsl:if test="@ShowCity = 1 and @City != ''"><xsl:value-of select="@City" /></xsl:if><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:element>			
					<xsl:element name="div">
						<xsl:attribute name="class">state-panel</xsl:attribute>
						<xsl:if test="@ShowState = 1 and @StateAbbr != ''"><xsl:value-of select="@StateAbbr" /></xsl:if><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</xsl:element>			
				</xsl:element>
				<xsl:choose>
					<xsl:when test="@ProjectType = 'Loan Sale'">
						<xsl:element name="div">
							<xsl:attribute name="class">project-image-panel-loan</xsl:attribute>
								<xsl:element name="div">
									<xsl:attribute name="class">ribbon-project-image-panel-loan-blue</xsl:attribute>
										<xsl:element name="div"><xsl:attribute name="class">ribbon-blue</xsl:attribute>LOAN</xsl:element>
								</xsl:element>
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
					</xsl:when>
					<xsl:otherwise>
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
                    </xsl:otherwise>
				</xsl:choose>
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
							<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute><xsl:value-of select="format-number(@Size, '###,###')" />&#160;<xsl:value-of select="@SizeType" /></xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
						</xsl:if>
						<xsl:if test="@ShowUnits = 1 and @Units != ''">
							<xsl:element name="div"><xsl:attribute name="class">field-label</xsl:attribute><xsl:value-of select="@UnitsLabel" />:</xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute><xsl:value-of select="format-number(@Units, '###,###.##')" /></xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">cb</xsl:attribute></xsl:element>
						</xsl:if>
						<xsl:if test="@ShowParcelSize = 1 and @ParcelSize != ''">
							<xsl:element name="div"><xsl:attribute name="class">field-label</xsl:attribute>Lot Size:</xsl:element>
							<xsl:element name="div"><xsl:attribute name="class">field-value</xsl:attribute><xsl:value-of select="format-number(@ParcelSize, '###,###.##')" />&#160;<xsl:value-of select="@ParcelType" /></xsl:element>
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
				<xsl:element name="div">
					<xsl:attribute name="class">bidding-panel</xsl:attribute>
					<xsl:element name="table">
						<xsl:attribute name="border">0</xsl:attribute>
						<xsl:attribute name="cellspacing">0</xsl:attribute>
						<xsl:attribute name="cellpadding">0</xsl:attribute>
						<xsl:element name="tr">
							<xsl:attribute name="id">BidRow</xsl:attribute>
							<xsl:attribute name="style">display: none;</xsl:attribute>
							<xsl:element name="td"><xsl:attribute name="width">100px</xsl:attribute><xsl:element name="span"><xsl:attribute name="id">BidLabel</xsl:attribute>Starting Bid:&#160;</xsl:element></xsl:element>
							<xsl:element name="td">$<xsl:element name="span"><xsl:attribute name="id">BidValue</xsl:attribute></xsl:element></xsl:element>
						</xsl:element>
						<xsl:element name="tr">
							<xsl:attribute name="id">TimeRemainingRow</xsl:attribute>
							<xsl:attribute name="style">display: none;</xsl:attribute>
							<xsl:element name="td">
								<xsl:element name="span"><xsl:attribute name="class">TimeRemainingLabel</xsl:attribute>Time Left:&#160;</xsl:element>
							</xsl:element>
							<xsl:element name="td">
								<xsl:element name="span"><xsl:attribute name="class">TimeRemainingValue</xsl:attribute>Calculating...</xsl:element>
							</xsl:element>
						</xsl:element>
						<xsl:element name="tr">
							<xsl:attribute name="id">StartDateRow</xsl:attribute>
							<xsl:attribute name="style">display: none;</xsl:attribute>
							<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">StartDateLabel</xsl:attribute>Auction Start:&#160;</xsl:element></xsl:element>
							<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">StartDateValue</xsl:attribute></xsl:element> Pacific</xsl:element>
						</xsl:element>
						<xsl:element name="tr">
							<xsl:attribute name="id">ReserveRow</xsl:attribute>
							<xsl:attribute name="style">display: none;</xsl:attribute>
							<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">ReserveLabel</xsl:attribute>Reserve:&#160;</xsl:element></xsl:element>
							<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">ReserveValue</xsl:attribute></xsl:element></xsl:element>
						</xsl:element>
						<xsl:element name="tr">
							<xsl:attribute name="id">PricePer</xsl:attribute>
							<xsl:attribute name="style">display: none;</xsl:attribute>
							<xsl:attribute name="data-price-per"><xsl:value-of select="@PricePer" /></xsl:attribute>
							<xsl:if test="@PricePer != 0 and ((@ShowSquareFeet = 1 and @Size != '') or (@ShowUnits = 1 and @Units != '') or (@ShowParcelSize = 1 and @ParcelSize != ''))">
								<xsl:choose>
									<xsl:when test="@PricePer = 1">
										<xsl:attribute name="data-value"><xsl:value-of select="@Size" /></xsl:attribute>
										<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">PricePerLabel</xsl:attribute>Price/<xsl:value-of select="@SizeType" />:&#160;</xsl:element></xsl:element>
										<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">PricePerValue</xsl:attribute></xsl:element></xsl:element>
									</xsl:when>
									<xsl:when test="@PricePer = 2">
										<xsl:attribute name="data-value"><xsl:value-of select="@Units" /></xsl:attribute>
										<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">PricePerLabel</xsl:attribute>Price/<xsl:value-of select="substring(@UnitsLabel, 1, (string-length(@UnitsLabel) - 1))" />:&#160;</xsl:element></xsl:element>
										<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">PricePerValue</xsl:attribute></xsl:element></xsl:element>
									</xsl:when>
									<xsl:when test="@PricePer = 3">
										<xsl:attribute name="data-value"><xsl:value-of select="@ParcelSize" /></xsl:attribute>
										<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">PricePerLabel</xsl:attribute>Price/<xsl:value-of select="@ParcelType" />:&#160;</xsl:element></xsl:element>
										<xsl:element name="td"><xsl:element name="span"><xsl:attribute name="id">PricePerValue</xsl:attribute></xsl:element></xsl:element>
									</xsl:when>
								</xsl:choose>
							</xsl:if>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>

