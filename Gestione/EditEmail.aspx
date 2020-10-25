<%@ Register TagPrefix="MessPanel" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Page language="c#" Codebehind="EditEmail.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.EditMail" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>EditEmail</TITLE>
		<META name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<META name="CODE_LANGUAGE" content="C#">
		<META name="vs_defaultClientScript" content="JavaScript">
		<META name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
	</HEAD>
	<body bottomMargin="0" leftMargin="5" rightMargin="0" onbeforeunload="parent.left.valorizza()"
		topMargin="0" ms_positioning="GridLayout">
		<FORM id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0px; LEFT: 0px"
				id="TableMain" border="0" cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TBODY>
					<TR>
						<TD style="HEIGHT: 50px" align="center">
							<P><UC1:PAGETITLE id="PageTitle1" title="Gestione Inserimento-modifica Email" runat="server"></UC1:PAGETITLE></P>
						</TD>
					</TR>
					<TR>
						<TD height="95%" vAlign="top" align="center">
							<TABLE id="tblFormInput" cellSpacing="1" cellPadding="1" align="center">
								<TR>
									<TD style="WIDTH: 5%; HEIGHT: 5%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 5%" vAlign="top" align="left">&nbsp;<MESSPANEL:MESSAGEPANEL id="PanelMess" runat="server" erroriconurl="~/Images/ico_critical.gif" messageiconurl="~/Images/ico_info.gif"></MESSPANEL:MESSAGEPANEL>
										<ASP:LABEL style="Z-INDEX: 0" id="lbloperazione" runat="server"></ASP:LABEL></TD>
								</TR>
								<TR>
									<TD vAlign="top" align="center"></TD>
									<TD vAlign="top" align="left"><ASP:PANEL id="PanelEdit" runat="server">
											<TABLE id="tblSearch75" border="0" cellSpacing="1" cellPadding="2">
												<TBODY>
													<TR>
														<TD colSpan="4" align="center"></TD>
													</TR>
													<TR>
														<TD align="right"><asp:requiredfieldvalidator id="rfvDescrizione" runat="server" ErrorMessage="Inserire la descrizione" ControlToValidate="txtsDescrizione">*</asp:requiredfieldvalidator><asp:regularexpressionvalidator id="rem" runat="server" ErrorMessage="Email non valida!" ControlToValidate="txtsDescrizione"
																ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:regularexpressionvalidator>Email</TD>
														<TD><CC1:S_TEXTBOX id="txtsDescrizione" runat="server" maxlength="128" dbparametername="p_Descrizione"
																dbdirection="Input" width="95%" dbsize="50"></CC1:S_TEXTBOX></TD>
													</TR>
													<tr>
														<TD align="right">Note</TD>
														<td><CC1:S_TEXTBOX id="txtsNote" tabIndex="1" runat="server" maxlength="100" dbparametername="p_Note"
																width="256px" dbsize="50" dbindex="1"></CC1:S_TEXTBOX></td>
													</tr>
													<tr>
														<TD style="HEIGHT: 24px" align="right">Manutenzione a Richiesta</TD>
														<td style="HEIGHT: 24px"><asp:checkbox id="CHKMRSGA" runat="server" Text="SGA"></asp:checkbox>&nbsp;
															<asp:checkbox style="Z-INDEX: 0" id="CHKMRDIE" runat="server" Text="DIE"></asp:checkbox></td>
													</tr>
													<tr>
														<TD align="right">Manutenzione Straordinaria</TD>
														<td><asp:checkbox style="Z-INDEX: 0" id="CHKMSSGA" runat="server" Text="SGA"></asp:checkbox>&nbsp;
															<asp:checkbox style="Z-INDEX: 0" id="CHKMSDIE" runat="server" Text="DIE"></asp:checkbox></td>
													</tr>
													<tr>
														<TD align="right"></TD>
														<TD></TD>
													</tr>
													<TR>
														<TD align="right"></TD>
														<td></td>
													</TR></TD>
								</TR>
							</TABLE>
							</ASP:PANEL></TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 4.33%" vAlign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CC1:S_BUTTON id="btnsSalva" tabIndex="3" runat="server" text="Salva Email" cssclass="btn"></CC1:S_BUTTON>
						</TD>
						<td style="HEIGHT: 4.33%" vAlign="top" align="left"><ASP:BUTTON id="btnAnnulla" tabIndex="5" runat="server" text="Indietro" cssclass="btn" causesvalidation="False"></ASP:BUTTON>&nbsp;&nbsp;&nbsp;
							<CC1:S_BUTTON style="Z-INDEX: 0" id="btnCopiaEmail" tabIndex="3" runat="server" text="Copia Associazioni Edifici-Servizi da Email"
								cssclass="btn" Width="208px"></CC1:S_BUTTON><CC1:S_COMBOBOX style="Z-INDEX: 0" id="cmbCopiaEmail" tabIndex="2" runat="server" dbparametername="p_Email"
								dbindex="2" Width="319px" dbdatatype="Integer"></CC1:S_COMBOBOX>
						<td>
						<TD style="HEIGHT: 4.33%" vAlign="top" align="left"></TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 5%" vAlign="top" align="left"></TD>
						<TD style="HEIGHT: 5%" vAlign="top" align="left"><ASP:LABEL id="lblMessage" runat="server"></ASP:LABEL><ASP:LABEL style="Z-INDEX: 0" id="lblEmailIns" runat="server" Visible="False"></ASP:LABEL></TD>
					</TR>
				</TBODY>
			</TABLE>
			<asp:validationsummary id="vlsEdit" runat="server" ShowSummary="False" ShowMessageBox="True"></asp:validationsummary></TD></TR></TBODY></TABLE></FORM>
		<script language="javascript">parent.left.calcola();</script>
		</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
