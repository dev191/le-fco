<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Page language="c#" Codebehind="EditPmp.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.EditPmp" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>EditAddetti</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" MS_POSITIONING="GridLayout">
		<script language="javascript">
	
	function Verifica(oggetto,max)
	{
	if (event.keyCode >=48	&& event.keyCode <= 57)
	{
		event.keyCode = 0;
	}
	
	
		if (oggetto.length>=max)
		{
				event.keyCode = 0;
		}
	}
	function Verifica1(oggetto,max)
	{
	if (event.keyCode <48	|| event.keyCode > 57)
	{
		event.keyCode = 0;
	}
	
	
		if (oggetto.length>=max)
		{
				event.keyCode = 0;
		}
	}
		</script>
		<form id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0px; LEFT: 0px"
				id="TableMain" border="0" cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR height="95%" vAlign="top" align="center">
					<TD>
						<TABLE id="tblFormInput" border="0" cellSpacing="1" cellPadding="1" width="100%" align="center">
							<TBODY>
								<TR>
									<TD style="WIDTH: 4.29%; HEIGHT: 5.31%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 5.31%" vAlign="top" align="left"><asp:label id="lblOperazione" runat="server" CssClass="TitleOperazione" Width="504px"></asp:label><cc2:messagepanel id="PanelMess" runat="server" ErrorIconUrl="~/Images/ico_critical.gif" MessageIconUrl="~/Images/ico_info.gif"></cc2:messagepanel></TD>
								</TR>
								<TR>
									<TD style="WIDTH: 83px; HEIGHT: 1%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 1%" vAlign="top" align="left">
										<hr SIZE="1" noShade>
									</TD>
								</TR>
								<TR>
									<TD style="WIDTH: 83px" vAlign="top" align="center"></TD>
									<TD vAlign="top" width="100%" align="left"><asp:panel id="PanelEdit" runat="server" Width="100%">
											<TABLE id="tblSearch100" border="0" cellSpacing="1" cellPadding="2" width="100%">
												<TR>
													<TD style="WIDTH: 181px; HEIGHT: 24px" align="left">Descrizione&nbsp;
														<asp:RequiredFieldValidator id="rfvcognome" runat="server" ControlToValidate="txtsdescrizione" ErrorMessage="Inserire la descrizione">*</asp:RequiredFieldValidator></TD>
													<TD>
														<cc1:S_TextBox id="txtsdescrizione" tabIndex="1" runat="server" Width="95%" MaxLength="250"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 181px; HEIGHT: 25px" align="left">
														<P>Tempo Intervento espresso in minuti&nbsp;
														</P>
													</TD>
													<TD style="HEIGHT: 25px">
														<cc1:S_TextBox id="txtsunitshour" tabIndex="2" runat="server" MaxLength="7"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 181px; HEIGHT: 20px" align="left">Servizio&nbsp;
														<asp:RangeValidator id="RfvServ" runat="server" ControlToValidate="cmbsServ" ErrorMessage="Nessuno Servizio selezionato"
															MaximumValue="99999999999" MinimumValue="1">*</asp:RangeValidator></TD>
													<TD style="HEIGHT: 20px">
														<asp:DropDownList id="cmbsServ" tabIndex="3" runat="server" Width="90%" AutoPostBack="True"></asp:DropDownList></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 181px; HEIGHT: 20px" align="left">Standard Apparecchiatura
														<asp:RangeValidator id="RFVeqstd" runat="server" ControlToValidate="cmbseq_std" ErrorMessage="Nessuno Standard selezionato"
															MaximumValue="99999999999" MinimumValue="1">*</asp:RangeValidator></TD>
													<TD style="HEIGHT: 20px">
														<cc1:S_ComboBox id="cmbseq_std" tabIndex="4" runat="server" Width="90%" DBDataType="Integer" AutoPostBack="True"></cc1:S_ComboBox></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 181px; HEIGHT: 22px" align="left">Frequenza
														<asp:RangeValidator id="RfvPmpFreq" runat="server" ControlToValidate="cmbspmp" ErrorMessage="Nessuna frequenza selezionata"
															MaximumValue="99999999999" MinimumValue="1">*</asp:RangeValidator></TD>
													<TD style="HEIGHT: 22px">
														<cc1:S_ComboBox id="cmbspmp" tabIndex="5" runat="server" Width="90%" DBDataType="Integer" AutoPostBack="True"></cc1:S_ComboBox></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 181px; HEIGHT: 16px" align="left">Specializzazione
														<asp:RangeValidator id="Rfvtr" runat="server" ControlToValidate="cmbstr" ErrorMessage="Nessuna Specializzazione selezionata"
															MaximumValue="99999999999" MinimumValue="1">*</asp:RangeValidator></TD>
													<TD style="HEIGHT: 16px">
														<cc1:S_ComboBox id="cmbstr" tabIndex="6" runat="server" Width="90%" DBDataType="Integer"></cc1:S_ComboBox></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 181px" align="left">Codice Procedura di Manutenzione</TD>
													<TD>
														<cc1:S_TextBox id="txtspmp_id" tabIndex="7" runat="server" Width="50%"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 181px">Dismesso:</TD>
													<TD>
														<cc1:s_checkbox id="ChekDismesso" tabIndex="8" runat="server"></cc1:s_checkbox></TD>
												</TR>
											</TABLE>
										</asp:panel></TD>
								</TR>
								<tr>
									<TD style="WIDTH: 83px; HEIGHT: 5%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 5%" vAlign="top" align="left"><cc1:s_button id="btnsSalva" tabIndex="8" runat="server" CssClass="btn" Text="Salva"></cc1:s_button>&nbsp;
										<cc1:s_button id="btnsElimina" tabIndex="9" runat="server" CssClass="btn" Text="Elimina" CausesValidation="False"
											CommandType="Delete"></cc1:s_button>&nbsp;
										<asp:button id="btnAnnulla" tabIndex="10" runat="server" CssClass="btn" Text="Annulla" CausesValidation="False"></asp:button></TD>
								</tr>
								<TR>
									<TD style="WIDTH: 83px; HEIGHT: 1%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 1%" vAlign="top" align="left">
										<hr SIZE="1" noShade>
									</TD>
								</TR>
				</TR>
				<TR>
					<TD style="HEIGHT: 5%" vAlign="top" align="left"></TD>
					<TD style="HEIGHT: 5%" vAlign="top" align="left"><asp:label id="lblFirstAndLast" runat="server"></asp:label>&nbsp;
					</TD>
				</TR>
			</TABLE>
			<asp:validationsummary id="vlsEdit" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary></TD></TR></TBODY></TABLE></form>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
