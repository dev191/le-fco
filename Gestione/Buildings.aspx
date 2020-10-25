<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Page language="c#" Codebehind="Buildings.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.Buildings" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>Ditte</TITLE>
		<META name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<META name="CODE_LANGUAGE" content="C#">
		<META name="vs_defaultClientScript" content="JavaScript">
		<META name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
		<SCRIPT language="javascript">
	function SoloNumeri()
	{	
		if (event.keyCode < 48	|| event.keyCode > 57){
			event.keyCode = 0;
		}	
	}	
		</SCRIPT>
	</HEAD>
	<BODY onbeforeunload="parent.left.valorizza()" ms_positioning="GridLayout">
		<FORM id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; TOP: 0px; LEFT: 0px" id="TableMain" border="0"
				cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><UC1:PAGETITLE id="PageTitle1" runat="server"></UC1:PAGETITLE></TD>
				</TR>
				<TR>
					<TD height="95%" vAlign="top" align="center">
						<TABLE id="tblForm" cellSpacing="1" cellPadding="1" align="center">
							<TR>
								<TD style="HEIGHT: 25%" vAlign="top" align="left"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" titlestyle-cssclass="TitleSearch" cssclass="DataPanel75"
										titletext="Ricerca" allowtitleexpandcollapse="True" collapsed="False" expandtext="Espandi" collapsetext="Riduci" collapseimageurl="../Images/up.gif"
										expandimageurl="../Images/down.gif">
										<TABLE id="tblSearch100" border="0" cellSpacing="0" cellPadding="2">
											<TR>
												<TD style="HEIGHT: 24px" width="20%" align="right">Codice Edificio
												</TD>
												<TD style="WIDTH: 219px; HEIGHT: 24px" width="219">
													<CC1:S_TEXTBOX id="txtsBL_ID" tabIndex="1" runat="server" width="208px" maxlength="6" dbindex="0"
														dbsize="8" dbdirection="Input" dbparametername="p_BL_ID"></CC1:S_TEXTBOX></TD>
												<TD style="HEIGHT: 24px" width="20%" align="right">Nome</TD>
												<TD style="HEIGHT: 24px" width="30%">
													<CC1:S_TEXTBOX id="txtsName" tabIndex="2" runat="server" width="208px" maxlength="50" dbindex="1"
														dbsize="50" dbdirection="Input" dbparametername="p_NAME"></CC1:S_TEXTBOX></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 24px" align="right">Indirizzo</TD>
												<TD style="WIDTH: 219px; HEIGHT: 24px">
													<CC1:S_TEXTBOX id="txtsIndirizzo" tabIndex="3" runat="server" width="208px" maxlength="50" dbindex="2"
														dbsize="50" dbparametername="p_INDIRIZZO"></CC1:S_TEXTBOX></TD>
												<TD style="HEIGHT: 24px" align="right">Ditta Referente</TD>
												<TD style="HEIGHT: 24px">
													<CC1:S_TEXTBOX id="txtsReferente" tabIndex="4" runat="server" width="208px" dbindex="3" dbsize="50"
														dbparametername="p_REFERENTE"></CC1:S_TEXTBOX></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" align="right">Comune</TD>
												<TD style="WIDTH: 219px; HEIGHT: 23px">
													<CC1:S_TEXTBOX id="txtsComune" tabIndex="5" runat="server" width="208px" dbindex="4" dbsize="50"
														dbparametername="p_COMUNE"></CC1:S_TEXTBOX></TD>
												<TD style="DISPLAY:NONE" align="right">Progetto</TD>
												<TD style="DISPLAY:NONE">
													<CC1:S_COMBOBOX id="CmbProgetto" tabIndex="8" runat="server" width="208px" dbindex="5" dbsize="1"
														dbdirection="Input" dbparametername="p_progetto" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 23px" align="right"></TD>
												<TD style="WIDTH: 219px; HEIGHT: 23px"></TD>
												<TD style="HEIGHT: 23px" align="right"></TD>
												<TD style="HEIGHT: 23px">
													<asp:Button id="Button1" runat="server" Text="Calcola tutte le superfici" Visible="False"></asp:Button></TD>
											</TR>
											<TR>
											</TR>
											<TR>
												<TD colSpan="2">
													<CC1:S_BUTTON id="btnsRicerca" tabIndex="6" runat="server" cssclass="btn" width="125px" text="Ricerca"></CC1:S_BUTTON>&nbsp;
													<ASP:BUTTON id="btnEsporta" runat="server" cssclass="btn" width="125px" text="Esporta Dati In Excel"></ASP:BUTTON>&nbsp;
													<CC1:S_BUTTON id="BtnReset" tabIndex="4" runat="server" cssclass="btn" width="60px" text="Reset"></CC1:S_BUTTON></TD>
												<TD></TD>
												<TD align="right"><A class=GuidaLink href="<%= HelpLink %>" 
                  target=_blank>Guida</A></TD>
											</TR>
											<TR>
											</TR>
										</TABLE>
									</COLLAPSE:DATAPANEL></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 3%" align="center"><asp:label id="lbMessage" runat="server"></asp:label></TD>
							<TR>
								<TD style="HEIGHT: 72%" vAlign="top" align="center"><UC1:GRIDTITLE id="GridTitle1" runat="server"></UC1:GRIDTITLE><ASP:DATAGRID id="DataGridRicerca" runat="server" cssclass="DataGrid" autogeneratecolumns="False"
										gridlines="Vertical" borderwidth="1px" bordercolor="Gray" allowpaging="True" PageSize="100">
										<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
										<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
										<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
										<Columns>
											<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
											<asp:TemplateColumn>
												<HeaderStyle Width="3%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
												<ItemTemplate>
													<asp:ImageButton id="ImgBtnDettaglio" CommandArgument='<%# "EditBuilding.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ID") + "&amp;FunId=" + FunId + "&amp;TipoOper=read" %>' CommandName="Dettaglio" Runat="server" ImageUrl="../images/Search16x16_bianca.jpg">
													</asp:ImageButton>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn>
												<HeaderStyle Width="3%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
												<ItemTemplate>
													<asp:ImageButton id="ImgBtnEdit" CommandArgument='<%# "EditBuilding.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ID") + "&amp;FunId=" + FunId + "&amp;TipoOper=write" %>' CommandName="Dettaglio" Runat="server" ImageUrl="../images/edit.gif">
													</asp:ImageButton>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="bl_id" HeaderText="Codice">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="name" HeaderText="Nome">
												<HeaderStyle Width="27%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Indirizzo" HeaderText="Indirizzo">
												<HeaderStyle Width="23%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Referente" HeaderText="Ditta Referente">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="prcom" HeaderText="Comune">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="progetto" HeaderText="Progetto">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle Mode="NumericPages"></PagerStyle>
									</ASP:DATAGRID></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</FORM>
		<SCRIPT language="javascript">parent.left.calcola();</SCRIPT>
	</BODY>
</HTML>
