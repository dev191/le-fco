<%@ Page language="c#" Codebehind="CreazioneSGA3.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorrettiva.CreazioneSGA3" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UserStanze" Src="../WebControls/UserStanze.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Register TagPrefix="MessPanel" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="uc1" TagName="ProblemaCausaWC" Src="../WebControls/ProblemaCausaWC.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PassiProcedure" Src="../WebControls/PassiProcedure.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CodiceApparecchiature" Src="../WebControls/CodiceApparecchiature.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="RichiedentiSollecito" Src="../WebControls/RichiedentiSollecito.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Richiedenti" Src="../WebControls/Richiedenti.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Creazione Rdl</title>
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
		<script language="javascript">
	     function ValUrgenza(sender, args)
	     {	
			args.IsValid = true;
			return true;
	     }
		function ManDiff()
		{
		    return true;
			
		}
		
		function clearRoom()
		{
			document.getElementById("<%=UserStanze1.s_TxtIdStanza.ClientID%>").value="";
			document.getElementById("<%=UserStanze1.s_TxtDescStanza.ClientID%>").value="";	
		}   
	
  
	
		function iterator(senser)
		{
			var count = document.forms[0].elements.length;
			for (i=0; i<count; i++) 
			{	
				var element = document.forms[0].elements[i]; 
				if(element.type == 'select-one')
				{
					element.disabled=true;
				}
			}	
		}
		
	function ClearApparechiature()
	{
		var ctrltxtapp=document.getElementById('<%=CodiceApparecchiature1.s_CodiceApparecchiatura.ClientID%>');
		if(ctrltxtapp!=null && ctrltxtapp!='undefined')
		{
		  ctrltxtapp.value="";
		  document.getElementById('<%=CodiceApparecchiature1.CodiceHidden.ClientID%>').value="";
		}
	}

	function ControllaBL(nome)
	{
		if (document.getElementById(nome).value == "")				
		{
			alert('Inserire il Codice Edificio');
			return false;
		}
		return true;
	}
	
  function DivSetVisible(state)
  {
	 var DivRef = document.getElementById('pnlShowInfo');
	 var IfrRef = document.getElementById('DivShim');
	 if(state)
	 {
		DivRef.style.display = "block";
		IfrRef.style.width = DivRef.offsetWidth;
		IfrRef.style.height = DivRef.offsetHeight;
		IfrRef.style.top = DivRef.style.top;
		IfrRef.style.left = DivRef.style.left;
		IfrRef.style.zIndex = DivRef.style.zIndex - 1;
		IfrRef.style.display = "block";
	}
	else
	{
		DivRef.style.display = "none";
		IfrRef.style.display = "none";
	}
  }
  
   function EmesseSetVisible(state)
  {
   var DivRef = document.getElementById('PanelEmesse');
   var IfrRef = document.getElementById('DivEmesse');
   if(state)
   {
    DivRef.style.display = "block";
    IfrRef.style.width = DivRef.offsetWidth;
    IfrRef.style.height = DivRef.offsetHeight;
    IfrRef.style.top = DivRef.style.top;
    IfrRef.style.left = DivRef.style.left;
    IfrRef.style.zIndex = DivRef.style.zIndex - 1;
    IfrRef.style.display = "block";
   }
   else
   {
    DivRef.style.display = "none";
    IfrRef.style.display = "none";
   }
   
   
  }
  function visibletextmail(sender,controlid)
  {
       document.getElementById(controlid).disabled=!document.getElementById(sender).checked;       
  }
  	function SoloNumeri()
		{	
			if (event.keyCode < 48	|| event.keyCode > 57)
			{
				event.keyCode = 0;
			}	
		}
		
 		function ControllaOra(orain)
		{
		
			var ora=document.getElementById(orain).value;
			
				if (isNaN(ora))
						document.getElementById(orain).value="00"
				if(ora<0 || ora>23)
				{ 

					alert("Attenzione l'ora deve essere compresa tra 00 e 23");		
					document.getElementById(orain).focus()
					return false;
				}	
				else
				{
					var val = document.getElementById(orain).value;
					if(val.length==1)
						document.getElementById(orain).value="0" + val;
					return true;
				}
		}
		function ControllaMin(min)
		{
			var minuti=parseInt(document.getElementById(min).value);
				if (minuti=="")
						document.getElementById(min).value="00"
				
				
				if(minuti<0 || minuti>59)
				{
					alert("Attenzione i minuti devono essere compresi tra 00 e 59");		
					document.getElementById(min).focus();
					return false;
				}
				else
				{
				var val = document.getElementById(min).value;
					if(val.length==1)
						document.getElementById(min).value="0" + val;
					return true;
				}
			
		}
	function formatNum(obj)

{
	val=document.getElementById(obj).value;
	if(val=="")
		document.getElementById(obj).value="00";
	//if(val.length==1)	
	//	document.getElementById(obj).value=val+"0";
}

function NascondiASeguito(p)
{
	if(p=='1')
	{
				crtls=document.getElementById('aseguito1').style; 
				crtls.display="block";
				crtls=document.getElementById('aseguito2').style; 
				crtls.display="block";
				crtls=document.getElementById('aseguito3').style; 
				crtls.display="block";
				crtls=document.getElementById('aseguito4').style; 
				crtls.display="block";
				crtls=document.getElementById('aseguito5').style; 
				crtls.display="block";
	}
	
	if(p=='2')
	{
				crtls=document.getElementById('aseguito1').style; 
				crtls.display="none";
				crtls=document.getElementById('aseguito2').style; 
				crtls.display="none";
				crtls=document.getElementById('aseguito3').style; 
				crtls.display="none";
				crtls=document.getElementById('aseguito4').style; 
				crtls.display="none";
				crtls=document.getElementById('aseguito5').style; 
				crtls.display="none";

	}
	
}
function $get(ct)
{
 return document.getElementById(ct);
}

function bloccachk(chk)
{
var ctrl;
var crtls;
ctrl=!document.getElementById(chk).checked
	switch (chk)
	{
		case"ChkConduzione":
			$get('OraConduzione').disabled=ctrl;
			$get("MinutiConduzione").disabled=ctrl;
			$get("CPConduzioneData_S_TxtDatecalendar").disabled=ctrl;
			$get("CPConduzioneData_btCalendar").disabled=ctrl;
		break;
		case"ChkSopralluogo":
			$get('TxtSopralluogo').disabled=ctrl;
			$get("CPSopralluogoDie_S_TxtDatecalendar").disabled=ctrl;
			$get("CPSopralluogoDie_btCalendar").disabled=ctrl;
			$get("CPSopralluogoData_S_TxtDatecalendar").disabled=ctrl;
			$get("CPSopralluogoData_btCalendar").disabled=ctrl;
			$get('TxtASeguito4').disabled=ctrl;
		break;
	}
}

function apriGuidaUrgenze(prj)
{
	if(prj==1)//h3g
		var param="../Doc_Db/DOmUrgenzaH3g-2.pdf"; 			
	else
		var param="../Doc_Db/DOmUrgenza-Vod.pdf";
	window.open(param,'hlp','width=800,height=400 ,toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=yes');
	return false;
}	

function caricatxtfield(codScript){
	document.getElementById("TxtCodScript").value=codScript;
	__doPostBack('btnsRicerca','');
}

		</script>
	</HEAD>
	<body bottomMargin="0">
		<form id="Form1" method="post" runat="server">
			<INPUT id="provenienza" type="hidden" name="provenienza" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0px; LEFT: 0px"
				cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<TBODY>
					<tr>
						<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" title="Inserimento Richieste" runat="server"></uc1:pagetitle></TD>
					</tr>
					<tr>
						<td>
							<hr noShade SIZE="1">
							<div>&nbsp;<asp:label id="lblProgetto" runat="server">Progetto: </asp:label><asp:dropdownlist id="CmbProgetto" runat="server" Width="216px"></asp:dropdownlist></div>
						</td>
					</tr>
					<tr>
						<TD vAlign="top" align="left" height="100%">
							<TABLE id="tblBlSearch" cellSpacing="1" cellPadding="1" border="0">
								<tr>
									<td>
										<div id="PanelRichiedente">
											<TABLE id="TableRichiedente" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
												<TR>
													<TD>
														<%--asp:requiredfieldvalidator id="rfvRichiedenteNome" runat="server" ErrorMessage="Indicare il Nome del Richiedente">*</asp:requiredfieldvalidator><asp:requiredfieldvalidator id="rfvRichiedenteCognome" runat="server" ErrorMessage="Indicare il Cognome del Richiedente">*</asp:requiredfieldvalidator --%>
													</TD>
												</TR>
											</TABLE>
										</div>
									</td>
								</tr>
								<tr>
									<td>Richiedente:
										<asp:dropdownlist id="cmbsrichiedente" runat="server" Width="216px"></asp:dropdownlist></td>
								</tr>
								<TR>
									<TD>
										<TABLE id="TableRicercaModulo" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
											<TR>
												<TD><uc1:ricercamodulo id="RicercaModulo1" runat="server"></uc1:ricercamodulo><asp:requiredfieldvalidator id="rfvEdificio" runat="server" ErrorMessage="Selezionare una Centrale">*</asp:requiredfieldvalidator></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<!--	<TR>
									<TD>Descrizione Intervento Richiesto:</TD>
								</TR>
								<TR>
									<TD>
										<TABLE style="WIDTH: 100%" class="tblSearch100Dettaglio" border="0" cellSpacing="0" cellPadding="0">
											<TR>
												<TD width="10%">Telefono</TD>
												<TD width="20%" align="left"><asp:textbox id="txtsTelefonoRichiedente" runat="server" MaxLength="50"></asp:textbox></TD>
												<TD width="10%"><span>Ticket assegnato a</span></TD>
												<TD width="40%" align="left"><asp:textbox id="txtsNota" runat="server" Width="100%" MaxLength="2000" Rows="2" TextMode="MultiLine"></asp:textbox></TD>
											</TR>
											<tr>
												<TD width="10%">Piano</TD>
												<TD width="20%" align="left"><asp:dropdownlist id="cmbsPiano" runat="server" Width="200px"></asp:dropdownlist></TD>
												<TD width="10%">Stanza</TD>
												<TD width="10%" colSpan="2"><uc1:userstanze id="UserStanze1" runat="server"></uc1:userstanze></TD>
											</tr>
										</TABLE>
									</TD>
								</TR>-->
								<TR>
									<TD><asp:linkbutton id="lkbNonEmesse" runat="server" CausesValidation="False" CssClass="LabelInfo">Richieste non Emesse</asp:linkbutton></TD>
								</TR>
								<TR>
									<TD>
										<div id="pnlShowInfo" style="Z-INDEX: 100; POSITION: absolute; BACKGROUND-COLOR: gainsboro; DISPLAY: none; COLOR: #ffffff"
											runat="server">
											<TABLE height="100%" width="100%">
												<TR>
													<TD class="TitleSearch" vAlign="top" align="right"><asp:linkbutton id="lnkChiudi" runat="server" CausesValidation="False" CssClass="LabelChiudi">Chiudi</asp:linkbutton></TD>
												</TR>
												<TR>
													<TD><asp:datagrid id="DataGridRicerca" runat="server" CssClass="DataGrid" PageSize="5" BorderColor="Gray"
															BorderWidth="1px" AutoGenerateColumns="False" GridLines="Vertical" AllowPaging="True">
															<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
															<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
															<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
															<Columns>
																<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
																<asp:TemplateColumn>
																	<HeaderStyle Width="3%"></HeaderStyle>
																	<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																	<ItemTemplate>
																		<asp:ImageButton CausesValidation=False id="lnkNonEmesse" Runat=server CommandName="NonEmesse" ImageUrl="~/images/edit.gif" CommandArgument='<%# "CompletaRdl1.aspx?wr_id=" + DataBinder.Eval(Container.DataItem,"ID")%>'>
																		</asp:ImageButton>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:BoundColumn DataField="bl" HeaderText="Centrale"></asp:BoundColumn>
																<asp:BoundColumn DataField="ID" HeaderText="Rdl"></asp:BoundColumn>
																<asp:BoundColumn DataField="Data" HeaderText="Data Creazione" DataFormatString="{0:g}"></asp:BoundColumn>
																<asp:BoundColumn DataField="status" HeaderText="Stato Rdl"></asp:BoundColumn>
																<asp:BoundColumn DataField="Descrizione" HeaderText="Descrizione"></asp:BoundColumn>
																<asp:BoundColumn DataField="Richiedente" HeaderText="Richiedente"></asp:BoundColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid></TD>
												</TR>
											</TABLE>
										</div>
										<iframe id="DivShim" style="POSITION: absolute; DISPLAY: none" tabIndex="0" src="javascript:false;"
											frameBorder="0" scrolling="no"></iframe>
									</TD>
								</TR>
								<TR>
									<TD><asp:linkbutton id="LinkApprovate" runat="server" CausesValidation="False" CssClass="LabelInfo">Richieste Emesse</asp:linkbutton></TD>
								</TR>
								<TR>
									<TD>
										<div id="PanelEmesse" style="Z-INDEX: 100; POSITION: absolute; BACKGROUND-COLOR: gainsboro; DISPLAY: none; COLOR: #ffffff"
											runat="server">
											<TABLE height="100%" width="100%">
												<TR>
													<TD class="TitleSearch" vAlign="top" align="right"><asp:linkbutton id="LinkChiudi2" runat="server" CausesValidation="False" CssClass="LabelChiudi">Chiudi</asp:linkbutton></TD>
												</TR>
												<TR>
													<TD><asp:datagrid id="DatagridEmesse" runat="server" CssClass="DataGrid" PageSize="5" BorderColor="Gray"
															BorderWidth="1px" AutoGenerateColumns="False" GridLines="Vertical" AllowPaging="True">
															<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
															<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
															<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
															<Columns>
																<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
																<asp:TemplateColumn>
																	<HeaderStyle Width="3%"></HeaderStyle>
																	<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																	<ItemTemplate>
																		<asp:ImageButton CausesValidation=False id="lnlEmesse" Runat=server CommandName="Emesse" ImageUrl="~/images/edit.gif" CommandArgument='<%# "CompletaRdl1.aspx?wr_id=" + DataBinder.Eval(Container.DataItem,"ID") + "&c=true"%>'>
																		</asp:ImageButton>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:BoundColumn DataField="bl" HeaderText="Centrale"></asp:BoundColumn>
																<asp:BoundColumn DataField="ID" HeaderText="Rdl"></asp:BoundColumn>
																<asp:BoundColumn DataField="Data" HeaderText="Data Creazione" DataFormatString="{0:g}"></asp:BoundColumn>
																<asp:BoundColumn DataField="status" HeaderText="Stato Rdl"></asp:BoundColumn>
																<asp:BoundColumn DataField="Descrizione" HeaderText="Descrizione"></asp:BoundColumn>
																<asp:BoundColumn DataField="Richiedente" HeaderText="Richiedente"></asp:BoundColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid></TD>
												</TR>
											</TABLE>
										</div>
										<iframe id="DivEmesse" style="POSITION: absolute; DISPLAY: none" src="javascript:false;"
											frameBorder="0" scrolling="no"></iframe>
									</TD>
								</TR>
								<TR>
									<TD>
										<div style="DISPLAY: none"><asp:button id="btsCodice" runat="server" Width="153" text="Visualizza Reperibilit�" Height="22"></asp:button><BR>
											<asp:textbox id="txtBL_ID" runat="server" Width="0px"></asp:textbox>
											<div id="PopupRep" style="BORDER-BOTTOM: #000000 1px solid; POSITION: absolute; BORDER-LEFT: #000000 1px solid; WIDTH: 100%; DISPLAY: none; HEIGHT: 200%; BORDER-TOP: #000000 1px solid; BORDER-RIGHT: #000000 1px solid"><IFRAME id="docRep" name="docRep" src="" frameBorder="no" width="100%"></IFRAME>
											</div>
										</div>
									</TD>
								</TR>
								<TR>
									<TD>
										<div id="PanelServizio">
											<TABLE id="Table2" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
												<TR>
													<TD><B>Tipo Manutenzione: </B>
													</TD>
													<td><asp:dropdownlist id="cmbsTipoManutenzione" runat="server" AutoPostBack="True" width="350px"></asp:dropdownlist><asp:requiredfieldvalidator id="rfvTipoManutenzione" runat="server" ErrorMessage="Selezionare un Tipo Manutenzione">*</asp:requiredfieldvalidator></td>
												</TR>
												<TR>
													<TD width="15%"><B>Servizio:</B></TD>
													<TD><asp:dropdownlist id="cmbsServizio" runat="server" Width="350px" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="rfvServizio" runat="server" ErrorMessage="Selezionare un Servizio">*</asp:requiredfieldvalidator></TD>
													<TD width="15%">
														<div style="DISPLAY: none">Centro di Costo:</div>
													</TD>
													<td colSpan="3">
														<div style="DISPLAY: none"><asp:dropdownlist id="cmbsCdC" runat="server" Width="350px"></asp:dropdownlist><asp:requiredfieldvalidator id="rfvCdC" runat="server" ErrorMessage="Selezionare un Centro di Costo">*</asp:requiredfieldvalidator></div>
													</td>
												</TR>
												<TR>
													<TD width="15%"><SPAN>Standard Apparecchiatura:</SPAN></TD>
													<TD colSpan="5"><asp:dropdownlist id="cmbsApparecchiatura" runat="server" Width="350px" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="rfvApparecchiaturaStd" runat="server" ErrorMessage="Selezionare uno Standard">*</asp:requiredfieldvalidator></TD>
												</TR>
											</TABLE>
										</div>
									</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id="TableCodiceApparecchiatura" style="WIDTH: 100%" cellSpacing="1" cellPadding="1"
											border="0">
											<TR>
												<TD><uc1:codiceapparecchiature id="CodiceApparecchiature1" runat="server"></uc1:codiceapparecchiature></TD>
												<asp:requiredfieldvalidator id="rfvApparato" runat="server" ErrorMessage="Selezionare un Apparato">*</asp:requiredfieldvalidator></TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id="TableUrgenza" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
											<TR>
												<TD width="15%">Priorit�:</TD>
												<TD><asp:dropdownlist id="cmbsUrgenza" runat="server" Width="400px"></asp:dropdownlist></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD>
										<div id="PanelProblema">
											<TABLE id="TableProblema" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
												<TR>
													<TD colSpan="2">
														<TABLE id="TableProblemaBreve" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
															<TR>
																<TD width="15%">Descrizione Problema/Note:</TD>
																<TD width="85%"><asp:textbox id="txtsProblemaBreve" runat="server" Width="100%"></asp:textbox><asp:requiredfieldvalidator id="rfvProblemaBreve" runat="server" ErrorMessage="Indicare una Descrizione Problema Note ">*</asp:requiredfieldvalidator></TD>
															</TR>
															<TR style="DISPLAY: none">
																<TD width="15%">Attivit� Operative:</TD>
																<TD><asp:textbox id="txtsProblema" runat="server" Width="100%" Height="100px" Rows="4" TextMode="MultiLine"
																		BackColor="White"></asp:textbox>
																</TD>
															</TR>
														</TABLE>
													</TD>
												</TR>
											</TABLE>
										</div>
									</TD>
								</TR>
								<TR style="DISPLAY: none">
									<TD>
										<div id="DivMP">
											<TABLE id="TablePP" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
												<TR>
													<TD>
														<TABLE id="TablePassiProcedure" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
															<TR>
																<TD><uc1:passiprocedure id="PassiProcedure" runat="server"></uc1:passiprocedure></TD>
															</TR>
														</TABLE>
													</TD>
												</TR>
											</TABLE>
										</div>
									</TD>
								</TR>
								<TR>
									<TD>
										<TABLE style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
											<TR>
												<TD colSpan="2">
													<TABLE style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
														<TR>
															<TD width="15%">Tipo Attivit�:
															</TD>
															<td width="85%"><asp:dropdownlist id="cmbsSettore" runat="server"></asp:dropdownlist></td>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD>
										<DIV id="DivMC">
											<TABLE height="100%" width="100%">
												<TR>
													<TD><uc1:problemacausawc id="ProblemaCausaWC1" runat="server"></uc1:problemacausawc></TD>
												</TR>
												<TR>
													<TD>
														<TABLE height="100%" width="100%" border="0">
															<TR>
																<TD style="WIDTH: 197px" align="left" width="197">Problema:
																</TD>
																<td><asp:textbox id="TxtGuasto" runat="server" Width="400px"></asp:textbox></td>
															</TR>
															<TR>
																<TD style="WIDTH: 197px" align="left" width="197">Causa presunta guasto/anomalia:
																</TD>
																<TD><asp:textbox id="TxtCausa" runat="server" Width="400px"></asp:textbox><asp:requiredfieldvalidator id="rfvProblema" runat="server" ErrorMessage="Selezionare un Problema e Causa">*</asp:requiredfieldvalidator></TD>
															</TR>
														</TABLE>
													</TD>
												</TR>
											</TABLE>
										</DIV>
									</TD>
								</TR>
								<tr>
									<td>
										<table style="WIDTH: 344px; HEIGHT: 26px" cellSpacing="0" cellPadding="0" border="0">
											<TR>
												<TD style="WIDTH: 37px">Email:</TD>
												<TD style="WIDTH: 72px" width="72"><asp:checkbox id="chksSendMail" runat="server" Text="[Si/No]"></asp:checkbox>
												<TD width="15%">Destinatari:</TD>
												<TD><asp:textbox id="txtsMittente" runat="server" Width="100%" ToolTip="Gli indirizzi mail devono essere separati da ;"></asp:textbox></TD>
											</TR>
										</table>
									</td>
								</tr>
								<TR>
									<TD>
										<div style="DISPLAY: none">
											<TABLE style="WIDTH: 408px; HEIGHT: 24px" cellSpacing="0" cellPadding="0" width="408" border="0">
												<TR>
													<TD>Richiesta:&nbsp;</TD>
													<TD><UC1:CALENDARPICKER id="CalendarPicker1" runat="server"></UC1:CALENDARPICKER></TD>
													<TD>Ora:</TD>
													<TD><asp:textbox id="txtsorain" runat="server" Width="30px">00</asp:textbox>:
														<asp:textbox id="txtsorainmin" runat="server" Width="30px">00</asp:textbox>&nbsp;</TD>
												</TR>
											</TABLE>
										</div>
									</TD>
								</TR>
								<TR>
									<TD>
										<div><cc1:s_button id="btnsSalva" tabIndex="2" runat="server" Text="Salva"></cc1:s_button>&nbsp;<asp:button id="cmdReset" CausesValidation="False" Text="Reset" Runat="server"></asp:button>
											<cc1:s_button id="btnsChiudi" runat="server" CausesValidation="False" Text="Chiudi"></cc1:s_button><a 
            class=GuidaLink href="<%= HelpLink %>" target=_blank 
            >Guida</a>
											<asp:customvalidator id="Cv1" runat="server" ClientValidationFunction="ValUrgenza" ControlToValidate="cmbsUrgenza"></asp:customvalidator></div>
									</TD>
								</TR>
								<TR>
									<TD>
										<div><asp:label id="lblFirstAndLast" runat="server"></asp:label>&nbsp;
											<MESSPANEL:MESSAGEPANEL id="PanelMess" runat="server" MessageIconUrl="~/Images/ico_info.gif" ErrorIconUrl="~/Images/ico_critical.gif"></MESSPANEL:MESSAGEPANEL></div>
									</TD>
								</TR>
								<TR>
									<TD>
										<div><asp:validationsummary id="vlsEdit" runat="server" ShowSummary="False" DisplayMode="List" ShowMessageBox="True"></asp:validationsummary></div>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
			<script type="text/javascript">
			<% if(divVisible!=null && divVisible.Equals("DivMP")){ %>
				document.getElementById('DivMC').style.display='none';
				document.getElementById('DivMP').style.display='';
			<% }else if(divVisible!=null && divVisible.Equals("DivMC")){ %>
				document.getElementById('DivMC').style.display='';
				document.getElementById('DivMP').style.display='none';
			<% }else{ %>
				document.getElementById('DivMC').style.display='none';
				document.getElementById('DivMP').style.display='none';
			<% } %>
			
			<% if(nascondiJS!=null && nascondiJS.Equals("si")){ %>
				document.getElementById("btnsRicerca").disabled=true;
				document.getElementById("btsCodice").disabled=true;
				document.getElementById("imgPulisciCampi").style.display='none';
				document.getElementById("bt_codapparecchiatura").disabled=true;
				document.getElementById("imgPulisciEq").style.display='none';
			<%}%>
			
			/*if(parent.document.getElementById("CodiceApparecchiature1_hidCodEq")!=null){
				if(parent.document.getElementById("CodiceApparecchiature1_hidCodEq").value!=''){
					parent.document.getElementById("cmbsServizio").disabled=true;
					parent.document.getElementById("cmbsApparecchiatura").disabled=true;
				}else{
					parent.document.getElementById("cmbsServizio").disabled=false;
					parent.document.getElementById("cmbsApparecchiatura").disabled=false;
				}
			}*/
			</script>
		</form>
	</body>
</HTML>
