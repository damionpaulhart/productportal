<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">

    <data date-time-format="iso8601">

      <!--<p>
          <xsl:value-of select="ReleaseDate"/>
          </p>
        <p>
            <xsl:value-of select="ModelName"/>
        </p>-->

      <!--<xsl:for-each select="Products_Basic">
          <p>
            <xsl:value-of select="ReleaseDate"/>
          </p>
          <p>
            <xsl:value-of select="ModelName"/>
          </p>
        </xsl:for-each>-->

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


