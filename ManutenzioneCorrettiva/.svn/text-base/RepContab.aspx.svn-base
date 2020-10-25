<%@ Page language="c#" Codebehind="RepContab.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorrettiva.RepContab" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Anagrafica Contabilizzazione</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
		<script language="javascript">
		</script>
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; TOP: 0px; LEFT: 0px" id="TableMain" border="0"
				cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR>
					<TD height="95%" vAlign="top" align="center">
						<TABLE id="tblForm" cellSpacing="1" cellPadding="1" align="center">
							<TR>
								<TD style="HEIGHT: 25%" vAlign="top" align="left"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" TitleStyle-CssClass="TitleSearch" CssClass="DataPanel75"
										TitleText="Ricerca" AllowTitleExpandCollapse="True" Collapsed="False" ExpandText="Espandi" CollapseText="Riduci" CollapseImageUrl="../Images/up.gif"
										ExpandImageUrl="../Images/down.gif">
										<TABLE id="tblSearch100" border="0" cellSpacing="0" cellPadding="2">
											<TR>
												<TD align="left">Centro di Costo</TD>
												<TD>
													<cc1:s_textbox id="txtsDescrizione" tabIndex="1" runat="server" width="384px" DBParameterName="P_CdC"
														DBSize="100" DBDirection="Input"></cc1:s_textbox></TD>
											</TR>
											<TR>
												<TD align="left">Servizio</TD>
												<TD>
													<CC1:S_COMBOBOX style="Z-INDEX: 0" id="cmbsServizio" tabIndex="2" runat="server" DBParameterName="P_servizi_id"
														DBSize="10" DBDirection="Input" DBDataType="Integer" DBIndex="1"></CC1:S_COMBOBOX>&nbsp;
												</TD>
											</TR>
											<TR>
												<TD align="left">Anno</TD>
												<TD>
													<cc1:S_ComboBox style="Z-INDEX: 0" id="cmbsAnno" runat="server" DBParameterName="p_ANNO" DBSize="20"
														DBIndex="2"></cc1:S_ComboBox></TD>
											</TR>
											<TR>
												<TD style="WIDTH: 522px" colSpan="2" align="left">
													<cc1:s_button id="btnsRicerca" tabIndex="3" runat="server" CssClass="btn" Text="Ricerca"></cc1:s_button>&nbsp;
													<cc1:S_Button id="BtnReset" tabIndex="4" runat="server" CssClass="btn" Text="Reset"></cc1:S_Button></TD>
												<TD align="right"><A class=GuidaLink href="<%= HelpLink %>" 
                  target=_blank>Guida</A></TD>
											</TR>
										</TABLE>
									</COLLAPSE:DATAPANEL></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 3%" align="center"></TD>
							<TR>
								<TD style="HEIGHT: 72%" vAlign="top" align="center"><uc1:gridtitle id="GridTitle1" runat="server"></uc1:gridtitle>
									<asp:datagrid id="DataGridRicerca" runat="server" CssClass="DataGrid" AllowPaging="True" AutoGenerateColumns="False"
										GridLines="Vertical" BorderWidth="1px" BorderColor="Gray" ShowFooter="True">
										<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
										<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
										<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="SERVIZIO" HeaderText="Servizio">
												<HeaderStyle Width="30%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="CDC" HeaderText="Centro di Costo">
												<HeaderStyle Width="30%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="SOMMA" HeaderText="Importo Consuntivo" DataFormatString="{0:C}">
												<ItemStyle HorizontalAlign="Right" Width="30%"></ItemStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn>
												<HeaderStyle Width="5%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
												<ItemTemplate>
													<asp:LinkButton id=LinkButton1 runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"RdL") %>' OnCommand="LinkButton1_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"idcontabilizzazione") %>'>
													</asp:LinkButton>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle Mode="NumericPages"></PagerStyle>
									</asp:datagrid></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
