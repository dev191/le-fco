<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Addetti" Src="../WebControls/Addetti.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Richiedenti" Src="../WebControls/Richiedenti.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Page language="c#" Codebehind="Avvisi.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorrettiva.Avvisi" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>Avvisi Rdl</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="C#" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
		<SCRIPT language="javascript">
		
		var NS4 = (navigator.appName == "Netscape" && parseInt(navigator.appVersion) < 5);
		var NSX = (navigator.appName == "Netscape");
		var IE4 = (document.all) ? true : false;
		var timerIDR = 0;
			
		    timerIDR=setTimeout("ricaricaP()",<%= System.Configuration.ConfigurationSettings.AppSettings["refresh"]%>);
			
			function ricaricaP()
			{
			  //alert(document.getElementById("hiddenpinga").value);
			  var obj=document.getElementById("btnsRicerca");
			  if(document.getElementById("hiddenpinga").value=="1")				
				__doPostBack('btnsRicerca','')				
			}
			
			var timerID = 0;
			var tStart  = null;
			
			function changetimer()
			{
			
				//alert(document.getElementById("hiddenpinga").value);
				if (document.getElementById("hiddenpinga").value=="1")
				{
				    document.getElementById("hiddenpinga").value="0";
				    document.getElementById("imagetimer").src="../images/play.ico";
				    document.getElementById("imagetimer").title="Riabilita il refresh della pagina."
				    tStart   = new Date();
					document.getElementById("counter").innerText = "Tempo in Pausa: 0:0";
					timerID  = setTimeout("UpdateTimer()", 1000);
					
					if(timerIDR)
					{
						clearTimeout(timerIDR);
						timerIDR  = 0;
					}
				}
				else
				{
				 document.getElementById("hiddenpinga").value="1";
				 document.getElementById("imagetimer").src="../images/pause.ico";
				 document.getElementById("imagetimer").title="Mette in Pausa refresh della pagina."
				  if(timerID)
				  {
					clearTimeout(timerID);
					timerID  = 0;
				   }
				    timerIDR=setTimeout("ricaricaP()",<%= System.Configuration.ConfigurationSettings.AppSettings["refresh"]%>);
					tStart = null;
					document.getElementById("counter").innerText = "";
				}
			}
			
			function UpdateTimer()
			{
				var   tDate = new Date();
				var   tDiff = tDate.getTime() - tStart.getTime();
				tDate.setTime(tDiff);
				document.getElementById("counter").innerText  = "Tempo in Pausa: " 
												+ tDate.getMinutes() + ":" 
												+ tDate.getSeconds();

				timerID = setTimeout("UpdateTimer()", 1000);
			}
			
			function valutanumeri(evt)
			{
				var e = evt? evt : window.event; 
				if(!e) return; 
				var key = 0; 
				
				if(IE4==true)
				{
					if (e.keyCode < 48	|| e.keyCode > 57){
						e.keyCode = 0;
						return false;
					}	
		        }
		        
				if (e.keycode) { key = e.keycode; } // for moz/fb, if keycode==0 use 'which' 
				if (typeof(e.which)!= 'undefined') { 
					key = e.which;
					if (key < 48	|| key > 57){
						return false;
					} 
					
				} 
			}
			function nonpaste()
			{
				return false;
			}
			
		//Impedisce di scatenare qualsiasi l'evento sulla pagina alla pressione del tasto invio
	   function valutaenter(evt)
			{
				var e = evt? evt : window.event; 
				if(!e) return; 
				var key = 0; 
				
				if(IE4==true)
				{
					if (e.keyCode ==13){
						e.keyCode = 0;
						return false;
					}	
		        }
		        
				if (e.keycode) { key = e.keycode; } // for moz/fb, if keycode==0 use 'which' 
				if (typeof(e.which)!= 'undefined') { 
					key = e.which;
					if (key ==13){
						return false;
					} 
					
				} 
			}
			
			function AddHour(var_s,caselladitesto)
		{
		var hh = 0.0;
		var txt = document.getElementById(caselladitesto)
		
		if( txt.value < 0 || txt.value > 24 ) {
			txt.value = 0;
		}

		hh =  txt.value/1 + var_s;

		if( hh == "NaN"){
			hh = 0;
		}

		if( hh >= 24 )
		{
			hh = 0;
		}
		
		if( hh < 0 )
		{
			hh = 23;
		}
		
		var str = ( ( hh < "10" )? "0" : "") + hh;
		if( str == "NaN" ) {
			str = "00";
		}

		txt.value = str;
	}

	function AddMinute(var_s,caselladitesto)
	{
		var mm = 0.0;
		var txt = document.getElementById(caselladitesto)
		
		if( txt.value < 0 || txt.value >= 60 ) {
			txt.var_mm.value = 0;
		}

		mm =  txt.value/1 + var_s*15;

		if( mm == "NaN" )
		{
			mm = 0;
		}

		if( mm >= 60 )
		{
			mm = 0;
		}
		
		if( mm < 0 )
		{
			mm =45;
		}
		
		var str = ( ( mm < "10" )? "0" : "") + mm;
		if( str == "NaN" ) {
			str = "00";
		}

		txt.value = str;
	}
	
	function visualizzaReperibili(bl_id)
	{
		if(bl_id==0)
			var param="../CommonPage/RiepilogoReperibilita.aspx?avvisi=yes"; 			
		else
			var param="../CommonPage/RiepilogoReperibilita.aspx?bl_id=" + bl_id + "&avvisi=yes"; 				
		window.open(param,'lin','width=800,height=400 ,toolbar=yes, location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes');
	}		
	
	function cambiaImg(perc)
	{		
		document.getElementById("imgPerc").style.display="block";
		switch (perc)
		{			
			case "1": //da 0 a 33%			    
			    document.getElementById("imgPerc").src="../Images/semaforo_verde.png";						
				break;
			case "2": //da 34 a 66%			    
			    document.getElementById("imgPerc").src="../Images/semaforo_azzurro.png";						
				break;
			case "3": //da 67 a 100%			    
			    document.getElementById("imgPerc").src="../Images/semaforo_giallo.png";						
				break;
			case "4": //oltre 100%
			    document.getElementById("imgPerc").src="../Images/semaforo_rosso.png";						
				break;
			default: //oltre 100%
			    document.getElementById("imgPerc").src="../Images/collapse.gif";						
				break;				
		}		
	
	}	
	
		</SCRIPT>
	</HEAD>
	<BODY onkeypress="if (valutaenter(event) == false) { return false; }" bottomMargin="0"
		onbeforeunload="parent.left.valorizza()" leftMargin="5" topMargin="0" rightMargin="0"
		ms_positioning="GridLayout">
		<FORM id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; POSITION: absolute; TOP: 0px; LEFT: 0px" cellSpacing="0"
				cellPadding="0" width="100%" align="center" border="0">
				<TBODY>
					<TR>
						<TD style="HEIGHT: 50px" align="center" width="100%"><INPUT id="hiddenpinga" type="hidden" name="hiddenpinga" runat="server"><UC1:PAGETITLE id="PageTitle1" title="Sfoglia RdL e Odl" runat="server"></UC1:PAGETITLE></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="center">
							<TABLE id="tblForm" cellSpacing="1" cellPadding="1" width="100%" align="center">
								<TBODY>
									<TR>
										<TD style="HEIGHT: 25%" vAlign="top" align="left"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" expandimageurl="../Images/downarrows_trans.gif"
												collapseimageurl="../Images/uparrows_trans.gif" collapsetext="Riduci" expandtext="Espandi" collapsed="False" allowtitleexpandcollapse="True" titletext="Ricerca"
												cssclass="DataPanel75" titlestyle-cssclass="TitleSearch">
												<TABLE id="tblSearch100" border="0" cellSpacing="1" cellPadding="2" width="100%">
													<TR>
														<TD colSpan="4" align="left">
															<uc1:ricercamodulo id="RicercaModulo1" runat="server"></uc1:ricercamodulo></TD>
													</TR>
													<TR>
														<TD>
															<TABLE>
																<TR>
																	<TD width="13%" align="left">Stato:</TD>
																	<TD>
																		<asp:dropdownlist id="CmbStato" runat="server" Width="300px"></asp:dropdownlist></TD>
																	<TD width="13%" align="left">RdL:</TD>
																	<TD width="30%">
																		<cc1:s_textbox id="txtsRichiesta" runat="server" DBIndex="2" DBDataType="VarChar" MaxLength="10"
																			DBSize="255" width="136px" DBDirection="Input" DBParameterName="p_Wr_Id"></cc1:s_textbox></TD>
																	<TD style="WIDTH: 16px">Codice SGA:</TD>
																	<TD>
																		<asp:textbox id="txtSGA" runat="server" Width="100px"></asp:textbox></TD>
																</TR>
																<TR>
																	<TD align="left">Urgenza:</TD>
																	<TD>
																		<cc1:s_combobox id="cmbsUrgenza" runat="server" Width="306px"></cc1:s_combobox></TD>
																	<TD width="13%" align="left">Sede:</TD>
																	<TD width="30%">
																		<cc1:s_textbox id="txtsSede" runat="server" DBDataType="VarChar" MaxLength="10" DBSize="255" width="136px"
																			DBDirection="Input" DBParameterName="p_sede"></cc1:s_textbox></TD>
																	<TD style="WIDTH: 16px" align="left">Perc. SLA:</TD>
																	<TD>
																		<cc1:s_combobox id="cmbsPerc" runat="server" Width="108px"></cc1:s_combobox></TD>
																	<TD>
																		<asp:Image id="imgPerc" runat="server" ImageUrl="../Images/collapse.gif" Visible="True"></asp:Image></TD>
																</TR>
															</TABLE>
														</TD>
													</TR>
													<TR>
														<TD align="left">
															<CC1:S_BUTTON id="btnsRicerca" runat="server" cssclass="btn" text="Ricerca"></CC1:S_BUTTON>
															<CC1:S_BUTTON id="btnsReset" runat="server" cssclass="btn" text="Reset"></CC1:S_BUTTON>&nbsp;
															<ASP:BUTTON id="cmdRep" runat="server" cssclass="btn" Visible="False" text="Visualizza tutti i reperibili"></ASP:BUTTON>&nbsp;&nbsp;&nbsp;
															<A id="linkRefresh" onclick="changetimer();" href="#" runat="server"><IMG id="imagetimer" title="Mette in Pausa refresh della pagina" border="0" src="../images/pause.ico"></A>&nbsp;<SPAN id="counter"></SPAN>
														</TD>
														<TD align="right"><A class=GuidaLink href="<%= HelpLink %>" 
                  target=_blank>Guida</A></TD>
													</TR>
												</TABLE>
											</COLLAPSE:DATAPANEL></TD>
									</TR>
									<TR>
										<TD align="center"></TD>
									</TR>
									<TR>
										<TD vAlign="top" align="center" width="100%"><UC1:GRIDTITLE id="GridTitle1" runat="server"></UC1:GRIDTITLE><ASP:DATAGRID id="DataGridRicerca" runat="server" cssclass="DataGrid" autogeneratecolumns="False"
												gridlines="Vertical" borderwidth="1px" bordercolor="Gray" EnableViewState="False">
												<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
												<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
												<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn>
														<HeaderStyle Width="3%"></HeaderStyle>
														<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
														<ItemTemplate>
															<asp:Image id="ImageB1" runat="server" ImageUrl="../images/email.png"></asp:Image>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn>
														<HeaderStyle Width="3%"></HeaderStyle>
														<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
														<ItemTemplate>
															<asp:image id="imageCall" Runat="server" ImageUrl="../images/CallCenter3.ico"></asp:image>
															</asp:ImageButton>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn Visible="False" DataField="tipomanutenzione_id" HeaderText="tipomanutenzione_id"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="id_stato" HeaderText="id_stato"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="id_addetto" HeaderText="id_addetto"></asp:BoundColumn>
													<asp:HyperLinkColumn Text="RDL" DataNavigateUrlField="WR" DataNavigateUrlFormatString="javascript:var w =window.open('CompletaRdL.aspx?wr_id={0}&amp;FunId={0}&amp;chiamante=Avvisi','_blank','width=1024,height=768,toolbar=yes, location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes')"
														DataTextField="WR" HeaderText="RdL"></asp:HyperLinkColumn>
													<asp:BoundColumn DataField="Progetto" HeaderText="Progetto"></asp:BoundColumn>
													<asp:BoundColumn DataField="Edificio" HeaderText="Edificio"></asp:BoundColumn>
													<asp:BoundColumn DataField="Sede" HeaderText="Sede"></asp:BoundColumn>
													<asp:BoundColumn DataField="Stato" HeaderText="Stato"></asp:BoundColumn>
													<asp:BoundColumn DataField="data_RDL" HeaderText="Data"></asp:BoundColumn>
													<asp:BoundColumn DataField="Priority" HeaderText="Priorit&#224;"></asp:BoundColumn>
													<asp:HyperLinkColumn Visible="False" Text="Addetto" DataNavigateUrlField="id_addetto" DataNavigateUrlFormatString="javascript:var w =window.open('../Gestione/EditAddetti.aspx?TipoOper=read&amp;Callcenter=yes&amp;ItemId={0}&amp;FunId={0}','_blank','width=800,height=600,location=no')"
														DataTextField="Addetto" HeaderText="Addetto" NavigateUrl="Nominativo"></asp:HyperLinkColumn>
													<asp:BoundColumn DataField="SLA" HeaderText="SLA"></asp:BoundColumn>
													<asp:BoundColumn DataField="diff" HeaderText="Ore"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="stato_ritardo" HeaderText="Rit"></asp:BoundColumn>
													<asp:BoundColumn DataField="perc" HeaderText="%"></asp:BoundColumn>
													<asp:TemplateColumn>
														<ItemTemplate>
															<asp:Image id="Img5min" runat="server" ImageUrl="../Images/semaforo_verde.png"></asp:Image>
															<asp:Image id="Img10min" runat="server" ImageUrl="../Images/semaforo_azzurro.png"></asp:Image>
															<asp:Image id="Img15min" runat="server" 
															ImageUrl="../Images/semaforo_giallo.png"></asp:Image>
															<asp:Image id="Img15pmin" runat="server" ImageUrl="../Images/semaforo_lamp.gif"></asp:Image>
															<asp:Image id="ImgChiudi" runat="server" Height="27px" Width="28px" ImageUrl="../Images/set_7_a.gif"></asp:Image>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn Visible="False" DataField="servizio" HeaderText="servizio"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="descrizione_intervento" HeaderText="des"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="id_bl" HeaderText="id_bl"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="wr" HeaderText="wr_id"></asp:BoundColumn>
												</Columns>
												<PagerStyle HorizontalAlign="Left" ForeColor="Black" BackColor="Silver" Mode="NumericPages"></PagerStyle>
											</ASP:DATAGRID></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<INPUT id="hiddensort" type="hidden" name="hiddensort" runat="server">
		</FORM>
		</TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
		<script language="javascript">
			parent.left.calcola();
		</script>
	</BODY>
</HTML>
