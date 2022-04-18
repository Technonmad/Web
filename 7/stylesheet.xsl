<?xml version="1.0"  encoding ="UTF-8" ?>
<xsl:stylesheet version="1.0 " xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
       <html>
            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
            </head>
           <body>
                <div class="row">
                    <div class="col-4">
                        <div class="list-group sticky-top" id="list-tab" role="tablist">
                            <xsl:for-each select="TVGrid/Event/Date[not(.=preceding::*)]">
                                <a class="list-group-item list-group-item-action" id="list-{.}-list" data-bs-toggle="list" href="#list-{.}" role="tab" aria-controls="list-{.}"><xsl:value-of select="."/></a>
                            </xsl:for-each>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="tab-content" id="nav-tabContent">
                            <xsl:for-each select="TVGrid/Event/Date[not(.=preceding::*)]">
                                <xsl:variable name="i" select="."/>
                                <div class="tab-pane fade" id="list-{.}" role="tabpanel" aria-labelledby="list-{.}-list">
                                    <xsl:for-each select="/TVGrid/Event[Date=$i]">
                                        <span class="badge bg-primary">
                                            <xsl:value-of select="Start"/>
                                        </span>&#x2007;
                                        <xsl:value-of select="Title"/>
                                        <p><xsl:value-of select="Info"/></p>
                                    </xsl:for-each>
                                </div>
                                    
                                
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
           </body>
       </html>
   </xsl:template>
</xsl:stylesheet>