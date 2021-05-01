<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="happy.css"/>
            </head>
            <body>
                <p> See the source <a href="Chapter%207%20-%20New.xml"> XML </a> , <a href="HappyWomanNew.xsl">
                        XSLT</a> , and <a href="happy.css"> CSS </a></p>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>

    <xsl:template match="tei:emph">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <xsl:template match="tei:lg">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>

    <xsl:template match="tei:l">
       <l>
           <xsl:apply-templates/>
       </l>
    </xsl:template>

    <xsl:template match="tei:q">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>
    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:ptr">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute> *
        </xsl:element>
    </xsl:template>

<xsl:template match="tei:note">
    <xsl:element name="a">
        <xsl:attribute name="id">
            <xsl:value-of select="@xml:id"/>
        </xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute> *
    </xsl:element>
    <h4><xsl:apply-templates select="tei:idno"/></h4>
    <xsl:for-each select="tei:note">
        <p><xsl:apply-templates/></p>
    </xsl:for-each>
    
</xsl:template>
    


</xsl:stylesheet>
