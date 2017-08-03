<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/">
        <xsl:for-each select="//row">
            <xsl:element name="div">
                <xsl:attribute name="id">pid<xsl:value-of select="@PropertyId" /></xsl:attribute>
                <xsl:attribute name="name">ListingPanel</xsl:attribute>
                <xsl:attribute name="class">ListingPanel</xsl:attribute>
                <xsl:attribute name="PropertyName"><xsl:value-of select="@Name" /></xsl:attribute>
                <xsl:attribute name="PropertyType"><xsl:value-of select="@PropertyType" /></xsl:attribute>
                <xsl:attribute name="PropertyCity"><xsl:value-of select="@City" /></xsl:attribute>
                <xsl:attribute name="PropertyState"><xsl:value-of select="@StateAbbr" /></xsl:attribute><xsl:attribute name="ProjectType"><xsl:value-of select="@ProjectType" /></xsl:attribute><xsl:attribute name="LoanTypes"><xsl:value-of select="@LoanTypes" /></xsl:attribute><xsl:attribute name="LoanPerformance"><xsl:value-of select="@LoanPerformance" /></xsl:attribute><xsl:attribute name="LoanInterestType"><xsl:value-of select="@LoanInterestType" /></xsl:attribute>
                <xsl:attribute name="LoanTypes"><xsl:value-of select="@LoanTypes" /></xsl:attribute>
                <xsl:attribute name="LoanPerformance"><xsl:value-of select="@LoanPerformance" /></xsl:attribute>
                <xsl:attribute name="LoanInterestType"><xsl:value-of select="@LoanInterestType" /></xsl:attribute>
				  <!-- Alternate the class on every other row -->
                <xsl:choose>
                    <xsl:when test="position() mod 2 != 1">
                        <xsl:attribute name="class">ListingPanelGray</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">ListingPanel</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
               
                <!-- <xsl:element name="div">
                    <xsl:attribute name="class">propstatus</xsl:attribute>
                    <xsl:value-of select="@Status" />
                </xsl:element> -->
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
							<xsl:if test="substring(@propertylink, 1, 17) != 'javascript: alert'">
								<xsl:attribute name="onclick">ExecutiveSummaryClick(&quot;<xsl:value-of select="/PropertyListings/@engineProjectName" />&quot;, &quot;<xsl:value-of select="@CleanName" />&quot;);</xsl:attribute>
							</xsl:if>
                        </xsl:if>
                        <xsl:if test="@propertylinkTarget != ''">
                            <xsl:attribute name="target"><xsl:value-of select="@propertylinkTarget" /></xsl:attribute>
                        </xsl:if>
                        <xsl:element name="img">
                            <xsl:attribute name="class">PropertyThumbnail</xsl:attribute>
                            <xsl:attribute name="src">
                                <xsl:value-of select="@largeimageurl" />
                            </xsl:attribute>
                            <xsl:attribute name="alt"></xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
				<xsl:element name="div">
                    <xsl:attribute name="class">propstatus</xsl:attribute>
                    <xsl:value-of select="@Status" />
					</xsl:element>
				 <xsl:element name="div">
                    <xsl:attribute name="class">fl2</xsl:attribute>
					 <xsl:attribute name="style">margin-top:-4px;</xsl:attribute> 
                    <xsl:choose>
                        <xsl:when test="@propertylink != ''">
                            <xsl:element name="a">
                                <xsl:attribute name="class">PropertyNameAnchor ProjectName</xsl:attribute>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@propertylink" />
                                </xsl:attribute>
                                <xsl:attribute name="title">
                                    <xsl:value-of select="@propertylinktooltip" />
                                </xsl:attribute>
								<xsl:if test="substring(@propertylink, 1, 17) != 'javascript: alert'">
									<xsl:attribute name="onclick">ExecutiveSummaryClick(&quot;<xsl:value-of select="/PropertyListings/@engineProjectName" />&quot;, &quot;<xsl:value-of select="@CleanName" />&quot;);</xsl:attribute>
								</xsl:if>
                                <xsl:if test="@propertylinkTarget != ''">
                                    <xsl:attribute name="target">
                                        <xsl:value-of select="@propertylinkTarget" />
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="@Name" />
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">fl</xsl:attribute>
							<xsl:attribute name="style">float:none;margin-top:-4px;</xsl:attribute>
							<xsl:element name="span">
								<xsl:attribute name="class">ProjectName</xsl:attribute>
								<xsl:value-of select="@Name" />
							</xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
				
                <xsl:element name="div">
                    <xsl:attribute name="class">propinfobox</xsl:attribute>
                    <xsl:element name="table">
                        <xsl:attribute name="class">propdata</xsl:attribute>
                        <xsl:element name="tr">
                            <xsl:element name="td">
							<xsl:attribute name="height">47</xsl:attribute>
							<!-- <xsl:attribute name="style">width:1240px</xsl:attribute> -->
                                <xsl:attribute name="class">labelcol</xsl:attribute>
                                
                            
                                    <xsl:choose>
										<!-- <xsl:when test="string-length(@PropertyType) > 40"> -->
										 <xsl:when test="@PropertyType != ''">
										   <xsl:element name="div"><xsl:attribute name="class">labels</xsl:attribute>
								
                                  Type:
                                </xsl:element>
								    <xsl:element name="div">
								<xsl:attribute name="style">width:350px; width:auto !ie7;</xsl:attribute>
								<xsl:attribute name="class">labels2</xsl:attribute>
											<xsl:value-of select="substring(@PropertyType, 1, 40)" />
											</xsl:element>
										</xsl:when>
										<xsl:otherwise>
								
											<xsl:value-of select="@PropertyType" />
										</xsl:otherwise>
									</xsl:choose>
                                
                                <xsl:if test="@ShowCity = 1 or @ShowState = 1">
                                    <xsl:element name="div">
                                        <xsl:attribute name="class">labels</xsl:attribute>
                                        Location: 
                                    </xsl:element>
                                    <xsl:element name="div">
									<xsl:attribute name="style">width:350px; width:auto !ie7;</xsl:attribute>
									<xsl:attribute name="class">labels2</xsl:attribute>
                                        <xsl:if test="@ShowCity = 1 and @City != ''">
                                            <xsl:value-of select="@City" />, 
                                        </xsl:if>
                                        <xsl:if test="@ShowState = 1 and @StateAbbr != ''">
                                            <xsl:value-of select="@StateAbbr" />
                                        </xsl:if>
                                    </xsl:element>
                                </xsl:if>
                              
                                
                            </xsl:element>
							
							
							<xsl:element name="td">
							<xsl:attribute name="style"></xsl:attribute>
							<xsl:attribute name="height">47</xsl:attribute>
                                <xsl:attribute name="class">labelcol</xsl:attribute>
                               
                                
                            
                                <xsl:if test="@ShowValue = 1 and @AskingPrice != ''">
                                    <xsl:element name="div">
                                        <xsl:attribute name="class">labels</xsl:attribute>
                                        Asking&#160;Price:
                                    </xsl:element>
                                    <xsl:element name="div">
									<xsl:attribute name="class">labels2</xsl:attribute>
                                        $<xsl:value-of select="format-number(@AskingPrice, '###,###')" />
                                    </xsl:element>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="(@Type = 'Office' or @Type = 'Retail' or @Type = 'Recreational / Specialty / Other' or (@Type = 'Medical Facilities' and @Description = 'Hospital') or (@Type = 'Industrial' and (@Description != 'Parking' and @Description != 'Self Storage'))) and @ShowSquareFeet = 1 and @SqFt &gt; 0">
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">labels</xsl:attribute>
                                            Size: 
                                        </xsl:element>
                                        <xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
                                            <xsl:value-of select="format-number(@SqFt, '###,###')" />&#160;SqFt
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="(@Type = 'Land') and @ShowParcelSize = 1 and @ParcelSize &gt; 0">
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">labels</xsl:attribute>
                                            Size: 
                                        </xsl:element>
                                        <xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
                                            <xsl:choose>
                                                    <xsl:when test="@ParcelSize = 1">
                                                        <xsl:value-of select="format-number(@ParcelSize, '###,###.##')" />&#160;Acre
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="format-number(@ParcelSize, '###,###.##')" />&#160;Acres
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="(@Type = 'Hospitality' or @Type = 'Multi-family' or (@Type = 'Industrial' and (@Description = 'Parking' or @Description = 'Self Storage')) or (@Type = 'Medical Facilities' and @Description = 'Congregate Care / Convalescent') or (@Type = 'Medical Facilities' and @Description = 'Hospital')) and @ShowUnits = 1 and @Units &gt; 0">
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">labels</xsl:attribute>
                                            <xsl:value-of select="@UnitsLabel" />:
                                        </xsl:element>
                                        <xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
                                            <xsl:value-of select="format-number(@Units, '###,###')" />
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:when test="(@Type = 'Hospitality' or @Type = 'Multi-family' or (@Type = 'Industrial' and (@Description = 'Parking' or @Description = 'Self Storage')) or (@Type = 'Medical Facilities' and @Description = 'Congregate Care / Convalescent')) and @ShowSquareFeet = 1 and @SqFt &gt; 0">
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">labels</xsl:attribute>
                                            Size:
                                        </xsl:element>
                                        <xsl:element name="div">
										<xsl:attribute name="class">labels2</xsl:attribute>
                                            <xsl:value-of select="format-number(@SqFt, '###,###')" />&#160;SqFt
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
										
							
                            <xsl:element name="td">
							<xsl:attribute name="height">47</xsl:attribute>
							<!-- <xsl:attribute name="style">width:170px</xsl:attribute> -->
                                <xsl:attribute name="rowspan">2</xsl:attribute>
                                <xsl:attribute name="class">contacts</xsl:attribute>
								<!-- <xsl:element name="div">
                    <xsl:attribute name="class">propstatus</xsl:attribute>
                    <xsl:value-of select="@Status" />
                </xsl:element> -->
                                    
                                    <xsl:for-each select="./Contact">
								<xsl:element name="div">
									<xsl:attribute name="style">color:#0000000 !important;font-weight:bold;width:190px;</xsl:attribute>
								
                                        <xsl:value-of select="@Company"/>
                                    </xsl:element>
                                        <xsl:element name="div">
                                            <xsl:value-of select="@FirstName" />&#160;<xsl:value-of select="@LastName" />
                                        </xsl:element>
                                    </xsl:for-each>  
                            </xsl:element>
                        </xsl:element>
						<!--  <xsl:element name="tr">
                            <xsl:element name="td">
							 <xsl:attribute name="style">width:700px;</xsl:attribute>
							
							 <xsl:attribute name="colspan">3</xsl:attribute>
                               <xsl:attribute name="class">sumcol</xsl:attribute> 
                                
                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                            </xsl:element>
                        </xsl:element> -->

                      				<xsl:element name="tr">
							<xsl:element name="td">
								<xsl:attribute name="colspan">2</xsl:attribute>
								<xsl:attribute name="class">sumcol</xsl:attribute>
								<xsl:element name="div">
									<xsl:attribute name="class">sumstuff</xsl:attribute>
								<!--Description:-->
								</xsl:element>
								<xsl:if test="@ShowSummary = 1 and @Summary != ''">
									<xsl:element name="div">
										<xsl:attribute name="class">summary</xsl:attribute>

										<xsl:value-of select="@Summary" />
									</xsl:element>
								</xsl:if>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:element>
						</xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
		<script type="text/javascript">
		<![CDATA[
			function ExecutiveSummaryClick(engineName, projectName) {
				pageTracker._trackEvent(engineName, 'ExecutiveSummary', projectName);
			}
			function ContactClick(engineName, projectName, contact) {
				pageTracker._trackEvent(engineName, 'Contact', projectName + " - " + contact);
			}
			function ContactClick(engineName, projectName, contact) {
				pageTracker._trackEvent(engineName, 'Contact', projectName + " - " + contact);
			}
		]]>
		</script>	
    </xsl:template>
</xsl:stylesheet>