<%@ Register TagPrefix="uc1" TagName="UserStanze" Src="../WebControls/UserStanze.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Page language="c#" Codebehind="CreazioneRdl.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorretiva.CreazioneRdl" %>
<%@ Register TagPrefix="MessPanel" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="uc1" TagName="CodiceApparecchiature" Src="../WebControls/CodiceApparecchiature.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="RichiedentiSollecito" Src="../WebControls/RichiedentiSollecito.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Richiedenti" Src="../WebControls/Richiedenti.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>CreazioneRdl</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
		<script language="javascript">
       function ValidUrg()
       {
          var idp= document.getElementById("<%=RicercaModulo1.idProg.ClientID%>").value;
		  alert(idp);
		  if(idp=="1")
		  {
				var dif=document.getElementById("cmbsTipoIntrevento").value;
				var ur=document.getElementById("cmbsUrgenza").value;
				
				// Controllo se il servizio è PORTE REI
				if(document.getElementById("<%=cmbsServizio.ClientID%>").value)=62
				{
					if ( (ur=="50" || ur=="49") && dif!="83" )
				    {	
						alert("Selezionare l'intervento 'NON DIFFERIBILE' con il servizio 'PORTE REI' e urgenza 'REI Urgente'.");
						return false;
					}
					
					if ( (ur!="50" && ur!="49") && dif=="83" )
				    {	
						alert("Selezionare l'intervento 'DIFFERIBILE' o 'MIGLIORATIVO con il servizio 'PORTE REI' e urgenza diversa 'REI Urgente'.");
						return false;
					}		  	
				}
				
				if(dif=="61")
				alert(ur);
				{
				  
				  if (ur!="1" && ur!="2" && ur!="3" && ur!="8" && ur!="9" && ur!="10")
				  {

					alert("L'intervento NON DIFFERIBILE deve avere una urgenza CRITICA, URGENTE O EMERENZA!");
					return false;
				  }
				}
				else
				{
				  if (ur=="1" && ur=="2" && ur=="3" && ur=="8" && ur=="9" && ur=="10")
				  {
					alert("L'intervento DIFFERIBILE NON deve avere una urgenza CRITICA, URGENTE O EMERENZA!");
					return false;
				  }
				}
		  }
		  return true;
       }
		
 
		function setProg()
		{
			var ct=document.getElementById('CmbProgetto').value;
			document.getElementById("<%=RichiedentiSollecito1.idProg.ClientID%>").value=ct;
			document.getElementById("<%=RicercaModulo1.idProg.ClientID%>").value=ct;
		}
  function clearRoom()
	{
		document.getElementById("<%=UserStanze1.s_TxtIdStanza.ClientID%>").value="";
		document.getElementById("<%=UserStanze1.s_TxtDescStanza.ClientID%>").value="";	
	}   
	
    function disableControl()
	{	
		//var ctrl= document.forms[0]; 
		//iterator(ctrl);		
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
		
 		function ControllaOra()
		{
			var ora=document.getElementById("<%=txtsorain.ClientID%>").value;
				if (isNaN(ora))
						document.getElementById("<%=txtsorain.ClientID%>").value="00"
				if(ora<0 || ora>23)
				{ 

					alert("Attenzione l'ora deve essere compresa tra 00 e 23");		
					document.getElementById("<%=txtsorain.ClientID%>").focus()
					return false;
				}	
				else
				{
					var val = document.getElementById("<%=txtsorain.ClientID%>").value;
					if(val.length==1)
						document.getElementById("<%=txtsorain.ClientID%>").value="0" + val;
					return true;
				}
		}
		function ControllaMin()
		{
			var minuti=parseInt(document.getElementById("<%=txtsorainmin.ClientID%>").value);
				if (minuti=="")
						document.getElementById("<%=txtsorainmin.ClientID%>").value="00"
				
				
				if(minuti<0 || minuti>59)
				{
					alert("Attenzione i minuti devono essere compresi tra 00 e 59");		
					document.getElementById("<%=txtsorainmin.ClientID%>").focus();
					return false;
				}
				else
				{
				var val = document.getElementById("<%=txtsorainmin.ClientID%>").value;
					if(val.length==1)
						document.getElementById("<%=txtsorainmin.ClientID%>").value="0" + val;
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

//aggiunta SGA mdi
function VisualizzaASeguito(tiposeguito)
{
	var crtls;
	
		switch (tiposeguito)
		{
			case "1": //Conduzione
				//visualizzo e imposto il valore delle label
			    crtls=document.getElementById('lbl').style; 
				crtls.display="block";				
				document.getElementById('<%=lblAseguito1.ClientID%>').innerText='In Data';	
				crtls=document.getElementById('lbl2').style; 
				crtls.display="block";				
				document.getElementById('<%=lblAseguito2.ClientID%>').innerText="Ora"
				//visualizzo le td che mi servono		
			    crtls=document.getElementById('data').style; 
				crtls.display="block";				
				crtls=document.getElementById('ora').style; 
				crtls.display="block";
				//nascondo le td che non servono
				crtls=document.getElementById('die').style; 
				crtls.display="none";	
				crtls=document.getElementById('del').style; 
				crtls.display="none";
				crtls=document.getElementById('sopralluogo').style; 
				crtls.display="none";
				
			break;
			case  "2": case "3": case  "4" :			
				//visualizzo e imposto il valore delle label
				crtls=document.getElementById('lbl').style; 
				crtls.display="block";				
				document.getElementById('<%=lblAseguito1.ClientID%>').innerText='DIE N°';	
				crtls=document.getElementById('lbl2').style; 
				crtls.display="block";				
				document.getElementById('<%=lblAseguito2.ClientID%>').innerText="DEL"
				//visualizzo le td che mi servono
				crtls=document.getElementById('die').style; 
				crtls.display="block";	
				crtls=document.getElementById('del').style; 
				crtls.display="block";	
				//nascondo le td che non servono
				crtls=document.getElementById('data').style; 
				crtls.display="none";				
				crtls=document.getElementById('ora').style; 
				crtls.display="none";
				crtls=document.getElementById('sopralluogo').style; 
				crtls.display="none";
			break;
			case "5":			
				//visualizzo e imposto il valore delle label
				crtls=document.getElementById('lbl').style; 
				crtls.display="block";				
				document.getElementById('<%=lblAseguito1.ClientID%>').innerText='DIE N°';	
				crtls=document.getElementById('lbl2').style; 
				crtls.display="block";				
				document.getElementById('<%=lblAseguito2.ClientID%>').innerText="DEL"
				//visualizzo le td che mi servono
				crtls=document.getElementById('die').style; 
				crtls.display="block";	
				crtls=document.getElementById('del').style; 
				crtls.display="block";	
				crtls=document.getElementById('sopralluogo').style; 
				crtls.display="block";	
				//nascondo le td che non servono
				crtls=document.getElementById('data').style; 
				crtls.display="none";				
				crtls=document.getElementById('ora').style; 
				crtls.display="none";
			break;
			default:
				crtls=document.getElementById('lbl').style; 
				crtls.display="none";				
				crtls=document.getElementById('lbl2').style; 
				crtls.display="none";				
				crtls=document.getElementById('die').style; 
				crtls.display="none";	
				crtls=document.getElementById('del').style; 
				crtls.display="none";	
				crtls=document.getElementById('sopralluogo').style; 
				crtls.display="none";	
				crtls=document.getElementById('data').style; 
				crtls.display="none";				
				crtls=document.getElementById('ora').style; 
				crtls.display="none";
			break;
		}		
	

}
//fine aggiunta
		</script>
	</HEAD>
	<body bottomMargin="0" onbeforeunload="disableControl();parent.left.valorizza()" leftMargin="5"
		topMargin="0" rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 0px; HEIGHT: 100%"
				cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" title="Inserimento Richieste" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="center" height="98%">
						<TABLE id="tblFormInput" cellSpacing="1" cellPadding="1" align="center">
							<TR>
								<TD style="WIDTH: 3%; HEIGHT: 5%" vAlign="top" align="left"></TD>
								<TD style="HEIGHT: 3%" vAlign="top" align="left"></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 1%" vAlign="top" align="left"></TD>
								<TD style="HEIGHT: 1%" vAlign="top" align="left">
									<hr noShade SIZE="1">
									<div>&nbsp;
										<asp:label id="lblProgetto" runat="server">Progetto: </asp:label><asp:dropdownlist id="CmbProgetto" runat="server" Width="216px"></asp:dropdownlist></div>
								</TD>
							</TR>
							<TR>
								<TD vAlign="top" align="center"></TD>
								<TD vAlign="top" align="left">
									<TABLE id="tblSearch95" cellSpacing="1" cellPadding="1" border="0">
										<TR>
											<TD align="center" colSpan="4"><asp:panel id="PanelRichiedente" runat="server">
													<TABLE id="TableRichiedente" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
														<TR>
															<TD width="25%" colSpan="4">
																<uc1:RichiedentiSollecito id="RichiedentiSollecito1" runat="server"></uc1:RichiedentiSollecito>
																<asp:requiredfieldvalidator id="rfvRichiedenteNome" runat="server" ErrorMessage="Indicare il Nome del Richiedente">*</asp:requiredfieldvalidator>
																<asp:requiredfieldvalidator id="rfvRichiedenteCognome" runat="server" ErrorMessage="Indicare il Cognome del Richiedente">*</asp:requiredfieldvalidator></TD>
														</TR>
													</TABLE>
												</asp:panel></TD>
										</TR>
										<TR>
											<TD align="left" colSpan="4">
												<TABLE id="TableRicercaModulo" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
													<TR>
														<TD><uc1:ricercamodulo id="RicercaModulo1" runat="server"></uc1:ricercamodulo><asp:requiredfieldvalidator id="rfvEdificio" runat="server" ErrorMessage="Selezionare un Edificio">*</asp:requiredfieldvalidator></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<td>
												<table>
													<tr>
														<td>Descrizione Intervento Richiesto:
														</td>
													</tr>
												</table>
												<TABLE class="tblSearch100Dettaglio" style="WIDTH: 100%" cellSpacing="1" cellPadding="1"
													border="0">
													<TR>
														<TD width="10%">Telefono</TD>
														<TD align="left" width="20%"><cc1:s_textbox id="txtsTelefonoRichiedente" runat="server" DBParameterName="p_Phone" DBSize="20"
																DBIndex="3" MaxLength="50"></cc1:s_textbox></TD>
														<TD width="10%">Nota/Ambiente</TD>
														<TD align="left" width="40%"><cc1:s_textbox id="txtsNota" runat="server" Width="100%" DBParameterName="p_Nota_Ric" DBSize="2000"
																DBIndex="4" MaxLength="2000" TextMode="MultiLine" Rows="2"></cc1:s_textbox></TD>
													</TR>
													<tr>
														<TD width="10%">Piano
															<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="Selezionare un piano"
																ControlToValidate="cmbsPiano">*</asp:requiredfieldvalidator></TD>
														<TD align="left" width="20%"><cc1:s_combobox id="cmbsPiano" runat="server" Width="200px" DBParameterName="p_id_piani" DBSize="10"
																DBIndex="17" DBDirection="Input" DBDataType="Integer"></cc1:s_combobox></TD>
														<TD width="10%" colSpan="2"><uc1:userstanze id="UserStanze1" runat="server"></uc1:userstanze></TD>
													</tr>
												</TABLE>
											</td>
										</TR>
										<TR>
											<TD align="left" colSpan="4"><asp:linkbutton id="lkbNonEmesse" runat="server" CssClass="LabelInfo" CausesValidation="False">Richieste non Emesse</asp:linkbutton></TD>
										</TR>
										<tr>
											<td><asp:panel id="pnlShowInfo" style="DISPLAY: none; Z-INDEX: 100; COLOR: #ffffff; POSITION: absolute; BACKGROUND-COLOR: gainsboro"
													runat="server" Width="100%">
													<TABLE height="100%" width="100%">
														<TR>
															<TD class="TitleSearch" vAlign="top" align="right">
																<asp:linkbutton id="lnkChiudi" runat="server" CssClass="LabelChiudi" CausesValidation="False">Chiudi</asp:linkbutton></TD>
														</TR>
														<TR>
															<TD>
																<asp:datagrid id="DataGridRicerca" runat="server" CssClass="DataGrid" BorderColor="Gray" BorderWidth="1px"
																	AutoGenerateColumns="False" GridLines="Vertical" AllowPaging="True">
																	<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
																	<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
																	<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
																	<Columns>
																		<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
																		<asp:TemplateColumn>
																			<HeaderStyle Width="3%"></HeaderStyle>
																			<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																			<ItemTemplate>
																				<asp:ImageButton CausesValidation=False id="lnkNonEmesse" Runat=server CommandName="NonEmesse" ImageUrl="~/images/edit.gif" CommandArgument='<%# "EditCreazione.aspx?wr_id=" + DataBinder.Eval(Container.DataItem,"ID")%>'>
																				</asp:ImageButton>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:BoundColumn DataField="ID" HeaderText="N. RDL"></asp:BoundColumn>
																		<asp:BoundColumn DataField="bl" HeaderText="EDIFICIO"></asp:BoundColumn>
																		<asp:BoundColumn DataField="Data" HeaderText="DATA RICHIESTA" DataFormatString="{0:d}"></asp:BoundColumn>
																		<asp:BoundColumn DataField="status" HeaderText="STATO"></asp:BoundColumn>
																		<asp:BoundColumn DataField="Descrizione" HeaderText="DESCRIZIONE"></asp:BoundColumn>
																		<asp:BoundColumn DataField="Richiedente" HeaderText="RICHIEDENTE"></asp:BoundColumn>
																	</Columns>
																	<PagerStyle Mode="NumericPages"></PagerStyle>
																</asp:datagrid></TD>
														</TR>
													</TABLE>
												</asp:panel><iframe id="DivShim" style="DISPLAY: none; POSITION: absolute" src="javascript:false;" frameBorder="0"
													scrolling="no"> </iframe>
											</td>
										</tr>
										<TR>
											<TD align="left" colSpan="4"><asp:linkbutton id="LinkApprovate" runat="server" CssClass="LabelInfo" CausesValidation="False">Richieste Approvate</asp:linkbutton></TD>
										</TR>
										<tr>
											<td><asp:panel id="PanelEmesse" style="DISPLAY: none; Z-INDEX: 100; COLOR: #ffffff; POSITION: absolute; BACKGROUND-COLOR: gainsboro"
													runat="server" Width="100%">
													<TABLE height="100%" width="100%">
														<TR>
															<TD class="TitleSearch" vAlign="top" align="right">
																<asp:linkbutton id="LinkChiudi2" runat="server" CssClass="LabelChiudi" CausesValidation="False">Chiudi</asp:linkbutton></TD>
														</TR>
														<TR>
															<TD>
																<asp:datagrid id="DatagridEmesse" runat="server" CssClass="DataGrid" BorderColor="Gray" BorderWidth="1px"
																	AutoGenerateColumns="False" GridLines="Vertical" AllowPaging="True">
																	<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
																	<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
																	<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
																	<Columns>
																		<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID"></asp:BoundColumn>
																		<asp:TemplateColumn>
																			<HeaderStyle Width="3%"></HeaderStyle>
																			<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
																			<ItemTemplate>
																				<asp:ImageButton CausesValidation=False id="lnlEmesse" Runat=server CommandName="Emesse" ImageUrl="~/images/edit.gif" CommandArgument='<%# "EditCreazione.aspx?wr_id=" + DataBinder.Eval(Container.DataItem,"ID") + "&c=true"%>'>
																				</asp:ImageButton>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:BoundColumn DataField="ID" HeaderText="N. RDL"></asp:BoundColumn>
																		<asp:BoundColumn DataField="bl" HeaderText="EDIFICIO"></asp:BoundColumn>
																		<asp:BoundColumn DataField="Data" HeaderText="DATA RICHIESTA" DataFormatString="{0:d}"></asp:BoundColumn>
																		<asp:BoundColumn DataField="status" HeaderText="STATO"></asp:BoundColumn>
																		<asp:BoundColumn DataField="Descrizione" HeaderText="DESCRIZIONE"></asp:BoundColumn>
																		<asp:BoundColumn DataField="Richiedente" HeaderText="RICHIEDENTE"></asp:BoundColumn>
																	</Columns>
																	<PagerStyle Mode="NumericPages"></PagerStyle>
																</asp:datagrid></TD>
														</TR>
													</TABLE>
												</asp:panel><iframe id="DivEmesse" style="DISPLAY: none; POSITION: absolute" src="javascript:false;"
													frameBorder="0" scrolling="no"> </iframe>
											</td>
										</tr>
										<tr width="100%">
											<td align="left" width="100%"><asp:button id="btsCodice" runat="server" Width="153" Height="22" text="Visualizza Reperibilità"></asp:button><BR>
												<asp:textbox id="txtBL_ID" runat="server" Width="0px"></asp:textbox>
												<div id="PopupRep" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; DISPLAY: none; BORDER-LEFT: #000000 1px solid; WIDTH: 100%; BORDER-BOTTOM: #000000 1px solid; POSITION: absolute; HEIGHT: 200%"><IFRAME id="docRep" name="docRep" src="" frameBorder="no" width="100%"></IFRAME>
												</div>
											</td>
										</tr>
										<TR>
											<TD align="center" colSpan="4"><asp:panel id="PanelServizio" runat="server">
													<TABLE id="Table2" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
														<TR>
															<TD style="HEIGHT: 16px" width="15%">Servizio</TD>
															<TD style="HEIGHT: 16px" colSpan="5">
																<cc1:S_ComboBox id="cmbsServizio" runat="server" Width="350px" DBParameterName="p_Servizio_Id" DBSize="4"
																	DBIndex="10" DBDataType="Integer" AutoPostBack="True"></cc1:S_ComboBox></TD>
														</TR>
														<TR>
															<TD width="15%"><SPAN>Std. Apparecchiatura</SPAN></TD>
															<TD colSpan="5">
																<cc1:S_ComboBox id="cmbsApparecchiatura" runat="server" Width="350px" DBParameterName="p_Eqstd_Id"
																	DBSize="4" DBIndex="11" AutoPostBack="True"></cc1:S_ComboBox></TD>
														</TR>
													</TABLE>
												</asp:panel></TD>
										</TR>
										<TR>
											<TD align="center" colSpan="4">
												<TABLE id="TableRicercaApparecchiatura" style="WIDTH: 100%" cellSpacing="1" cellPadding="1"
													border="0">
													<TBODY>
														<TR>
															<TD><uc1:codiceapparecchiature id="CodiceApparecchiature1" runat="server"></uc1:codiceapparecchiature></TD>
											</TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD align="center" colSpan="4"><asp:panel id="PanelProblema" runat="server">
										<TABLE id="TableProblema" style="WIDTH: 100%" cellSpacing="1" cellPadding="1" border="0">
											<TBODY>
												<TR>
													<TD width="15%">Urgenza</TD>
													<TD colSpan="3">
														<cc1:S_ComboBox id="cmbsUrgenza" runat="server" Width="400px" DBParameterName="p_Priority" DBSize="4"
															DBIndex="12" DBDataType="Integer"></cc1:S_ComboBox></TD>
												</TR>
												<TR>
													<TD>Descrizione Problema<BR>
														Note</TD>
													<TD colSpan="3">
														<cc1:S_TextBox id="txtsProblema" runat="server" Width="100%" DBParameterName="p_Description" DBSize="4000"
															DBIndex="13" TextMode="MultiLine" Rows="4"></cc1:S_TextBox></TD>
												</TR>
									</asp:panel>
							<TR>
								<TD>A seguito di</TD>
								<TD><CC1:S_COMBOBOX id="CmbASeguito" runat="server" width="224px" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
								<TD id="lbl" style="DISPLAY: none"><asp:label id="lblAseguito1" runat="server"></asp:label></TD>
								<TD id="data" style="DISPLAY: none"><UC1:CALENDARPICKER id="CalendarPickerASeguito1" runat="server"></UC1:CALENDARPICKER></TD>
								<TD id="die" style="DISPLAY: none"><cc1:s_textbox id="TxtASeguito1" runat="server" DBParameterName="p_Aseguito1" MaxLength="11"></cc1:s_textbox></TD>
								<TD id="lbl2" style="DISPLAY: none"><asp:label id="lblAseguito2" runat="server"></asp:label></TD>
								<TD id="ora" style="DISPLAY: none"><asp:textbox id="TxtOraAseguito" runat="server" Width="30px">00</asp:textbox>:
									<asp:textbox id="TxtMinAseguito" runat="server" Width="30px">00</asp:textbox></TD>
								<TD id="del" style="DISPLAY: none"><UC1:CALENDARPICKER id="CalendarPickerASeguito2" runat="server"></UC1:CALENDARPICKER></TD>
							</TR>
							<TR id="sopralluogo" style="DISPLAY: none">
								<TD>Sopralluogo effettuato in data</TD>
								<TD><UC1:CALENDARPICKER id="CalendarPickerASeguito3" runat="server"></UC1:CALENDARPICKER></TD>
								<TD>Da</TD>
								<TD><cc1:s_textbox id="TxtASeguito4" runat="server" DBParameterName="p_Aseguito4" MaxLength="61"></cc1:s_textbox></TD>
							</TR>
							<TR>
								<TD>Tipo di intervento</TD>
								<TD><CC1:S_COMBOBOX id="cmbsTipoIntrevento" runat="server" width="224px" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
							</TR>
							<TR>
								<TD>Causa presunta guasto/anomalia</TD>
								<TD colSpan="3"><cc1:s_textbox id="TxtCausa" runat="server" Width="100%" DBParameterName="p_causa" DBSize="408"
										DBIndex="13" MaxLength="408" TextMode="MultiLine" Rows="4"></cc1:s_textbox></TD>
							</TR>
							<TR>
								<TD>Effetto del guasto</TD>
								<TD colSpan="3"><cc1:s_textbox id="TxtGuasto" runat="server" Width="100%" DBParameterName="p_guastp" DBSize="408"
										DBIndex="13" MaxLength="408" TextMode="MultiLine" Rows="4"></cc1:s_textbox></TD>
							</TR>
							<TR>
								<TD>Email</TD>
								<TD width="30%"><asp:checkbox id="chksSendMail" runat="server" Text="[Si/No]"></asp:checkbox>
								<TD width="15%">Destinatari
								</TD>
								<TD><asp:textbox id="txtsMittente" runat="server" Width="100%" ToolTip="Gli indirizzi mail devono essere separati da ;"></asp:textbox></TD>
							</TR>
							<TR>
								<TD>
								Data Richiesta
								<td><UC1:CALENDARPICKER id="CalendarPicker1" runat="server"></UC1:CALENDARPICKER></td>
					</TD>
					<TD>Ora
					</TD>
					<TD noWrap><asp:textbox id="txtsorain" runat="server" Width="30px">00</asp:textbox>:
						<asp:textbox id="txtsorainmin" runat="server" Width="30px">00</asp:textbox></TD>
					</TD></TR>
			</TABLE> </TD></TR></TABLE></TD></TR><!--messo io-->
			<TR>
				<TD style="HEIGHT: 5%" vAlign="top" align="left"></TD>
				<TD style="HEIGHT: 5%" vAlign="top" align="left" width="90%">
					<table width="100%" border="0">
						<tr>
							<td align="left" width="70%"><cc1:s_button id="btnsSalva" tabIndex="2" runat="server" Text="Salva"></cc1:s_button>&nbsp;<asp:button id="cmdReset" CausesValidation="False" Text="Reset" Runat="server"></asp:button>
							</td>
							<td align="right" width="25%"><A 
                  class=GuidaLink href="<%= HelpLink %>" target=_blank 
                  >Guida</A>
							</td>
							<td width="5%">&nbsp;</td>
						</tr>
					</table>
				</TD>
			<TR>
				<TD style="HEIGHT: 1%" vAlign="top" align="left"></TD>
				<TD style="HEIGHT: 1%" vAlign="top" align="left">
					<hr noShade SIZE="1">
				</TD>
			</TR>
			<TR>
				<TD style="HEIGHT: 5%" vAlign="top" align="left"></TD>
				<TD style="HEIGHT: 5%" vAlign="top" align="left"><asp:label id="lblFirstAndLast" runat="server"></asp:label>&nbsp;
					<MESSPANEL:MESSAGEPANEL id="PanelMess" runat="server" MessageIconUrl="~/Images/ico_info.gif" ErrorIconUrl="~/Images/ico_critical.gif"></MESSPANEL:MESSAGEPANEL><asp:customvalidator id="CVal1" runat="server" ErrorMessage="Valore non valido per l'urgenza" ControlToValidate="CmbProgetto"
						ClientValidationFunction="VerUrge">*</asp:customvalidator></TD>
			</TR>
			</TBODY></TABLE><asp:validationsummary id="vlsEdit" runat="server" ShowSummary="False" DisplayMode="List" ShowMessageBox="True"></asp:validationsummary></TD></TR></TBODY></TABLE>&nbsp;

		</form>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
