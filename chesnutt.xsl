<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>

    <!-- "DINNER PARTY MENU" TEMPLATE. I USE THIS TO ORGANIZE THE BASIC STRUCTURE 
    OF THE OUTPUT DOCUMENT. SO IT WILL INCLUDE BASIC DOCUMENT STRUCTURE TAGS AND
    ANY PULLING/REORGANIZING OF INFORMATION FROM THE ORIGINAL.-->

    <xsl:template match="/">
        <!-- NOTICE THE SLASH THERE. In XPath this means root node (which in a TEI XML file is <TEI>). -->
        <html>
            <body>

                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>


    <!-- "FOOD PREP/MISE EN PLACE" TEMPLATES -->


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="tei:teiHeader"/>

    <!-- NOTICE THAT THIS ONE IS EMPTY. WE WILL TALK ABOUT WHAT THAT DOES.-->

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
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute> LINK! </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:person">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
        <h4><xsl:apply-templates select="tei:persName"/>(<xsl:apply-templates select="tei:birth"
                />-<xsl:apply-templates select="tei:death"/>)</h4>
        <p>Occupation: <xsl:apply-templates select="tei:occupation"/></p>
        <p> Affiliation: <xsl:apply-templates select="tei:affiliation"/></p>
        <xsl:for-each select="tei:note">
            <p>
                <xsl:apply-templates/>
            </p>
        </xsl:for-each>
    </xsl:template>


    <!--"RECIPE" TEMPLATES-->


    <!-- A NAMED TEMPLATE THAT WILL HOLD INFORMATION/OUTPUT TO BE CALLED ELSEWHERE -->



</xsl:stylesheet>
