<%@ Page language="c#" Codebehind="INS_MENU.aspx.cs" AutoEventWireup="false" Inherits="TheSite.Gestione.INS_MENU" %>
<%@ Register TagPrefix="Collapse" Namespace="Csy.WebControls" Assembly="CsyWebControls" %>
<%@ Register TagPrefix="cc1" Namespace="S_Controls" Assembly="S_Controls" %>
<%@ Register TagPrefix="uc1" TagName="GridTitle" Src="../WebControls/GridTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageTitle" Src="../WebControls/PageTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Inserimento Menù </title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../Css/MainSheet.css">
	</HEAD>
	<body onbeforeunload="parent.left.valorizza()" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE style="Z-INDEX: 101; POSITION: absolute; TOP: 0px; LEFT: 0px" id="TableMain" border="0"
				cellSpacing="0" cellPadding="0" width="100%" align="center">
				<TR>
					<TD style="HEIGHT: 50px" align="center"><uc1:pagetitle id="PageTitle1" runat="server"></uc1:pagetitle></TD>
				</TR>
				<TR>
					<TD height="95%" vAlign="top" align="center">
						<TABLE id="tblForm" cellSpacing="1" cellPadding="1" align="center">
							<TR>
								<TD style="HEIGHT: 29.8%" vAlign="top" align="left"><COLLAPSE:DATAPANEL id="PanelRicerca" runat="server" TitleStyle-CssClass="TitleSearch" CssClass="DataPanel75"
										TitleText="Ricerca" AllowTitleExpandCollapse="True" Collapsed="False" ExpandText="Espandi" CollapseText="Riduci" CollapseImageUrl="../Images/up.gif"
										ExpandImageUrl="../Images/down.gif">
										<TABLE id="tblSearch100" border="0" cellSpacing="0" cellPadding="2">
											<TR>
												<TD style="HEIGHT: 11px" width="20%" align="left"></TD>
												<TD style="HEIGHT: 11px" width="30%"></TD>
												<TD style="HEIGHT: 11px" width="20%" align="left"></TD>
												<TD style="HEIGHT: 11px" width="30%"></TD>
											</TR>
											<TR>
												<TD><STRONG>File Menù da inserire:</STRONG></TD>
												<TD colSpan="3"><INPUT style="WIDTH: 392px; HEIGHT: 18px" id="FilePreventivo" size="46" type="file" name="File1"
														runat="server">&nbsp;
													<asp:button id="BtInviaPreventivo" runat="server" Text="Invia il File..."></asp:button></TD>
											</TR>
											<TR>
												<TD><STRONG>Controlla Ultimo Menù Inserito:</STRONG></TD>
												<TD colSpan="3">
													<asp:LinkButton id="LKfile" runat="server">LinkButton</asp:LinkButton></TD>
											</TR>
											<TR>
												<TD colSpan="3" align="left">&nbsp;
												</TD>
												<TD align="right"><A class=GuidaLink href="<%= HelpLink %>" 
                  target=_blank>Guida</A></TD>
											</TR>
										</TABLE>
									</COLLAPSE:DATAPANEL></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 3%" align="center"></TD>
							<TR>
								<TD style="HEIGHT: 72%" vAlign="top" align="center"></TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
		<script language="javascript">parent.left.calcola();</script>
	</body>
</HTML>
