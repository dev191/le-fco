using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using System.Configuration;
using TheSite.Classi.AnalisiStatistiche;



namespace TheSite.AnalisiStatistiche
{
	/// <summary>
	/// Descrizione di riepilogo per StampaReportPMP.
	/// </summary>
	public class StampaReportPMP : System.Web.UI.Page
	{
		protected CrystalDecisions.Web.CrystalReportViewer CRView1;
//		protected CrystalDecisions.CrystalReports.Engine.ReportDocument crReportDocument;
		private ReportDocument crReportDocument;
		protected System.Web.UI.WebControls.Button Button1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Inserire qui il codice utente necessario per inizializzare la pagina.
			GeneraReport("a" );
		}

		#region Codice generato da Progettazione Web Form
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: questa chiamata è richiesta da Progettazione Web Form ASP.NET.
			//
			InitializeComponent();
			crReportDocument = new ReportDocument();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Metodo necessario per il supporto della finestra di progettazione. Non modificare
		/// il contenuto del metodo con l'editor di codice.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			GeneraReport("a" );
		}
		private void GeneraReport(string StringaOdl)
		{ 
			report_pmp DtRpt = new report_pmp();
			TheSite.SchemiXSD.ReportPmp ds = new TheSite.SchemiXSD.ReportPmp();
			ds = DtRpt.GetDataRpt(StringaOdl);
			string pathRptSource = Server.MapPath(Request.ApplicationPath + ConfigurationSettings.AppSettings["SourceReports"]);
			crReportDocument.Load(pathRptSource + "REPORT_PMP.rpt");
			crReportDocument.SetDataSource(ds);
			CRView1.ReportSource = crReportDocument;
			CRView1.DataBind();
			//  per pdf
		string Fname = Server.MapPath("../Report/" +  Session.SessionID.ToString() + ".pdf");//pathRptSource  + Session.SessionID.ToString() + ".pdf" ;
			ExportOptions optExp;
			DiskFileDestinationOptions optDsk  = new DiskFileDestinationOptions();
			PdfRtfWordFormatOptions optPdfRtf = new PdfRtfWordFormatOptions();
			optExp = crReportDocument.ExportOptions;
			optExp.ExportFormatType = ExportFormatType.PortableDocFormat;
			optExp.FormatOptions = optPdfRtf;
			optExp.ExportDestinationType = ExportDestinationType.DiskFile;
			optDsk.DiskFileName = Fname;
			optExp.DestinationOptions = optDsk;

			crReportDocument.Export();
			Response.ClearContent();
			Response.ClearHeaders();
			Response.ContentType = "application/pdf";
			Response.WriteFile(Fname);
			Response.Flush();
			Response.Close();
			System.IO.File.Delete(Fname);
		}

			
	
	}
}
