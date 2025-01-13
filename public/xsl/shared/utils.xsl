<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Convert snake_case or kebab-case to Title Case -->
    <xsl:template name="title-case">
        <xsl:param name="text"/>
        <xsl:variable name="clean-text">
            <xsl:choose>
                <xsl:when test="contains($text, '_')">
                    <xsl:value-of select="translate($text, '_', ' ')"/>
                </xsl:when>
                <xsl:when test="contains($text, '-')">
                    <xsl:value-of select="translate($text, '-', ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$text"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="lower-text" select="translate($clean-text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
        
        <xsl:for-each select="tokenize($lower-text, ' ')">
            <xsl:value-of select="concat(translate(substring(., 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(., 2))"/>
            <xsl:if test="position() != last()">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <!-- Convert database type to HTML input type -->
    <xsl:template name="input-type">
        <xsl:param name="type"/>
        <xsl:choose>
            <xsl:when test="$type = 'int' or $type = 'decimal' or $type = 'float'">number</xsl:when>
            <xsl:when test="$type = 'date'">date</xsl:when>
            <xsl:when test="$type = 'datetime'">datetime-local</xsl:when>
            <xsl:when test="$type = 'time'">time</xsl:when>
            <xsl:when test="$type = 'email'">email</xsl:when>
            <xsl:when test="$type = 'url'">url</xsl:when>
            <xsl:when test="$type = 'password'">password</xsl:when>
            <xsl:otherwise>text</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Convert string to camelCase -->
    <xsl:template name="camel-case">
        <xsl:param name="text"/>
        <xsl:variable name="clean-text">
            <xsl:choose>
                <xsl:when test="contains($text, '_')">
                    <xsl:value-of select="translate($text, '_', ' ')"/>
                </xsl:when>
                <xsl:when test="contains($text, '-')">
                    <xsl:value-of select="translate($text, '-', ' ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$text"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="words" select="tokenize($clean-text, ' ')"/>
        <xsl:value-of select="$words[1]"/>
        <xsl:for-each select="$words[position() > 1]">
            <xsl:value-of select="concat(translate(substring(., 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(., 2))"/>
        </xsl:for-each>
    </xsl:template>

    <!-- Convert string to PascalCase -->
    <xsl:template name="pascal-case">
        <xsl:param name="text"/>
        <xsl:variable name="camel">
            <xsl:call-template name="camel-case">
                <xsl:with-param name="text" select="$text"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="concat(translate(substring($camel, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring($camel, 2))"/>
    </xsl:template>

    <!-- Format date string -->
    <xsl:template name="format-date">
        <xsl:param name="date"/>
        <xsl:param name="format" select="'yyyy-MM-dd'"/>
        <!-- Add date formatting logic here -->
        <xsl:value-of select="$date"/>
    </xsl:template>

    <!-- Check if value is numeric -->
    <xsl:template name="is-numeric">
        <xsl:param name="value"/>
        <xsl:value-of select="string(number($value)) != 'NaN'"/>
    </xsl:template>
</xsl:stylesheet> 