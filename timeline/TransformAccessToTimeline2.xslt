<?xml version="1.0" encoding="UTF-8"?>
<?altova_samplexml E:\timeline\test.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <data date-time-format="iso8601">
      <xsl:for-each select="dataroot/Products_Basic">
        <event>
          <xsl:attribute name="start">
            <xsl:value-of select="ReleaseDate"/>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="ModelName"/>
          </xsl:attribute>
        </event>
      </xsl:for-each>
    </data>
  </xsl:template>
</xsl:stylesheet>
