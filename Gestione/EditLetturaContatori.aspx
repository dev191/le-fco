<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RicercaModulo" Src="../WebControls/RicercaModulo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CodiceApparecchiature" Src="../WebControls/CodiceApparecchiature.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Page language="c#" Codebehind="EditLetturaContatori.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.EditLetturaContatori" %>
<%@ Register TagPrefix="uc1" TagName="Addetti" Src="../WebControls/Addetti.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>Lettura Contatori</TITLE>
		<META name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<META name="CODE_LANGUAGE" content="C#">
		<META name="vs_defaultClientScript" content="JavaScript">
		<META name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
		<SCRIPT language="javascript">
		
		function ClearApparechiature()
		{
			var ctrltxtapp=document.getElementById('<%=CodiceApparecchiature1.s_CodiceApparecchiatura.ClientID%>');
			if(ctrltxtapp!=null && ctrltxtapp!='undefined')
			{
				ctrltxtapp.value="";
				document.getElementById('<%=CodiceApparecchiature1.CodiceHidden.ClientID%>').value="";
			}
		
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
			var bool1=true;
			var ora=parseInt(document.getElementById("<%=txtsorain.ClientID%>").value);
			var minuti=parseInt(document.getElementById("<%=txtsorainmin.ClientID%>").value);
				
				if(ora<0 || ora>23)
				{ 
					alert("Attenzione l'ora deve essere compresa tra 00 e 23");					
					document.getElementById("<%=txtsorain.ClientID%>").focus();
					bool1=false;
				}	
				
				
				else
				{
				/*alert( "else");
				alert( bool1);*/
					if(minuti<0 || minuti>59)
					{
						alert("Attenzione i minuti devono essere compresi tra 00 e 59");		
						document.getElementById("<%=txtsorainmin.ClientID%>").focus();					
						bool1=false;
					}
				/*alert( bool1);*/
						
				return bool1;
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

				function Formatta(txt)
						{
							testo=document.getElementById(txt);
							if(testo.value.length==0)
								testo.value="00";
							if(testo.value.length==1)
								testo.value="0"+testo.value;		
						}
		
				function Formatta1(txt)
						{
							testo=document.getElementById(txt);
							if(testo.value.length==0)
								testo.value="000";
							if(testo.value.length==1)
								testo.value="00"+testo.value;	
							if(testo.value.length==2)
								testo.value="0"+testo.value;		
						}		
	
		

		</SCRIPT>
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" ms_positioning="GridLayout">
		<FORM id="Form1" method="post" runat="server">
			<TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TR>
					<TD align="center"><UC1:PAGETITLE id="PageTitle1" runat="server"></UC1:PAGETITLE></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="left"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" DESIGNTIMEDRAGDROP="15" titlestyle-cssclass="TitleSearch"
							collapsed="False" titletext="Filtra Apparecchiatura" expandtext="Espandi" expandimageurl="../Images/down.gif" collapsetext="Espandi/Riduci"
							cssclass="DataPanel75" collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True">
							<TABLE id="tblSearch10" border="0" cellSpacing="1" cellPadding="1">
								<TR>
									<TD vAlign="top" colSpan="4" align="left">
										<P>
											<UC1:RICERCAMODULO id="RicercaModulo1" runat="server"></UC1:RICERCAMODULO></P>
									</TD>
								</TR>
								<TR style="DISPLAY: none">
									<TD style="WIDTH: 15%">Piano:</TD>
									<TD style="HEIGHT: 28px">
										<CC1:S_COMBOBOX id="cmbsPiano" tabIndex="1" runat="server" width="200px" autopostback="True"></CC1:S_COMBOBOX></TD>
									<TD>Stanza:</TD>
									<TD>
										<CC1:S_COMBOBOX id="cmbsStanza" tabIndex="2" runat="server" width="200px" dbdirection="Input"></CC1:S_COMBOBOX></TD>
								</TR>
								<TR>
									<TD><SPAN>Servizio: </SPAN>
									</TD>
									<TD>
										<CC1:S_COMBOBOX id="cmbsServizio" tabIndex="3" runat="server" width="392px" autopostback="True"></CC1:S_COMBOBOX></TD>
								</TR>
								<TR>
									<TD><SPAN>Std. Apparecchiatura:</SPAN>
									</TD>
									<TD>
										<CC1:S_COMBOBOX id="cmbsApparecchiatura" tabIndex="4" runat="server" width="392px"></CC1:S_COMBOBOX></TD>
								</TR>
							</TABLE>
						</COLLAPSE:DATAPANEL></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="left"><COLLAPSE:DATAPANEL id="Datapanel1" runat="server" DESIGNTIMEDRAGDROP="795" titlestyle-cssclass="TitleSearch"
							collapsed="False" titletext="Salva Lettura" expandtext="Espandi" expandimageurl="../Images/down.gif" collapsetext="Espandi/Riduci"
							cssclass="DataPanel75" collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True">
							<TABLE style="WIDTH: 100%; HEIGHT: 152px" id="tblSearch100" border="0" cellSpacing="1"
								cellPadding="1">
								<TR>
									<TD colSpan="4" align="left">
										<UC1:CODICEAPPARECCHIATURE id="CodiceApparecchiature1" runat="server"></UC1:CODICEAPPARECCHIATURE></TD>
								</TR>
								<TR>
									<TD align="left">Data
									</TD>
									<TD align="left">
										<uc1:CalendarPicker id="CalendarPicker1" runat="server"></uc1:CalendarPicker>
										<asp:RequiredFieldValidator id="RfvData" runat="server" ErrorMessage="Selezionare la data lettura">*</asp:RequiredFieldValidator></TD>
									<TD align="left">Ora Lettura
									</TD>
									<TD align="left">
										<asp:TextBox style="Z-INDEX: 0" id="txtsorain" tabIndex="6" runat="server" Width="30px">00</asp:TextBox>:
										<asp:TextBox style="Z-INDEX: 0" id="txtsorainmin" tabIndex="7" runat="server" Width="30px">00</asp:TextBox></TD>
								</TR>
								<TR>
									<TD align="left">Valore Lettura</TD>
									<TD align="left">
										<cc1:S_TextBox id="TxtValoreLetturaInt" tabIndex="8" runat="server" DBDirection="Input" DBSize="20"
											DBParameterName="p_telefono" DBIndex="5" DBDataType="VarChar">0</cc1:S_TextBox>,
										<cc1:S_TextBox id="TxtValoreLetturaDec" tabIndex="9" runat="server" Width="32px" DBDirection="Input"
											DBSize="3" DBParameterName="p_telefono" DBIndex="5" DBDataType="VarChar" MaxLength="3">000</cc1:S_TextBox></TD>
									<TD align="left">Unità di Misura</TD>
									<TD align="left">
										<cc1:S_TextBox style="Z-INDEX: 0" id="TXTUMISURA" tabIndex="10" runat="server" Width="64px" DBDirection="Input"
											DBSize="50" DBParameterName="p_umisura" DBIndex="7" DBDataType="VarChar" MaxLength="15">......</cc1:S_TextBox>
										<asp:RequiredFieldValidator id="RvfTXTUMISURA" runat="server" ErrorMessage="Selezionare unità di misura" Width="10%"
											InitialValue="......" ControlToValidate="TXTUMISURA">*</asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD align="left">Addetto</TD>
									<TD align="left">
										<uc1:Addetti id="Addetti1" runat="server"></uc1:Addetti>
										<asp:RequiredFieldValidator id="RFVAddetto" runat="server" ErrorMessage="Selezionare un addetto">*</asp:RequiredFieldValidator></TD>
									<TD align="left">Energia
									</TD>
									<TD align="left">
										<CC1:S_COMBOBOX id="CmbsEnergia" tabIndex="11" runat="server" width="200px" dbdirection="Input">
											<asp:ListItem Value="--Seleziona Energia--">--Seleziona Energia--</asp:ListItem>
											<asp:ListItem Value="Erogata">Erogata</asp:ListItem>
											<asp:ListItem Value="Utilizzata">Utilizzata</asp:ListItem>
										</CC1:S_COMBOBOX>
										<asp:RequiredFieldValidator id="RfvEnergia" runat="server" ErrorMessage="Selezionare un' energia" Width="10%"
											InitialValue="--Seleziona Energia--" ControlToValidate="CmbsEnergia">*</asp:RequiredFieldValidator></TD>
								</TR>
								<TR>
									<TD align="left">Nota</TD>
									<TD colSpan="3" align="left">
										<cc1:S_TextBox id="TxtNota" tabIndex="12" runat="server" Width="456px" DBDirection="Input" DBSize="20"
											DBIndex="5" DBDataType="VarChar" Height="56px" TextMode="MultiLine"></cc1:S_TextBox></TD>
								</TR>
								<TR>
									<TD>
										<P>
											<CC1:S_BUTTON id="BtnSalva" runat="server" cssclass="btn" width="130px" text="Salva" tooltip="Salva Lettura"></CC1:S_BUTTON></P>
									</TD>
									<TD colSpan="3">
										<CC1:S_BUTTON id="BtnElimina" runat="server" cssclass="btn" width="130px" text="Elimina" CausesValidation="False"></CC1:S_BUTTON>
										<CC1:S_BUTTON id="BtnAnnulla" runat="server" cssclass="btn" width="130px" text="Annulla" tooltip="Torna alla pagina di ricerca"
											CausesValidation="False"></CC1:S_BUTTON>
										<cc1:S_TextBox id="itemId" tabIndex="6" runat="server" Width="0px" DBDirection="Input" DBSize="20"
											DBParameterName="p_telefono" DBIndex="5" DBDataType="VarChar" Height="0px"></cc1:S_TextBox></TD>
								</TR>
							</TABLE>
						</COLLAPSE:DATAPANEL></TD>
				</TR>
			</TABLE>
			<asp:validationsummary style="Z-INDEX: 101; POSITION: absolute; TOP: 376px; LEFT: 40px" id="ValidationSummary1"
				runat="server" Height="56px" ShowSummary="False" ShowMessageBox="True"></asp:validationsummary></FORM>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
