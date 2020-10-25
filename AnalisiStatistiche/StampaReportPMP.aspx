<%@ Page language="c#" Codebehind="StampaReportPMP.aspx.cs" AutoEventWireup="false" Inherits="TheSite.AnalisiStatistiche.StampaReportPMP" %>
<%@ Register TagPrefix="cr" Namespace="CrystalDecisions.Web" Assembly="CrystalDecisions.Web, Version=9.1.5000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>StampaReportPMP</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:Button style="Z-INDEX: 101; POSITION: absolute; TOP: 72px; LEFT: 32px" id="Button1" runat="server"
				Text="Button"></asp:Button>
			<CR:CrystalReportViewer style="Z-INDEX: 102; POSITION: absolute; TOP: 8px; LEFT: 8px" id="CRView1" runat="server"
				Height="50px" Width="350px" Visible="False"></CR:CrystalReportViewer>
		</form>
	</body>
</HTML>
