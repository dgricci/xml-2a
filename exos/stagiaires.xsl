<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xml1-a="http://www.ensg.eu/xml1-a/0.0.1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xml1-a xsi"
                version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

<!-- depuis l'élément racine : -->
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#x0A;</xsl:text>
<html>
<xsl:call-template name="header"/>
<body>
<table border="1" style="width:100%">
<tr><th>Nom</th><th>Prénom</th><th>Employeur</th><th>Direction</th><th>Service</th><th>Fonction</th><th>LIEU DE TRAVAIL</th></tr>
<xsl:apply-templates select=".//xml1-a:personne"/>
</table>
</body>
</html>
</xsl:template>

<!-- calcul pour chaque personne : -->
<xsl:template match="xml1-a:personne">
<!-- on récupère l'identifiant du service -->
<xsl:variable name="i1" select="./@service"/>
<!-- on récupère l'identifiant du lieu de travail -->
<xsl:variable name="i2" select="./@lieu"/>
<!-- on récupère l'employeur qui contient le service : -->
<xsl:variable name="e" select="../xml1-a:employeurs/xml1-a:employeur[xml1-a:direction/xml1-a:service/@nom=$i1]"/>
<!-- on récupère la direction qui contient le service : -->
<xsl:variable name="d" select="$e/xml1-a:direction[xml1-a:service/@nom=$i1]"/>
<!-- on récupère le service de la personne : -->
<xsl:variable name="s" select="$d/xml1-a:service[@nom=$i1]"/>
<!-- on récupère le lieu de travail : -->
<xsl:variable name="l" select="../xml1-a:lieuxDeTravail/xml1-a:lieuDeTravail[@nom=$i2]"/>
<!-- on récupère l'adresse : -->
<xsl:variable name="a">
    <xsl:call-template name="_substituteFromWithTo_">
        <xsl:with-param name="string" select="$l/text()"/>
    </xsl:call-template>
</xsl:variable>
<tr>
<td><xsl:value-of select="./@nom"/></td>
<td><xsl:value-of select="./@prenom"/></td>
<td><xsl:value-of select="$e/@nom"/></td>
<td><xsl:value-of select="$d/@nom"/></td>
<td><xsl:value-of select="$s/@nom"/></td> <!-- c'est bien le bon service !  -->
<td><xsl:value-of select="./xml1-a:fonction/text()"/></td>
<td><xsl:copy-of select="$a"/></td>
</tr>
</xsl:template>

<!-- en-tête HTML : -->
<xsl:template name="header">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="author" content="XML1-a"/>
    <meta name="copyright" content="© 2009-2015 Institut National de l'Information Géographique et Forestière"/>
    <meta name="description" content="exercice 5 - transformation XSL"/>
    <meta name="keywords" content="XML XSD XSL"/>
    <title>Stagiaires</title>
</head>
</xsl:template>

<!-- substitue les chaînes from (défaut: \n) par les chaînes to (<br/>) : -->
<xsl:template name="_substituteFromWithTo_">
    <xsl:param name="string"/>
    <xsl:param name="from" select="'&#xA;'"/><!-- retour à la ligne -->
    <xsl:param name="to"><br/></xsl:param>
    <xsl:choose>
        <xsl:when test="contains($string, $from)">
            <xsl:variable name="preA" select="normalize-space(substring-before($string, $from))"/>
            <xsl:if test="string-length($preA) &gt; 0">
                <xsl:value-of select="$preA"/>
                <xsl:copy-of select="$to"/>
            </xsl:if>
            <xsl:call-template name="_substituteFromWithTo_">
                <xsl:with-param name="string" select="substring-after($string, $from)"/>
                <xsl:with-param name="from" select="$from"/>
                <xsl:with-param name="to" select="$to"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="normalize-space($string)"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>

