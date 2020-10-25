<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Page language="c#" Codebehind="RdLAddetti.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorrettiva.RdLAddetti" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
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
	<body bottomMargin="0" onbeforeunload="parent.left.valorizza()" leftMargin="5" topMargin="0"
		rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 0px"
				cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
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
											<TABLE id="tblSearch100" cellSpacing="1" cellPadding="2" border="0">
												<TR>
													<TD align="left" width="20%">Cognome</TD>
													<TD width="20%">
														<cc1:S_TextBox id="txtscognome" tabIndex="1" runat="server" DBIndex="0" DBParameterName="p_cognome"
															DBDirection="Input" width="100%" DBSize="50"></cc1:S_TextBox></TD>
													<TD align="left" width="20%">Nome</TD>
													<TD width="40%">
														<cc1:S_TextBox id="txtsnome" tabIndex="2" runat="server" DBIndex="1" DBParameterName="p_nome" DBDirection="Input"
															width="344px" DBSize="50"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 22px" align="left">Ditta</TD>
													<TD style="HEIGHT: 22px">
														<cc1:S_ComboBox id="cmbsditta" tabIndex="3" runat="server" DBIndex="2" DBParameterName="p_ditta"
															DBDirection="Input" DBSize="10" DBDataType="Integer"></cc1:S_ComboBox></TD>
													<TD style="HEIGHT: 22px" align="left">Edificio</TD>
													<TD style="HEIGHT: 22px">
														<cc1:S_ComboBox id="cmbsedificio" tabIndex="3" runat="server" DBIndex="2" DBParameterName="p_ditta"
															DBDirection="Input" DBSize="10" DBDataType="Integer"></cc1:S_ComboBox></TD>
												</TR>
												<TR>
													<TD align="left" width="20%">Data Pianificata DA</TD>
													<TD width="20%">
														<uc1:CalendarPicker id="CalendarPicker1" runat="server"></uc1:CalendarPicker></TD>
													<TD align="left" width="20%">Data Pianificata A</TD>
													<TD width="40%">
														<uc1:CalendarPicker id="Calendarpicker2" runat="server"></uc1:CalendarPicker></TD>
												</TR>
												<TR>
													<TD align="left" colSpan="3">&nbsp;
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
									<TD align="center"><uc1:gridtitle id="GridTitle1" runat="server"></uc1:gridtitle><asp:datagrid id="DataGridRicerca" runat="server" CssClass="DataGrid" AllowPaging="True" AutoGenerateColumns="False"
											GridLines="Vertical" BorderWidth="1px" BorderColor="Gray">
											<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
											<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
											<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn Visible="False">
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
														<asp:ImageButton id="Imagebutton1" Runat="server" CommandName="Dettaglio" ImageUrl="~/images/edit.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"HTMLADDRDL")%>'>
														</asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False">
													<HeaderStyle Width="1%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
													<ItemTemplate>
														<asp:ImageButton id="Imagebutton2" Runat="server" CommandName="Dettaglio" ImageUrl="../images/view.gif" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"HTMLADDRDL") %>'>
														</asp:ImageButton>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="Addetto" HeaderText="Addetto">
													<HeaderStyle Width="18%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="bl_id" HeaderText="Edifici">
													<HeaderStyle Width="18%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="NR_RDL" HeaderText="Nr RdL">
													<HeaderStyle Width="18%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="datapianif" HeaderText="Data Pianificata"></asp:BoundColumn>
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
