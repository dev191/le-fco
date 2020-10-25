<%@ Page language="c#" Codebehind="EditDestinatario.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.EditDestinatario" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Edit Destinatario</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" MS_POSITIONING="GridLayout">
		<script language="javascript">
	
	
	
		</script>
		<form id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0px; LEFT: 0px"
				cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR vAlign="top" align="center" height="95%">
					<TD>
						<TABLE id="tblFormInput" cellSpacing="1" cellPadding="1" align="center">
							<TBODY>
								<TR>
									<TD style="WIDTH: 5%; HEIGHT: 5%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 5%" vAlign="top" align="left"><asp:label id="lblOperazione" runat="server" CssClass="TitleOperazione" Width="544px"></asp:label><cc2:messagepanel id="PanelMess" runat="server" ErrorIconUrl="~/Images/ico_critical.gif" MessageIconUrl="~/Images/ico_info.gif"></cc2:messagepanel></TD>
								</TR>
								<TR>
									<TD style="HEIGHT: 1%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 1%" vAlign="top" align="left">
										<hr noShade SIZE="1">
									</TD>
								</TR>
								<TR>
									<TD vAlign="top" align="center"></TD>
									<TD vAlign="top" align="left"><asp:panel id="PanelEdit" runat="server">
											<TABLE id="tblSearch75" border="0" cellSpacing="1" cellPadding="2">
												<TR>
													<TD style="HEIGHT: 24px" align="left">Edificio:</TD>
													<TD style="HEIGHT: 24px">
														<asp:dropdownlist id="DrEdifici" runat="server" Width="375px" AutoPostBack="True"></asp:dropdownlist></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">Email:&nbsp;
														<asp:RequiredFieldValidator id="rfvDescrizione" runat="server" ErrorMessage="Inserire la descrizione" ControlToValidate="TxtMail">*</asp:RequiredFieldValidator>
														<asp:RegularExpressionValidator id="rem" runat="server" ErrorMessage="Email non valida!" ControlToValidate="TxtMail"
															ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></TD>
													<TD style="HEIGHT: 23px">
														<asp:TextBox id="TxtMail" runat="server" Width="375px" MaxLength="100"></asp:TextBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">Descrizione:</TD>
													<TD style="HEIGHT: 23px">
														<asp:TextBox id="txtDesc" runat="server" Width="375px" MaxLength="255"></asp:TextBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">Servizio:</TD>
													<TD style="HEIGHT: 23px">
														<asp:DropDownList id="DrServizio" runat="server" Width="375px"></asp:DropDownList></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">Tipo Doc:</TD>
													<TD style="HEIGHT: 23px">
														<asp:DropDownList id="TipoDoc" runat="server" Width="375px">
															<asp:ListItem Value="1">Riceve documenti SGA</asp:ListItem>
															<asp:ListItem Value="2">Riceve documenti DIE</asp:ListItem>
														</asp:DropDownList></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">
														<P>Abilitato:</P>
													</TD>
													<TD style="HEIGHT: 23px">
														<asp:CheckBox id="CkAb" runat="server" Text="Si/No flag con spunta indica che è abilitato"></asp:CheckBox></TD>
												</TR>
											</TABLE>
										</asp:panel></TD>
								</TR>
								<tr>
									<TD style="HEIGHT: 5%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 5%" vAlign="top" align="left"><cc1:s_button id="btnsSalva" tabIndex="10" runat="server" Text="Salva" CssClass="btn"></cc1:s_button>&nbsp;
										<asp:button id="btnAnnulla" tabIndex="12" runat="server" Text="Annulla" CausesValidation="False"
											CssClass="btn"></asp:button></TD>
								</tr>
								<TR>
									<TD style="HEIGHT: 1%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 1%" vAlign="top" align="left">
										<hr noShade SIZE="1">
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
