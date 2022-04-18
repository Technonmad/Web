<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1>Топ 10 полководцев</h1>
                <ol>
                    <xsl:for-each select="generals/person">
                        <xsl:sort select="votes" order="descending"/>
                        <xsl:if test="votes &gt; 8802405">
                        <li>
                            <dl>
                                <dt>Имя: <xsl:value-of select="name"/></dt>
                                    <dd>Голосов: <xsl:value-of select="votes"/></dd>
                            </dl>
                        </li>
                        <br />
                        </xsl:if>
                    </xsl:for-each>
                </ol>
            </body>  
        </html>
    </xsl:template>
</xsl:stylesheet>