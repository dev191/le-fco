<%@ Register TagPrefix="uc1" TagName="Fascicolo" Src="WebControls/Fascicolo.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Matricole" Src="WebControls/Matricole.ascx" %>
<%@ Page language="c#" Codebehind="PROVA.aspx.cs" AutoEventWireup="false" Inherits="TheSite.PROVA" %>
<%@ Register TagPrefix="uc1" TagName="PMPCP" Src="WebControls/PMPCP.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>PROVA</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:Button id="Button1" style="Z-INDEX: 100; LEFT: 272px; POSITION: absolute; TOP: 192px" runat="server"
				Text="Button" Width="120px"></asp:Button>
			<DIV style="DISPLAY: inline; Z-INDEX: 105; LEFT: 448px; WIDTH: 424px; POSITION: absolute; TOP: 136px; HEIGHT: 19px"
				ms_positioning="FlowLayout">Stato : 4 compl, 6 emesso in lav, 1 in attesa 
				emissione</DIV>
			<asp:TextBox id="TextBox2" style="Z-INDEX: 103; LEFT: 232px; POSITION: absolute; TOP: 136px"
				runat="server"></asp:TextBox>
			<asp:TextBox id="TextBox1" style="Z-INDEX: 101; LEFT: 240px; POSITION: absolute; TOP: 64px" runat="server"></asp:TextBox>
			<DIV style="DISPLAY: inline; Z-INDEX: 104; LEFT: 440px; WIDTH: 456px; POSITION: absolute; TOP: 72px; HEIGHT: 38px"
				ms_positioning="FlowLayout">edificio SN_TO_4 , SN_CR_2, SN_SD_7</DIV>
		</form>
	</body>
</HTML>
