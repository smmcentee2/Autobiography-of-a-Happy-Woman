<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>


    <xsl:template match="/"> 
        <html>
               <head>
                   <link rel="stylesheet" type="text/css" href="Happy_woman.css"/>
               </head>
            <body>
                <p> source <a href="final%20project.xml">XML</a>, <a href="HappyWoman.xsl">
                    XSLT</a>, and <a href="Happy.css"> CSS</a> </p>
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
        <xsl:apply-templates/>
        <l/>
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
            <xsl:attribute name="href"><xsl:value-of select="@target"/>
            </xsl:attribute>*</xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
   

    <xsl:template match="tei:note">
        <xsl:choose>
            <xsl:when test="contains(@type, 'authorial')">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <h4>
                    <xsl:apply-templates select="tei:idno"/>
                    <xsl:element name="a"> <xsl:attribute name="id"> <xsl:value-of select="@xml:id"
                    /> </xsl:attribute> <xsl:attribute name="href"> <xsl:value-of
                        select="@target"/> </xsl:attribute>* </xsl:element>
                </h4>
                <xsl:for-each select="tei:note">
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
        
    
</xsl:stylesheet>
