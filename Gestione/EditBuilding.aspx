<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Page language="c#" Codebehind="EditBuilding.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.EditBuilding" %>
<%@ Register TagPrefix="MessPanel" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>EditBuilding</TITLE>
		<META name="vs_showGrid" content="False">
		<META name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<META name="CODE_LANGUAGE" content="C#">
		<META name="vs_defaultClientScript" content="JavaScript">
		<META name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
		<SCRIPT language="javascript" src="../Js/CommonScript.js"></SCRIPT>
		<SCRIPT language="javascript">
		
		
		function SoloNumeriVirgola()
		{	
			if (!((event.keyCode >= 48 && event.keyCode <= 57) || event.keyCode == 44))
			{		
				event.keyCode = 0;		
			}
		}
	
			/*function SelezionaListBox()
			{
				
				var lst= document.getElementById("<%%>");=ListBoxRightP.ClientID
				if (lst.options.length>0)
				{
					if (lst.selectedIndex = -1)
					{
						lst.options[0].selected= true
					}	
				}	
					
				
			}*/
	
			function Messaggio() 
			{
				Abilita(3); 
				alert('Impossibile Eliminare il piano in quanto legato ad una apparecchiatura!'); 
			}
			function MessaggioPiani() 
			{
				Abilita(3); 
				alert('Impossibile Eliminare il piano in quanto associato ad una stanza!!'); 
			}
			
	
			function Abilita(val)
			{
				var pan1 = document.getElementById("<%=PanelEditAnag.ClientID%>");
				var pan2 = document.getElementById("<%=PanelEditServizi.ClientID%>")
				var pan3 = document.getElementById("<%=PanelEditMail.ClientID%>");
				var pan4 = document.getElementById("<%=PanelEditPiani.ClientID%>");
				var pan5 = document.getElementById("<%=PanelEditStanze.ClientID%>");
				
				switch (val)
				{
					case 0: //Anagrafica
						pan1.style.display='block';
						pan2.style.display='none';
						pan3.style.display='none';
						pan4.style.display='none';
						pan5.style.display='none';
						break;
					case 1: //Servizi
						pan1.style.display='none';
						pan2.style.display='none';
						pan3.style.display='block';
						pan4.style.display='none';
						pan5.style.display='none';
						break;
					case 2: //e-mail
						pan1.style.display='none';
						pan2.style.display='block';
						pan3.style.display='none';
						pan4.style.display='none';
						pan5.style.display='none';
						break;
					case 3: //Piani
						pan1.style.display='none';
						pan2.style.display='none';
						pan3.style.display='none';
						pan4.style.display='block';
						pan5.style.display='none';
						break;
					case 4: //Stanze
						pan1.style.display='none';
						pan2.style.display='none';
						pan3.style.display='none';
						pan4.style.display='none';
						pan5.style.display='block';
						break;
				}
			}
	
	function apri_ricerca_reparto(gruppo,descmat,id)
	{
		var	var1=document.getElementById(descmat).value;
		var W = window.open('../CommonPage/ListaReparto.aspx?utente=ALE&IdMat='+id+'&desc=' + var1 + '&IdTxt='+descmat+'&aa=richiesta_lavoro','vericacodice','width=600,height=400;status=yes')								
	}	
	
	function apri_ricerca_uso(gruppo,descmat,id)
	{
		var	var1=document.getElementById(descmat).value;
		var W = window.open('../CommonPage/ListaDestinazioneUso.aspx?utente=ALE&IdMat='+id+'&desc=' + var1 + '&IdTxt='+descmat+'&aa=richiesta_lavoro','vericacodice','width=600,height=400;status=yes')								
	}		
	
	function ControllaDati (categoria, reparto, destinazione)
	{
		var cat= document.getElementById(categoria).selectedIndex;
		var rep =document.getElementById(reparto).value;
		var dest=document.getElementById(destinazione).value;
		var messaggio="";
		
		if (cat == '0' )
			messaggio=" - Selezionare una Categoria \n";
		if (rep =="")
			messaggio+=" - Selezionare un Reparto \n";
		if (dest =="")
			messaggio+=" - Selezionare una Destinazione \n";
			
		if(dest  == ""  ||  rep  == "" ||  cat ==  '0')
		{
			alert (messaggio);
			return false;
		}
		else
			return true;
	}
		</SCRIPT>
	</HEAD>
	<body onload="Abilita(<%=TabId%>);" onbeforeunload=parent.left.valorizza()>
		<FORM id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; TOP: 0px; LEFT: 0px" id="TableMain"
				border="0" cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TBODY>
					<TR>
						<TD>&nbsp;</TD>
						<TD align="center"><UC1:PAGETITLE id="Pagetitle2" runat="server"></UC1:PAGETITLE></TD>
					</TR>
					<TR>
						<TD>&nbsp;</TD>
						<TD vAlign="top" align="center">
							<TABLE id="tblFormInput" cellSpacing="1" cellPadding="1" align="center">
								<TBODY>
									<TR>
										<TD vAlign="top" align="left">&nbsp;</TD>
										<TD vAlign="top" align="left"><ASP:LABEL id="lblOperazione" runat="server" width="512px" cssclass="TitleOperazione"></ASP:LABEL><MESSPANEL:MESSAGEPANEL id="PanelMess" runat="server" width="136px" messageiconurl="~/Images/ico_info.gif"
												erroriconurl="~/Images/ico_critical.gif"></MESSPANEL:MESSAGEPANEL></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD style="vAlign: 'top'" align="left">&nbsp;
						</TD>
						<TD style="vAlign: 'top'" align="left">
							<HR SIZE="1" noShade>
							<IEWC:TABSTRIP id="TabStrip1" runat="server" tabselectedstyle="background-color:#ffffff;color:#000000;border-style:inset;"
								tabhoverstyle="background-color:#777777;border-style:inset;border-width:1;" tabdefaultstyle="background-color:darkgray;font-family:verdana;font-weight:bold;font-size:8pt;color:#ffffff;width:79;height:21;text-align:center;border-style:outset;border-width:1;">
								<IEWC:TAB text="Anagrafica"></IEWC:TAB>
								<IEWC:TAB text="E-Mails"></IEWC:TAB>
								<IEWC:TAB text="Servizi"></IEWC:TAB>
								<IEWC:TAB text="Piani"></IEWC:TAB>
								<IEWC:TAB text="Stanze"></IEWC:TAB>
							</IEWC:TABSTRIP></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="center">&nbsp;
						</TD>
						<TD vAlign="top" align="left"><ASP:PANEL id="PanelEditAnag" runat="server" width="100%">
								<TABLE id="tblSearch100" border="0" cellSpacing="1" cellPadding="2">
									<TR>
										<TD colSpan="4" align="center"></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 576px" vAlign="middle" align="right">
											<ASP:REQUIREDFIELDVALIDATOR id="rfvBL_ID" runat="server" controltovalidate="txtsBL_ID" errormessage="Inserire il Codice Edificio">*</ASP:REQUIREDFIELDVALIDATOR>Codice 
											Edificio</TD>
										<TD style="WIDTH: 294px" height="30" width="294">
											<CC1:S_TEXTBOX id="txtsBL_ID" tabIndex="1" runat="server" width="208px" maxlength="10" dbdirection="Input"
												dbsize="8" dbparametername="p_BL_ID" dbindex="0"></CC1:S_TEXTBOX></TD>
										<TD style="WIDTH: 498px" vAlign="middle" align="right">
											<ASP:REQUIREDFIELDVALIDATOR id="rfvName" runat="server" controltovalidate="txtsNome" errormessage="Inserire il Nome dell'edificio">*</ASP:REQUIREDFIELDVALIDATOR>Nome 
											Edificio</TD>
										<TD height="30">
											<CC1:S_TEXTBOX id="txtsNome" tabIndex="2" runat="server" width="208px" maxlength="250" dbdirection="Input"
												dbsize="50" dbparametername="p_NAME" dbindex="1"></CC1:S_TEXTBOX></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 576px" vAlign="middle" align="right">
											<ASP:REQUIREDFIELDVALIDATOR id="rfvIndirizzo" runat="server" controltovalidate="txtsIndirizzo" errormessage="Inserire l' Indirizzo principale">*</ASP:REQUIREDFIELDVALIDATOR>Indirizzo</TD>
										<TD style="WIDTH: 294px">
											<CC1:S_TEXTBOX id="txtsIndirizzo" tabIndex="3" runat="server" width="208px" maxlength="50" dbdirection="Input"
												dbsize="50" dbparametername="p_INDIRIZZO" dbindex="2"></CC1:S_TEXTBOX></TD>
										<TD style="WIDTH: 498px" vAlign="middle" align="right">Secondo Indirizzo</TD>
										<TD>
											<CC1:S_TEXTBOX id="txtsIndirizzo2" tabIndex="4" runat="server" width="208px" maxlength="50" dbdirection="Input"
												dbsize="50" dbparametername="p_INDIRIZZO2" dbindex="3"></CC1:S_TEXTBOX></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 576px; HEIGHT: 17px" vAlign="middle" align="right">
											<ASP:RANGEVALIDATOR id="rvProvincia" runat="server" controltovalidate="cmbsProvincia" errormessage="Valorizzare la Provincia"
												minimumvalue="1" maximumvalue="9999999999999">*</ASP:RANGEVALIDATOR>Provincia</TD>
										<TD style="WIDTH: 294px; HEIGHT: 17px">
											<CC1:S_COMBOBOX id="cmbsProvincia" tabIndex="5" runat="server" width="208px" dbdirection="Input"
												dbsize="10" dbparametername="p_PROVINCIA" dbindex="4" autopostback="True" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
										<TD style="WIDTH: 498px; HEIGHT: 17px" vAlign="middle" align="right">
											<ASP:RANGEVALIDATOR id="rvComune" runat="server" controltovalidate="cmbsComune" errormessage="Valorizzare il Comune"
												minimumvalue="1" maximumvalue="9999999999999">*</ASP:RANGEVALIDATOR>Comune</TD>
										<TD style="HEIGHT: 17px">
											<CC1:S_COMBOBOX id="cmbsComune" tabIndex="6" runat="server" width="208px" dbdirection="Input" dbsize="10"
												dbparametername="p_COMUNE" dbindex="6" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 576px; HEIGHT: 15px" vAlign="middle" borderColor="red" align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<ASP:REGULAREXPRESSIONVALIDATOR id="revZIP" runat="server" width="3px" controltovalidate="TxtsCAP" errormessage="Cap Non Valido"
												validationexpression="\d{5}" height="8px">*</ASP:REGULAREXPRESSIONVALIDATOR>CAP</TD>
										<TD style="WIDTH: 294px; HEIGHT: 15px" borderColor="red" align="left">
											<CC1:S_TEXTBOX id="TxtsCAP" tabIndex="7" runat="server" width="208px" maxlength="10" dbdirection="Input"
												dbsize="10" dbparametername="p_ZIP" dbindex="7"></CC1:S_TEXTBOX></TD>
										<TD style="WIDTH: 498px; HEIGHT: 15px" borderColor="red" align="right">
											<ASP:RANGEVALIDATOR id="rvUso" runat="server" controltovalidate="cmbsUso" errormessage="Valorizzare il campo Uso "
												minimumvalue="1" maximumvalue="9999999999999">*</ASP:RANGEVALIDATOR>Uso</TD>
										<TD style="HEIGHT: 15px" borderColor="red" align="center">
											<CC1:S_COMBOBOX id="cmbsUso" tabIndex="8" runat="server" width="208px" dbdirection="Input" dbsize="10"
												dbparametername="p_USE" dbindex="8" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 576px; HEIGHT: 20px" vAlign="middle" borderColor="#ff0000" align="right">
											<ASP:RANGEVALIDATOR id="rvDitta" runat="server" controltovalidate="cmbsDitta" errormessage="Valorizzare la Ditta"
												minimumvalue="1" maximumvalue="9999999999999">*</ASP:RANGEVALIDATOR>Ditta</TD>
										<TD style="WIDTH: 294px; HEIGHT: 20px" borderColor="#ff0000" align="left">
											<CC1:S_COMBOBOX id="cmbsDitta" tabIndex="9" runat="server" width="208px" dbdirection="Input" dbsize="10"
												dbparametername="p_DITTA" dbindex="9" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
										<TD style="WIDTH: 498px; HEIGHT: 20px" borderColor="#ff0000" align="right">
											<ASP:RANGEVALIDATOR id="RANGProg" runat="server" controltovalidate="CmbProgetto" errormessage="Valorizzare il campo Progetto"
												minimumvalue="1" maximumvalue="9999999999999">*</ASP:RANGEVALIDATOR>Progetto</TD>
										<TD style="HEIGHT: 20px" borderColor="#ff0000" align="center">
											<CC1:S_COMBOBOX id="CmbProgetto" tabIndex="8" runat="server" width="208px" dbdirection="Input" dbsize="1"
												dbparametername="p_progetto" dbindex="12" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 576px; HEIGHT: 20px" vAlign="middle" borderColor="#ff0000" align="right">Localizzazione 
											Geografica</TD>
										<TD style="WIDTH: 294px; HEIGHT: 20px" borderColor="#ff0000" align="left">
											<CC1:S_COMBOBOX id="cmbsLocalizzazione" tabIndex="9" runat="server" width="208px" dbdirection="Input"
												dbsize="10" dbparametername="p_localizzazione" dbindex="13" dbdatatype="Integer"></CC1:S_COMBOBOX></TD>
										<TD style="WIDTH: 498px; HEIGHT: 20px" borderColor="#ff0000" align="right"></TD>
										<TD style="HEIGHT: 20px" borderColor="#ff0000" align="center"></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 576px" vAlign="middle" borderColor="#ff0000" align="right">Commenti</TD>
										<TD style="WIDTH: 727px" borderColor="#ff0000" colSpan="2" align="left">
											<CC1:S_TEXTBOX id="txtsCommenti" tabIndex="10" runat="server" width="269px" dbdirection="Input"
												dbsize="4000" dbparametername="p_COMMENTS" dbindex="10" height="104px" rows="5" textmode="MultiLine"></CC1:S_TEXTBOX></TD>
										<TD borderColor="#ff0000" align="left"></TD>
									</TR>
									<TR>
										<TD colSpan="4" align="center"></TD>
									</TR>
								</TABLE>
							</ASP:PANEL><ASP:PANEL id="PanelEditServizi" runat="server" width="100%">
								<TABLE id="Table1" class="tblFormInputDettaglio" border="0" cellSpacing="1" cellPadding="1"
									width="100%" align="center">
									<TR>
										<TD width="40%" align="center"></TD>
										<TD align="center">Servizi</TD>
										<TD align="center"></TD>
									</TR>
									<TR>
										<TD colSpan="3" align="center">
											<P align="center">
												<ASP:DATAGRID id="DataGridServizi" runat="server" cssclass="DataGrid" datakeyfield="ID" bordercolor="Gray"
													borderwidth="1px" gridlines="Vertical" autogeneratecolumns="False">
													<ALTERNATINGITEMSTYLE cssclass="DataGridAlternatingItemStyle"></ALTERNATINGITEMSTYLE>
													<ITEMSTYLE cssclass="DataGridItemStyle"></ITEMSTYLE>
													<HEADERSTYLE cssclass="DataGridHeaderStyle"></HEADERSTYLE>
													<COLUMNS>
														<ASP:BOUNDCOLUMN visible="False" datafield="ID" headertext="ID"></ASP:BOUNDCOLUMN>
														<ASP:TEMPLATECOLUMN headertext="Associato">
															<HEADERSTYLE horizontalalign="Center" width="8%"></HEADERSTYLE>
															<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<cc1:S_CheckBox id="chks_Associato" runat="server" DBIndex="0" DBSize="0" DBDirection="InputOutput" DBDataType="VarChar" Checked='<%# bool.Parse(DataBinder.Eval(Container.DataItem, "ASSOC").ToString()) %>'>
																</cc1:S_CheckBox>
															</ITEMTEMPLATE>
															<FOOTERSTYLE horizontalalign="Center"></FOOTERSTYLE>
														</ASP:TEMPLATECOLUMN>
														<ASP:BOUNDCOLUMN datafield="descrizione" headertext="Servizio"></ASP:BOUNDCOLUMN>
														<ASP:TEMPLATECOLUMN headertext="Data Inizio">
															<HEADERSTYLE horizontalalign="Center" width="8%"></HEADERSTYLE>
															<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<UC1:CALENDARPICKER id="CalPckDataDa" runat="server"></UC1:CALENDARPICKER>
															</ITEMTEMPLATE>
															<FOOTERSTYLE horizontalalign="Center"></FOOTERSTYLE>
														</ASP:TEMPLATECOLUMN>
														<ASP:TEMPLATECOLUMN headertext="Data Fine">
															<HEADERSTYLE horizontalalign="Center" width="8%"></HEADERSTYLE>
															<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
															<ITEMTEMPLATE>
																<UC1:CALENDARPICKER id="CalPckDataA" runat="server"></UC1:CALENDARPICKER>
															</ITEMTEMPLATE>
															<FOOTERSTYLE horizontalalign="Center"></FOOTERSTYLE>
														</ASP:TEMPLATECOLUMN>
													</COLUMNS>
												</ASP:DATAGRID></P>
											<P align="center">&nbsp;</P>
										</TD>
									</TR>
									<TR>
										<TD></TD>
										<TD></TD>
										<TD width="40%"></TD>
									</TR>
								</TABLE>
							</ASP:PANEL><ASP:PANEL id="PanelEditMail" runat="server" width="100%">
								<TABLE id="Table2" class="tblFormInputDettaglio" border="0" cellSpacing="1" cellPadding="1"
									width="100%" align="center">
									<TR>
										<TD style="WIDTH: 260px; HEIGHT: 19px" width="260" align="center">E-mail</TD>
										<TD style="WIDTH: 129px; HEIGHT: 16px" align="center"></TD>
										<TD style="HEIGHT: 16px" align="center">
											<ASP:REGULAREXPRESSIONVALIDATOR id="REVEmail" runat="server" controltovalidate="ListboxRightE" errormessage="Formato Email non Valido."
												validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</ASP:REGULAREXPRESSIONVALIDATOR>E-mail&nbsp;Associate</TD>
									</TR>
									<TR>
										<TD style="WIDTH: 260px" align="center">
											<ASP:TEXTBOX id="txtsLeftMail" tabIndex="15" runat="server" width="240px" height="18px"></ASP:TEXTBOX></TD>
										<TD style="WIDTH: 129px">
											<P align="center">
												<ASP:BUTTON id="btnAssociaE" tabIndex="16" runat="server" cssclass="btn" width="110px" text="Aggiungi >>"
													causesvalidation="False"></ASP:BUTTON></P>
											<P align="center">
												<ASP:BUTTON id="btnEliminaE" tabIndex="18" runat="server" cssclass="btn" width="110px" text="Elimina"
													causesvalidation="False"></ASP:BUTTON></P>
											<P align="center">&nbsp;</P>
										</TD>
										<TD align="center">
											<ASP:LISTBOX id="ListboxRightE" tabIndex="17" runat="server" width="272px" rows="8"></ASP:LISTBOX></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 260px"></TD>
										<TD style="WIDTH: 129px"></TD>
										<TD width="40%"></TD>
									</TR>
								</TABLE>
							</ASP:PANEL><ASP:PANEL id="PanelEditPiani" runat="server" width="100%">
								<TABLE id="TablePiani" class="tblFormInputDettaglio" border="0" cellSpacing="1" cellPadding="1"
									width="100%" align="center">
									<TR>
										<TD width="40%" colSpan="3" align="center">Associazioni&nbsp;Stanze ai Piani</TD>
									</TR>
									<TR>
										<TD align="left">
											<ASP:LINKBUTTON id="nuovoPiano" runat="server">Nuovo</ASP:LINKBUTTON></TD>
										<TD style="WIDTH: 321px" align="center"><INPUT id="Hidden1" size="1" type="hidden" name="HiddenPianiStanze" runat="server"></TD>
										<TD align="left">Record:
											<ASP:LABEL id="LabelPiano" runat="server">0</ASP:LABEL></TD>
									</TR>
									<TR>
										<TD colSpan="3" align="center"></TD>
									</TR>
									<TR>
										<TD style="HEIGHT: 2.98%" vAlign="top" align="left">&nbsp;</TD>
										<TD style="HEIGHT: 2.98%" vAlign="top" align="left">&nbsp;
											<ASP:DATAGRID id="DataGridPiani" runat="server" cssclass="DataGrid" datakeyfield="ID" bordercolor="Gray"
												borderwidth="1px" gridlines="Vertical" autogeneratecolumns="False" Height="116px" Width="482px">
												<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
												<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
												<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
												<Columns>
													<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID">
														<HeaderStyle Width="1%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:TemplateColumn>
														<HeaderStyle Width="2%"></HeaderStyle>
														<ItemStyle Wrap="False"></ItemStyle>
														<ItemTemplate>
															<ASP:IMAGEBUTTON id="Imagebutton3" runat="server" commandname="Edit" imageurl="../Images/edit.gif"
																borderstyle="None"></ASP:IMAGEBUTTON>
															<ASP:IMAGEBUTTON id="Imagebutton4" runat="server" commandname="Delete" imageurl="../Images/elimina.gif"
																borderstyle="None"></ASP:IMAGEBUTTON>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn>
														<HeaderStyle Width="2%"></HeaderStyle>
														<ItemStyle Wrap="False"></ItemStyle>
														<EditItemTemplate>
															<ASP:IMAGEBUTTON id="Imagebutton5" runat="server" commandname="Update" imageurl="../Images/salva.gif"
																borderstyle="None"></ASP:IMAGEBUTTON>
															<ASP:IMAGEBUTTON id="Imagebutton6" runat="server" commandname="Cancel" imageurl="../Images/annulla.gif"
																borderstyle="None"></ASP:IMAGEBUTTON>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn>
														<HeaderStyle Width="2%"></HeaderStyle>
														<FooterStyle Wrap="False"></FooterStyle>
														<FooterTemplate>
															<ASP:IMAGEBUTTON id="Imagebutton7" runat="server" commandname="Insert" imageurl="../Images/salva.gif"
																borderstyle="None"></ASP:IMAGEBUTTON>
															<ASP:IMAGEBUTTON id="Imagebutton8" runat="server" commandname="Cancel" imageurl="../Images/annulla.gif"
																borderstyle="None"></ASP:IMAGEBUTTON>
														</FooterTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Piano">
														<HeaderStyle Width="30px"></HeaderStyle>
														<ItemStyle HorizontalAlign="Left"></ItemStyle>
														<ItemTemplate>
															<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Descrizione") %>'>
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<cc1:S_ComboBox id="cmbPianiAdd" runat="server" Width="264px" DBDirection="Input" DBIndex="1" DBDataType="Integer" DataValueField="ID" DataTextField="DESCRIZIONE" DataSource="<%#GetAllPianiNonAssociati()%>" BParameterName="@p_pianostanza">
															</cc1:S_ComboBox>
														</FooterTemplate>
														<EditItemTemplate>
															<cc1:S_ComboBox id="cmbPianiMod" runat="server" Width="264px" DBDirection="Input" DBIndex="1" DBDataType="Integer" SelectedValue='<%# GetIndex(DataBinder.Eval(Container.DataItem, "ID").ToString()) %>' DataValueField="ID" DataTextField="DESCRIZIONE" DataSource="<%#GetAllPiani()%>" BParameterName="@p_pianostanza">
															</cc1:S_ComboBox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Area Netta (mq)">
														<ItemTemplate>
															<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MQNETTI") %>' ID="Label4">
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<CC1:S_TEXTBOX id="pianoMqNettiAdd" tabindex="3" runat="server" width="60px" dbparametername="@Stanza"
																dbsize="8" dbdirection="Input" maxlength="8"></CC1:S_TEXTBOX>
														</FooterTemplate>
														<EditItemTemplate>
															<CC1:S_TEXTBOX id="pianoMqNettiMod" tabIndex="3" runat="server" Width="60px" DBParameterName="@Stanza" DBSize="8" DBDirection="Input" MaxLength="8" Text='<%# DataBinder.Eval(Container, "DataItem.MQNETTI") %>'>
															</CC1:S_TEXTBOX>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Volume Lordo Riscaldato (mc)">
														<ItemTemplate>
															<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.volume") %>' ID="Label6">
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<CC1:S_TEXTBOX id="volumemcadd" tabindex="4" runat="server" width="60px" dbparametername="@Stanza"
																dbsize="8" dbdirection="Input" maxlength="8"></CC1:S_TEXTBOX>
														</FooterTemplate>
														<EditItemTemplate>
															<CC1:S_TEXTBOX id="volumemcMod" tabIndex="4" runat="server" Width="60px" DBParameterName="@Stanza" DBSize="8" DBDirection="Input" MaxLength="8" Text='<%# DataBinder.Eval(Container, "DataItem.volume") %>'>
															</CC1:S_TEXTBOX>
														</EditItemTemplate>
													</asp:TemplateColumn>
												</Columns>
											</ASP:DATAGRID></TD>
									</TR>
									<TR>
										<TD style="HEIGHT: 2.98%" vAlign="top" align="left"></TD>
										<TD style="HEIGHT: 2.98%" vAlign="top" align="left"></TD>
									</TR>
								</TABLE>
							</ASP:PANEL><ASP:PANEL id="PanelEditStanze" runat="server" width="100%">
								<TABLE id="Table4" class="tblFormInputDettaglio" border="0" cellSpacing="1" cellPadding="1"
									width="100%" align="center">
									<TR>
										<TD style="WIDTH: 46px" width="46" align="center"></TD>
										<TD colSpan="3" align="center">Associazioni&nbsp;Stanze ai Piani</TD>
									</TR>
									<TR>
										<TD style="WIDTH: 46px" align="left">
											<ASP:LINKBUTTON id="lkbNuovo" runat="server" DESIGNTIMEDRAGDROP="3883">Nuovo</ASP:LINKBUTTON></TD>
										<TD style="WIDTH: 585px" align="center"><INPUT id="HiddenPianiStanze" size="1" type="hidden" name="HiddenPianiStanze" runat="server"></TD>
										<TD align="left">Record:
											<ASP:LABEL id="lblRecord" runat="server">0</ASP:LABEL></TD>
									</TR>
									<TR>
										<TD colSpan="3" align="center"></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 585px; HEIGHT: 2.98%" vAlign="top" colSpan="3" align="left">&nbsp;
											<ASP:DATAGRID id="DataGridEsegui" runat="server" cssclass="DataGrid" datakeyfield="ID" bordercolor="Gray"
												borderwidth="1px" gridlines="Vertical" autogeneratecolumns="False" Width="95%">
												<AlternatingItemStyle CssClass="DataGridAlternatingItemStyle"></AlternatingItemStyle>
												<ItemStyle CssClass="DataGridItemStyle"></ItemStyle>
												<HeaderStyle CssClass="DataGridHeaderStyle"></HeaderStyle>
												<Columns>
													<asp:BoundColumn Visible="False" DataField="ID" HeaderText="ID">
														<HeaderStyle Width="1%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:TemplateColumn>
														<HeaderStyle Width="2%"></HeaderStyle>
														<ItemStyle Wrap="False"></ItemStyle>
														<ItemTemplate>
															<ASP:IMAGEBUTTON id="imbEdit" runat="server" borderstyle="None" imageurl="../Images/edit.gif" commandname="Edit"></ASP:IMAGEBUTTON>
															<ASP:IMAGEBUTTON id="imbDelete" runat="server" borderstyle="None" imageurl="../Images/elimina.gif"
																commandname="Delete"></ASP:IMAGEBUTTON>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn>
														<HeaderStyle Width="2%"></HeaderStyle>
														<ItemStyle Wrap="False"></ItemStyle>
														<EditItemTemplate>
															<ASP:IMAGEBUTTON id="imbUpdate" runat="server" borderstyle="None" imageurl="../Images/salva.gif"
																commandname="Update"></ASP:IMAGEBUTTON>
															<ASP:IMAGEBUTTON id="imbCancel" runat="server" borderstyle="None" imageurl="../Images/annulla.gif"
																commandname="Cancel"></ASP:IMAGEBUTTON>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn>
														<HeaderStyle Width="2%"></HeaderStyle>
														<FooterStyle Wrap="False"></FooterStyle>
														<FooterTemplate>
															<ASP:IMAGEBUTTON id="Imagebutton1" runat="server" borderstyle="None" imageurl="../Images/salva.gif"
																commandname="Insert"></ASP:IMAGEBUTTON>
															<ASP:IMAGEBUTTON id="Imagebutton2" runat="server" borderstyle="None" imageurl="../Images/annulla.gif"
																commandname="Cancel"></ASP:IMAGEBUTTON>
														</FooterTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Piano">
														<HeaderStyle Width="30px"></HeaderStyle>
														<ItemStyle HorizontalAlign="Left"></ItemStyle>
														<ItemTemplate>
															<asp:Label id=lblDescrizionePiano runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DescrizionePiano") %>'>
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<cc1:S_ComboBox id=ddlpianoNew runat="server" DBDirection="Input" DBDataType="Integer" DBIndex="1" BParameterName="@p_pianostanza" DataSource="<%#GetPianiEdificio()%>" DataTextField="DESCRIZIONE" DataValueField="ID">
															</cc1:S_ComboBox>
														</FooterTemplate>
														<EditItemTemplate>
															<cc1:S_ComboBox id=ddlpiano runat="server" DBDirection="Input" DBDataType="Integer" DBIndex="1" BParameterName="@p_pianostanza" DataSource="<%#GetPianiEdificio()%>" DataTextField="DESCRIZIONE" DataValueField="ID" SelectedValue='<%# GetIndex(DataBinder.Eval(Container.DataItem, "Piani").ToString()) %>'>
															</cc1:S_ComboBox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Stanza">
														<ItemTemplate>
															<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Descrizione") %>'>
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<CC1:S_TEXTBOX id="ddlstanzaNew" tabIndex="3" runat="server" width="47px" dbparametername="@Stanza"
																dbsize="8" dbdirection="Input" maxlength="8"></CC1:S_TEXTBOX>
														</FooterTemplate>
														<EditItemTemplate>
															<CC1:S_TEXTBOX id=ddlstanza tabIndex=3 runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Descrizione") %>' DBDirection="Input" Width="47px" DBSize="8" MaxLength="8" DBParameterName="@Stanza">
															</CC1:S_TEXTBOX>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Descrizione Stanza">
														<ItemTemplate>
															<asp:Label id=lbldescrizione runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descstanza") %>' Width="183px">
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<CC1:S_TEXTBOX id="ddldescrizionenew" tabIndex="3" runat="server" width="191px" dbparametername="@Stanza"
																dbsize="8" dbdirection="Input" maxlength="255"></CC1:S_TEXTBOX>
														</FooterTemplate>
														<EditItemTemplate>
															<CC1:S_TEXTBOX id=ddldescrizione tabIndex=3 runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descstanza") %>' DBDirection="Input" Width="191px" DBSize="8" MaxLength="255" DBParameterName="@Stanza">
															</CC1:S_TEXTBOX>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Mq">
														<ItemTemplate>
															<asp:Label id=LblMq runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MQ") %>' Width="71px">
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<CC1:S_TEXTBOX id=TxtMqNew onKeyPress="SoloNumeri();" tabIndex=3 runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MQ") %>' Width="39px" MaxLength="8" DBSize="8" DBDirection="Input">
															</CC1:S_TEXTBOX>,
															<CC1:S_TEXTBOX id="TxtMqNewDec" onKeyPress="SoloNumeri();" tabIndex="3" runat="server" Width="24px"
																MaxLength="2" DBSize="8" DBDirection="Input">00</CC1:S_TEXTBOX>
														</FooterTemplate>
														<EditItemTemplate>
															<CC1:S_TEXTBOX id=TxtMq onKeyPress="SoloNumeri();" tabIndex=3 runat="server" Text='<%#  Decimale(DataBinder.Eval(Container.DataItem, "MQ").ToString(), "Int") %>' Width="39px" MaxLength="8" DBSize="8" DBDirection="Input">
															</CC1:S_TEXTBOX>,
															<CC1:S_TEXTBOX id=TxtMqDec onKeyPress="SoloNumeri();" tabIndex=3 runat="server" Text='<%#  Decimale(DataBinder.Eval(Container.DataItem, "MQ").ToString(), "Dec") %>' Width="24px" MaxLength="2" DBSize="8" DBDirection="Input">
															</CC1:S_TEXTBOX>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Categoria">
														<ItemTemplate>
															<asp:Label id=lblDescCat runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "categoria") %>' Width="176px">
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<cc1:S_ComboBox id=CmbCatNew runat="server" DBDirection="Input" DBDataType="Integer" DBIndex="1" DataSource="<%# BindRmCat() %>" DataTextField="DESCRIZIONE" DataValueField="ID">
															</cc1:S_ComboBox>
														</FooterTemplate>
														<EditItemTemplate>
															<cc1:S_ComboBox id=CmbCat runat="server" DBDirection="Input" DBDataType="Integer" DBIndex="1" DataSource="<%# BindRmCat() %>" DataTextField="DESCRIZIONE" DataValueField="ID" SelectedValue=' <%#  GetIndex(DataBinder.Eval(Container.DataItem, "idcat").ToString()) %>'>
															</cc1:S_ComboBox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Reparto">
														<ItemTemplate>
															<asp:Label id=lblDescRep runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "reparto") %>' Width="176px">
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<asp:TextBox id="TxtRepNew" runat="server" Width="112px" Height="20px"></asp:TextBox><INPUT class=btn id=cmbsCercaRepartoN onclick="apri_ricerca_reparto('ADMIN','<%= descRep%>','<%= id%>');" type=button value=...>
															<asp:TextBox id="IdRepartoNew" runat="server" Width="0px" Height="0px"></asp:TextBox>
														</FooterTemplate>
														<EditItemTemplate>
															<asp:TextBox id=TxtRep runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "reparto") %>' Width="112px" Height="20px">
															</asp:TextBox><INPUT class=btn id=cmbsCercaReparto onclick="apri_ricerca_reparto('ADMIN','<%= descRep1%>','<%= id1%>');" type=button value=...>
															<asp:TextBox id=IdReparto runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "idrep") %>' Width="0px" Height="0px">
															</asp:TextBox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="Destinazione">
														<ItemTemplate>
															<asp:Label id=LblUso runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "destuso") %>' Width="176px">
															</asp:Label>
														</ItemTemplate>
														<FooterTemplate>
															<asp:TextBox id="TxtUsoNew" runat="server" Width="112px" Height="20px"></asp:TextBox><INPUT class=btn id=cmbsCercaUsoN onclick="apri_ricerca_uso('ADMIN','<%= descUso%>','<%= Usoid%>');" type=button value=...>
															<asp:TextBox id="IdUsoNew" runat="server" Width="0px" Height="0px"></asp:TextBox>
														</FooterTemplate>
														<EditItemTemplate>
															<asp:TextBox id=TxtUso runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "destuso") %>' Width="112px" Height="20px">
															</asp:TextBox>
															<asp:TextBox id=IdUso runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "iduso") %>' Width="0px" Height="0px">
															</asp:TextBox><INPUT class=btn id=cmbsCercaUso onclick="apri_ricerca_uso('ADMIN','<%= descUso1 %>','<%= Usoid1 %>');" type=button value=...>
														</EditItemTemplate>
													</asp:TemplateColumn>
												</Columns>
											</ASP:DATAGRID></TD>
									</TR>
									<TR>
										<TD style="WIDTH: 46px; HEIGHT: 2.98%" vAlign="top" align="left"></TD>
										<TD style="WIDTH: 585px; HEIGHT: 2.98%" vAlign="top" align="left"></TD>
									</TR>
								</TABLE>
							</ASP:PANEL></TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 2.77%" vAlign="top" align="left">&nbsp;</TD>
						<TD style="HEIGHT: 2.77%" vAlign="top" align="left">&nbsp;
						</TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 4.53%" vAlign="top" align="left">&nbsp;</TD>
						<TD style="HEIGHT: 4.53%" vAlign="top" align="left"><CC1:S_BUTTON id="btnsSalva" tabIndex="23" runat="server" cssclass="btn" text="Salva"></CC1:S_BUTTON>&nbsp;
							<CC1:S_BUTTON id="btnsElimina" tabIndex="24" runat="server" cssclass="btn" causesvalidation="False"
								text="Elimina" commandtype="Delete"></CC1:S_BUTTON>&nbsp;
							<ASP:BUTTON id="btnAnnulla" tabIndex="25" runat="server" cssclass="btn" causesvalidation="False"
								text="Annulla"></ASP:BUTTON></TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 1%" vAlign="top" align="left">&nbsp;</TD>
						<TD style="HEIGHT: 1%" vAlign="top" align="left">
							<HR SIZE="1" noShade>
						</TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 6.53%" vAlign="top" align="left">&nbsp;</TD>
						<TD style="HEIGHT: 6.53%" vAlign="top" align="left"><ASP:LABEL id="lblFirstAndLast" runat="server"></ASP:LABEL>&nbsp;</TD>
					</TR>
					<TR>
						<TD>&nbsp;</TD>
						<TD><ASP:VALIDATIONSUMMARY id="vlsEdit" runat="server" showmessagebox="True" displaymode="List" showsummary="False"></ASP:VALIDATIONSUMMARY></TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
