<%@ Page language="c#" Codebehind="CompletaRdl1.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorrettiva.CompletaRdl1" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>Completamento Richiesta</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
		<SCRIPT language="javascript" src="../images/cal/popcalendar.js"></SCRIPT>
		<SCRIPT language="javascript" src="jscompleta.js"></SCRIPT>
		<script>
	function SoloNumerip()
{	
if (event.keyCode < 48	|| event.keyCode > 57)
		{
		event.keyCode = 0;
		}	
}
	
		</script>
</HEAD>
	<body onbeforeunload="closewin();" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" cellSpacing="1"
				cellPadding="1" width="100%" border="0">
				<TR>
					<TD align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="100%" border="0">
							<TBODY>
								<TR>
									<TD><cc2:datapanel id="PanelGeneral" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
											collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif"
											expandtext="Espandi" titletext="Dati della Richiesta" collapsed="False" titlestyle-cssclass="TitleSearch">
            <TABLE id=tblSearch100 cellSpacing=0 cellPadding=0 width="100%" 
            border=0>
              <TR>
                <TD style="HEIGHT: 12px" width="20%"><B>RDL N�</B></TD>
                <TD style="WIDTH: 169px; HEIGHT: 12px">
<ASP:LABEL id=LblRdl runat="server" width="174px"></ASP:LABEL></TD>
                <TD style="HEIGHT: 12px"><B><INPUT id=hidBl_id 
                  style="WIDTH: 16px; HEIGHT: 18px" type=hidden size=1 
                  name=hidBl_id runat="server"><INPUT id=HPageBack 
                  style="WIDTH: 16px; HEIGHT: 18px" type=hidden size=1 
                  name=HPageBack runat="server"><INPUT id=HSga 
                  style="WIDTH: 16px; HEIGHT: 18px" type=hidden size=1 name=HSga 
                  runat="server"><INPUT id=HPrj 
                  style="WIDTH: 16px; HEIGHT: 18px" type=hidden size=1 name=HPrj 
                  runat="server"></B></TD>
                <TD style="HEIGHT: 12px"></TD></TR>
              <TR>
                <TD style="HEIGHT: 12px"><B>Nominativo Richiedente:</B></TD>
                <TD style="WIDTH: 169px; HEIGHT: 12px">
<ASP:LABEL id=lblRichiedente runat="server" width="174px"></ASP:LABEL></TD>
                <TD style="HEIGHT: 12px"><B>Operatore:</B></TD>
                <TD style="HEIGHT: 12px">
<ASP:LABEL id=lblOperatore runat="server" width="128px"></ASP:LABEL></TD></TR>
              <TR>
                <TD><B>Telefono Richiedente:</B></TD>
                <TD>
<ASP:LABEL id=lbltelefonoric runat="server" width="174px"></ASP:LABEL></TD>
                <TD style="HEIGHT: 29px"><B>Data Richiesta:</B></TD>
                <TD style="HEIGHT: 29px">
<ASP:LABEL id=lblDataRichiesta runat="server" width="128px"></ASP:LABEL></TD></TR>
              <TR>
                <TD><B>Gruppo Richiedente:</B></TD>
                <TD style="WIDTH: 169px">
<ASP:LABEL id=lblGruppo runat="server" width="174px"></ASP:LABEL></TD>
                <TD><B>Orario Richiesta:</B></TD>
                <TD>
<ASP:LABEL id=lblOraRichiesta runat="server" width="128px"></ASP:LABEL></TD></TR>
              <TR>
                <TD><B>Email Richiedente:</B></TD>
                <TD style="WIDTH: 169px">
<ASP:LABEL id=lblemailric runat="server" width="174px"></ASP:LABEL></TD>
                <TD><B>Stanza Richiedente:</B></TD>
                <TD>
<ASP:LABEL id=lblstanzaric runat="server" width="128px"></ASP:LABEL></TD></TR>
              <TR>
                <TD><B>Centrale:</B></TD>
                <TD colSpan=3>
<ASP:LABEL id=lblfabbricato runat="server" width="382px"></ASP:LABEL>
<ASP:TEXTBOX id=txtHidBl runat="server" width="0px"></ASP:TEXTBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 13px"><B></B></TD>
                <TD style="WIDTH: 169px; HEIGHT: 13px">
<ASP:LABEL id=lblPiano runat="server" width="174px" Visible="False"></ASP:LABEL></TD>
                <TD style="HEIGHT: 13px"><B></B></TD>
                <TD style="HEIGHT: 13px">
<ASP:LABEL id=lblStanza runat="server" width="174px" Visible="False"></ASP:LABEL></TD></TR>
              <TR>
                <TD style="HEIGHT: 13px"><B></B></TD>
                <TD style="HEIGHT: 13px" colSpan=3>
<ASP:LABEL id=lblTelefono runat="server" width="174px" Visible="False"></ASP:LABEL></TD>
              <TR>
                <TD><B></B></TD>
                <TD colSpan=3>
<ASP:LABEL id=lblNote runat="server" width="472px" Visible="False"></ASP:LABEL>
<ASP:LABEL id=presidio runat="server" width="0px" Height="0px"></ASP:LABEL></TD></TR>
              <TR>
                <TD style="HEIGHT: 24px"><B><B>Servizio:</B></B></TD>
                <TD style="HEIGHT: 24px" colSpan=3>
<CC1:S_COMBOBOX id=cmbsServizio runat="server" width="480px" Enabled="False" autopostback="True"></CC1:S_COMBOBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 24px"><B><B>Tipo Attivit�:</B></B></TD>
                <TD style="HEIGHT: 24px" colSpan=3>
<CC1:S_COMBOBOX id=cmbsSettore runat="server" width="480px" Enabled="False" autopostback="True"></CC1:S_COMBOBOX></TD></TR><!--
												<TR>
													<TD class="SGA" style="HEIGHT: 24px"><STRONG class="blueoverline">A Seguito di:</STRONG></TD>
													<TD style="HEIGHT: 24px" colSpan="3">&nbsp;
													</TD>
												</TR>
												-->
              <TR>
                <TD style="HEIGHT: 19px"><B>Standard Apparecchiatura:</B></TD>
                <TD style="HEIGHT: 19px" colSpan=3>
<CC1:S_COMBOBOX id=cmdsStdApparecchiatura runat="server" width="480px" Enabled="False" dbsize="10" dbparametername="p_eqstd_id" dbdirection="Input" dbindex="1" AutoPostBack="True" dbdatatype="Integer"></CC1:S_COMBOBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 30px"><B>Apparecchiatura:</B></TD>
                <TD style="HEIGHT: 30px" colSpan=3>
<CC1:S_COMBOBOX id=cmbEQ runat="server" width="480px" Enabled="False" dbsize="10" dbparametername="p_id_eq" dbdirection="Input" dbindex="1" dbdatatype="Integer"></CC1:S_COMBOBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 88px"><B>Descrizione Problema/Note:</B></TD>
                <TD style="HEIGHT: 88px" colSpan=3>
<CC1:S_TEXTBOX id=txtsDescrizionebreve runat="server" width="663px" Enabled="False" height="77px"></CC1:S_TEXTBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 38px"><B>Attivit� Operative:</B></TD>
                <TD style="HEIGHT: 38px" colSpan=3>
<CC1:S_TEXTBOX id=txtsDescrizione runat="server" width="664px" Enabled="False" height="107px" textmode="MultiLine"></CC1:S_TEXTBOX></TD></TR>
              <TR>
                <TD><B>Problema:</B></TD>
                <TD colSpan=3>
<CC1:S_TEXTBOX id=txtProblema runat="server" width="472px" Enabled="False" height="28px" MaxLength="408"></CC1:S_TEXTBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 41px"><B>Causa Presunta 
                Guasto/Anomalia:</B></TD>
                <TD style="HEIGHT: 41px" colSpan=3>
<CC1:S_TEXTBOX id=txtCausa runat="server" width="472px" Enabled="False" height="25px" MaxLength="408"></CC1:S_TEXTBOX></TD></TR><!-- --></TR>
              <TR>
                <TD><STRONG>Priorit�:</STRONG></TD>
                <TD colSpan=3>
<CC1:S_COMBOBOX id=cmbsUrgenza runat="server" width="264px" Enabled="False"></CC1:S_COMBOBOX></TD></TR>
              <TR>
                <TD style="WIDTH: 139px; HEIGHT: 38px" vAlign=middle 
                  align=left><B>Tipo Manutenzione:</B> </TD>
                <TD style="WIDTH: 241px; HEIGHT: 27px">
<CC1:S_COMBOBOX id=cmbsTipoManutenzione runat="server" width="264px" Enabled="False"></CC1:S_COMBOBOX></TD>
                <TD style="HEIGHT: 27px" vAlign=middle><B></B></TD>
                <TD style="HEIGHT: 27px"></TD></TR><!-- -->
              <TR>
                <TD></TD>
                <TD colSpan=3>
<asp:button id=Button1 runat="server" Text="Modifica Sezione Dati della Richiesta" Width="248px"></asp:button></TD></TR></TABLE>
						</cc2:datapanel></TD>
				</TR>
				<TR>
					<TD><cc2:datapanel id="Datapanel1" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
							collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif"
							expandtext="Espandi" titletext="Report Lavoro SGA" collapsed="False" titlestyle-cssclass="TitleSearch"
							Visible="False">
            <TABLE id=Table3 cellSpacing=1 cellPadding=1 width="100%" 
              border=0>
              <TR>
                <TD style="HEIGHT: 38px" colSpan=3>
                  <TABLE id=Table18 style="WIDTH: 528px; HEIGHT: 100%" 
                  cellSpacing=0 cellPadding=0 width=528 border=0></TABLE></TD></TR>
              <TR id=trprev1>
                <TD style="WIDTH: 139px"><B>Importo Presunto:</B></TD>
                <TD>
                  <TABLE style="WIDTH: 528px; HEIGHT: 100%">
                    <TR>
                      <TD>
<CC1:S_TEXTBOX id=txtImp1 style="TEXT-ALIGN: right" runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtImp1_1 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD><B>Oltre Iva:</B></TD>
                      <TD>
<CC1:S_TEXTBOX id=txtPercentuale1 style="TEXT-ALIGN: right" runat="server" width="24px" maxlength="2"></CC1:S_TEXTBOX><B>%</B></TD></TR></TABLE></TD>
              <TR id=trprev2>
                <TD style="WIDTH: 139px"><B>Importo Forfettario:</B></TD>
                <TD>, 
                  <TABLE id=Table19 style="WIDTH: 528px; HEIGHT: 100%">
                    <TR>
                      <TD>
<CC1:S_TEXTBOX id=txtImp2 style="TEXT-ALIGN: right" runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtImp2_1 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD><B>Oltre Iva:</B></TD>
                      <TD><B>
<CC1:S_TEXTBOX id=txtPercentuale2 style="TEXT-ALIGN: right" runat="server" width="24px" maxlength="2"></CC1:S_TEXTBOX>%</B></TD></TR></TABLE></TD></TR>
              <TR id=trprev3>
                <TD class=sga style="WIDTH: 139px"><B 
                  class=blueoverline>Modalit� di Pagamento:</B></TD>
                <TD colSpan=3>
<CC1:S_TEXTBOX id=txtModalitaPagamento runat="server" width="480px" height="34px" textmode="MultiLine" MaxLength="112"></CC1:S_TEXTBOX></TD></TR></TABLE>
						</cc2:datapanel></TD>
				</TR>
				<TR>
					<TD><cc2:datapanel id="Datapanel2" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
							collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif"
							expandtext="Espandi" titletext="Documentazione in allegato" collapsed="False" titlestyle-cssclass="TitleSearch"><INPUT id=UploadFile 
            style="WIDTH: 392px; HEIGHT: 18px" type=file size=46 name=UploadFile 
            runat="server">&nbsp; 
<asp:button id=BtUpload runat="server" Text="Invia il File..."></asp:button>
<asp:repeater id=rpdc Runat="server">
								<HeaderTemplate>
									<table border="0">
										<tr>
											<td>Download del Documento</td>
											<td>Elimina</td>
										</tr>
									</table>
								</HeaderTemplate>
								<ItemTemplate>
									<table border="0">
										<tr>
											<td>
												<asp:Label Runat="server" ID="lbln"></asp:Label></td>
											<td>
												<asp:ImageButton ID="delete" ImageUrl="../Images/elimina.gif" Runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id_file") + "," + DataBinder.Eval(Container.DataItem, "Nome_Doc") %>'>
												</asp:ImageButton></td>
										</tr>
									</table>
								</ItemTemplate>
								<FooterTemplate>
								</FooterTemplate>
							</asp:repeater></cc2:datapanel></TD>
				</TR>
				<tr>
					<TD>
						<DIV style="DISPLAY: none"><cc2:datapanel id="Datapanel6" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
								collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif" expandtext="Espandi"
								titletext="Preventivo RdL" collapsed="False" titlestyle-cssclass="TitleSearch">
            <TABLE id=TablePrev cellSpacing=1 cellPadding=1 width="100%" 
            border=0>
              <TR>
                <TD style="HEIGHT: 32px"><STRONG>Preventivo N�:</STRONG></TD>
                <TD style="WIDTH: 241px; HEIGHT: 32px">
<asp:textbox id=TxtNumPreventivo runat="server" MaxLength="25" Width="160px"></asp:textbox></TD>
                <TD style="WIDTH: 141px; HEIGHT: 32px" 
                  align=right><STRONG>Importo Preventivo: &nbsp;</STRONG></TD>
                <TD style="HEIGHT: 32px">
<CC1:S_TEXTBOX id=txtImpPrev1 style="TEXT-ALIGN: right" runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtImpPrev2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 32px"><STRONG>Autorizzazione 
                  Preventivo:</STRONG></TD>
                <TD colSpan=3>
<asp:label id=lblAut runat="server" Width="400px" Font-Bold="True"></asp:label></TD></TR>
              <TR>
                <TD><STRONG>File Preventivo:</STRONG></TD>
                <TD colSpan=3><INPUT id=FilePreventivo 
                  style="WIDTH: 392px; HEIGHT: 18px" type=file size=46 
                  name=File1 runat="server">&nbsp; 
<asp:button id=BtInviaPreventivo runat="server" Text="Salva il Preventivo/Invia Email" Width="192px"></asp:button></TD></TR>
              <TR>
                <TD>
<ASP:LABEL id=lblprev runat="server" width="176px" Font-Bold="True"></ASP:LABEL></TD>
                <TD colSpan=3>
<asp:hyperlink id=LkPrev runat="server"></asp:hyperlink>&nbsp; 
<asp:imagebutton id=btImgDelete runat="server" ImageUrl="../Images/elimina.gif"></asp:imagebutton></TD></TR></TABLE>
							</cc2:datapanel></DIV>
					</TD>
				</tr>
				<TR>
					<TD><cc2:datapanel id="Datapanel3" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
							collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif"
							expandtext="Espandi" titletext="Emissione Ordine" collapsed="False" titlestyle-cssclass="TitleSearch">
							<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" border="0">
								<TR>
									<TD><STRONG>Ordine:</STRONG></TD>
									<TD style="WIDTH: 241px"><asp:label id="LblOrdine" runat="server" Font-Bold="True"></asp:label></TD>
									<TD style="WIDTH: 141px"></TD>
									<TD></TD>
								<TR>
									<TD style="WIDTH: 11.3%">
										<DIV style="DISPLAY: none"><B class="blueoverline">Soluzione Proposta:</B>
										</DIV>
									</TD>
									<TD colSpan="3">
										<DIV style="DISPLAY: none"><CC1:S_TEXTBOX id="txtSoluzioneProposta" runat="server" width="480px" height="34px" textmode="MultiLine"
												MaxLength="408"></CC1:S_TEXTBOX></DIV>
									</TD>
								</TR>
								<TR>
									<TD style="WIDTH: 139px">
										<DIV style="DISPLAY: none"><B class="blueoverline">Note SGA:</B>
										</DIV>
									</TD>
									<TD colSpan="3">
										<DIV style="DISPLAY: none"><CC1:S_TEXTBOX id="txtNoteSga" runat="server" width="480px" height="34px" textmode="MultiLine"
												MaxLength="408"></CC1:S_TEXTBOX></DIV>
									</TD>
								</TR>
								<TR>
									<TD style="WIDTH: 139px">
										<DIV style="DISPLAY: none"><STRONG>SGA:</STRONG>
										</DIV>
									</TD>
									<TD colSpan="3">
										<DIV style="DISPLAY: none"><asp:label id="lblSGA" runat="server" Font-Bold="True"></asp:label>&nbsp;
											<asp:label id="LblDataInvioSga" runat="server" Font-Bold="True"></asp:label></DIV>
									</TD>
								</TR>
								<TR>
									<TD><STRONG>Addetto-Ditta Esecutrice:&nbsp;&nbsp;</STRONG></TD>
									<TD style="WIDTH: 241px"><CC1:S_COMBOBOX id="cmbsAddetto" runat="server" width="376px"></CC1:S_COMBOBOX></TD>
									<TD style="WIDTH: 141px" align="left"><STRONG>&nbsp;&nbsp;</STRONG></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD style="HEIGHT: 16px" colSpan="2"><STRONG>Data&nbsp;Inizio Schedulata:</STRONG></TD>
									<TD style="HEIGHT: 16px" colSpan="2"><STRONG>Data Fine Schedulata:</STRONG></TD>
								</TR>
								<TR>
									<TD><uc1:calendarpicker id="CalendarPicker6" runat="server"></uc1:calendarpicker></TD>
									<TD>Ora<CC1:S_COMBOBOX id="cmbOra1" runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
										</CC1:S_COMBOBOX>
										<CC1:S_COMBOBOX id="cmbMin2" runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="30">30</asp:ListItem>
											<asp:ListItem Value="45">45</asp:ListItem>
										</CC1:S_COMBOBOX></TD>
									<TD><uc1:calendarpicker id="CalendarPicker2" runat="server"></uc1:calendarpicker></TD>
									<TD>Ora<CC1:S_COMBOBOX id="cmborafinelav" runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
										</CC1:S_COMBOBOX>
										<CC1:S_COMBOBOX id="cmbminfinelav" runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="30">30</asp:ListItem>
											<asp:ListItem Value="45">45</asp:ListItem>
										</CC1:S_COMBOBOX></TD>
								</TR>
								<TR>
									<TD colSpan="4">
										<div style="DISPLAY: none"><ASP:LABEL id="LblMessaggio" runat="server" width="560px" Font-Bold="True"></ASP:LABEL></div>
									</TD>
								</TR>
								<TR>
									<TD><STRONG>Stato Impianto:</STRONG></TD>
									<TD colSpan="3"><CC1:S_COMBOBOX id="CmbStatoImpianto" runat="server" width="216px" DBDirection="Input"></CC1:S_COMBOBOX></TD>
								</TR>
								<TR>
									<TD align="center" colSpan="4"><asp:button id="btChiudi1" runat="server" Width="135px" Text="Chiudi"></asp:button>&nbsp;
										<asp:button id="btRifiuta" runat="server" Width="135px" Text="Rifiuta"></asp:button>&nbsp;
										<asp:button id="btSospendi" runat="server" Width="135px" Text="Sospendi"></asp:button>&nbsp;
										<asp:button id="btApprova" runat="server" Width="135px" Text="Approva/Emetti"></asp:button>&nbsp;<asp:button id="BtSalvaSGA" runat="server" Visible="False" Width="120px" Text="Salva/Invia SGA"></asp:button>
									</TD>
								</TR>
							</TABLE></TD>
				</TR>
				</TBODY></TABLE></cc2:datapanel></TD></TR>
			<TR>
				<TD><cc2:datapanel id="Datapanel5" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
						collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif"
						expandtext="Espandi" titletext="Consuntivo Economico" collapsed="false" titlestyle-cssclass="TitleSearch">
      <TABLE cellSpacing=1 cellPadding=1 width="100%" border=0>
        <TR>
          <TD style="WIDTH: 144px" colSpan=6>
            <DIV style="DISPLAY: none">
            <TABLE id=Table12 style="WIDTH: 616px; HEIGHT: 33px" cellSpacing=0 
            cellPadding=0 width=616 border=0>
              <TR>
                <TD>
                  <DIV style="DISPLAY: none">
<CC1:S_OPTIONBUTTON id=OptAMisura tabIndex=4 runat="server" Checked="True" text="A Misura" groupname="Grkind"></CC1:S_OPTIONBUTTON></DIV></TD>
                <TD style="WIDTH: 106px">
                  <DIV style="DISPLAY: none">
<CC1:S_OPTIONBUTTON id=OptAForfait tabIndex=4 runat="server" text="A Forfait" groupname="Grkind"></CC1:S_OPTIONBUTTON></DIV></TD>
                <TD colSpan=2>
                  <DIV style="DISPLAY: none"><STRONG 
                  class=blueoverline></STRONG></DIV>
                  <DIV></DIV></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD style="WIDTH: 144px" colSpan=6>
            <TABLE>
              <TR>
                <TD>
                  <TABLE class=btbal id=Table9 
                  style="WIDTH: 488px; HEIGHT: 88px" cellSpacing=0 cellPadding=0 
                  width=488 border=0>
                    <TR>
                      <TD style="WIDTH: 60px"></TD>
                      <TD style="WIDTH: 138px"><STRONG>Costo 
                      Materiali</STRONG></TD>
                      <TD style="WIDTH: 143px"><STRONG><STRONG><STRONG>Costo 
                        Personale</STRONG></STRONG></STRONG></TD>
                      <TD><STRONG>Sub Totali</STRONG></TD><!-- <TD><STRONG> </STRONG></TD> --></TR>
                    <TR>
                      <TD style="WIDTH: 60px"><STRONG>Manuale</STRONG></TD>
                      <TD class=BbR style="WIDTH: 138px">
<CC1:S_TEXTBOX id=txtCostiMateriali1 style="TEXT-ALIGN: right" runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtCostiMateriali2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD class=BbR style="WIDTH: 143px">
<CC1:S_TEXTBOX id=txtCostiPersonale1 style="TEXT-ALIGN: right" runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtCostiPersonale2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD class=BbR>
<CC1:S_TEXTBOX id=txtCostiTotale1 style="TEXT-ALIGN: right" runat="server" width="48px" Enabled="False" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtCostiTotale2 runat="server" width="27px" Enabled="False" maxlength="2">00</CC1:S_TEXTBOX></TD><!-- <TD><STRONG> </STRONG></TD> --></TR>
                    <TR>
                      <TD style="WIDTH: 60px"><STRONG>A Misura</STRONG></TD>
                      <TD class=BbR style="WIDTH: 138px">
<ASP:LABEL id=lblCostoMateriali runat="server"></ASP:LABEL>� 
<INPUT id=btOpenMat title="Apre i Costi Materiali" onclick="OpenMateriali(<%=wr_id.ToString()%>);" type=button value=... name=btOpenMat></TD>
                      <TD class=BbR style="WIDTH: 143px">
<ASP:LABEL id=lblCostiPersonale runat="server"></ASP:LABEL>� 
<INPUT id=btnPersonale title="Apre i Costi Addetti" onclick="OpenPopUpAddetti(<%=wr_id.ToString()%>);" type=button value=... name=Button1></TD>
                      <TD class=BbR>
<ASP:LABEL id=LblTotale runat="server"></ASP:LABEL>�</TD><!-- <TD><STRONG> </STRONG></TD> --></TR>
                    <TR>
                      <TD style="WIDTH: 60px"><STRONG>Totale</STRONG></TD>
                      <TD style="WIDTH: 138px">
<ASP:LABEL id=LblTotMateriali runat="server"></ASP:LABEL>�</TD>
                      <TD style="WIDTH: 143px">
<ASP:LABEL id=LblTotPersonale runat="server"></ASP:LABEL>�</TD>
                      <TD>
<ASP:LABEL id=LblTotGenerale runat="server"></ASP:LABEL>�</TD><!--
											<TD><STRONG><INPUT id="AggiornaTot" onclick="RicalcolaTotaliAG();"  style="VISIBILITY: hidden" type="button" value="Aggiorna"></STRONG></TD>
										--></TR></TABLE></TD>
                <TD><SPAN><STRONG>Note</STRONG> <BR>
<CC1:S_TEXTBOX id=TxtAForfait runat="server" Height="59px" MaxLength="250" Width="283px" TextMode="MultiLine"></CC1:S_TEXTBOX></SPAN></TD></TR></TABLE></TD></TR>
        <TR>
          <TD style="WIDTH: 144px" colSpan=6>
            <TABLE id=Table10 style="WIDTH: 800px; HEIGHT: 40px" cellSpacing=0 
            cellPadding=0 width=800 border=0>
              <TR>
                <TD><STRONG>Importo Consuntivo File Allegato:</STRONG></TD>
                <TD>&nbsp; 
<CC1:S_TEXTBOX id=ImpCons1 style="TEXT-ALIGN: right" runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=ImpCons2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                <TD><STRONG>File Consuntivo pdf:</STRONG></TD>
                <TD>&nbsp;<INPUT id=FileConsuntivo 
                  style="WIDTH: 206px; HEIGHT: 18px" type=file size=15 
                  name=File1 runat="server"> </TD>
                <TD>
<asp:button id=BtInviaCons runat="server" Text="Salva Consuntivo" Width="105px"></asp:button></TD></TR>
              <TR>
                <TD colSpan=3>
<ASP:LABEL id=lblCons runat="server" width="176px" Font-Bold="True"></ASP:LABEL></TD>
                <TD colSpan=2>
<asp:hyperlink id=LkCons runat="server"></asp:hyperlink>&nbsp; 
<asp:imagebutton id=btImgDeleteCons runat="server" ImageUrl="../Images/elimina.gif"></asp:imagebutton></TD></TR>
              <TR>
                <TD colSpan=5></TD></TR>
              <TR>
                <TD><B>Centro di Costo:</B></TD>
                <TD>
<CC1:S_COMBOBOX id=cmbCdC runat="server" dbsize="10" dbdirection="Input" AutoPostBack="True" dbdatatype="Integer" Width="200px"></CC1:S_COMBOBOX></TD>
                <TD><B>Nr Ordine SAP</B></TD>
                <TD>
<CC1:S_TEXTBOX onkeypress=SoloNumerip() id=txtnrsap runat="server" width="209px" height="20px"></CC1:S_TEXTBOX></TD>
                <TD></TD></TR></TABLE></TD></TR></TABLE>
					</cc2:datapanel></TD>
			</TR>
			<TR>
				<TD><cc2:datapanel id="Datapanel4" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
						collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif"
						expandtext="Espandi" titletext="Completamento Ordine" collapsed="False" titlestyle-cssclass="TitleSearch">
      <TABLE cellSpacing=1 cellPadding=1 width="100%" border=0>
        <TR>
          <TD><STRONG>Stato Richiesta:</STRONG></TD>
          <TD>
<CC1:S_COMBOBOX id=cmbsstatolavoro runat="server" width="476px"></CC1:S_COMBOBOX></TD>
          <TD style="WIDTH: 112px"></TD>
          <TD></TD></TR>
        <TR id=trsosp>
          <TD><STRONG>Sospesa per:</STRONG></TD>
          <TD colSpan=3>
<CC1:S_TEXTBOX id=txtsAnnotazioni runat="server" width="480px" height="34px" textmode="MultiLine" MaxLength="2000"></CC1:S_TEXTBOX></TD></TR>
        <TR>
          <TD colSpan=4>
            <TABLE id=Table13 style="HEIGHT: 68px" cellSpacing=0 cellPadding=0 
            width=900 border=0>
              <TR>
                <TD class=die><STRONG class=blueoverline>Data Inizio 
                  Lavori:</STRONG></TD>
                <TD class=die><STRONG class=blueoverline 
                  title="data di completamente dell�intervento a tampone per la risoluzione del guasto">Data 
                  Provvisoria Fine Lavori:</STRONG></TD>
                <TD class=die><STRONG class=blueoverline>Data Fine 
                  Lavori:</STRONG></TD></TR>
              <TR>
                <TD>
                  <TABLE id=Table5 cellSpacing=1 cellPadding=1 width="100%" 
                  border=0>
                    <TR>
                      <TD>
<uc1:CalendarPicker id=CalendarPicker7 runat="server"></uc1:CalendarPicker></TD>
                      <TD><STRONG><SPAN class=die><SPAN 
                        class=blueoverline>Ora</SPAN></SPAN> 
<CC1:S_COMBOBOX id=OraIni runat="server" dbdatatype="Integer">
																	<asp:ListItem Value="00">00</asp:ListItem>
																	<asp:ListItem Value="01">01</asp:ListItem>
																	<asp:ListItem Value="02">02</asp:ListItem>
																	<asp:ListItem Value="03">03</asp:ListItem>
																	<asp:ListItem Value="04">04</asp:ListItem>
																	<asp:ListItem Value="05">05</asp:ListItem>
																	<asp:ListItem Value="06">06</asp:ListItem>
																	<asp:ListItem Value="07">07</asp:ListItem>
																	<asp:ListItem Value="08">08</asp:ListItem>
																	<asp:ListItem Value="09">09</asp:ListItem>
																	<asp:ListItem Value="10">10</asp:ListItem>
																	<asp:ListItem Value="11">11</asp:ListItem>
																	<asp:ListItem Value="12">12</asp:ListItem>
																	<asp:ListItem Value="13">13</asp:ListItem>
																	<asp:ListItem Value="14">14</asp:ListItem>
																	<asp:ListItem Value="15">15</asp:ListItem>
																	<asp:ListItem Value="16">16</asp:ListItem>
																	<asp:ListItem Value="17">17</asp:ListItem>
																	<asp:ListItem Value="18">18</asp:ListItem>
																	<asp:ListItem Value="19">19</asp:ListItem>
																	<asp:ListItem Value="20">20</asp:ListItem>
																	<asp:ListItem Value="21">21</asp:ListItem>
																	<asp:ListItem Value="22">22</asp:ListItem>
																	<asp:ListItem Value="23">23</asp:ListItem>
																</CC1:S_COMBOBOX></STRONG>: 
<CC1:S_COMBOBOX id=MinitiIni runat="server" width="40px" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="25">25</asp:ListItem>
																<asp:ListItem Value="30">30</asp:ListItem>
																<asp:ListItem Value="35">35</asp:ListItem>
																<asp:ListItem Value="40">40</asp:ListItem>
																<asp:ListItem Value="45">45</asp:ListItem>
																<asp:ListItem Value="50">50</asp:ListItem>
																<asp:ListItem Value="55">55</asp:ListItem>
															</CC1:S_COMBOBOX></TD></TR></TABLE></TD>
                <TD>
                  <TABLE id=Table14 cellSpacing=1 cellPadding=1 width="100%" 
                  border=0>
                    <TR>
                      <TD>
<uc1:CalendarPicker id=CalendarPicker10 runat="server"></uc1:CalendarPicker></TD>
                      <TD><STRONG><SPAN class=die><SPAN 
                        class=blueoverline>Ora</SPAN></SPAN> 
<CC1:S_COMBOBOX id=S_COMBOBOX2 runat="server" dbdatatype="Integer">
																	<asp:ListItem Value="00">00</asp:ListItem>
																	<asp:ListItem Value="01">01</asp:ListItem>
																	<asp:ListItem Value="02">02</asp:ListItem>
																	<asp:ListItem Value="03">03</asp:ListItem>
																	<asp:ListItem Value="04">04</asp:ListItem>
																	<asp:ListItem Value="05">05</asp:ListItem>
																	<asp:ListItem Value="06">06</asp:ListItem>
																	<asp:ListItem Value="07">07</asp:ListItem>
																	<asp:ListItem Value="08">08</asp:ListItem>
																	<asp:ListItem Value="09">09</asp:ListItem>
																	<asp:ListItem Value="10">10</asp:ListItem>
																	<asp:ListItem Value="11">11</asp:ListItem>
																	<asp:ListItem Value="12">12</asp:ListItem>
																	<asp:ListItem Value="13">13</asp:ListItem>
																	<asp:ListItem Value="14">14</asp:ListItem>
																	<asp:ListItem Value="15">15</asp:ListItem>
																	<asp:ListItem Value="16">16</asp:ListItem>
																	<asp:ListItem Value="17">17</asp:ListItem>
																	<asp:ListItem Value="18">18</asp:ListItem>
																	<asp:ListItem Value="19">19</asp:ListItem>
																	<asp:ListItem Value="20">20</asp:ListItem>
																	<asp:ListItem Value="21">21</asp:ListItem>
																	<asp:ListItem Value="22">22</asp:ListItem>
																	<asp:ListItem Value="23">23</asp:ListItem>
																</CC1:S_COMBOBOX></STRONG>: 
<CC1:S_COMBOBOX id=S_COMBOBOX1 runat="server" width="40px" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="25">25</asp:ListItem>
																<asp:ListItem Value="30">30</asp:ListItem>
																<asp:ListItem Value="35">35</asp:ListItem>
																<asp:ListItem Value="40">40</asp:ListItem>
																<asp:ListItem Value="45">45</asp:ListItem>
																<asp:ListItem Value="50">50</asp:ListItem>
																<asp:ListItem Value="55">55</asp:ListItem>
															</CC1:S_COMBOBOX></TD></TR></TABLE></TD>
                <TD>
                  <TABLE id=Table6 cellSpacing=1 cellPadding=1 width="100%" 
                  border=0>
                    <TR>
                      <TD>
<uc1:CalendarPicker id=CalendarPicker8 runat="server"></uc1:CalendarPicker></TD>
                      <TD><STRONG><SPAN class=die><SPAN 
                        class=blueoverline>Ora</SPAN></SPAN> 
<CC1:S_COMBOBOX id=OraFine runat="server" dbdatatype="Integer">
																	<asp:ListItem Value="00">00</asp:ListItem>
																	<asp:ListItem Value="01">01</asp:ListItem>
																	<asp:ListItem Value="02">02</asp:ListItem>
																	<asp:ListItem Value="03">03</asp:ListItem>
																	<asp:ListItem Value="04">04</asp:ListItem>
																	<asp:ListItem Value="05">05</asp:ListItem>
																	<asp:ListItem Value="06">06</asp:ListItem>
																	<asp:ListItem Value="07">07</asp:ListItem>
																	<asp:ListItem Value="08">08</asp:ListItem>
																	<asp:ListItem Value="09">09</asp:ListItem>
																	<asp:ListItem Value="10">10</asp:ListItem>
																	<asp:ListItem Value="11">11</asp:ListItem>
																	<asp:ListItem Value="12">12</asp:ListItem>
																	<asp:ListItem Value="13">13</asp:ListItem>
																	<asp:ListItem Value="14">14</asp:ListItem>
																	<asp:ListItem Value="15">15</asp:ListItem>
																	<asp:ListItem Value="16">16</asp:ListItem>
																	<asp:ListItem Value="17">17</asp:ListItem>
																	<asp:ListItem Value="18">18</asp:ListItem>
																	<asp:ListItem Value="19">19</asp:ListItem>
																	<asp:ListItem Value="20">20</asp:ListItem>
																	<asp:ListItem Value="21">21</asp:ListItem>
																	<asp:ListItem Value="22">22</asp:ListItem>
																	<asp:ListItem Value="23">23</asp:ListItem>
																</CC1:S_COMBOBOX></STRONG>: 
<CC1:S_COMBOBOX id=MinutiFine runat="server" width="40px" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="25">25</asp:ListItem>
																<asp:ListItem Value="30">30</asp:ListItem>
																<asp:ListItem Value="35">35</asp:ListItem>
																<asp:ListItem Value="40">40</asp:ListItem>
																<asp:ListItem Value="45">45</asp:ListItem>
																<asp:ListItem Value="50">50</asp:ListItem>
																<asp:ListItem Value="55">55</asp:ListItem>
															</CC1:S_COMBOBOX></TD></TR></TABLE></TD></TR></TABLE></TD></TR>
        <TR>
          <TD><STRONG>Rimedio Problema\Causa:</STRONG></TD>
          <TD colSpan=3>
<asp:DropDownList id=cmbSoluzioni runat="server" width="480px"></asp:DropDownList></TD></TR>
        <TR>
          <TD><STRONG>Rimedio Problema\Causa Testo:</STRONG></TD>
          <TD colSpan=3>
<asp:TextBox id=txtSoluzione runat="server" MaxLength="100" Width="480px"></asp:TextBox></TD></TR>
        <TR>
          <TD colSpan=4>
            <DIV style="DISPLAY: none">
<asp:CheckBox id=CkDisser runat="server" Visible="False" Text="Creato Disservizio"></asp:CheckBox></DIV></TD>
          <DIV></DIV></TR>
        <TR>
          <TD class=die><STRONG class=blueoverline>
            <DIV style="DISPLAY: none"></STRONG></DIV></TD>
          <TD colSpan=3>
            <DIV style="DISPLAY: none">
            <TABLE id=Table16 cellSpacing=0 cellPadding=0 width=300 border=0>
              <TR>
                <TD>
<asp:TextBox id=txtOperazioneN runat="server" Visible="False" MaxLength="9"></asp:TextBox></TD>
                <TD></TD>
                <TD>
<CC1:S_COMBOBOX id=CmbMese runat="server" width="196px" Visible="False">
														<asp:ListItem Value="0">- Nessun Mese Selezionato -</asp:ListItem>
														<asp:ListItem Value="1">Gennaio</asp:ListItem>
														<asp:ListItem Value="2">Febbraio</asp:ListItem>
														<asp:ListItem Value="3">Marzo</asp:ListItem>
														<asp:ListItem Value="4">Aprile</asp:ListItem>
														<asp:ListItem Value="5">Maggio</asp:ListItem>
														<asp:ListItem Value="6">Giugno</asp:ListItem>
														<asp:ListItem Value="7">Luglio</asp:ListItem>
														<asp:ListItem Value="8">Agosto</asp:ListItem>
														<asp:ListItem Value="9">Settembre</asp:ListItem>
														<asp:ListItem Value="10">Ottobre</asp:ListItem>
														<asp:ListItem Value="11">Novembre</asp:ListItem>
														<asp:ListItem Value="12">Dicembre</asp:ListItem>
													</CC1:S_COMBOBOX></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD><STRONG>Note Completamento:</STRONG></TD>
          <TD colSpan=3>
<CC1:S_TEXTBOX id=txtNoteCompletamento runat="server" width="480px" height="34px" textmode="MultiLine" MaxLength="215"></CC1:S_TEXTBOX></TD></TR>
        <TR>
          <TD class=die>
            <DIV style="DISPLAY: none"><STRONG 
          class=blueoverline></STRONG></DIV></TD>
          <TD class=die colSpan=3>
            <DIV style="DISPLAY: none">
            <TABLE id=Table15 cellSpacing=0 cellPadding=0 border=0>
              <TR>
                <TD class=die>
<asp:CheckBox id=Ck1 runat="server" Visible="False" Text="Gli apparati sono perfettamente funzionanti" CssClass="blueoverline"></asp:CheckBox></TD>
                <TD class=die>
<asp:CheckBox id=Ck2 runat="server" Visible="False" Text="L'installazione � conforme alle norme vigenti" CssClass="blueoverline"></asp:CheckBox></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD class=die>
            <DIV style="DISPLAY: none"><STRONG 
          class=blueoverline></STRONG></DIV></TD>
          <TD colSpan=3>
            <DIV style="DISPLAY: none">
<CC1:S_TEXTBOX id=cmbDescrizioneIntervento runat="server" width="480px" Visible="False" height="34px" textmode="MultiLine" MaxLength="256"></CC1:S_TEXTBOX></DIV></TD></TR>
        <TR id=trsod style="DISPLAY: none">
          <TD>
            <DIV style="DISPLAY: none"><STRONG>Livello Soddisfazione:</STRONG> 
            </DIV></TD>
          <TD colSpan=3>
            <DIV style="DISPLAY: none">
<ASP:RADIOBUTTONLIST id=RdListLivello runat="server" Width="500px" repeatdirection="Horizontal">
											<asp:ListItem Value="4" Selected="True">Non dichiarato</asp:ListItem>
											<asp:ListItem Value="1">Non Soddisfatto</asp:ListItem>
											<asp:ListItem Value="2">Soddisfatto</asp:ListItem>
											<asp:ListItem Value="3">Pienamente Soddisfatto</asp:ListItem>
										</ASP:RADIOBUTTONLIST></DIV></TD></TR></TABLE>
					</cc2:datapanel></TD>
			</TR>
			<TR>
				<td>
					<div style="DISPLAY: none"><cc2:datapanel id="Datapanel10" runat="server" cssclass="DataPanel75" allowtitleexpandcollapse="True"
							collapseimageurl="../Images/up.gif" collapsetext="Riduci" expandimageurl="../Images/down.gif" expandtext="Espandi"
							titletext="Benestare Fatturazione MAP" collapsed="False" titlestyle-cssclass="TitleSearch">
      <TABLE cellSpacing=1 cellPadding=1 width="100%" border=0>
        <TR>
          <TD><STRONG>Nr MAP:</STRONG></TD>
          <TD style="WIDTH: 247px">
<CC1:S_TEXTBOX id=txtmap runat="server" width="161px" MaxLength="25"></CC1:S_TEXTBOX></TD>
          <TD><STRONG>Importo MAP:</STRONG></TD>
          <TD>
<CC1:S_TEXTBOX id=txtimpmap1 style="TEXT-ALIGN: right" runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtimpmap2 style="TEXT-ALIGN: left" runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD></TR>
        <TR>
          <TD style="WIDTH: 441px" colSpan=2>
<ASP:LABEL id=lblMAP runat="server" width="400px" Font-Bold="True"></ASP:LABEL></TD>
          <TD colSpan=2>
<asp:button id=btMAP runat="server" Text="Salva MAP/Invia Email" Width="135px"></asp:button></TD></TR></TABLE>
						</cc2:datapanel></div>
				</td>
			</TR>
			<TR>
				<TD align="center">
					<div class="DataPanel75" id="azioni" style="WIDTH: 100%; HEIGHT: 85px" runat="server">
						<TABLE width="100%" border="0">
							<TR>
								<TD class="TitleSearch" colSpan="4">Operazioni</TD>
							</TR>
							<TR>
								<TD><asp:button id="BtSalva" runat="server" Width="135px" Text="Salva"></asp:button></TD>
								<TD><asp:button id="BtDIE" runat="server" Visible="False" Width="135px" Text="Salva/Invia DIE"></asp:button></TD>
								<TD><asp:button id="btmpermlav" runat="server" Width="135px" Text="Permesso di Lavoro"></asp:button></TD>
								<TD><asp:button id="btFoglioPdf" runat="server" Width="135px" Text="Foglio Prestazioni PDF"></asp:button></TD>
							</TR>
							<TR>
								<TD><asp:button id="btChiudi" runat="server" Width="135px" Text="Chiudi"></asp:button></TD>
								<TD></TD>
								<TD></TD>
								<TD><asp:button id="btFoglio" runat="server" Visible="False" Width="135px" Text="Foglio Prestazioni"></asp:button></TD>
							</TR>
						</TABLE>
					</div>
				</TD>
			</TR>
			</TABLE>&nbsp;
		</form>
	</body>
</HTML>
