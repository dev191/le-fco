<%@ Register TagPrefix="MessagePanel1" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="MessPanel" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Page language="c#" Codebehind="EditCP.aspx.cs" AutoEventWireup="false" Inherits="TheSite.GestioneControlliPeriodici.EditCP" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>EditUtenti</TITLE>
		<META content="False" name="vs_showGrid">
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="C#" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
		<SCRIPT language="javascript" src="../Js/CommonScript.js"></SCRIPT>
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" bottommargin="0" leftmargin="5" topmargin="0"
		rightmargin="0" ms_positioning="GridLayout">
		<FORM id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0px; LEFT: 0px"
				cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><UC1:PAGETITLE id="PageTitle1" runat="server"></UC1:PAGETITLE></TD>
				</TR>
				<TR>
					<TD valign="top" align="center" height="95%">
						<TABLE id="tblFormInput" cellspacing="1" cellpadding="1" align="center">
							<TR>
								<TD style="WIDTH: 5%; HEIGHT: 4.68%" valign="top" align="left"></TD>
								<TD style="HEIGHT: 4.68%" valign="top" align="left"><MESSPANEL:MESSAGEPANEL id="PanelMess" runat="server" width="136px" erroriconurl="~/Images/ico_critical.gif"
										messageiconurl="~/Images/ico_info.gif"></MESSPANEL:MESSAGEPANEL></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 0.96%" valign="top" align="left"></TD>
								<TD style="HEIGHT: 0.96%" valign="top" align="left"><HR noshade size="1">
								</TD>
							</TR>
							<TR>
								<TD valign="top" align="center"></TD>
								<TD valign="top" align="left"><ASP:PANEL id="PanelEdit" runat="server">
										<TABLE id="tblSearch100" border="1" cellSpacing="0" cellPadding="2">
											<TR>
												<TD width="20%" align="left">ODL CP NR:&nbsp;</TD>
												<TD width="30%">
													<ASP:LABEL style="Z-INDEX: 0" id="LblRdl" runat="server"></ASP:LABEL></TD>
												<TD width="20%" align="left">RDL CP NR:</TD>
												<TD width="30%">
													<ASP:LABEL style="Z-INDEX: 0" id="lblOdl" runat="server"></ASP:LABEL></TD>
											</TR>
											<TR>
												<TD width="20%" align="left">Controllo Periodico</TD>
												<TD colSpan="3">
													<CC1:S_TEXTBOX id="txtsCP" tabIndex="2" runat="server" width="90%" dbsize="255" dbdirection="Input"
														maxlength="1000" dbindex="3" TextMode="MultiLine" Enabled="False"></CC1:S_TEXTBOX></TD>
											</TR>
											<TR>
												<TD width="20%" align="left">Frequenza Controllo Periodico:&nbsp;</TD>
												<TD colSpan="3">
													<ASP:LABEL style="Z-INDEX: 0" id="lblFreq" runat="server"></ASP:LABEL></TD>
											</TR>
											<TR>
												<TD width="20%" align="left">Stato RDL
												</TD>
												<TD>
													<CC1:S_COMBOBOX id="cmbsstatolavoro" runat="server"></CC1:S_COMBOBOX></TD>
												<TD width="20%" align="left">Addetto
												</TD>
												<TD>
													<CC1:S_COMBOBOX id="cmbsAddetto" runat="server"></CC1:S_COMBOBOX></TD>
											</TR>
											<TR>
												<TD align="left">Data&nbsp;Prevista Inizio Lavori:</TD>
												<TD>
													<UC1:CALENDARPICKER id="CalendarPicker1" runat="server"></UC1:CALENDARPICKER></TD>
												<TD align="left">Data&nbsp;Prevista Fine Lavori:</TD>
												<TD>
													<UC1:CALENDARPICKER id="CalendarPicker2" runat="server"></UC1:CALENDARPICKER></TD>
											</TR>
											<TR>
												<TD align="left">Data&nbsp;Inizio Completamento Lavori:</TD>
												<TD>
													<UC1:CALENDARPICKER id="CalendarPicker3" runat="server"></UC1:CALENDARPICKER></TD>
												<TD align="left">Data&nbsp;Fine Completamento Lavori:</TD>
												<TD>
													<UC1:CALENDARPICKER id="CalendarPicker4" runat="server"></UC1:CALENDARPICKER></TD>
											</TR>
											<TR>
												<TD width="20%" align="left">Note Completamento</TD>
												<TD colSpan="3">
													<CC1:S_TEXTBOX id="txtsNoteCompletamento" tabIndex="2" runat="server" width="90%" dbsize="255"
														dbdirection="Input" maxlength="1000" dbindex="3" TextMode="MultiLine" dbparametername="pIndirizzo"></CC1:S_TEXTBOX></TD>
											</TR>
										</TABLE>
									</ASP:PANEL></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 4.53%" valign="top" align="left"></TD>
								<TD style="HEIGHT: 4.53%" valign="top" align="left"><CC1:S_BUTTON id="btnSalva" tabindex="11" runat="server" cssclass="btn" text="Salva" Width="80px"></CC1:S_BUTTON>&nbsp;&nbsp;&nbsp;
									<ASP:BUTTON id="btnAnnulla" tabindex="13" runat="server" cssclass="btn" text="Indietro" causesvalidation="False"
										Width="80px"></ASP:BUTTON></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 1%" valign="top" align="left"></TD>
								<TD style="HEIGHT: 1%" valign="top" align="left">
									<HR noshade size="1">
								</TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 5%" valign="top" align="left"></TD>
								<TD style="HEIGHT: 5%" valign="top" align="left"><ASP:LABEL id="lblFirstAndLast" runat="server"></ASP:LABEL>&nbsp;</TD>
							</TR>
						</TABLE>
						<ASP:VALIDATIONSUMMARY id="vlsEdit" runat="server" showmessagebox="True" displaymode="List" showsummary="False"></ASP:VALIDATIONSUMMARY></TD>
				</TR>
			</TABLE>
		</FORM>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
