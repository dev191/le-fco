<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CodiceApparecchiature" Src="../WebControls/CodiceApparecchiature.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserStanzeRic" Src="../WebControls/UserStanzeRic.ascx" %>
<%@ Page language="c#" Codebehind="NavigazioneEdifici.aspx.cs" AutoEventWireup="false" Inherits="TheSite.AnagrafeImpianti.NavigazioneEdifici" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>NavigazioneEdifici</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; TOP: 8px; LEFT: 8px" id="TableMain" border="0"
				cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="left"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" TitleStyle-CssClass="TitleSearch" Collapsed="False"
							TitleText="Ricerca" ExpandText="Espandi" ExpandImageUrl="../Images/down.gif" CollapseText="Espandi/Riduci" CssClass="DataPanel75"
							CollapseImageUrl="../Images/up.gif" AllowTitleExpandCollapse="True">
							<TABLE id="tblSearch100" border="0" cellSpacing="1" cellPadding="1">
								<TR>
									<TD vAlign="top" colSpan="4" align="center">
										<P>
											<uc1:RicercaModulo id="RicercaModulo1" runat="server"></uc1:RicercaModulo>
											<asp:requiredfieldvalidator id="rfvEdificio" runat="server" ErrorMessage="Selezionare un Edificio per eseguire la ricerca">*</asp:requiredfieldvalidator></P>
									</TD>
								</TR>
								<TR>
									<TD style="WIDTH: 15%">Piano:</TD>
									<TD style="HEIGHT: 28px">
										<cc1:s_combobox id="cmbsPiano" runat="server" Width="200px"></cc1:s_combobox></TD>
									<TD colSpan="2"></TD>
								</TR>
								<TR>
									<TD style="HEIGHT: 13px"><SPAN>&nbsp;</SPAN></TD>
									<TD style="HEIGHT: 13px" colSpan="3"></TD>
								</TR>
								<TR>
									<TD style="HEIGHT: 28px"><SPAN>Destinazioni Uso:</SPAN>
									</TD>
									<TD style="HEIGHT: 28px" colSpan="3">
										<asp:TextBox id="TxtUso" runat="server" Width="392px"></asp:TextBox></TD>
								</TR>
								<TR>
									<TD colSpan="4">&nbsp;
										<P></P>
										<TABLE style="HEIGHT: 19px" id="Table1" border="0" cellSpacing="0" cellPadding="0" width="100%">
											<TR>
												<TD colSpan="4" align="center">
													<TABLE id="Table3" border="0" cellSpacing="1" cellPadding="1" width="100%">
														<TR>
															<TD>
																<cc1:S_Button id="S_btMostra" runat="server" CssClass="btn" Width="134px" ToolTip="Avvia la ricerca"
																	Text="Mostra Dettagli"></cc1:S_Button></TD>
															<TD>
																<cc1:S_Button id="btReset" runat="server" CssClass="btn" Width="67px" Text="Reset" CausesValidation="False"></cc1:S_Button></TD>
															<TD>
																<cc1:S_Button id="S_Button1" runat="server" CssClass="btn" Width="134px" Text="Esporta in excel"></cc1:S_Button></TD>
															<TD>
																<asp:Button id="BtExport" runat="server" CssClass="btn" Width="134px" Text="Exp. Report in Excel"
																	CausesValidation="False"></asp:Button></TD>
															<TD title="L'estrazione è sensibile ai criteri di filtro selezionati">Tipo Exp:
															</TD>
															<TD>
																<asp:DropDownList id="DrTipoRep" runat="server" Width="256px">
																	<asp:ListItem Value="0">Edifici - Piani </asp:ListItem>
																	<asp:ListItem Value="1">Edifici - Piani- Stanze</asp:ListItem>
																	<asp:ListItem Value="2">Destinazione Uso</asp:ListItem>
																	<asp:ListItem Value="3">Reparti</asp:ListItem>
																	<asp:ListItem Value="4">Categorie</asp:ListItem>
																</asp:DropDownList></TD>
															<TD><A class=GuidaLink href="<%= HelpLink %>" 
                        target=_blank>Guida</A></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
						</COLLAPSE:DATAPANEL></TD>
				</TR>
				<TR vAlign="top">
					<TD vAlign="top"><uc1:gridtitle id="GridTitle1" runat="server"></uc1:gridtitle><asp:datagrid id="MyDataGrid1" runat="server" CssClass="DataGrid" Width="100%" AllowCustomPaging="True"
							GridLines="Vertical" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="Gray">
							<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
							<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
							<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
							<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="bl_id" HeaderText="Cod.Edificio"></asp:BoundColumn>
								<asp:BoundColumn DataField="Piano" HeaderText="Piano"></asp:BoundColumn>
								<asp:BoundColumn DataField="NR_STANZA" HeaderText="NR_STANZA"></asp:BoundColumn>
								<asp:BoundColumn DataField="DESCR" HeaderText="Descrizione"></asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Left" CssClass="DataGridPagerStyle" Mode="NumericPages"></PagerStyle>
						</asp:datagrid></TD>
				</TR>
			</TABLE>
			<asp:validationsummary style="Z-INDEX: 102; POSITION: absolute; TOP: 648px; LEFT: 24px" id="vlsEdit" runat="server"
				ShowSummary="False" DisplayMode="List" ShowMessageBox="True"></asp:validationsummary></form>
		</TD></TR></TBODY></TABLE>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
