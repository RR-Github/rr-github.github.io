<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<xsl:for-each select="//row">
			<!-- Each Propert Listing in a separate div -->
			<xsl:element name="div">
				<xsl:attribute name="id">pid<xsl:value-of select="@PropertyId" />
				</xsl:attribute>
				<xsl:attribute name="class">MapDescListingPanel</xsl:attribute>
				<!-- Alternate the class on every other row -->
				<xsl:attribute name="PropertyName">
					<xsl:value-of select="@Name" />
				</xsl:attribute>
				<xsl:attribute name="PropertyType">
					<xsl:value-of select="@PropertyType" />
				</xsl:attribute>
				<xsl:attribute name="PropertyCity">
					<xsl:value-of select="@City" />
				</xsl:attribute>
				<xsl:attribute name="PropertyState">
					<xsl:value-of select="@StateAbbr" />
				</xsl:attribute>
				<xsl:attribute name="ProjectType">
					<xsl:value-of select="@ProjectType" />
				</xsl:attribute>
				<xsl:attribute name="LoanTypes">
					<xsl:value-of select="@LoanTypes" />
				</xsl:attribute>
				<xsl:attribute name="LoanPerformance">
					<xsl:value-of select="@LoanPerformance" />
				</xsl:attribute>
				<xsl:attribute name="LoanInterestType">
					<xsl:value-of select="@LoanInterestType" />
				</xsl:attribute>
				<xsl:attribute name="LoanTypes">
					<xsl:value-of select="@LoanTypes" />
				</xsl:attribute>
				<xsl:attribute name="LoanPerformance">
					<xsl:value-of select="@LoanPerformance" />
				</xsl:attribute>
				<xsl:attribute name="LoanInterestType">
					<xsl:value-of select="@LoanInterestType" />
				</xsl:attribute>
				<xsl:element name="table">
					<xsl:attribute name="class">HeaderTable</xsl:attribute>
					<xsl:attribute name="width">100%</xsl:attribute>
					<xsl:element name="tr">
						<xsl:element name="td">
							<xsl:attribute name="class">HeaderTable</xsl:attribute>
							<xsl:attribute name="width">50%</xsl:attribute>
							<xsl:element name="div">
								<xsl:choose>
									<xsl:when test="@propertylink != ''">
										<xsl:element name="a">
											<xsl:attribute name="class">PropertyNameAnchor</xsl:attribute>
											<xsl:attribute name="href">
												<xsl:value-of select="@propertylink" />
											</xsl:attribute>
											<xsl:attribute name="title">
												<xsl:value-of select="@propertylinktooltip" />
											</xsl:attribute>
											<xsl:if test="@propertylinkTarget != ''">
												<xsl:attribute name="target">
													<xsl:value-of select="@propertylinkTarget" />
												</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="@Name" />
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">fl HeaderPropertyName</xsl:attribute>
										<xsl:value-of select="@Name" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:element>
						<xsl:element name="td">
							<xsl:attribute name="class">HeaderTable</xsl:attribute>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">cb</xsl:attribute>
				</xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">fl</xsl:attribute>
					<xsl:element name="a">
						<xsl:if test="@propertylink != ''">
							<xsl:attribute name="href">
								<xsl:value-of select="@propertylink" />
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="@propertylinktooltip" />
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="@propertylinkTarget != ''">
							<xsl:attribute name="target">
								<xsl:value-of select="@propertylinkTarget" />
							</xsl:attribute>
						</xsl:if>
						<xsl:element name="img">
							<xsl:attribute name="class">dukei</xsl:attribute>
							<xsl:attribute name="src">
								<xsl:value-of select="@imageurl" />
							</xsl:attribute>
							<xsl:attribute name="alt"/>
						</xsl:element>
					</xsl:element>
					<xsl:element name="div">
						<xsl:attribute name="class">cb</xsl:attribute>
					</xsl:element>
				</xsl:element>
				<xsl:element name="div">
					<xsl:attribute name="class">propinfobox</xsl:attribute>
					<xsl:element name="table">
						<xsl:attribute name="class">propdata</xsl:attribute>
						<xsl:element name="tr">
<!--						
							<xsl:element name="td">
								<xsl:attribute name="valign">top</xsl:attribute>
								<xsl:attribute name="class">labelcol1</xsl:attribute>
								<xsl:element name="div">
									<xsl:attribute name="class">labels</xsl:attribute>
										Type: 
								</xsl:element>
								<xsl:element name="div">
									<xsl:value-of select="substring-before(@PropertyType,' - ')" />
								</xsl:element>
								<xsl:if test="@ShowCity = 1 or @ShowState = 1">
									<xsl:element name="div">
										<xsl:attribute name="class">labels</xsl:attribute>
                                        Address: 
									</xsl:element>
									<xsl:element name="div">
										<xsl:value-of select="@Address" />
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:element>
								</xsl:if>
								<xsl:element name="div">
									<xsl:attribute name="class">labels</xsl:attribute>
                                        City: 
								</xsl:element>
								<xsl:element name="div">									
									<xsl:if test="@ShowCity = 1 and @City != ''">
										<xsl:value-of select="@City" />, 
									</xsl:if>
									<xsl:if test="@ShowState = 1 and @StateAbbr != ''">
										<xsl:value-of select="@StateAbbr" />
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</xsl:element>
							</xsl:element>
-->							
							<xsl:element name="td">
								<xsl:attribute name="valign">top</xsl:attribute>
								<xsl:attribute name="class">labelcol2</xsl:attribute>
								<xsl:if test="@ShowSquareFeet = 1">
									<xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
											Size: 
									</xsl:element>
									<xsl:element name="div">
										<xsl:value-of select="format-number(@SqFt, '###,###')" />&#160;SqFt
									</xsl:element>
								</xsl:if>
								<xsl:if test="@ShowOccupancy = 1">
									<xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
										Occupancy: 
									</xsl:element>
									<xsl:element name="div">
										<xsl:choose>
											<xsl:when test="@Occupancy &gt; 0">
												<xsl:value-of select="@Occupancy" />&#160;%
											</xsl:when>
											<xsl:otherwise>
												N/A
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:if>
								<xsl:if test="@ShowParcelSize = 1">
									<xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
										Parcel&#160;Size: 
									</xsl:element>
									<xsl:element name="div">
										<xsl:choose>
											<xsl:when test="@ParcelSize and @ParcelSize &gt; 1">
												<xsl:value-of select="format-number(@ParcelSize, '###,###.##')" />&#160;Acres
											</xsl:when>
											<xsl:when test="@ParcelSize and @ParcelSize = 1">
												<xsl:value-of select="format-number(@ParcelSize, '###,###.##')" />&#160;Acre
											</xsl:when>
											<xsl:otherwise>
												N/A
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:if>
								<xsl:if test="@ShowUnits = 1 and @UnitsLabel">
									<xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
										<xsl:value-of select="@UnitsLabel" />:
									</xsl:element>
									<xsl:element name="div">
										<xsl:choose>
											<xsl:when test="@Units &gt; 0">
												<xsl:value-of select="format-number(@Units, '###,###')" />
											</xsl:when>
											<xsl:otherwise>
												N/A
											</xsl:otherwise>
										</xsl:choose>
									</xsl:element>
								</xsl:if>
							</xsl:element>
							<xsl:element name="td">
								<xsl:attribute name="rowspan">2</xsl:attribute>
								<xsl:attribute name="class">contacts</xsl:attribute>
								<xsl:for-each select="./Contact"> 
									<xsl:element name="div">
										<xsl:element name="img">
											<xsl:attribute name="src">
													https://my.rcm1.com/files/T2H4B5VV6hyYv8UkGoEDu7teJW_bN9zCCt6liAQsrvVApgIco7iCBGLofASWI3fA.png
											</xsl:attribute>
											<xsl:attribute name="alt"/>
										</xsl:element>
										<xsl:element name="a">
											<xsl:attribute name="href">
													#
											</xsl:attribute>
											<xsl:attribute name="onclick">
												<xsl:value-of select="@Compose" />return false;</xsl:attribute>
											<xsl:attribute name="title">
												<xsl:value-of select="@Email" />
											</xsl:attribute>
											<xsl:value-of select="@FirstName" />&#160;<xsl:value-of select="@LastName" />
										</xsl:element>
									</xsl:element>
									<xsl:element name="div">
										<xsl:if test="../@ShowPhone = 1 and @Phone != ''">
											<xsl:element name="img">
												<xsl:attribute name="src">
														https://my.rcm1.com/files/T2H4B5VV6hyYv8UkGoEDuwJm13cOYN715yMOF6j537TSxbA7YE9Q8S_hzXdDYLYD.png
												</xsl:attribute>
												<xsl:attribute name="alt"/>
											</xsl:element>
											<xsl:value-of select="@Phone" />
										</xsl:if>
									</xsl:element>
								</xsl:for-each>  
							</xsl:element>
						</xsl:element>
						<xsl:if test="@Summary != ''">
							<xsl:element name="tr">
								<xsl:element name="td">
									<xsl:attribute name="colspan">2</xsl:attribute>
									<xsl:attribute name="class">sumcol</xsl:attribute>
									<xsl:element name="div"><xsl:attribute name="class">sumstuff</xsl:attribute>Description:</xsl:element>
									<xsl:element name="div"><xsl:attribute name="class">summary</xsl:attribute><xsl:value-of select="@Summary" /></xsl:element>
								</xsl:element>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:element>
				<xsl:element name="table">
					<xsl:attribute name="width">100%</xsl:attribute>
					<xsl:element name="tr">
						<xsl:element name="td">
							<xsl:attribute name="width">50%</xsl:attribute>
							<xsl:element name="div">
								<xsl:attribute name="style">float:left!important;color: #000000; padding-top: 4px;font-family: Arial; white-space: nowrap; color: #000000; font-size: 8pt; font-weight: bold;</xsl:attribute>
							</xsl:element>
						</xsl:element>
						<xsl:element name="td">
							<xsl:attribute name="align">right</xsl:attribute>
							<xsl:element name="div">
								<xsl:attribute name="style">text-align:right!important;width:100%;color: #5C9C54; padding-top: 4px;font-family: Arial; white-space: nowrap; font-size: 8pt; font-weight: bold;</xsl:attribute>
								<xsl:choose>
									<xsl:when test="@propertylink != ''">
										<xsl:element name="a">
											<xsl:attribute name="class">redlinks</xsl:attribute>
											<xsl:attribute name="href">
												<xsl:value-of select="@propertylink" />
											</xsl:attribute>
											<xsl:attribute name="title">
												<xsl:value-of select="@propertylinktooltip" />
											</xsl:attribute>

											<xsl:if test="@propertylinkTarget != ''">
												<xsl:attribute name="target">
													<xsl:value-of select="@propertylinkTarget" />
												</xsl:attribute>
											</xsl:if>
											Additional Information &gt;&gt;&gt;
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">fl HeaderPropertyName</xsl:attribute>&#160;
									</xsl:otherwise>
								</xsl:choose>
							</xsl:element>
						</xsl:element>
					</xsl:element>							
				</xsl:element>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>