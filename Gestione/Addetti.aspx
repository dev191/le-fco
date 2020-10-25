<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Page language="c#" Codebehind="Addetti.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.Addetti" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Addetti</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" bottomMargin="0" leftMargin="5" topMargin="0"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; TOP: 0px; LEFT: 0px"
				cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<TR>
					<TD align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="center">
						<TABLE id="tblForm" cellSpacing="1" cellPadding="1" align="center">
							<tbody>
								<TR>
									<TD align="top">
										<COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" ExpandImageUrl="../Images/down.gif" CollapseImageUrl="../Images/up.gif"
											CollapseText="Riduci" ExpandText="Espandi" Collapsed="False" AllowTitleExpandCollapse="True" TitleText="Ricerca"
											CssClass="DataPanel75" TitleStyle-CssClass="TitleSearch">
											<TABLE id="tblSearch100" border="0" cellSpacing="1" cellPadding="2">
												<TR>
													<TD width="20%" align="left">Cognome</TD>
													<TD width="20%">
														<cc1:S_TextBox id="txtscognome" tabIndex="1" runat="server" DBSize="50" width="100%" DBDirection="Input"
															DBParameterName="p_cognome" DBIndex="0"></cc1:S_TextBox></TD>
													<TD width="20%" align="left">Nome</TD>
													<TD width="40%">
														<cc1:S_TextBox id="txtsnome" tabIndex="2" runat="server" DBSize="50" width="90%" DBDirection="Input"
															DBParameterName="p_nome" DBIndex="1"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 22px" align="left">Ditta</TD>
													<TD style="HEIGHT: 22px">
														<cc1:S_ComboBox id="cmbsditta" tabIndex="3" runat="server" DBSize="10" DBDirection="Input" DBParameterName="p_ditta"
															DBIndex="2" DBDataType="Integer"></cc1:S_ComboBox></TD>
													<TD style="HEIGHT: 22px" align="left"></TD>
													<TD style="HEIGHT: 22px"></TD>
												</TR>
												<TR>
													<TD colSpan="3" align="left">&nbsp;
														<cc1:S_Button id="btnsRicerca" tabIndex="4" runat="server" CssClass="btn" Text="Ricerca"></cc1:S_Button>
														<cc1:S_Button id="BtnReset" tabIndex="4" runat="server" CssClass="btn" Text="Reset"></cc1:S_Button></TD>
													<TD align="right"><A class=GuidaLink href="<%= HelpLink %>" 
                  target=_blank>Guida</A>
													</TD>
												</TR>
											</TABLE>
										</COLLAPSE:DATAPANEL></TD>
								</TR>
								<tr>
									<TD align="center"><uc1:gridtitle id="GridTitle1" runat="server"></uc1:gridtitle><asp:datagrid id="DataGridRicerca" runat="server" CssClass="DataGrid" BorderColor="Gray" BorderWidth="1px"
											GridLines="Vertical" AutoGenerateColumns="False" AllowPaging="True">
											<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
											<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
											<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn>
													<HeaderStyle Width="1%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<ItemTemplate>
														<asp:ImageButton id="Imagebutton3" Runat="server" CommandName="Dettaglio" ImageUrl="~/images/Search16x16_bianca.jpg" CommandArgument='<%# "EditAddetti.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ADDETTO_ID") + "&FunId=" + FunId + "&TipoOper=read"%>'>
														</asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="1%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<ItemTemplate>
														<asp:ImageButton id="Imagebutton1" Runat="server" CommandName="Dettaglio" ImageUrl="~/images/edit.gif" CommandArgument='<%# "EditAddetti.aspx?ItemID="+ DataBinder.Eval(Container.DataItem,"ADDETTO_ID") + "&FunId=" + FunId + "&TipoOper=write"%>'>
														</asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False">
													<HeaderStyle Width="1%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<ItemTemplate>
														<asp:ImageButton id="Imagebutton2" Runat="server" CommandName="Dettaglio" ImageUrl="../images/view.gif" CommandArgument='<%# "EditPianoFerie.aspx?ItemID="+ DataBinder.Eval(Container.DataItem,"ADDETTO_ID") + "&FunId=" + FunId + "&TipoOper=write"%>'>
														</asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="cognome" HeaderText="Cognome">
													<HeaderStyle Width="18%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="nome" HeaderText="Nome">
													<HeaderStyle Width="18%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="descrizione" HeaderText="Ditta">
													<HeaderStyle Width="18%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="telefono" HeaderText="Telefono">
													<HeaderStyle Width="15%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="cellulare" HeaderText="Cellulare">
													<HeaderStyle Width="15%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="zona" HeaderText="Zona">
													<HeaderStyle Width="16%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="codicelivello" HeaderText="Livello"></asp:BoundColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></TD>
								</tr>
							</tbody>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
