<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Page language="c#" Codebehind="ListaMateriali.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.ListaMateriali" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Eqstd</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
	</HEAD>
	<body bottomMargin="0" leftMargin="5" rightMargin="0" onbeforeunload="parent.left.valorizza()"
		topMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; TOP: 0px; LEFT: 0px" id="TableMain"
				border="0" cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TR>
					<TD align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="center">
						<TABLE id="tblForm" cellSpacing="1" cellPadding="1" align="center">
							<tbody>
								<TR>
									<TD align="top"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" TitleStyle-CssClass="TitleSearch" CssClass="DataPanel75"
											TitleText="Ricerca" AllowTitleExpandCollapse="True" Collapsed="False" ExpandText="Espandi" CollapseText="Riduci"
											CollapseImageUrl="../Images/up.gif" ExpandImageUrl="../Images/down.gif">
											<TABLE id="tblSearch100" border="0" cellSpacing="1" cellPadding="2">
												<TR>
													<TD width="10%" align="left">Codice Materiale</TD>
													<TD width="20%">
														<cc1:S_TextBox id="txtCodMateriale" tabIndex="1" runat="server" DBIndex="0" DBParameterName="p_codice_mat"
															DBDirection="Input" width="100%" DBSize="16"></cc1:S_TextBox></TD>
													<TD width="15%" align="left">Descrizione Materiale</TD>
													<TD width="55%">
														<cc1:S_TextBox id="txtDescMateriale" tabIndex="2" runat="server" DBIndex="1" DBParameterName="p_descrizione"
															DBDirection="Input" width="90%" DBSize="50"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 20px" align="left">Unità di Misura</TD>
													<TD style="HEIGHT: 20px">
														<cc1:S_ComboBox style="Z-INDEX: 0" id="S_CmbUnita" tabIndex="3" runat="server" DBIndex="3" DBParameterName="p_unita_id"
															DBDirection="Input" DBSize="25" DBDataType="Integer"></cc1:S_ComboBox></TD>
													<TD style="HEIGHT: 20px" align="left">Magazzino</TD>
													<TD style="HEIGHT: 20px">
														<cc1:S_ComboBox style="Z-INDEX: 0" id="S_cmbMagazzino" tabIndex="4" runat="server" DBIndex="4" DBParameterName="p_id_magazzino"
															DBDirection="Input" DBSize="25" DBDataType="Integer"></cc1:S_ComboBox></TD>
												</TR>
												<TR>
													<TD colSpan="3" align="left">
														<cc1:S_Button id="btnsRicerca" tabIndex="4" runat="server" CssClass="btn" Text="Ricerca"></cc1:S_Button>&nbsp;&nbsp;&nbsp;
														<cc1:S_Button id="btnReset" tabIndex="5" runat="server" CssClass="btn" Text="Reset"></cc1:S_Button></TD>
													<TD align="right"><A class=GuidaLink href="<%= HelpLink %>" 
                  target=_blank>Guida</A>
													</TD>
												</TR>
											</TABLE>
										</COLLAPSE:DATAPANEL></TD>
								</TR>
								<tr>
									<TD align="center"><uc1:gridtitle id="GridTitle1" runat="server"></uc1:gridtitle><asp:datagrid id="DataGridRicerca" runat="server" CssClass="DataGrid" AllowPaging="True" AutoGenerateColumns="False"
											GridLines="Vertical" BorderWidth="1px" BorderColor="Gray">
											<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
											<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
											<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn>
													<HeaderStyle Width="1%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<ItemTemplate>
														<asp:ImageButton id="imgVisualizza" Runat=server CommandName="Dettaglio" ImageUrl="~/images/Search16x16_bianca.jpg" CommandArgument='<%# "EditMateriale.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"idmateriali") + "&FunId=" + FunId + "&TipoOper=read"%>'>
														</asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="1%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<ItemTemplate>
														<asp:ImageButton id="imgModifica" Runat=server CommandName="Dettaglio" ImageUrl="~/images/edit.gif" CommandArgument='<%# "EditMateriale.aspx?ItemID="+ DataBinder.Eval(Container.DataItem,"idmateriali") + "&FunId=" + FunId + "&TipoOper=write"%>'>
														</asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="mcodice" HeaderText="Codice Materiale">
													<HeaderStyle Width="20%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="mdescrizione" HeaderText="Descrizione Materiale">
													<HeaderStyle Width="40%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="magazzino" HeaderText="Magazzino">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="prezzo" HeaderText="Prezzo" DataFormatString="{0:c}">
													<HeaderStyle Width="15px"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="ucodice" HeaderText="Unit&#224; di Misura">
													<HeaderStyle Width="20%"></HeaderStyle>
												</asp:BoundColumn>
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
