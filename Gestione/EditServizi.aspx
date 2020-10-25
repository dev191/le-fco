<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Page language="c#" Codebehind="EditServizi.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.EditServizi" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Edit Servizi</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Css/MainSheet.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" MS_POSITIONING="GridLayout">
		<script language="javascript">
	
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
		
		function imposta_dec(obj)
		{
			val=document.getElementById(obj).value;
			if(val=="")
				document.getElementById(obj).value="00";
			if(val.length==1)	
				document.getElementById(obj).value=val+"0";
		}
		
		function imposta_int(obj)
		{
			if(document.getElementById(obj).value=="")
				document.getElementById(obj).value="0";		
		}

	
		</script>
		<form id="Form1" method="post" runat="server">
			<TABLE id="TableMain" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0px; LEFT: 0px"
				cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR vAlign="top" align="center" height="95%">
					<TD>
						<TABLE id="tblFormInput" cellSpacing="1" cellPadding="1" align="center">
							<TBODY>
								<TR>
									<TD style="WIDTH: 5%; HEIGHT: 5%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 5%" vAlign="top" align="left"><asp:label id="lblOperazione" runat="server" CssClass="TitleOperazione" Width="544px"></asp:label><cc2:messagepanel id="PanelMess" runat="server" ErrorIconUrl="~/Images/ico_critical.gif" MessageIconUrl="~/Images/ico_info.gif"></cc2:messagepanel></TD>
								</TR>
								<TR>
									<TD style="HEIGHT: 1%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 1%" vAlign="top" align="left">
										<hr noShade SIZE="1">
									</TD>
								</TR>
								<TR>
									<TD vAlign="top" align="center"></TD>
									<TD vAlign="top" align="left"><asp:panel id="PanelEdit" runat="server">
											<TABLE id="tblSearch75" border="0" cellSpacing="1" cellPadding="2">
												<TR>
													<TD style="HEIGHT: 20px" align="left">Settore
														<asp:RequiredFieldValidator id="rfvSettore" runat="server" ControlToValidate="cmbsSettore" ErrorMessage="Scegliere il Settore"
															InitialValue="-1">*</asp:RequiredFieldValidator></TD>
													<TD style="HEIGHT: 20px">
														<cc1:S_ComboBox id="cmbsSettore" runat="server" DBIndex="3" DBParameterName="p_SETTORE" DBDirection="Input"
															DBDataType="Integer"></cc1:S_ComboBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 24px" align="left">Codice
														<asp:RequiredFieldValidator id="rfvCodice" runat="server" ControlToValidate="txtsCodice" ErrorMessage="Inserire il codice Servizio">*</asp:RequiredFieldValidator></TD>
													<TD style="HEIGHT: 24px">
														<cc1:S_TextBox id="txtsCodice" tabIndex="1" runat="server" Width="346px" DBIndex="2" DBParameterName="p_CODICE"
															DBDirection="Input" DBSize="5" MaxLength="5"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">Descrizione</TD>
													<TD style="HEIGHT: 23px">
														<cc1:S_TextBox id="txtsDescrizione" tabIndex="2" runat="server" Width="346px" DBIndex="0" DBParameterName="p_DESCRIZIONE"
															DBDirection="Input" DBDataType="VarChar" DBSize="255" MaxLength="255"></cc1:S_TextBox>
														<asp:RequiredFieldValidator id="rfvPercentuale" runat="server" ControlToValidate="txtsDescrizione" ErrorMessage="Inserire la Descrizione del Servizio">*</asp:RequiredFieldValidator></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">Note:</TD>
													<TD style="HEIGHT: 23px">
														<cc1:S_TextBox id="txtsNote" tabIndex="2" runat="server" Width="346px" DBIndex="1" DBParameterName="p_NOTE"
															DBDirection="Input" DBDataType="VarChar" DBSize="500" MaxLength="500" TextMode="MultiLine"></cc1:S_TextBox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 23px" align="left">Soglia Autorizzazione €</TD>
													<TD style="HEIGHT: 23px">
														<cc1:S_TextBox id="txtsSogliaImpI" tabIndex="2" runat="server" Width="48px" DBIndex="0" DBDirection="Input"
															DBDataType="VarChar" DBSize="255" MaxLength="255">0</cc1:S_TextBox>,
														<cc1:S_TextBox style="Z-INDEX: 0" id="txtsSogliaImpD" tabIndex="2" runat="server" Width="32px"
															DBIndex="0" DBDirection="Input" DBDataType="VarChar" DBSize="255" MaxLength="255">0</cc1:S_TextBox></TD>
												</TR>
												<TR>
												</TR>
											</TABLE>
										</asp:panel></TD>
								</TR>
								<tr>
									<TD style="HEIGHT: 5%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 5%" vAlign="top" align="left"><cc1:s_button id="btnsSalva" tabIndex="10" runat="server" CssClass="btn" Text="Salva"></cc1:s_button>&nbsp;
										<cc1:s_button id="btnsElimina" tabIndex="11" runat="server" CssClass="btn" Text="Elimina" CommandType="Delete"
											CausesValidation="False"></cc1:s_button>&nbsp;
										<asp:button id="btnAnnulla" tabIndex="12" runat="server" CssClass="btn" Text="Annulla" CausesValidation="False"></asp:button></TD>
								</tr>
								<TR>
									<TD style="HEIGHT: 1%" vAlign="top" align="left"></TD>
									<TD style="HEIGHT: 1%" vAlign="top" align="left">
										<hr noShade SIZE="1">
									</TD>
								</TR>
				</TR>
				<TR>
					<TD style="HEIGHT: 5%" vAlign="top" align="left"></TD>
					<TD style="HEIGHT: 5%" vAlign="top" align="left"><asp:label id="lblFirstAndLast" runat="server"></asp:label>&nbsp;
					</TD>
				</TR>
			</TABLE>
			<asp:validationsummary id="vlsEdit" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:validationsummary></TD></TR></TBODY></TABLE></form>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
