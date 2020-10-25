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
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using TheSite.Classi.AnalisiStatistiche;
using TheSite.Report;
using S_Controls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;
using TheSite.SchemiXSD;
using TheSite.Classi.ManCorrettiva;
using System.IO;
using System.Configuration;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using System.Data.OracleClient;
using ICSharpCode;
using ICSharpCode.SharpZipLib;
using ICSharpCode.SharpZipLib.Zip;
//using System.Web.UI.Page;


namespace TheSite.Classi.RptRtf
{
	/// <summary>
	/// Descrizione di riepilogo per SGA_DIE.
	/// </summary>
	public class SGA_DIE
	{  
		
		public System.Data.OracleClient.OracleConnection conn = new 
				   OracleConnection(System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"]);
		

		
		
		System.Data.OracleClient.OracleConnection _cn =new OracleConnection();
		
		public SGA_DIE()
		{
					
			
			//
			// TODO: aggiungere qui la logica del costruttore
			//
		}

		public string  GENERAPDFSGA(int wr_id, string sga, string username )
		{
		System.Web.UI.Page pg = new Page();
		
		string pathRptSource;
		ReportDocument crReportDocument= new ReportDocument();
		
			
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL  _RichiestaIntervento= new Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();
			DataSet Ds=_RichiestaIntervento.ReportSGA(wr_id);
			
			dsRapportino dsP = new  dsRapportino();
			int i = 0;
			for(i=0; i<=Ds.Tables[0].Rows.Count-1;i++)
			{ 
				dsP.Tables["sga"].ImportRow(Ds.Tables[0].Rows[i]);
			}
			
			pathRptSource=pg.Server.MapPath("../Report/RptSGA1.rpt");
			crReportDocument.Load(pathRptSource);
			crReportDocument.SetDataSource(dsP);
			//string Fname = pg.Server.MapPath("../Report/" +  pg.Session.SessionID.ToString() + ".pdf");//

			ExportOptions optExp;
			DiskFileDestinationOptions optDsk  = new DiskFileDestinationOptions();
			PdfRtfWordFormatOptions optPdfRtf = new PdfRtfWordFormatOptions();
			optExp = crReportDocument.ExportOptions;
			optExp.ExportFormatType = ExportFormatType.PortableDocFormat;
			optExp.FormatOptions = optPdfRtf;
			optExp.ExportDestinationType = ExportDestinationType.DiskFile;
			
			//-----inserire nome del file nuovo
			string STORENAME = "PACK_TRACCIA_DOC.SP_INS_SGA";

						
			conn.Open();
			System.Data.OracleClient.OracleCommand cmd =new OracleCommand();
			cmd.Connection=conn;
			cmd.CommandType = CommandType.StoredProcedure;	
			cmd.CommandText=STORENAME;
			
			OracleParameter par1 = new OracleParameter(); 
			par1.ParameterName="p_id_wr";			
			par1.OracleType =System.Data.OracleClient.OracleType.Number;
			par1.Direction = ParameterDirection.Input;
			par1.Value=wr_id;
			par1.Size=100;
			cmd.Parameters.Add(par1);

			OracleParameter par2 = new OracleParameter(); 
			par2.ParameterName="p_user";			
			par2.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par2.Direction = ParameterDirection.Input;
			par2.Size=50;
			par2.Value=username;
			cmd.Parameters.Add(par2);

			OracleParameter par3 = new OracleParameter(); 
			par3.ParameterName="p_sga";			
			par3.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par3.Direction = ParameterDirection.Input;
			par3.Size=100;
			par3.Value=sga;
			cmd.Parameters.Add(par3);


			
			OracleParameter par4 = new OracleParameter(); 
			par4.ParameterName="p_codice";			
			par4.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par4.Direction = ParameterDirection.Output;
			par4.Size=50;
			par4.Value="";
			cmd.Parameters.Add(par4);

			cmd.ExecuteNonQuery();

			 string NOMESGA= cmd.Parameters["p_codice"].Value.ToString();





//			OracleDataReader rdr = cmd.ExecuteReader();
//			string pr=rdr.GetString();

			//string pr=cmd.ExecuteScalar();
			conn.Close();
			cmd.Dispose();

			//@"C:\Inetpub\wwwroot\RL\Doc_DB\"
			
			//optDsk.DiskFileName = pathRptSource+sga+".pdf"; 
				optDsk.DiskFileName = @System.Configuration.ConfigurationSettings.AppSettings["DIRSGA"]+NOMESGA;
			//Fname;
			optExp.DestinationOptions = optDsk;

			crReportDocument.Export();

			string FileZip = Path.GetDirectoryName(optDsk.DiskFileName) + @"\" + Path.GetFileNameWithoutExtension(optDsk.DiskFileName) + ".zip";
		
			if (File.Exists(FileZip))
				File.Delete(FileZip);

			ZipOutputStream s = new ZipOutputStream(File.Create(FileZip)); 
			s.SetLevel(5); // 0 - store only to 9 -

			FileStream fs = File.OpenRead(optDsk.DiskFileName); 
			byte[] buffer = new byte[fs.Length]; 
			fs.Read(buffer, 0, buffer.Length); 
			ZipEntry entry = new ZipEntry(Path.GetFileName(optDsk.DiskFileName)); 
			s.PutNextEntry(entry); 
			s.Write(buffer, 0, buffer.Length); 
			s.Finish(); 
			s.Close(); 
			fs.Close();
			TheSite.Classi.MailSend mail=new TheSite.Classi.MailSend();
			//mail.SendMail(optDsk.DiskFileName,wr_id,DocType.SGA);
			mail.SendMail(FileZip,wr_id,DocType.SGA);
			return optDsk.DiskFileName;

		
		}

		
		
		public string  GENERAPDFDIE(int wr_id, string sga, string username)
		{
			System.Web.UI.Page pg = new Page();
			
			
		
			string pathRptSource;
			ReportDocument crReportDocument= new ReportDocument();
		
		
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL  _RichiestaIntervento= new Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();
			DataSet Ds=_RichiestaIntervento.ReportDIE(wr_id);
			
			dsRapportino dsP = new  dsRapportino();
			int i = 0;
			for(i=0; i<=Ds.Tables[0].Rows.Count-1;i++)
			{ 
				dsP.Tables["die"].ImportRow(Ds.Tables[0].Rows[i]);
			}
			
			pathRptSource=pg.Server.MapPath("../Report/RptDIE1.rpt");
			crReportDocument.Load(pathRptSource);
			crReportDocument.SetDataSource(dsP);
			//string Fname = pg.Server.MapPath("../Report/" +  pg.Session.SessionID.ToString() + ".pdf");//

			ExportOptions optExp;
			DiskFileDestinationOptions optDsk  = new DiskFileDestinationOptions();
			PdfRtfWordFormatOptions optPdfRtf = new PdfRtfWordFormatOptions();
			optExp = crReportDocument.ExportOptions;
			optExp.ExportFormatType = ExportFormatType.PortableDocFormat;
			optExp.FormatOptions = optPdfRtf;
			optExp.ExportDestinationType = ExportDestinationType.DiskFile;



			//-----inserire nome del file nuovo
			string STORENAME = "PACK_TRACCIA_DOC.SP_INS_DIE";

						
			conn.Open();
			System.Data.OracleClient.OracleCommand cmd =new OracleCommand();
			cmd.Connection=conn;
			cmd.CommandType = CommandType.StoredProcedure;	
			cmd.CommandText=STORENAME;
			
			OracleParameter par1 = new OracleParameter(); 
			par1.ParameterName="p_id_wr";			
			par1.OracleType =System.Data.OracleClient.OracleType.Number;
			par1.Direction = ParameterDirection.Input;
			par1.Value=wr_id;
			par1.Size=100;
			cmd.Parameters.Add(par1);

			OracleParameter par2 = new OracleParameter(); 
			par2.ParameterName="p_user";			
			par2.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par2.Direction = ParameterDirection.Input;
			par2.Size=50;
			par2.Value=username;
			cmd.Parameters.Add(par2);

			OracleParameter par3 = new OracleParameter(); 
			par3.ParameterName="p_sga";			
			par3.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par3.Direction = ParameterDirection.Input;
			par3.Size=100;
			par3.Value=sga;
			cmd.Parameters.Add(par3);


			
			OracleParameter par4 = new OracleParameter(); 
			par4.ParameterName="p_codice";			
			par4.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par4.Direction = ParameterDirection.Output;
			par4.Size=50;
			par4.Value="";
			cmd.Parameters.Add(par4);

			cmd.ExecuteNonQuery();


			string NOMEDIE= cmd.Parameters["p_codice"].Value.ToString();





			//			OracleDataReader rdr = cmd.ExecuteReader();
			//			string pr=rdr.GetString();

			//string pr=cmd.ExecuteScalar();
			conn.Close();
			cmd.Dispose();
			
			//@"C:\Inetpub\wwwroot\RL\Doc_DB\"
			
			//optDsk.DiskFileName = pathRptSource+sga+".pdf"; 
			//optDsk.DiskFileName = @"C:\Inetpub\wwwroot\UNICAMPUS\Doc_DB\DIE\"+NOMEDIE;
			optDsk.DiskFileName = @System.Configuration.ConfigurationSettings.AppSettings["DIRDIE"].ToString()+NOMEDIE;
			//Fname;
			optExp.DestinationOptions = optDsk;

			crReportDocument.Export();

			string FileZip = Path.GetDirectoryName(optDsk.DiskFileName) + @"\" + Path.GetFileNameWithoutExtension(optDsk.DiskFileName) + ".zip";
		
			if (File.Exists(FileZip))
				File.Delete(FileZip);

			ZipOutputStream s = new ZipOutputStream(File.Create(FileZip)); 
			s.SetLevel(5); // 0 - store only to 9 -

			FileStream fs = File.OpenRead(optDsk.DiskFileName); 
			byte[] buffer = new byte[fs.Length]; 
			fs.Read(buffer, 0, buffer.Length); 
			ZipEntry entry = new ZipEntry(Path.GetFileName(optDsk.DiskFileName)); 
			s.PutNextEntry(entry); 
			s.Write(buffer, 0, buffer.Length); 
			s.Finish(); 
			s.Close(); 
			fs.Close();
			TheSite.Classi.MailSend mail=new TheSite.Classi.MailSend();
			//mail.SendMail(optDsk.DiskFileName,wr_id,DocType.SGA);
			mail.SendMail(FileZip,wr_id,DocType.DIE);
			return optDsk.DiskFileName;

		
		}

	}

}
