<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2><xsl:value-of select="rss/channel/title"/></h2>
                <dl>
                    <xsl:for-each select="rss/channel/item">
                        <dt>Заголовок: <xsl:value-of select="title"/></dt>
                            <dd>Анонс: <xsl:value-of select="pubDate"/></dd>
                    </xsl:for-each>
                </dl>
            </body>  
        </html>
    </xsl:template>
</xsl:stylesheet>