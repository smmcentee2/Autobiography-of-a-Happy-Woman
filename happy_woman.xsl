<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">


    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="happy_woman.css"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>
    
    <xsl:template match="tei:p">
    <p>
        <xsl:apply-templates/>
    </p>
    </xsl:template>


    <xsl:template match="tei:ptr">
      <xsl:element name="a"> <xsl:attribute name="id"> <xsl:value-of select="@xml:id"
        /></xsl:attribute> <xsl:attribute name="href"> <xsl:value-of select="@target"/>
        </xsl:attribute>*</xsl:element>
      <xsl:apply-templates/>
    </xsl:template>
    



    <xsl:template match="tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>


    <xsl:template match="tei:note">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="@resp"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>

    </xsl:template>


</xsl:stylesheet>
