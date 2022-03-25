<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com"/>
        <link href="https://fonts.googleapis.com/css2?family=Expletus+Sans:ital@1&amp;display=swap" rel="stylesheet"/>
        <title>Grupos</title>
    </head>
    <body>
        <h1>Grupos de música</h1>
        <h2>Grupos de rock progresivo</h2>
        <table id="t1">
            <thead>
                <th>Nombre</th>
                <th>Miembros</th>
                <th>Estilo</th>
                <th>Canciones famosas</th>
                <th>Muestra de audio</th>
                <th>Imagen</th>
            </thead>
            <tbody>
                <xsl:for-each select="bands/band">
                    <xsl:sort select="count(members/name)" data-type="number" order="descending"/>
                    <xsl:if test="style='Progressive Rock'">
                        <tr>
                            <td>
                                <xsl:value-of select="name"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="members/name">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td>
                                <xsl:value-of select="style"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="famousSongs/title">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td id="columnaAudio">
                                <audio id="start" preload="auto">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="audioSample"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="controls">
                                    </xsl:attribute>
                                </audio>
                            </td>
                            <td>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="image"/>
                                    </xsl:attribute>
                                </img>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </tbody>
        </table>
        <h2>Grupos de otros estilos</h2>
        <table id="t2">
            <thead>
                <th>Nombre</th>
                <th>Miembros</th>
                <th>Estilo</th>
                <th>Canciones famosas</th>
                <th>Muestra de audio</th>
                <th>Imagen</th>
            </thead>
            <tbody>
                <xsl:for-each select="bands/band">
                    <xsl:sort select="count(members/name)" data-type="number" order="descending"/>
                    <xsl:if test="not(style='Progressive Rock')">
                        <tr>
                            <td>
                                <xsl:value-of select="name"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="members/name">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td>
                                <xsl:value-of select="style"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="famousSongs/title">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td id="columnaAudio">
                                <audio>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="audioSample"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="controls">
                                    </xsl:attribute>
                                </audio>
                            </td>
                            <td>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="image"/>
                                    </xsl:attribute>
                                </img>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </tbody>
        </table>

    </body>
</html>
</xsl:template>
</xsl:stylesheet>