<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Page language="c#" Codebehind="Pmp.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.Pmp" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>PMP</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="C#" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" bottommargin="0" leftmargin="5" topmargin="0"
		rightmargin="0" ms_positioning="GridLayout">
		<FORM id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; TOP: 0px; LEFT: 0px"
				cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<TR>
					<TD align="center"><UC1:PAGETITLE id="PageTitle1" runat="server"></UC1:PAGETITLE></TD>
				</TR>
				<TR>
					<TD valign="top" align="center">
						<TABLE id="tblForm" cellspacing="1" cellpadding="1" align="center">
							<TBODY>
								<TR>
									<TD align="top"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" expandimageurl="../Images/down.gif" collapseimageurl="../Images/up.gif"
											collapsetext="Riduci" expandtext="Espandi" collapsed="False" allowtitleexpandcollapse="True" titletext="Ricerca"
											cssclass="DataPanel75" titlestyle-cssclass="TitleSearch">
											<TABLE id="tblSearch100" cellspacing="1" cellpadding="2" border="0">
												<TBODY>
													<TR>
														<TD style="HEIGHT: 20px" align="left" width="20%">Descrizione</TD>
														<TD style="HEIGHT: 20px" width="20%"><CC1:S_TEXTBOX id="txtsdescrizione" tabindex="1" runat="server" dbsize="250" width="100%" dbdirection="Input"
																dbparametername="p_descrizione" dbindex="0"></CC1:S_TEXTBOX></TD>
														<TD style="HEIGHT: 20px" align="left" width="20%">Servizio</TD>
														<TD style="HEIGHT: 20px" width="40%"><CC1:S_COMBOBOX id="cmbsServizio" tabindex="2" runat="server" dbsize="10" dbdirection="Input" dbparametername="p_serv_id"
																dbindex="1" autopostback="True" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
													</TR>
													<TR>
														<TD align="left" width="20%" style="HEIGHT: 4px">Standard Apparecchiatura</TD>
														<TD width="40%" style="HEIGHT: 4px"><CC1:S_COMBOBOX id="cmbseq_std" tabindex="2" runat="server" dbsize="10" dbdirection="Input" dbparametername="p_eq_std_id"
																dbindex="2" autopostback="True" dbdatatype="Integer" width="400px"></CC1:S_COMBOBOX></TD>
														<TD style="HEIGHT: 4px" align="left">Frequenza</TD>
														<TD style="HEIGHT: 4px"><CC1:S_COMBOBOX id="cmbspmpfrequenza" tabindex="3" runat="server" dbsize="10" dbdirection="Input"
																dbparametername="p_pmp" dbindex="3" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
													</TR>
													<TR>
														<TD style="HEIGHT: 20px" align="left">Specializzazioni</TD>
														<TD style="HEIGHT: 20px"><CC1:S_COMBOBOX id="cmbstr_id" tabindex="3" runat="server" dbsize="10" dbdirection="Input" dbparametername="p_id_tr"
																dbindex="4" dbdatatype="Integer" width="320px"></CC1:S_COMBOBOX></TD>
														<TD style="HEIGHT: 20px" align="left"></TD>
														<TD style="HEIGHT: 20px"></TD>
													</TR>
													<TR>
														<TD align="left" colspan="3">&nbsp;
															<CC1:S_BUTTON id="btnsRicerca" tabindex="4" runat="server" text="Ricerca" cssclass="btn"></CC1:S_BUTTON>
															<ASP:BUTTON id="cmdReset" text="Reset" runat="server" cssclass="btn"></ASP:BUTTON></TD>
														<TD align="right"><A class=GuidaLink 
                  href="<%= HelpLink %>" target=_blank 
                  >Guida</A>
														</TD>
													</TR>
								</TR>
							</TBODY>
						</TABLE>
						</COLLAPSE:DATAPANEL></TD>
				</TR>
				<TR>
					<TD align="center"><UC1:GRIDTITLE id="GridTitle1" runat="server"></UC1:GRIDTITLE><ASP:DATAGRID id="DataGridRicerca" runat="server" cssclass="DataGrid" allowpaging="True" autogeneratecolumns="False"
							gridlines="Vertical" borderwidth="1px" bordercolor="Gray">
							<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
							<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
							<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn>
									<HeaderStyle Width="1%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
									<ItemTemplate>
										<asp:ImageButton id="imgbtnVisualizza" CommandArgument='<%# "EditPmp.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ID") + "&amp;FunId=" + FunId + "&amp;TipoOper=read"%>' ImageUrl="../Images/Search16x16_bianca.jpg" CommandName="Dettaglio" Runat="server" ToolTip="Visualizza Procedura di Manutenzione">
										</asp:ImageButton>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn>
									<HeaderStyle Width="1%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
									<ItemTemplate>
										<asp:ImageButton id="imgbtnModifica" CommandArgument='<%# "EditPmp.aspx?ItemID="+ DataBinder.Eval(Container.DataItem,"ID") + "&amp;FunId=" + FunId + "&amp;TipoOper=write"%>' ImageUrl="../Images/edit.gif" CommandName="Dettaglio" Runat="server" ToolTip="Modifica Procedura di Manutenzione">
										</asp:ImageButton>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn>
									<HeaderStyle Width="1%"></HeaderStyle>
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
									<ItemTemplate>
										<asp:ImageButton id="imgbtnStep" CommandArgument='<%# "PmpS.aspx?ItemID="+ DataBinder.Eval(Container.DataItem,"ID") + "&amp;FunId=" + FunId %>' ImageUrl="../Images/step.jpg" CommandName="Dettaglio" Runat="server" ToolTip="Passi per Procedura di Manutenzione">
										</asp:ImageButton>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="pmp_id" HeaderText="COD PMP">
									<HeaderStyle Width="14%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="descrizione" HeaderText="Descrizione">
									<HeaderStyle Width="20%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="servizio" HeaderText="Servizio">
									<HeaderStyle Width="10%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="Standard" HeaderText="Standard Apparecchiatura">
									<HeaderStyle Width="24%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="fqdes" HeaderText="Frequenza">
									<HeaderStyle Width="14%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="trdescrizione" HeaderText="Specializzazione">
									<HeaderStyle Width="18%"></HeaderStyle>
								</asp:BoundColumn>
								<asp:BoundColumn Visible="False" DataField="ac_id" HeaderText="DISMESSA"></asp:BoundColumn>
							</Columns>
							<PagerStyle HorizontalAlign="Left" CssClass="DataGridPagerStyle" Mode="NumericPages"></PagerStyle>
						</ASP:DATAGRID></TD>
				</TR>
			</TABLE>
			</TD></TR></TBODY></TABLE></FORM>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
