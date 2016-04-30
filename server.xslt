<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="port"/>
  <xsl:output omit-xml-declaration="yes"/>

  <xsl:template match="node()|@*">
     <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
     </xsl:copy>
  </xsl:template>

  <xsl:template match="//Server/Service/Connector[@protocol='HTTP/1.1']/@port">
    <xsl:attribute name="{name()}"><xsl:value-of select="$port"/></xsl:attribute>
  </xsl:template>
  
  <xsl:template match="//Server/Service/Connector[@protocol='HTTP/1.1']/@redirectPort">
    <xsl:attribute name="{name()}"><xsl:value-of select="$port+1"/></xsl:attribute>
  </xsl:template>
  
  <xsl:template match="//Server/Service/Connector[@protocol='AJP/1.3']/@port">
    <xsl:attribute name="{name()}"><xsl:value-of select="$port+2"/></xsl:attribute>
  </xsl:template>
  
  <xsl:template match="//Server/Service/Connector[@protocol='AJP/1.3']/@redirectPort">
    <xsl:attribute name="{name()}"><xsl:value-of select="$port+3"/></xsl:attribute>
  </xsl:template>
  
  <xsl:template match="//Server/@port">
    <xsl:attribute name="{name()}"><xsl:value-of select="$port+4"/></xsl:attribute>
  </xsl:template>


</xsl:stylesheet>
