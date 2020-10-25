<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output indent="yes" omit-xml-declaration="yes" method="xml"/>
    <xsl:template match="data">
     
		<HTML><HEAD>
		<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></META>
		<META content="MSHTML 6.00.2900.2627" name="GENERATOR"></META>
		<STYLE>
		</STYLE>
		</HEAD>
		<BODY bgColor="#ffffff">
		<DIV><FONT face="Arial" size="2">		
         E' stata creata una richiesta di intervento per l'Edificio: <xsl:value-of select="codedi" /><br/>
         RdL nr: <b><xsl:value-of select="idrichiesta" /></b>.<br/>
         Richiedente intervento:<xsl:value-of select="richiedente" />
         <br/>
         Servizio: <xsl:value-of select="servizio" />         
         <br/>
         Tipo Manutenzione: <xsl:value-of select="tipomanutenzione" />
          <br/>
         Urgenza intervento: <xsl:value-of select="urgenza" />
         <br/>
         Descrizione del problema/note: <xsl:value-of select="descrizione" />
         <br/>
         Per ulteriori informazioni <a href="http://sir.cofely.it/prm">http://sir.cofely.it/prm</a>
         <br/>
          Altri destinatari di questa email: <xsl:value-of select="altreemail" />
         <br/>
        
		</FONT></DIV></BODY></HTML>
    </xsl:template>
</xsl:stylesheet>
  