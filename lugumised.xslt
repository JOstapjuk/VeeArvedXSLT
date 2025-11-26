<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<meta charset="utf-8"/>
				<title>Veearvesti näidud</title>
				<style>
					table { border-collapse: collapse; width:100%; }
					th, td { border: 1px solid #ddd; padding: 6px; }
					th { background:#f2f2f2; text-align:left; }
				</style>
			</head>
			<body>
				<h2>Kõik veearvesti näidud</h2>

				<table>
					<thead>
						<tr>
							<th>Hoone</th>
							<th>Aadress</th>
							<th>Aasta</th>
							<th>Kuu</th>
							<th>Korter</th>
							<th>Nimi</th>
							<th>Kuupäev</th>
							<th>Külm (m³)</th>
							<th>Soe (m³)</th>
							<th>Makstud</th>
							<th>Count by Date</th>
							<th>Count by Korter</th>
							<th>Count by Makstud</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="//building">
							<xsl:variable name="hid" select="@id"/>
							<xsl:variable name="haddr" select="@address"/>
							<xsl:for-each select="period/lugumised">
								<tr>
									<td>
										<xsl:value-of select="$hid"/>
									</td>
									<td>
										<xsl:value-of select="$haddr"/>
									</td>
									<td>
										<xsl:value-of select="../@year"/>
									</td>
									<td>
										<xsl:value-of select="../@month"/>
									</td>
									<td>
										<xsl:value-of select="@korter"/>
									</td>
									<td>
										<xsl:value-of select="@nimi"/>
									</td>
									<td>
										<xsl:value-of select="@kuupaev"/>
									</td>
									<td>
										<xsl:value-of select="kuld_m3"/>
									</td>
									<td>
										<xsl:value-of select="soe_m3"/>
									</td>
									<td>
										<xsl:value-of select="@makstud"/>
									</td>

									<td>
										<xsl:value-of select="count(//lugumised[@kuupaev = current()/@kuupaev])"/>
									</td>
									<td>
										<xsl:value-of select="count(//lugumised[@korter = current()/@korter])"/>
									</td>
									<td>
										<xsl:value-of select="count(//lugumised[@makstud = current()/@makstud])"/>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
