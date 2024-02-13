<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html lang="de">
     <head>
        <meta charset="utf-8"/>
        <title>XML nach HTML</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet"/>
        <link rel="stylesheet" href="../css/html5-reset.css"/>
        <link rel="stylesheet" href="../css/table.css"/>
        <link rel="stylesheet" href="../css/standard.css"/>
        <link rel="stylesheet" href="../css/code-highlighter.css"/>
        <style><![CDATA[ table {margin-top: 1rem;} ]]></style>
      </head>
      <body>
        <h2>XML to HTML Table</h2>
        <p>XSL Stylesheet: <a href="xml-to-html-table.xsl">xml-to-html-table.xsl</a></p>
        <p>Command line: <code id="code-1">xsltproc xml-to-html-table.xsl <span id="code-span-1">XMLFILE</span></code></p>
        <table class="customTable">
          <tr>
            <xsl:for-each select="//table[0]/column">
              <th><xsl:value-of select="@name"/></th>
            </xsl:for-each>
          </tr>
          <xsl:for-each select="//table">
            <tr>
              <xsl:for-each select="column">
                <td><xsl:value-of select="."/></td>
              </xsl:for-each>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
