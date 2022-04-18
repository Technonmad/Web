<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
            </head>
            <body>
                <div class="row">
                    <div class="col-4">
                        <div class="list-group sticky-top" id="list-tab" role="tablist">
                            <xsl:for-each select="ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Dictionaries/Dictionary">
                                <xsl:if test="@Code = 'Genre'">
                                    <xsl:for-each select="DictionaryItem">
                                        <a class="list-group-item list-group-item-action" id="list-{@Code}-list" data-bs-toggle="list" href="#list-{@Code}" role="tab" aria-controls="list-{@Code}"><xsl:value-of select="Name"/></a>
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:for-each>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="tab-content inline" id="nav-tabContent">
                            <xsl:for-each select="ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Dictionaries/Dictionary">
                                <xsl:if test="@Code = 'Genre'">
                                    <xsl:for-each select="DictionaryItem">
                                        <div class="tab-pane fade show active" id="list-{@Code}" role="tabpanel" aria-labelledby="list-{@Code}-list">
                                            <div class="row row-cols-1 row-cols-md-2 g-4">
                                                <xsl:for-each select="Elements/Element">
                                                    <xsl:variable name="thisGameId" select="@ID"/>
                                                    <div class="card mb-2" style="max-width: 540px;">
                                                        <div class="row g-0">
                                                            <div class="col-md-4">
                                                                <img src="{/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Images/Image[@Type='logo190x140']}" class="img-fluid rounded-start" alt=""/>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="card-body">
                                                                    <h5 class="card-title"><xsl:value-of select="/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Name"/></h5>
                                                                    <p class="card-text"><xsl:value-of select="/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Properties/Property[@Code='Description80']"/></p>
                                                                    <p class="card-text">
                                                                        <small class="text-muted">
                                                                            <a href="{/ALAWAR_EXPORT/Languages/Language/Catalogs/Catalog/Items/Item[@ID=$thisGameId]/Properties/Property[@Code='OrderUrl']}">
                                                                                Ссылка на игру
                                                                            </a>
                                                                        </small>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </xsl:for-each>
                                            </div>
                                        </div>
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>