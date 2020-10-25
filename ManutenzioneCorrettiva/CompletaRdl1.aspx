<%@ Page language="c#" Codebehind="CompletaRdl1.aspx.cs" AutoEventWireup="false" Inherits="TheSite.ManutenzioneCorrettiva.CompletaRdl1" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<%@ Register TagPrefix="cc2" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="CalendarPicker" Src="../WebControls/CalendarPicker.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>Completamento Richiesta</title>
<meta content="Microsoft Visual Studio .NET 7.1" name=GENERATOR>
<meta content=C# name=CODE_LANGUAGE>
<meta content=JavaScript name=vs_defaultClientScript>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema><LINK href="../Css/MainSheet.css" type=text/css rel=stylesheet >
<SCRIPT language=javascript src="../images/cal/popcalendar.js"></SCRIPT>

<SCRIPT language=javascript src="jscompleta.js"></SCRIPT>

<script>
	
	function VisualizzaNO()
	{	
		var crtl; var crtl1; var crtl2; var crtl3;var crtl4; var crtl5;
		var crtl6;var crtl7;var crtl8;var crtl9;var crtl10;var crtl11;var crtl12;var crtl13;
		var crtl14;var crtl15;var crtl16;var crtl17;var crtl18;var crtl19;var crtl20;
		var crtl21;var crtl22;var crtl23;var crtl24;var crtl25;var crtl26;
		var crtl27;var crtl28;var crtl29;var crtl30;var crtl31;var crtl32;
		var crtl33;var crtl34;var crtl35;var crtl36;var crtl37;var crtl38;
	     
	     crtl=document.getElementById("divstatoimpianto").style;
		 crtl.display="none";
		 
		 crtl1=document.getElementById("divcmbstatoimpianto").style;		 
		 crtl1.display="none";
		 
		 crtl2=document.getElementById("rimedio").style; 		
		 crtl2.display="none";
		 
		 crtl3=document.getElementById("rimediot").style; 		
		 crtl3.display="none";
		 
		 crtl4=document.getElementById("rimediott").style; 		
		 crtl4.display="none";
		 
		 crtl5=document.getElementById("cmbrimedio").style; 		
		 crtl5.display="none";
		 
		 crtl6=document.getElementById("t1").style; 		
		 crtl6.display="none";
		 
		 crtl7=document.getElementById("t2").style; 		
		 crtl7.display="none";
		 
		 crtl8=document.getElementById("t3").style; 		
		 crtl8.display="none";
		 
		 crtl9=document.getElementById("t4").style; 		
		 crtl9.display="none";
	   	
	   	crtl10=document.getElementById("t5").style; 		
		 crtl10.display="none";	
		crtl11=document.getElementById("t6").style; 		
		 crtl11.display="none";	
		crtl12=document.getElementById("t7").style; 		
		 crtl12.display="none";	
		crtl13=document.getElementById("t8").style; 		
		 crtl13.display="none";	
		crtl14=document.getElementById("t9").style; 		
		 crtl14.display="none";
		crtl15=document.getElementById("t10").style; 		
		 crtl15.display="none"; 
		crtl16=document.getElementById("t11").style; 		
		 crtl16.display="none"; 
		crtl17=document.getElementById("t12").style; 		
		 crtl17.display="none";	
		crtl18=document.getElementById("t13").style; 		
		 crtl18.display="none";
		crtl19=document.getElementById("t14").style; 		
		 crtl19.display="none";
		crtl20=document.getElementById("t15").style; 		
		 crtl20.display="none";			
		crtl21=document.getElementById("t16").style; 		
		 crtl21.display="none";	
		crtl22=document.getElementById("t17").style; 		
		 crtl22.display="none";	
		crtl23=document.getElementById("t18").style; 		
		 crtl23.display="none";
	crtl24=document.getElementById("t19").style; 		
		 crtl24.display="none";
	crtl25=document.getElementById("t20").style; 		
		 crtl25.display="none";	 
	crtl26=document.getElementById("t21").style; 		
		 crtl26.display="none";	
	crtl27=document.getElementById("t22").style; 		
		 crtl27.display="none";	 		 
	crtl28=document.getElementById("t23").style; 		
		 crtl28.display="none";		 
crtl29=document.getElementById("t24").style;	crtl29.display="none";
crtl30=document.getElementById("t25").style;	crtl30.display="none";
crtl31=document.getElementById("t26").style;	crtl31.display="none";
crtl32=document.getElementById("t27").style;	crtl32.display="none";
crtl33=document.getElementById("t28").style;	crtl33.display="none";
crtl34=document.getElementById("t29").style;	crtl34.display="none";
crtl35=document.getElementById("txtdatariavvio").style;	crtl35.display="none";
crtl36=document.getElementById("datariavvio").style;	crtl36.display="none";
crtl37=document.getElementById("orariavvio").style;	crtl37.display="none";	 
crtl38=document.getElementById("txtlettura").style;	crtl38.display="none";			 
	}
	
	
	function SoloNumerip()
{	
if (event.keyCode < 48	|| event.keyCode > 57)
		{
		event.keyCode = 0;
		}	
}
	
		</script>
</HEAD>
<body onbeforeunload=closewin(); 
MS_POSITIONING="GridLayout">
<form id=Form1 method=post runat="server">
<TABLE id=Table1 style="Z-INDEX: 101; POSITION: absolute; TOP: 8px; LEFT: 8px" 
cellSpacing=1 cellPadding=1 width="100%" border=0>
  <TR>
    <TD align=center><uc1:pagetitle id=PageTitle1 runat="server"></uc1:pagetitle></TD></TR>
  <TR>
    <TD>
      <TABLE id=Table2 cellSpacing=1 cellPadding=1 width="100%" border=0 
      >
        <TBODY>
        <TR>
          <TD><cc2:datapanel id=PanelGeneral 
             runat="server" 
            titlestyle-cssclass="TitleSearch" collapsed="False" 
            titletext="Dati della Richiesta" expandtext="Espandi" 
            expandimageurl="../Images/down.gif" collapsetext="Riduci" 
            collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
            cssclass="DataPanel75">
            <TABLE id=tblSearch100 border=0 cellSpacing=0 cellPadding=0 
            width="100%">
              <TR>
                <TD style="HEIGHT: 12px" width="20%"><B>RDL nr</B></TD>
                <TD style="WIDTH: 169px; HEIGHT: 12px">
<ASP:LABEL id=LblRdl runat="server" width="174px"></ASP:LABEL></TD>
                <TD style="HEIGHT: 12px"><B><INPUT 
                  style="WIDTH: 16px; HEIGHT: 18px" id=hidBl_id size=1 
                  type=hidden name=hidBl_id runat="server"><INPUT 
                  style="WIDTH: 16px; HEIGHT: 18px" id=HPageBack size=1 
                  type=hidden name=HPageBack runat="server"><INPUT 
                  style="WIDTH: 16px; HEIGHT: 18px" id=HSga size=1 type=hidden 
                  name=HSga runat="server"><INPUT 
                  style="WIDTH: 16px; HEIGHT: 18px" id=HPrj size=1 type=hidden 
                  name=HPrj runat="server"></B></TD>
                <TD style="HEIGHT: 12px"></TD></TR>
              <TR>
                <TD>
                  <DIV id=t1><B>Nominativo Richiedente:</B> </DIV></TD>
                <TD>
                  <DIV id=t2>
<ASP:LABEL id=lblRichiedente runat="server" width="174px"></ASP:LABEL></DIV></TD>
                <TD>
                  <DIV id=t3><B>Utente Inserimento:</B> </DIV></TD>
                <TD>
                  <DIV id=t4>
<ASP:LABEL id=lblOperatore runat="server" width="128px"></ASP:LABEL></DIV></TD></TR>
              <TR>
                <TD style="DISPLAY: none">
                  <DIV id=t5><B>Telefono Richiedente:</B> </DIV></TD>
                <TD style="DISPLAY: none">
                  <DIV id=t6>
<ASP:LABEL id=lbltelefonoric runat="server" width="174px"></ASP:LABEL></DIV></TD>
                <TD><B>Data Richiesta:</B></TD>
                <TD>
<ASP:LABEL id=lblDataRichiesta runat="server" width="128px"></ASP:LABEL></TD></TR>
              <TR>
                <TD style="DISPLAY: none">
                  <DIV id=t7><B>Gruppo Richiedente:</B> </DIV></TD>
                <TD style="DISPLAY: none">
                  <DIV id=t8>
<ASP:LABEL id=lblGruppo runat="server" width="174px"></ASP:LABEL></DIV></TD>
                <TD><B>Orario Richiesta:</B></TD>
                <TD>
<ASP:LABEL id=lblOraRichiesta runat="server" width="128px"></ASP:LABEL></TD></TR>
              <TR>
                <TD style="DISPLAY: none">
                  <DIV id=t9><B>Email Richiedente:</B></DIV></TD>
                <TD style="DISPLAY: none">
                  <DIV id=t10>
<ASP:LABEL id=lblemailric runat="server" width="174px"></ASP:LABEL></DIV></TD>
                <TD style="DISPLAY: none">
                  <DIV id=t11><B>Stanza Richiedente:</B></DIV></TD>
                <TD>
                  <DIV id=t12>
<ASP:LABEL id=lblstanzaric runat="server" width="128px"></ASP:LABEL></DIV></TD></TR>
              <TR>
                <TD><B>Centrale:</B></TD>
                <TD colSpan=3>
<ASP:LABEL id=lblfabbricato runat="server" width="382px"></ASP:LABEL>
<ASP:TEXTBOX id=txtHidBl runat="server" width="0px"></ASP:TEXTBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 13px"><B></B></TD>
                <TD style="WIDTH: 169px; HEIGHT: 13px">
<ASP:LABEL id=lblPiano runat="server" width="174px" Visible="False">
														</ASP:LABEL></TD>
                <TD style="HEIGHT: 13px"><B></B></TD>
                <TD style="HEIGHT: 13px">
<ASP:LABEL id=lblStanza runat="server" width="174px" Visible="False">
														</ASP:LABEL></TD></TR>
              <TR>
                <TD style="HEIGHT: 13px"><B></B></TD>
                <TD style="HEIGHT: 13px" colSpan=3>
<ASP:LABEL id=lblTelefono runat="server" width="174px" Visible="False"></ASP:LABEL></TD>
              <TR>
                <TD><B></B></TD>
                <TD colSpan=3>
<ASP:LABEL id=lblNote runat="server" width="472px" Visible="False"></ASP:LABEL>
<ASP:LABEL id=presidio runat="server" width="0px" Height="0px"></ASP:LABEL></TD></TR>
              <TR>
                <TD>
                  <DIV id=t13><B>Servizio:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t14>
<CC1:S_COMBOBOX id=cmbsServizio runat="server" width="480px" autopostback="True" Enabled="False"></CC1:S_COMBOBOX></DIV></TD></TR>
              <TR>
                <TD>
                  <DIV id=t15><B>Tipo Attività:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t16>
<CC1:S_COMBOBOX id=cmbsSettore runat="server" width="480px" autopostback="True" Enabled="False"></CC1:S_COMBOBOX></DIV></TD></TR><!--
												<TR>
													<TD class="SGA" style="HEIGHT: 24px"><STRONG class="blueoverline">A Seguito di:</STRONG></TD>
													<TD style="HEIGHT: 24px" colSpan="3">&nbsp;
													</TD>
												</TR>
												-->
              <TR>
                <TD>
                  <DIV id=t17><B>Standard Apparecchiatura:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t18>
<CC1:S_COMBOBOX id=cmdsStdApparecchiatura runat="server" width="480px" Enabled="False" dbdatatype="Integer" AutoPostBack="True" dbindex="1" dbdirection="Input" dbparametername="p_eqstd_id" dbsize="10"></CC1:S_COMBOBOX></DIV></TD></TR>
              <TR>
                <TD>
                  <DIV id=t19><B>Apparecchiatura:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t20>
<CC1:S_COMBOBOX id=cmbEQ runat="server" width="480px" Enabled="False" dbdatatype="Integer" dbindex="1" dbdirection="Input" dbparametername="p_id_eq" dbsize="10"></CC1:S_COMBOBOX></DIV></TD></TR>
              <TR>
                <TD>
                  <DIV id=t21><B>Descrizione Problema/Note:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t22>
<CC1:S_TEXTBOX id=txtsDescrizionebreve runat="server" width="663px" Enabled="False" height="77px"></CC1:S_TEXTBOX></DIV></TD></TR>
              <TR>
                <TD>
                  <DIV id=t23><B>Problema:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t24>
<CC1:S_TEXTBOX id=txtProblema runat="server" width="472px" Enabled="False" height="28px" MaxLength="408"></CC1:S_TEXTBOX></DIV></TD></TR>
              <TR>
                <TD>
                  <DIV id=t25><B>Causa Presunta Guasto/Anomalia:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t26>
<CC1:S_TEXTBOX id=txtCausa runat="server" width="472px" Enabled="False" height="25px" MaxLength="408"></CC1:S_TEXTBOX></DIV></TD></TR><!-- --></TR>
              <TR>
                <TD><STRONG>Priorità:</STRONG></TD>
                <TD colSpan=3>
<CC1:S_COMBOBOX id=cmbsUrgenza runat="server" width="264px" Enabled="False"></CC1:S_COMBOBOX></TD></TR>
              <TR>
                <TD vAlign=middle align=left><B>Tipo Manutenzione:</B> </TD>
                <TD HEIGHT: 27px?>
<CC1:S_COMBOBOX id=cmbsTipoManutenzione runat="server" width="264px" Enabled="False"></CC1:S_COMBOBOX></TD>
                <TD style="HEIGHT: 27px" vAlign=middle><B></B></TD>
                <TD style="HEIGHT: 27px"></TD></TR><!-- -->
              <TR>
                <TD></TD>
                <TD colSpan=3>
                  <DIV id=t27>
<asp:button id=Button1 runat="server" Width="248px" Text="Modifica Sezione Dati della Richiesta"></asp:button></DIV></TD></TR>
              <TR>
                <TD>
                  <DIV id=t28><B>Data Anomalia:</B></DIV></TD>
                <TD colSpan=3>
                  <DIV id=t29><B>
<uc1:CalendarPicker id=CalendarPicker3 runat="server"></uc1:CalendarPicker>Ora</B> 
<CC1:S_COMBOBOX id=cmb_ora_anomalia runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
										</CC1:S_COMBOBOX>
<CC1:S_COMBOBOX id=cmb_min_anomalia runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
											<asp:ListItem Value="24">24</asp:ListItem>
											<asp:ListItem Value="25">25</asp:ListItem>
											<asp:ListItem Value="26">26</asp:ListItem>
											<asp:ListItem Value="27">27</asp:ListItem>
											<asp:ListItem Value="28">28</asp:ListItem>
											<asp:ListItem Value="29">29</asp:ListItem>
											<asp:ListItem Value="30">30</asp:ListItem>
											<asp:ListItem Value="31">31</asp:ListItem>
											<asp:ListItem Value="32">32</asp:ListItem>
											<asp:ListItem Value="33">33</asp:ListItem>
											<asp:ListItem Value="34">34</asp:ListItem>
											<asp:ListItem Value="35">35</asp:ListItem>
											<asp:ListItem Value="36">36</asp:ListItem>
											<asp:ListItem Value="37">37</asp:ListItem>
											<asp:ListItem Value="38">38</asp:ListItem>
											<asp:ListItem Value="39">39</asp:ListItem>
											<asp:ListItem Value="40">40</asp:ListItem>
											<asp:ListItem Value="41">41</asp:ListItem>
											<asp:ListItem Value="42">42</asp:ListItem>
											<asp:ListItem Value="43">43</asp:ListItem>
											<asp:ListItem Value="44">44</asp:ListItem>
											<asp:ListItem Value="45">45</asp:ListItem>
											<asp:ListItem Value="46">46</asp:ListItem>
											<asp:ListItem Value="47">47</asp:ListItem>
											<asp:ListItem Value="48">48</asp:ListItem>
											<asp:ListItem Value="49">49</asp:ListItem>
											<asp:ListItem Value="50">50</asp:ListItem>
											<asp:ListItem Value="51">51</asp:ListItem>
											<asp:ListItem Value="52">52</asp:ListItem>
											<asp:ListItem Value="53">53</asp:ListItem>
											<asp:ListItem Value="54">54</asp:ListItem>
											<asp:ListItem Value="55">55</asp:ListItem>
											<asp:ListItem Value="56">56</asp:ListItem>
											<asp:ListItem Value="57">57</asp:ListItem>
											<asp:ListItem Value="58">58</asp:ListItem>
											<asp:ListItem Value="59">59</asp:ListItem>
										</CC1:S_COMBOBOX></DIV></TD></TR></TABLE></cc2:datapanel></TD></TR>
        <TR>
          <TD><cc2:datapanel id=Datapanel1 
             runat="server" 
            titlestyle-cssclass="TitleSearch" collapsed="False" 
            titletext="Report Lavoro SGA" expandtext="Espandi" 
            expandimageurl="../Images/down.gif" collapsetext="Riduci" 
            collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
            cssclass="DataPanel75" Visible="False">
            <TABLE id=Table3 border=0 cellSpacing=1 cellPadding=1 
              width="100%">
              <TR>
                <TD style="HEIGHT: 38px" colSpan=3>
                  <TABLE style="WIDTH: 528px; HEIGHT: 100%" id=Table18 border=0 
                  cellSpacing=0 cellPadding=0 width=528></TABLE></TD></TR>
              <TR id=trprev1>
                <TD style="WIDTH: 139px"><B>Importo Presunto:</B></TD>
                <TD>
                  <TABLE style="WIDTH: 528px; HEIGHT: 100%">
                    <TR>
                      <TD>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtImp1 runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtImp1_1 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD><B>Oltre Iva:</B></TD>
                      <TD>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtPercentuale1 runat="server" width="24px" maxlength="2"></CC1:S_TEXTBOX><B>%</B></TD></TR></TABLE></TD>
              <TR id=trprev2>
                <TD style="WIDTH: 139px"><B>Importo Forfettario:</B></TD>
                <TD>, 
                  <TABLE style="WIDTH: 528px; HEIGHT: 100%" id=Table19>
                    <TR>
                      <TD>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtImp2 runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtImp2_1 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD><B>Oltre Iva:</B></TD>
                      <TD><B>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtPercentuale2 runat="server" width="24px" maxlength="2"></CC1:S_TEXTBOX>%</B></TD></TR></TABLE></TD></TR>
              <TR id=trprev3>
                <TD style="WIDTH: 139px" class=sga><B 
                  class=blueoverline>Modalità di Pagamento:</B></TD>
                <TD colSpan=3>
<CC1:S_TEXTBOX id=txtModalitaPagamento runat="server" width="480px" height="34px" MaxLength="112" textmode="MultiLine"></CC1:S_TEXTBOX></TD></TR></TABLE></cc2:datapanel></TD></TR>
        <TR>
          <TD><cc2:datapanel id=Datapanel2 
             runat="server" 
            titlestyle-cssclass="TitleSearch" collapsed="False" 
            titletext="Documentazione in allegato" expandtext="Espandi" 
            expandimageurl="../Images/down.gif" collapsetext="Riduci" 
            collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
            cssclass="DataPanel75"><INPUT 
            style="WIDTH: 392px; HEIGHT: 18px" id=UploadFile size=46 type=file 
            name=UploadFile runat="server">&nbsp; 
<asp:button id=BtUpload runat="server" Text="Invia il File..."></asp:button>
<asp:repeater id=rpdc Runat="server">
								<HeaderTemplate>
									<table border="0">
										<tr>
											<td>Download del Documento</td>
											<td>Elimina</td>
										</tr>
									</table>
								</HeaderTemplate>
								<ItemTemplate>
									<table border="0">
										<tr>
											<td>
												<asp:Label Runat="server" ID="lbln"></asp:Label></td>
											<td>
												<asp:ImageButton ID="delete" ImageUrl="../Images/elimina.gif" Runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id_file") + "," + DataBinder.Eval(Container.DataItem, "Nome_Doc") %>'>
												</asp:ImageButton></td>
										</tr>
									</table>
								</ItemTemplate>
								<FooterTemplate>
								</FooterTemplate>
							</asp:repeater></cc2:datapanel></TD></TR>
        <tr>
          <TD>
            <DIV style="DISPLAY: none"><cc2:datapanel 
            id=Datapanel6 runat="server" 
            titlestyle-cssclass="TitleSearch" collapsed="False" 
            titletext="Preventivo RdL" expandtext="Espandi" 
            expandimageurl="../Images/down.gif" collapsetext="Riduci" 
            collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
            cssclass="DataPanel75">
            <TABLE id=TablePrev border=0 cellSpacing=1 cellPadding=1 
            width="100%">
              <TR>
                <TD style="HEIGHT: 32px"><STRONG>Preventivo N°:</STRONG></TD>
                <TD style="WIDTH: 241px; HEIGHT: 32px">
<asp:textbox id=TxtNumPreventivo runat="server" MaxLength="25" Width="160px"></asp:textbox></TD>
                <TD style="WIDTH: 141px; HEIGHT: 32px" 
                  align=right><STRONG>Importo Preventivo: &nbsp;</STRONG></TD>
                <TD style="HEIGHT: 32px">
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtImpPrev1 runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtImpPrev2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD></TR>
              <TR>
                <TD style="HEIGHT: 32px"><STRONG>Autorizzazione 
                  Preventivo:</STRONG></TD>
                <TD colSpan=3>
<asp:label id=lblAut runat="server" Width="400px" Font-Bold="True"></asp:label></TD></TR>
              <TR>
                <TD><STRONG>File Preventivo:</STRONG></TD>
                <TD colSpan=3><INPUT style="WIDTH: 392px; HEIGHT: 18px" 
                  id=FilePreventivo size=46 type=file name=File1 
                  runat="server">&nbsp; 
<asp:button id=BtInviaPreventivo runat="server" Width="192px" Text="Salva il Preventivo/Invia Email"></asp:button></TD></TR>
              <TR>
                <TD>
<ASP:LABEL id=lblprev runat="server" width="176px" Font-Bold="True"></ASP:LABEL></TD>
                <TD colSpan=3>
<asp:hyperlink id=LkPrev runat="server"></asp:hyperlink>&nbsp; 
<asp:imagebutton id=btImgDelete runat="server" ImageUrl="../Images/elimina.gif"></asp:imagebutton></TD></TR></TABLE></cc2:datapanel></DIV></TD></tr>
        <TR>
          <TD><cc2:datapanel id=Datapanel3 
             runat="server" 
            titlestyle-cssclass="TitleSearch" collapsed="False" 
            titletext="Emissione Ordine" expandtext="Espandi" 
            expandimageurl="../Images/down.gif" collapsetext="Riduci" 
            collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
            cssclass="DataPanel75">
            <TABLE id=Table4 cellSpacing=1 cellPadding=1 width="100%" border=0 
            >
              <TR>
                <TD style="HEIGHT: 15px"><STRONG 
                  >OdL nr:</STRONG></TD>
                <TD style="WIDTH: 241px; HEIGHT: 15px"><asp:label id=LblOrdine runat="server" Font-Bold="True"></asp:label></TD>
                <TD style="WIDTH: 141px; HEIGHT: 15px"></TD>
                <TD style="HEIGHT: 15px"></TD>
              <TR>
                <TD style="WIDTH: 11.3%">
                  <DIV style="DISPLAY: none"><B 
                  class=blueoverline>Soluzione 
                  Proposta:</B> </DIV></TD>
                <TD colSpan=3>
                  <DIV style="DISPLAY: none"><CC1:S_TEXTBOX id=txtSoluzioneProposta runat="server" width="480px" height="34px" textmode="MultiLine" MaxLength="408"></CC1:S_TEXTBOX></DIV></TD></TR>
              <TR>
                <TD><B>Attività 
                  Operative:</B></TD>
                <TD colSpan=3><CC1:S_TEXTBOX id=txtsDescrizione runat="server" width="664px" height="107px" textmode="MultiLine"></CC1:S_TEXTBOX></TD></TR>
              <TR>
                <TD style="WIDTH: 139px">
                  <DIV style="DISPLAY: none"><B 
                  class=blueoverline>Note SGA:</B> 
</DIV></TD>
                <TD colSpan=3>
                  <DIV style="DISPLAY: none"><CC1:S_TEXTBOX id=txtNoteSga runat="server" width="480px" height="34px" textmode="MultiLine" MaxLength="408"></CC1:S_TEXTBOX></DIV></TD></TR>
              <TR>
                <TD style="WIDTH: 139px">
                  <DIV style="DISPLAY: none"><STRONG 
                  >SGA:</STRONG> </DIV></TD>
                <TD colSpan=3>
                  <DIV style="DISPLAY: none"><asp:label id=lblSGA runat="server" Font-Bold="True"></asp:label>&nbsp; 
<asp:label id=LblDataInvioSga runat="server" Font-Bold="True"></asp:label></DIV></TD></TR>
              <tr>
                <td></td>
                <TD>
                  <div id=lHAttcond><asp:hyperlink id=HAttcond runat="server">Visualizza Attività Conduzione</asp:hyperlink></div></TD>
                <TD colSpan=2><asp:button id=Button3 runat="server" Visible="False" Text="Esporta Att. Conduzione Dett.Passi" Width="256px"></asp:button></TD></tr>
              <TR>
                <TD><STRONG 
                  >Addetto-Ditta 
                  Esecutrice:&nbsp;&nbsp;</STRONG></TD>
                <TD style="WIDTH: 241px"><CC1:S_COMBOBOX id=cmbsAddetto runat="server" width="376px"></CC1:S_COMBOBOX></TD>
                <TD style="WIDTH: 141px" align=left></TD>
                <TD></TD></TR>
              <TR>
                <TD style="HEIGHT: 16px" colSpan=2 
                  ><STRONG 
                  >Data&nbsp;Inizio Schedulata:</STRONG></TD>
                <TD style="HEIGHT: 16px" colSpan=2 
                  ><STRONG>Data Fine 
                  Schedulata:</STRONG></TD></TR>
              <TR>
                <TD><uc1:calendarpicker id=CalendarPicker6 runat="server"></uc1:calendarpicker></TD>
                <TD>Ora<CC1:S_COMBOBOX id=cmbOra1 runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
										</CC1:S_COMBOBOX> <CC1:S_COMBOBOX id=cmbMin2 runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
											<asp:ListItem Value="24">24</asp:ListItem>
											<asp:ListItem Value="25">25</asp:ListItem>
											<asp:ListItem Value="26">26</asp:ListItem>
											<asp:ListItem Value="27">27</asp:ListItem>
											<asp:ListItem Value="28">28</asp:ListItem>
											<asp:ListItem Value="29">29</asp:ListItem>
											<asp:ListItem Value="30">30</asp:ListItem>
											<asp:ListItem Value="31">31</asp:ListItem>
											<asp:ListItem Value="32">32</asp:ListItem>
											<asp:ListItem Value="33">33</asp:ListItem>
											<asp:ListItem Value="34">34</asp:ListItem>
											<asp:ListItem Value="35">35</asp:ListItem>
											<asp:ListItem Value="36">36</asp:ListItem>
											<asp:ListItem Value="37">37</asp:ListItem>
											<asp:ListItem Value="38">38</asp:ListItem>
											<asp:ListItem Value="39">39</asp:ListItem>
											<asp:ListItem Value="40">40</asp:ListItem>
											<asp:ListItem Value="41">41</asp:ListItem>
											<asp:ListItem Value="42">42</asp:ListItem>
											<asp:ListItem Value="43">43</asp:ListItem>
											<asp:ListItem Value="44">44</asp:ListItem>
											<asp:ListItem Value="45">45</asp:ListItem>
											<asp:ListItem Value="46">46</asp:ListItem>
											<asp:ListItem Value="47">47</asp:ListItem>
											<asp:ListItem Value="48">48</asp:ListItem>
											<asp:ListItem Value="49">49</asp:ListItem>
											<asp:ListItem Value="50">50</asp:ListItem>
											<asp:ListItem Value="51">51</asp:ListItem>
											<asp:ListItem Value="52">52</asp:ListItem>
											<asp:ListItem Value="53">53</asp:ListItem>
											<asp:ListItem Value="54">54</asp:ListItem>
											<asp:ListItem Value="55">55</asp:ListItem>
											<asp:ListItem Value="56">56</asp:ListItem>
											<asp:ListItem Value="57">57</asp:ListItem>
											<asp:ListItem Value="58">58</asp:ListItem>
											<asp:ListItem Value="59">59</asp:ListItem>
										</CC1:S_COMBOBOX></TD>
                <TD><uc1:calendarpicker id=CalendarPicker2 runat="server"></uc1:calendarpicker></TD>
                <TD>Ora<CC1:S_COMBOBOX id=cmborafinelav runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
										</CC1:S_COMBOBOX> <CC1:S_COMBOBOX id=cmbminfinelav runat="server" dbdatatype="Integer">
											<asp:ListItem Value="00">00</asp:ListItem>
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="02">02</asp:ListItem>
											<asp:ListItem Value="03">03</asp:ListItem>
											<asp:ListItem Value="04">04</asp:ListItem>
											<asp:ListItem Value="05">05</asp:ListItem>
											<asp:ListItem Value="06">06</asp:ListItem>
											<asp:ListItem Value="07">07</asp:ListItem>
											<asp:ListItem Value="08">08</asp:ListItem>
											<asp:ListItem Value="09">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
											<asp:ListItem Value="13">13</asp:ListItem>
											<asp:ListItem Value="14">14</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="16">16</asp:ListItem>
											<asp:ListItem Value="17">17</asp:ListItem>
											<asp:ListItem Value="18">18</asp:ListItem>
											<asp:ListItem Value="19">19</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="21">21</asp:ListItem>
											<asp:ListItem Value="22">22</asp:ListItem>
											<asp:ListItem Value="23">23</asp:ListItem>
											<asp:ListItem Value="24">24</asp:ListItem>
											<asp:ListItem Value="25">25</asp:ListItem>
											<asp:ListItem Value="26">26</asp:ListItem>
											<asp:ListItem Value="27">27</asp:ListItem>
											<asp:ListItem Value="28">28</asp:ListItem>
											<asp:ListItem Value="29">29</asp:ListItem>
											<asp:ListItem Value="30">30</asp:ListItem>
											<asp:ListItem Value="31">31</asp:ListItem>
											<asp:ListItem Value="32">32</asp:ListItem>
											<asp:ListItem Value="33">33</asp:ListItem>
											<asp:ListItem Value="34">34</asp:ListItem>
											<asp:ListItem Value="35">35</asp:ListItem>
											<asp:ListItem Value="36">36</asp:ListItem>
											<asp:ListItem Value="37">37</asp:ListItem>
											<asp:ListItem Value="38">38</asp:ListItem>
											<asp:ListItem Value="39">39</asp:ListItem>
											<asp:ListItem Value="40">40</asp:ListItem>
											<asp:ListItem Value="41">41</asp:ListItem>
											<asp:ListItem Value="42">42</asp:ListItem>
											<asp:ListItem Value="43">43</asp:ListItem>
											<asp:ListItem Value="44">44</asp:ListItem>
											<asp:ListItem Value="45">45</asp:ListItem>
											<asp:ListItem Value="46">46</asp:ListItem>
											<asp:ListItem Value="47">47</asp:ListItem>
											<asp:ListItem Value="48">48</asp:ListItem>
											<asp:ListItem Value="49">49</asp:ListItem>
											<asp:ListItem Value="50">50</asp:ListItem>
											<asp:ListItem Value="51">51</asp:ListItem>
											<asp:ListItem Value="52">52</asp:ListItem>
											<asp:ListItem Value="53">53</asp:ListItem>
											<asp:ListItem Value="54">54</asp:ListItem>
											<asp:ListItem Value="55">55</asp:ListItem>
											<asp:ListItem Value="56">56</asp:ListItem>
											<asp:ListItem Value="57">57</asp:ListItem>
											<asp:ListItem Value="58">58</asp:ListItem>
											<asp:ListItem Value="59">59</asp:ListItem>
										</CC1:S_COMBOBOX></TD></TR>
              <TR>
                <TD colSpan=4>
                  <div style="DISPLAY: none"><ASP:LABEL id=LblMessaggio runat="server" width="560px" Font-Bold="True"></ASP:LABEL></div></TD></TR>
              <TR>
                <TD>
                  <div id=divstatoimpianto><STRONG 
                  >Stato Impianto:</STRONG> </div></TD>
                <TD colSpan=3>
                  <div id=divcmbstatoimpianto><CC1:S_COMBOBOX id=CmbStatoImpianto runat="server" width="216px" DBDirection="Input"></CC1:S_COMBOBOX></div></TD></TR>
              <TR>
                <TD align=center colSpan=4><asp:button id=btChiudi1 runat="server" Text="Chiudi" Width="135px"></asp:button>&nbsp; 
<asp:button id=btRifiuta runat="server" Text="Rifiuta" Width="135px"></asp:button>&nbsp;&nbsp;&nbsp; 
<asp:button id=btApprova runat="server" Text="Approva/Emetti" Width="135px"></asp:button>&nbsp;<asp:button id=BtSalvaSGA runat="server" Visible="False" Text="Salva/Invia SGA" Width="120px"></asp:button> 
                </TD></TR></TABLE></TD></TR></TBODY></TABLE></cc2:datapanel></TD></TR>
  <TR>
    <TD><cc2:datapanel id=Datapanel5 
      runat="server" titlestyle-cssclass="TitleSearch" collapsed="false" 
      titletext="Consuntivo Economico" expandtext="Espandi" 
      expandimageurl="../Images/down.gif" collapsetext="Riduci" 
      collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
      cssclass="DataPanel75">
      <TABLE border=0 cellSpacing=1 cellPadding=1 width="100%">
        <TR>
          <TD style="WIDTH: 144px" colSpan=6>
            <DIV style="DISPLAY: none">
            <TABLE style="WIDTH: 616px; HEIGHT: 33px" id=Table12 border=0 
            cellSpacing=0 cellPadding=0 width=616>
              <TR>
                <TD>
                  <DIV style="DISPLAY: none">
<CC1:S_OPTIONBUTTON id=OptAMisura tabIndex=4 runat="server" groupname="Grkind" text="A Misura" Checked="True"></CC1:S_OPTIONBUTTON></DIV></TD>
                <TD style="WIDTH: 106px">
                  <DIV style="DISPLAY: none">
<CC1:S_OPTIONBUTTON id=OptAForfait tabIndex=4 runat="server" groupname="Grkind" text="A Forfait"></CC1:S_OPTIONBUTTON></DIV></TD>
                <TD colSpan=2>
                  <DIV style="DISPLAY: none"><STRONG 
                  class=blueoverline></STRONG></DIV>
                  <DIV></DIV></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD style="WIDTH: 144px" colSpan=6>
            <TABLE>
              <TR>
                <TD>
                  <TABLE style="WIDTH: 488px; HEIGHT: 88px" id=Table9 
                  class=btbal border=0 cellSpacing=0 cellPadding=0 width=488>
                    <TR>
                      <TD style="WIDTH: 60px"></TD>
                      <TD style="WIDTH: 138px"><STRONG>Costo 
                      Materiali</STRONG></TD>
                      <TD style="WIDTH: 143px"><STRONG><STRONG><STRONG>Costo 
                        Personale</STRONG></STRONG></STRONG></TD>
                      <TD><STRONG>Sub Totali</STRONG></TD><!-- <TD><STRONG> </STRONG></TD> --></TR>
                    <TR>
                      <TD style="WIDTH: 60px"><STRONG>Manuale</STRONG></TD>
                      <TD style="WIDTH: 138px" class=BbR>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtCostiMateriali1 runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtCostiMateriali2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD style="WIDTH: 143px" class=BbR>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtCostiPersonale1 runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtCostiPersonale2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                      <TD class=BbR>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtCostiTotale1 runat="server" width="48px" Enabled="False" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=txtCostiTotale2 runat="server" width="27px" Enabled="False" maxlength="2">00</CC1:S_TEXTBOX></TD><!-- <TD><STRONG> </STRONG></TD> --></TR>
                    <TR>
                      <TD style="WIDTH: 60px"><STRONG>A Misura</STRONG></TD>
                      <TD style="WIDTH: 138px" class=BbR>
<ASP:LABEL id=lblCostoMateriali runat="server"></ASP:LABEL>€ 
<INPUT id=btOpenMat title="Apre i Costi Materiali" onclick="OpenMateriali(<%=wr_id.ToString()%>);" value=... type=button name=btOpenMat></TD>
                      <TD style="WIDTH: 143px" class=BbR>
<ASP:LABEL id=lblCostiPersonale runat="server"></ASP:LABEL>€ 
<INPUT id=btnPersonale title="Apre i Costi Addetti" onclick="OpenPopUpAddetti(<%=wr_id.ToString()%>);" value=... type=button name=Button1></TD>
                      <TD class=BbR>
<ASP:LABEL id=LblTotale runat="server"></ASP:LABEL>€</TD><!-- <TD><STRONG> </STRONG></TD> --></TR>
                    <TR>
                      <TD style="WIDTH: 60px"><STRONG>Totale</STRONG></TD>
                      <TD style="WIDTH: 138px">
<ASP:LABEL id=LblTotMateriali runat="server"></ASP:LABEL>€</TD>
                      <TD style="WIDTH: 143px">
<ASP:LABEL id=LblTotPersonale runat="server"></ASP:LABEL>€</TD>
                      <TD>
<ASP:LABEL id=LblTotGenerale runat="server"></ASP:LABEL>€</TD><!--
											<TD><STRONG><INPUT id="AggiornaTot" onclick="RicalcolaTotaliAG();"  style="VISIBILITY: hidden" type="button" value="Aggiorna"></STRONG></TD>
										--></TR></TABLE></TD>
                <TD><SPAN><STRONG>Note</STRONG> <BR>
<CC1:S_TEXTBOX id=TxtAForfait runat="server" Height="59px" MaxLength="250" Width="283px" TextMode="MultiLine"></CC1:S_TEXTBOX></SPAN></TD></TR></TABLE></TD></TR>
        <TR>
          <TD style="WIDTH: 144px" colSpan=6>
            <TABLE style="WIDTH: 800px; HEIGHT: 40px" id=Table10 border=0 
            cellSpacing=0 cellPadding=0 width=800>
              <TR>
                <TD><STRONG>Importo Consuntivo File Allegato:</STRONG></TD>
                <TD>&nbsp; 
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=ImpCons1 runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX id=ImpCons2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD>
                <TD><STRONG>File Consuntivo pdf:</STRONG></TD>
                <TD>&nbsp;<INPUT style="WIDTH: 206px; HEIGHT: 18px" 
                  id=FileConsuntivo size=15 type=file name=File1 runat="server"> 
                </TD>
                <TD>
<asp:button id=BtInviaCons runat="server" Width="105px" Text="Salva Consuntivo"></asp:button></TD></TR>
              <TR>
                <TD colSpan=3>
<ASP:LABEL id=lblCons runat="server" width="176px" Font-Bold="True"></ASP:LABEL></TD>
                <TD colSpan=2>
<asp:hyperlink id=LkCons runat="server"></asp:hyperlink>&nbsp; 
<asp:imagebutton id=btImgDeleteCons runat="server" ImageUrl="../Images/elimina.gif"></asp:imagebutton></TD></TR>
              <TR>
                <TD colSpan=5></TD></TR>
              <TR>
                <TD><B>Centro di Costo:</B></TD>
                <TD>
<CC1:S_COMBOBOX id=cmbCdC runat="server" dbdatatype="Integer" AutoPostBack="True" dbdirection="Input" dbsize="10" Width="200px"></CC1:S_COMBOBOX></TD>
                <TD><B>Nr Ordine SAP</B></TD>
                <TD>
<CC1:S_TEXTBOX id=txtnrsap onkeypress=SoloNumerip() runat="server" width="209px" height="20px"></CC1:S_TEXTBOX></TD>
                <TD></TD></TR></TABLE></TD></TR></TABLE></cc2:datapanel></TD></TR>
  <TR>
    <TD><cc2:datapanel id=Datapanel4 
      runat="server" titlestyle-cssclass="TitleSearch" collapsed="False" 
      titletext="Completamento Ordine" expandtext="Espandi" 
      expandimageurl="../Images/down.gif" collapsetext="Riduci" 
      collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
      cssclass="DataPanel75">
      <TABLE border=0 cellSpacing=1 cellPadding=1 width="100%">
        <TR>
          <TD><STRONG>Stato Richiesta:</STRONG></TD>
          <TD>
<CC1:S_COMBOBOX id=cmbsstatolavoro runat="server" width="476px"></CC1:S_COMBOBOX></TD>
          <TD style="WIDTH: 112px"></TD>
          <TD></TD></TR>
        <TR id=trsosp>
          <TD><STRONG>Sospesa per:</STRONG></TD>
          <TD colSpan=3>
<CC1:S_TEXTBOX id=txtsAnnotazioni runat="server" width="480px" height="34px" MaxLength="2000" textmode="MultiLine"></CC1:S_TEXTBOX></TD></TR>
        <TR>
          <TD colSpan=4>
            <TABLE style="HEIGHT: 68px" id=Table13 border=0 cellSpacing=0 
            cellPadding=0 width=900>
              <TR>
                <TD><STRONG>Data Inizio Lavori:</STRONG></TD>
                <TD><STRONG 
                  title="data di completamente dell’intervento a tampone per la risoluzione del guasto">Data&nbsp; 
                  Fine Lavori:</STRONG></TD>
                <TD>
                  <DIV id=txtdatariavvio><STRONG>Data 
              Riavvio:</STRONG></DIV></TD></TR>
              <TR>
                <TD>
                  <TABLE id=Table5 border=0 cellSpacing=1 cellPadding=1 
                  width="100%">
                    <TR>
                      <TD>
<uc1:CalendarPicker id=CalendarPicker7 runat="server"></uc1:CalendarPicker></TD>
                      <TD><STRONG><SPAN>Ora</SPAN> 
<CC1:S_COMBOBOX id=OraIni runat="server" dbdatatype="Integer">
																	<asp:ListItem Value="00">00</asp:ListItem>
																	<asp:ListItem Value="01">01</asp:ListItem>
																	<asp:ListItem Value="02">02</asp:ListItem>
																	<asp:ListItem Value="03">03</asp:ListItem>
																	<asp:ListItem Value="04">04</asp:ListItem>
																	<asp:ListItem Value="05">05</asp:ListItem>
																	<asp:ListItem Value="06">06</asp:ListItem>
																	<asp:ListItem Value="07">07</asp:ListItem>
																	<asp:ListItem Value="08">08</asp:ListItem>
																	<asp:ListItem Value="09">09</asp:ListItem>
																	<asp:ListItem Value="10">10</asp:ListItem>
																	<asp:ListItem Value="11">11</asp:ListItem>
																	<asp:ListItem Value="12">12</asp:ListItem>
																	<asp:ListItem Value="13">13</asp:ListItem>
																	<asp:ListItem Value="14">14</asp:ListItem>
																	<asp:ListItem Value="15">15</asp:ListItem>
																	<asp:ListItem Value="16">16</asp:ListItem>
																	<asp:ListItem Value="17">17</asp:ListItem>
																	<asp:ListItem Value="18">18</asp:ListItem>
																	<asp:ListItem Value="19">19</asp:ListItem>
																	<asp:ListItem Value="20">20</asp:ListItem>
																	<asp:ListItem Value="21">21</asp:ListItem>
																	<asp:ListItem Value="22">22</asp:ListItem>
																	<asp:ListItem Value="23">23</asp:ListItem>
																</CC1:S_COMBOBOX></STRONG>: 
<CC1:S_COMBOBOX id=MinitiIni runat="server" width="40px" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="01">01</asp:ListItem>
																<asp:ListItem Value="02">02</asp:ListItem>
																<asp:ListItem Value="03">03</asp:ListItem>
																<asp:ListItem Value="04">04</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="06">06</asp:ListItem>
																<asp:ListItem Value="07">07</asp:ListItem>
																<asp:ListItem Value="08">08</asp:ListItem>
																<asp:ListItem Value="09">09</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="11">11</asp:ListItem>
																<asp:ListItem Value="12">12</asp:ListItem>
																<asp:ListItem Value="13">13</asp:ListItem>
																<asp:ListItem Value="14">14</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="16">16</asp:ListItem>
																<asp:ListItem Value="17">17</asp:ListItem>
																<asp:ListItem Value="18">18</asp:ListItem>
																<asp:ListItem Value="19">19</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="21">21</asp:ListItem>
																<asp:ListItem Value="22">22</asp:ListItem>
																<asp:ListItem Value="23">23</asp:ListItem>
																<asp:ListItem Value="24">24</asp:ListItem>
																<asp:ListItem Value="25">25</asp:ListItem>
																<asp:ListItem Value="26">26</asp:ListItem>
																<asp:ListItem Value="27">27</asp:ListItem>
																<asp:ListItem Value="28">28</asp:ListItem>
																<asp:ListItem Value="29">29</asp:ListItem>
																<asp:ListItem Value="30">30</asp:ListItem>
																<asp:ListItem Value="31">31</asp:ListItem>
																<asp:ListItem Value="32">32</asp:ListItem>
																<asp:ListItem Value="33">33</asp:ListItem>
																<asp:ListItem Value="34">34</asp:ListItem>
																<asp:ListItem Value="35">35</asp:ListItem>
																<asp:ListItem Value="36">36</asp:ListItem>
																<asp:ListItem Value="37">37</asp:ListItem>
																<asp:ListItem Value="38">38</asp:ListItem>
																<asp:ListItem Value="39">39</asp:ListItem>
																<asp:ListItem Value="40">40</asp:ListItem>
																<asp:ListItem Value="41">41</asp:ListItem>
																<asp:ListItem Value="42">42</asp:ListItem>
																<asp:ListItem Value="43">43</asp:ListItem>
																<asp:ListItem Value="44">44</asp:ListItem>
																<asp:ListItem Value="45">45</asp:ListItem>
																<asp:ListItem Value="46">46</asp:ListItem>
																<asp:ListItem Value="47">47</asp:ListItem>
																<asp:ListItem Value="48">48</asp:ListItem>
																<asp:ListItem Value="49">49</asp:ListItem>
																<asp:ListItem Value="50">50</asp:ListItem>
																<asp:ListItem Value="51">51</asp:ListItem>
																<asp:ListItem Value="52">52</asp:ListItem>
																<asp:ListItem Value="53">53</asp:ListItem>
																<asp:ListItem Value="54">54</asp:ListItem>
																<asp:ListItem Value="55">55</asp:ListItem>
																<asp:ListItem Value="56">56</asp:ListItem>
																<asp:ListItem Value="57">57</asp:ListItem>
																<asp:ListItem Value="58">58</asp:ListItem>
																<asp:ListItem Value="59">59</asp:ListItem>
															</CC1:S_COMBOBOX></TD></TR></TABLE></TD>
                <TD>
                  <TABLE id=Table14 border=0 cellSpacing=1 cellPadding=1 
                  width="100%">
                    <TR>
                      <TD>
<uc1:CalendarPicker id=CalendarPicker8 runat="server"></uc1:CalendarPicker></TD>
                      <TD><STRONG><SPAN>Ora</SPAN></STRONG> : 
<CC1:S_COMBOBOX id=OraFine runat="server" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="01">01</asp:ListItem>
																<asp:ListItem Value="02">02</asp:ListItem>
																<asp:ListItem Value="03">03</asp:ListItem>
																<asp:ListItem Value="04">04</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="06">06</asp:ListItem>
																<asp:ListItem Value="07">07</asp:ListItem>
																<asp:ListItem Value="08">08</asp:ListItem>
																<asp:ListItem Value="09">09</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="11">11</asp:ListItem>
																<asp:ListItem Value="12">12</asp:ListItem>
																<asp:ListItem Value="13">13</asp:ListItem>
																<asp:ListItem Value="14">14</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="16">16</asp:ListItem>
																<asp:ListItem Value="17">17</asp:ListItem>
																<asp:ListItem Value="18">18</asp:ListItem>
																<asp:ListItem Value="19">19</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="21">21</asp:ListItem>
																<asp:ListItem Value="22">22</asp:ListItem>
																<asp:ListItem Value="23">23</asp:ListItem>
															</CC1:S_COMBOBOX>
<CC1:S_COMBOBOX id=MinutiFine runat="server" width="40px" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="01">01</asp:ListItem>
																<asp:ListItem Value="02">02</asp:ListItem>
																<asp:ListItem Value="03">03</asp:ListItem>
																<asp:ListItem Value="04">04</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="06">06</asp:ListItem>
																<asp:ListItem Value="07">07</asp:ListItem>
																<asp:ListItem Value="08">08</asp:ListItem>
																<asp:ListItem Value="09">09</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="11">11</asp:ListItem>
																<asp:ListItem Value="12">12</asp:ListItem>
																<asp:ListItem Value="13">13</asp:ListItem>
																<asp:ListItem Value="14">14</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="16">16</asp:ListItem>
																<asp:ListItem Value="17">17</asp:ListItem>
																<asp:ListItem Value="18">18</asp:ListItem>
																<asp:ListItem Value="19">19</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="21">21</asp:ListItem>
																<asp:ListItem Value="22">22</asp:ListItem>
																<asp:ListItem Value="23">23</asp:ListItem>
																<asp:ListItem Value="24">24</asp:ListItem>
																<asp:ListItem Value="25">25</asp:ListItem>
																<asp:ListItem Value="26">26</asp:ListItem>
																<asp:ListItem Value="27">27</asp:ListItem>
																<asp:ListItem Value="28">28</asp:ListItem>
																<asp:ListItem Value="29">29</asp:ListItem>
																<asp:ListItem Value="30">30</asp:ListItem>
																<asp:ListItem Value="31">31</asp:ListItem>
																<asp:ListItem Value="32">32</asp:ListItem>
																<asp:ListItem Value="33">33</asp:ListItem>
																<asp:ListItem Value="34">34</asp:ListItem>
																<asp:ListItem Value="35">35</asp:ListItem>
																<asp:ListItem Value="36">36</asp:ListItem>
																<asp:ListItem Value="37">37</asp:ListItem>
																<asp:ListItem Value="38">38</asp:ListItem>
																<asp:ListItem Value="39">39</asp:ListItem>
																<asp:ListItem Value="40">40</asp:ListItem>
																<asp:ListItem Value="41">41</asp:ListItem>
																<asp:ListItem Value="42">42</asp:ListItem>
																<asp:ListItem Value="43">43</asp:ListItem>
																<asp:ListItem Value="44">44</asp:ListItem>
																<asp:ListItem Value="45">45</asp:ListItem>
																<asp:ListItem Value="46">46</asp:ListItem>
																<asp:ListItem Value="47">47</asp:ListItem>
																<asp:ListItem Value="48">48</asp:ListItem>
																<asp:ListItem Value="49">49</asp:ListItem>
																<asp:ListItem Value="50">50</asp:ListItem>
																<asp:ListItem Value="51">51</asp:ListItem>
																<asp:ListItem Value="52">52</asp:ListItem>
																<asp:ListItem Value="53">53</asp:ListItem>
																<asp:ListItem Value="54">54</asp:ListItem>
																<asp:ListItem Value="55">55</asp:ListItem>
																<asp:ListItem Value="56">56</asp:ListItem>
																<asp:ListItem Value="57">57</asp:ListItem>
																<asp:ListItem Value="58">58</asp:ListItem>
																<asp:ListItem Value="59">59</asp:ListItem>
															</CC1:S_COMBOBOX></TD></TR></TABLE></TD>
                <TD>
                  <TABLE id=Table6 border=0 cellSpacing=1 cellPadding=1 
                  width="100%">
                    <TR>
                      <TD>
                        <DIV id=datariavvio>
<uc1:CalendarPicker id=CalendarPicker10 runat="server"></uc1:CalendarPicker></DIV></TD>
                      <TD>
                        <DIV id=orariavvio><STRONG><SPAN>Ora</SPAN> </STRONG>: 
<CC1:S_COMBOBOX id=S_COMBOBOX2 runat="server" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="01">01</asp:ListItem>
																<asp:ListItem Value="02">02</asp:ListItem>
																<asp:ListItem Value="03">03</asp:ListItem>
																<asp:ListItem Value="04">04</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="06">06</asp:ListItem>
																<asp:ListItem Value="07">07</asp:ListItem>
																<asp:ListItem Value="08">08</asp:ListItem>
																<asp:ListItem Value="09">09</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="11">11</asp:ListItem>
																<asp:ListItem Value="12">12</asp:ListItem>
																<asp:ListItem Value="13">13</asp:ListItem>
																<asp:ListItem Value="14">14</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="16">16</asp:ListItem>
																<asp:ListItem Value="17">17</asp:ListItem>
																<asp:ListItem Value="18">18</asp:ListItem>
																<asp:ListItem Value="19">19</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="21">21</asp:ListItem>
																<asp:ListItem Value="22">22</asp:ListItem>
																<asp:ListItem Value="23">23</asp:ListItem>
															</CC1:S_COMBOBOX>
<CC1:S_COMBOBOX id=S_COMBOBOX1 runat="server" width="40px" dbdatatype="Integer">
																<asp:ListItem Value="00">00</asp:ListItem>
																<asp:ListItem Value="01">01</asp:ListItem>
																<asp:ListItem Value="02">02</asp:ListItem>
																<asp:ListItem Value="03">03</asp:ListItem>
																<asp:ListItem Value="04">04</asp:ListItem>
																<asp:ListItem Value="05">05</asp:ListItem>
																<asp:ListItem Value="06">06</asp:ListItem>
																<asp:ListItem Value="07">07</asp:ListItem>
																<asp:ListItem Value="08">08</asp:ListItem>
																<asp:ListItem Value="09">09</asp:ListItem>
																<asp:ListItem Value="10">10</asp:ListItem>
																<asp:ListItem Value="11">11</asp:ListItem>
																<asp:ListItem Value="12">12</asp:ListItem>
																<asp:ListItem Value="13">13</asp:ListItem>
																<asp:ListItem Value="14">14</asp:ListItem>
																<asp:ListItem Value="15">15</asp:ListItem>
																<asp:ListItem Value="16">16</asp:ListItem>
																<asp:ListItem Value="17">17</asp:ListItem>
																<asp:ListItem Value="18">18</asp:ListItem>
																<asp:ListItem Value="19">19</asp:ListItem>
																<asp:ListItem Value="20">20</asp:ListItem>
																<asp:ListItem Value="21">21</asp:ListItem>
																<asp:ListItem Value="22">22</asp:ListItem>
																<asp:ListItem Value="23">23</asp:ListItem>
																<asp:ListItem Value="24">24</asp:ListItem>
																<asp:ListItem Value="25">25</asp:ListItem>
																<asp:ListItem Value="26">26</asp:ListItem>
																<asp:ListItem Value="27">27</asp:ListItem>
																<asp:ListItem Value="28">28</asp:ListItem>
																<asp:ListItem Value="29">29</asp:ListItem>
																<asp:ListItem Value="30">30</asp:ListItem>
																<asp:ListItem Value="31">31</asp:ListItem>
																<asp:ListItem Value="32">32</asp:ListItem>
																<asp:ListItem Value="33">33</asp:ListItem>
																<asp:ListItem Value="34">34</asp:ListItem>
																<asp:ListItem Value="35">35</asp:ListItem>
																<asp:ListItem Value="36">36</asp:ListItem>
																<asp:ListItem Value="37">37</asp:ListItem>
																<asp:ListItem Value="38">38</asp:ListItem>
																<asp:ListItem Value="39">39</asp:ListItem>
																<asp:ListItem Value="40">40</asp:ListItem>
																<asp:ListItem Value="41">41</asp:ListItem>
																<asp:ListItem Value="42">42</asp:ListItem>
																<asp:ListItem Value="43">43</asp:ListItem>
																<asp:ListItem Value="44">44</asp:ListItem>
																<asp:ListItem Value="45">45</asp:ListItem>
																<asp:ListItem Value="46">46</asp:ListItem>
																<asp:ListItem Value="47">47</asp:ListItem>
																<asp:ListItem Value="48">48</asp:ListItem>
																<asp:ListItem Value="49">49</asp:ListItem>
																<asp:ListItem Value="50">50</asp:ListItem>
																<asp:ListItem Value="51">51</asp:ListItem>
																<asp:ListItem Value="52">52</asp:ListItem>
																<asp:ListItem Value="53">53</asp:ListItem>
																<asp:ListItem Value="54">54</asp:ListItem>
																<asp:ListItem Value="55">55</asp:ListItem>
																<asp:ListItem Value="56">56</asp:ListItem>
																<asp:ListItem Value="57">57</asp:ListItem>
																<asp:ListItem Value="58">58</asp:ListItem>
																<asp:ListItem Value="59">59</asp:ListItem>
															</CC1:S_COMBOBOX></DIV></TD></TR></TABLE></TD></TR></TABLE></TD></TR>
        <TR>
          <TD>
            <DIV id=rimedio><STRONG>Rimedio Problema\Causa:</STRONG></DIV></TD>
          <DIV></DIV>
          <TD colSpan=3>
            <DIV id=cmbrimedio>
<asp:DropDownList id=cmbSoluzioni runat="server" width="480px"></asp:DropDownList></DIV></TD>
          <DIV></DIV></TR>
        <TR>
          <TD>
            <DIV id=rimediot><STRONG>Rimedio Problema\Causa Testo:</STRONG> 
            </DIV></TD>
          <TD colSpan=3>
            <DIV id=rimediott>
<asp:TextBox id=txtSoluzione runat="server" MaxLength="100" Width="480px"></asp:TextBox></DIV></TD></TR>
        <TR>
          <TD colSpan=4>
            <DIV style="DISPLAY: none">
<asp:CheckBox id=CkDisser runat="server" Visible="False" Text="Creato Disservizio"></asp:CheckBox></DIV></TD>
          <DIV></DIV></TR>
        <TR>
          <TD class=die><STRONG class=blueoverline>
            <DIV style="DISPLAY: none"></STRONG></DIV></TD>
          <TD colSpan=3>
            <DIV style="DISPLAY: none">
            <TABLE id=Table16 border=0 cellSpacing=0 cellPadding=0 width=300>
              <TR>
                <TD>
<asp:TextBox id=txtOperazioneN runat="server" Visible="False" MaxLength="9"></asp:TextBox></TD>
                <TD></TD>
                <TD>
<CC1:S_COMBOBOX id=CmbMese runat="server" width="196px" Visible="False">
														<asp:ListItem Value="0">- Nessun Mese Selezionato -</asp:ListItem>
														<asp:ListItem Value="1">Gennaio</asp:ListItem>
														<asp:ListItem Value="2">Febbraio</asp:ListItem>
														<asp:ListItem Value="3">Marzo</asp:ListItem>
														<asp:ListItem Value="4">Aprile</asp:ListItem>
														<asp:ListItem Value="5">Maggio</asp:ListItem>
														<asp:ListItem Value="6">Giugno</asp:ListItem>
														<asp:ListItem Value="7">Luglio</asp:ListItem>
														<asp:ListItem Value="8">Agosto</asp:ListItem>
														<asp:ListItem Value="9">Settembre</asp:ListItem>
														<asp:ListItem Value="10">Ottobre</asp:ListItem>
														<asp:ListItem Value="11">Novembre</asp:ListItem>
														<asp:ListItem Value="12">Dicembre</asp:ListItem>
													</CC1:S_COMBOBOX></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD><STRONG>Note Completamento:</STRONG></TD>
          <TD colSpan=3>
<CC1:S_TEXTBOX id=txtNoteCompletamento runat="server" width="480px" height="34px" MaxLength="215" textmode="MultiLine"></CC1:S_TEXTBOX></TD></TR>
        <TR>
          <TD><STRONG>Valore Lettura contatore(h):</STRONG></TD>
          <TD colSpan=3>
<CC1:S_TEXTBOX id=txtlettura onkeypress=SoloNumerip() runat="server" width="150" MaxLength="10">0</CC1:S_TEXTBOX>&nbsp;
<ASP:LABEL style="Z-INDEX: 0" id=LABEL1 runat="server" width="450px" Font-Bold="True"></ASP:LABEL></TD></TR>
        <TR>
          <TD class=die>
            <DIV style="DISPLAY: none"><STRONG 
          class=blueoverline></STRONG></DIV></TD>
          <TD class=die colSpan=3>
            <DIV style="DISPLAY: none">
            <TABLE id=Table15 border=0 cellSpacing=0 cellPadding=0>
              <TR>
                <TD class=die>
<asp:CheckBox id=Ck1 runat="server" Visible="False" Text="Gli apparati sono perfettamente funzionanti" CssClass="blueoverline"></asp:CheckBox></TD>
                <TD class=die>
<asp:CheckBox id=Ck2 runat="server" Visible="False" Text="L'installazione è conforme alle norme vigenti" CssClass="blueoverline"></asp:CheckBox></TD></TR></TABLE></DIV></TD></TR>
        <TR>
          <TD class=die>
            <DIV style="DISPLAY: none"><STRONG 
          class=blueoverline></STRONG></DIV></TD>
          <TD colSpan=3>
            <DIV style="DISPLAY: none">
<CC1:S_TEXTBOX id=cmbDescrizioneIntervento runat="server" width="480px" Visible="False" height="34px" MaxLength="256" textmode="MultiLine"></CC1:S_TEXTBOX></DIV></TD></TR>
        <TR style="DISPLAY: none" id=trsod>
          <TD>
            <DIV style="DISPLAY: none"><STRONG>Livello Soddisfazione:</STRONG> 
            </DIV></TD>
          <TD colSpan=3>
            <DIV style="DISPLAY: none">
<ASP:RADIOBUTTONLIST id=RdListLivello runat="server" Width="500px" repeatdirection="Horizontal">
											<asp:ListItem Value="4" Selected="True">Non dichiarato</asp:ListItem>
											<asp:ListItem Value="1">Non Soddisfatto</asp:ListItem>
											<asp:ListItem Value="2">Soddisfatto</asp:ListItem>
											<asp:ListItem Value="3">Pienamente Soddisfatto</asp:ListItem>
										</ASP:RADIOBUTTONLIST></DIV></TD></TR></TABLE></cc2:datapanel></TD></TR>
  <TR>
    <td>
      <div style="DISPLAY: none"><cc2:datapanel 
      id=Datapanel10 runat="server" 
      titlestyle-cssclass="TitleSearch" collapsed="False" 
      titletext="Benestare Fatturazione MAP" expandtext="Espandi" 
      expandimageurl="../Images/down.gif" collapsetext="Riduci" 
      collapseimageurl="../Images/up.gif" allowtitleexpandcollapse="True" 
      cssclass="DataPanel75">
      <TABLE border=0 cellSpacing=1 cellPadding=1 width="100%">
        <TR>
          <TD><STRONG>Nr MAP:</STRONG></TD>
          <TD style="WIDTH: 247px">
<CC1:S_TEXTBOX id=txtmap runat="server" width="161px" MaxLength="25"></CC1:S_TEXTBOX></TD>
          <TD><STRONG>Importo MAP:</STRONG></TD>
          <TD>
<CC1:S_TEXTBOX style="TEXT-ALIGN: right" id=txtimpmap1 runat="server" width="48px" maxlength="8">0</CC1:S_TEXTBOX>, 
<CC1:S_TEXTBOX style="TEXT-ALIGN: left" id=txtimpmap2 runat="server" width="27px" maxlength="2">00</CC1:S_TEXTBOX></TD></TR>
        <TR>
          <TD style="WIDTH: 441px" colSpan=2>
<ASP:LABEL id=lblMAP runat="server" width="400px" Font-Bold="True"></ASP:LABEL></TD>
          <TD colSpan=2>
<asp:button id=btMAP runat="server" Width="135px" Text="Salva MAP/Invia Email"></asp:button></TD></TR></TABLE></cc2:datapanel></div></td></TR>
  <TR>
    <TD align=center>
      <div class=DataPanel75 id=azioni style="WIDTH: 100%; HEIGHT: 85px" 
       runat="server">
      <TABLE width="100%" border=0>
        <TR>
          <TD class=TitleSearch colSpan=4>Operazioni</TD></TR>
        <TR>
          <TD><asp:button id=BtSalva runat="server" Text="Salva" Width="135px"></asp:button></TD>
          <TD><asp:button id=BtDIE runat="server" Visible="False" Text="Salva/Invia DIE" Width="135px"></asp:button></TD>
          <TD><asp:button id=btmpermlav runat="server" Text="Permesso di Lavoro" Width="135px"></asp:button></TD>
          <TD><asp:button id=btFoglioPdf runat="server" Visible="False" Text="Foglio Prestazioni PDF" Width="135px"></asp:button></TD></TR>
        <TR>
          <TD><asp:button id=btChiudi runat="server" Text="Chiudi" Width="135px"></asp:button></TD>
          <TD></TD>
          <TD></TD>
          <TD><asp:button id=btFoglio runat="server" Visible="False" Text="Foglio Prestazioni" Width="135px"></asp:button></TD></TR></TABLE></div></TD></TR></TABLE>&nbsp; 
</form>
	</body>
</HTML>
