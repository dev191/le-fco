using System;
using System.IO;
using System.Collections;
using System.Web.Mail;
using System.Data;
using System.Data.OracleClient;
using ApplicationDataLayer;
using ApplicationDataLayer.Collections;
using S_Controls.Collections;
using ApplicationDataLayer.DBType;
using System.Configuration;

 
public enum DocType
{
	SGA,
	DIE,
	XLS
}

namespace TheSite.Classi
{
	/// <summary>
	/// Descrizione di riepilogo per MailSend.
	/// </summary>
	/// 
	public class MailSend
	{
		Classi.ManCorrettiva.ClManCorrettiva _ClManCorrettiva =new TheSite.Classi.ManCorrettiva.ClManCorrettiva();
		ApplicationDataLayer.OracleDataLayer _OraDl;
		protected string s_ConnStr = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
		public MailSend()
		{
			_OraDl = new OracleDataLayer(s_ConnStr);
		}

		public void SendMail(string filename,int wr_id,DocType TipoDoc)
		{
			string FileName=filename;
			string maillist="";
			
			//Recupero i dati della RDL
			DataSet _Ds=  _ClManCorrettiva.GetSingleRdlNew(wr_id);
			DataRow riga=_Ds.Tables[0].Rows[0];
			//Recupero l'id dell'edificio
			int bl_id=int.Parse(riga["ID_BL"].ToString());
			int servizio_id=int.Parse(riga["servizio_id"].ToString());
			int tipomanutenzione_id =int.Parse(riga["tipomanutenzione_id"].ToString());
			ArrayList li= GetDestinatari(wr_id,bl_id,servizio_id,TipoDoc);
			foreach(string mail in li)
			{		
				maillist+=mail +";";
			}
			//			if (tipomanutenzione_id==3)
			//			{
			//				foreach(string mail in li)
			//				{		
			//					maillist+=mail +";";
			//				}
			//			}
			//			else
			//			{
			//			maillist="sgadie@cofasir.it";
			//			}
			MailMessage mailMessage = new MailMessage ();  
			mailMessage.From = ConfigurationSettings.AppSettings["MailFrom"].ToString();
			mailMessage.To = maillist;
			if(TipoDoc==DocType.DIE && ConfigurationSettings.AppSettings["CCDIE"].ToString()!="")
				mailMessage.Cc =ConfigurationSettings.AppSettings["CCDIE"].ToString();
			if(TipoDoc==DocType.SGA && ConfigurationSettings.AppSettings["CCSGA"].ToString()!="")
				mailMessage.Cc =ConfigurationSettings.AppSettings["CCSGA"].ToString();

			mailMessage.Subject = string.Format("Documento: {0} Data invio: {1} Ora: {2} ({3})",Path.GetFileName(FileName),DateTime.Now.ToLongDateString(),DateTime.Now.ToLongTimeString(),wr_id);
			mailMessage.Body = "";
			mailMessage.BodyFormat = MailFormat.Html;
			// Andrea
			MailAttachment attach = new MailAttachment(FileName);
			
			mailMessage.Attachments.Add(attach);
			//				SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer"].ToString();
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = ConfigurationSettings.AppSettings["usersmtp"].ToString(); 
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = ConfigurationSettings.AppSettings["pwdsmtp"].ToString();

			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer2"].ToString();
			SmtpMail.Send(mailMessage);

		}


		public void SendMailSGA(int wr_id,string TipoDoc)
		{
		
			string maillist="";
			
			//Recupero i dati della RDL
			DataSet _Ds=  _ClManCorrettiva.GetSingleRdl_DEMO(wr_id);
			DataRow riga=_Ds.Tables[0].Rows[0];
			//Recupero l'id dell'edificio
			int bl_id=int.Parse(riga["ID_BL"].ToString());
			int servizio_id=int.Parse(riga["servizio_id"].ToString());

			string edificio=riga["bl_id"].ToString();
			string RdL =wr_id.ToString();
			string DataRdl =riga["DataRdl"].ToString();
			string Corpo=riga["Corpo"].ToString();
			string Oggetto=riga["Oggetto"].ToString();
			
			//Recupero i destinatari legati all'edificio
			ArrayList li= GetDestinatari(wr_id,bl_id,servizio_id,DocType.SGA);
			
			
			foreach(string mail in li)
			{		
				maillist+=mail +";";
			}
			MailMessage mailMessage = new MailMessage ();  
			mailMessage.From = ConfigurationSettings.AppSettings["MailFrom"].ToString();
			mailMessage.To = maillist;
			mailMessage.Subject= Oggetto ;
			mailMessage.Cc="sgadie@cofasir.it;call.centercofathec@cofely-gdfsuez.com";
			mailMessage.Body = Corpo;
			mailMessage.BodyFormat = MailFormat.Html;
			// Andrea
			//MailAttachment attach = new MailAttachment(FileName);
			
			//mailMessage.Attachments.Add(attach);
			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer"].ToString();
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = ConfigurationSettings.AppSettings["usersmtp"].ToString(); 
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = ConfigurationSettings.AppSettings["pwdsmtp"].ToString();

			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer2"].ToString();
			SmtpMail.Send(mailMessage);

		}

		
		public void SendMailPREV(int wr_id,string TipoDoc)
		{
		
			string maillist="";
			
			//Recupero i dati della RDL
			DataSet _Ds=  _ClManCorrettiva.GetSingleRdl_PREV(wr_id);
			DataRow riga=_Ds.Tables[0].Rows[0];
			//Recupero l'id dell'edificio
			int bl_id=int.Parse(riga["ID_BL"].ToString());
			//int servizio_id=int.Parse(riga["servizio_id"].ToString());

			string edificio=riga["bl_id"].ToString();
			string RdL =wr_id.ToString();
			//string DataRdl =riga["DataRdl"].ToString();
			string Corpo=riga["Corpo"].ToString();
			string Oggetto=riga["Oggetto"].ToString();
			
			//Recupero i destinatari legati all'edificio
			ArrayList li= GetDestinatariPREVCONS(bl_id,"PREV");
			
			
			foreach(string mail in li)
			{		
				maillist+=mail +";";
			}
			MailMessage mailMessage = new MailMessage ();  
			mailMessage.From = ConfigurationSettings.AppSettings["MailFrom"].ToString();
			mailMessage.To = maillist;
			mailMessage.Subject= Oggetto ;
			mailMessage.Body = Corpo;
			mailMessage.BodyFormat = MailFormat.Html;
			// Andrea
			//MailAttachment attach = new MailAttachment(FileName);
			
			//mailMessage.Attachments.Add(attach);
			//				SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer"].ToString();
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = ConfigurationSettings.AppSettings["usersmtp"].ToString(); 
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = ConfigurationSettings.AppSettings["pwdsmtp"].ToString();

			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer2"].ToString();
			SmtpMail.Send(mailMessage);

		}


		public void SendMailCONS(int wr_id,string TipoDoc)
		{
		
			string maillist="";
			
			//Recupero i dati della RDL
			DataSet _Ds=  _ClManCorrettiva.GetSingleRdl_CONS(wr_id);
			DataRow riga=_Ds.Tables[0].Rows[0];
			//Recupero l'id dell'edificio
			int bl_id=int.Parse(riga["ID_BL"].ToString());
			//int servizio_id=int.Parse(riga["servizio_id"].ToString());

			string edificio=riga["bl_id"].ToString();
			string RdL =wr_id.ToString();
			//string DataRdl =riga["DataRdl"].ToString();
			string Corpo=riga["Corpo"].ToString();
			string Oggetto=riga["Oggetto"].ToString();
			
			//Recupero i destinatari legati all'edificio
			ArrayList li= GetDestinatariPREVCONS(bl_id,"CONS");
			
			
			foreach(string mail in li)
			{		
				maillist+=mail +";";
			}
			MailMessage mailMessage = new MailMessage ();  
			mailMessage.From = ConfigurationSettings.AppSettings["MailFrom"].ToString();
			mailMessage.To = maillist;
			mailMessage.Subject= Oggetto ;
			mailMessage.Body = Corpo;
			mailMessage.BodyFormat = MailFormat.Html;
			// Andrea
			//MailAttachment attach = new MailAttachment(FileName);
			
			//mailMessage.Attachments.Add(attach);
			//				SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer"].ToString();
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = ConfigurationSettings.AppSettings["usersmtp"].ToString(); 
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = ConfigurationSettings.AppSettings["pwdsmtp"].ToString();

			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer2"].ToString();
			SmtpMail.Send(mailMessage);

		}

		public void SendMailMAP(int wr_id,string TipoDoc)
		{
		
			string maillist="";
			
			//Recupero i dati della RDL
			DataSet _Ds=  _ClManCorrettiva.GetSingleRdl_MAP(wr_id);
			DataRow riga=_Ds.Tables[0].Rows[0];
			//Recupero l'id dell'edificio
			int bl_id=int.Parse(riga["ID_BL"].ToString());
			//int servizio_id=int.Parse(riga["servizio_id"].ToString());

			string edificio=riga["bl_id"].ToString();
			string RdL =wr_id.ToString();
			//string DataRdl =riga["DataRdl"].ToString();
			string Corpo=riga["Corpo"].ToString();
			string Oggetto=riga["Oggetto"].ToString();
			
			//Recupero i destinatari legati all'edificio
			ArrayList li= GetDestinatariPREVCONS(bl_id,"CONS");
			
			
			foreach(string mail in li)
			{		
				maillist+=mail +";";
			}
			MailMessage mailMessage = new MailMessage ();  
			mailMessage.From = ConfigurationSettings.AppSettings["MailFrom"].ToString();
			mailMessage.To = maillist;
			mailMessage.Subject= Oggetto ;
			mailMessage.Body = Corpo;
			mailMessage.BodyFormat = MailFormat.Html;
			// Andrea
			//MailAttachment attach = new MailAttachment(FileName);
			
			//mailMessage.Attachments.Add(attach);
			//				SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer"].ToString();
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = ConfigurationSettings.AppSettings["usersmtp"].ToString(); 
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = ConfigurationSettings.AppSettings["pwdsmtp"].ToString();

			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer2"].ToString();
			SmtpMail.Send(mailMessage);

		}

		
		public void SendMailXls(string filename,DocType TipoDoc, int id_bl)
		{
			string FileName=filename;
			string maillist="";		
		
			//Recupero i destinatari legati all'edificio
			ArrayList li= GetDestinatariXls(id_bl);
			
			foreach(string mail in li)
			{		
				maillist+=mail +";";
			}
			MailMessage mailMessage = new MailMessage ();  
			mailMessage.From = ConfigurationSettings.AppSettings["MailFrom"].ToString();
			mailMessage.To = maillist;
			mailMessage.Cc ="sir@cofasir.it";
			mailMessage.Subject = string.Format("Documento: {0} Data invio: {1} Ora: {2}",Path.GetFileName(FileName),DateTime.Now.ToLongDateString(),DateTime.Now.ToLongTimeString());
			mailMessage.Body = "";
			mailMessage.BodyFormat = MailFormat.Html;

			MailAttachment attach = new MailAttachment(FileName);
			
			mailMessage.Attachments.Add(attach);
			//			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer"].ToString();
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = ConfigurationSettings.AppSettings["usersmtp"].ToString(); 
			mailMessage.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = ConfigurationSettings.AppSettings["pwdsmtp"].ToString();

			SmtpMail.SmtpServer = ConfigurationSettings.AppSettings["SmtpServer2"].ToString();
			SmtpMail.Send(mailMessage);

		}
		/// <summary>
		/// Recupera le mail dei destinatari Xls
		///</summary>
		

		

		private ArrayList GetDestinatariXls(int bl_id)
		{
			
			S_ControlsCollection _SColl = new S_ControlsCollection();
		
			S_Controls.Collections.S_Object p = new S_Object();
			p.ParameterName = "p_bl_id";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SColl.Count;
			p.Value = bl_id;
			_SColl.Add(p);

			p = new S_Object();
			p.ParameterName = "IO_CURSOR";
			p.DbType = CustomDBType.Cursor;
			p.Direction = ParameterDirection.Output;
			p.Index = _SColl.Count;
			_SColl.Add(p);

			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETDESTINATARIXLS";
			 
			DataSet _Ds =  _OraDl.GetRows(_SColl, s_StrSql);

			ArrayList li =new ArrayList();
			foreach(DataRow riga in  _Ds.Tables[0].Rows)
				li.Add(riga["mail"].ToString());
			
			return li;
		}
	
		/// <summary>
		/// Recupera le mail dei destinatari
		/// </summary>
		/// <param name="TipoDoc">Destinatari legati a quel tipo di documento</param>
		/// <param name="bl_id">Recupera i destinatari legati a quell'edificio</param>
		/// <returns></returns>
		private ArrayList GetDestinatari( int wr_id,int bl_id,int servizio_id,DocType TipoDoc)
		{
			
			S_ControlsCollection _SColl = new S_ControlsCollection();
		
			
			//			p = new S_Object();
			//			p.ParameterName = "p_wr_id";
			//			p.DbType = CustomDBType.Integer;
			//			p.Direction = ParameterDirection.Input;
			//			p.Index = _SColl.Count;
			//			p.Value = wr_id;
			//			_SColl.Add(p);
			
			S_Controls.Collections.S_Object p = new S_Object();
			p.ParameterName = "p_bl_id";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SColl.Count;
			p.Value = bl_id;
			_SColl.Add(p);

			p = new S_Object();
			p.ParameterName = "p_servizio_id";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SColl.Count;
			p.Value = servizio_id;
			_SColl.Add(p);

			p = new S_Object();
			p.ParameterName = "p_tipo_doc";
			p.DbType = CustomDBType.VarChar;
			p.Direction = ParameterDirection.Input;
			p.Index = _SColl.Count;
			p.Value = TipoDoc.ToString();
			p.Size=250;
			_SColl.Add(p);

			p = new S_Object();
			p.ParameterName = "p_wr_id";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SColl.Count;
			p.Value = wr_id;
			p.Size=250;
			_SColl.Add(p);



			p = new S_Object();
			p.ParameterName = "IO_CURSOR";
			p.DbType = CustomDBType.Cursor;
			p.Direction = ParameterDirection.Output;
			p.Index = _SColl.Count;
			_SColl.Add(p);

			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETDESTINATARI";
			 
			DataSet _Ds =  _OraDl.GetRows(_SColl, s_StrSql);

			ArrayList li =new ArrayList();
			foreach(DataRow riga in  _Ds.Tables[0].Rows)
				li.Add(riga["mail"].ToString());
			
			return li;
		}
	
		

		private ArrayList GetDestinatariPREVCONS(int bl_id, string tipodoc)
		{
			
			S_ControlsCollection _SColl = new S_ControlsCollection();
		
			S_Controls.Collections.S_Object p = new S_Object();
			p.ParameterName = "p_bl_id";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SColl.Count;
			p.Value = bl_id;
			_SColl.Add(p);

			
			p = new S_Object();
			p.ParameterName = "p_tipo_doc";
			p.DbType = CustomDBType.VarChar;
			p.Direction = ParameterDirection.Input;
			p.Index = _SColl.Count;
			p.Value = tipodoc.ToString();
			p.Size=250;
			_SColl.Add(p);

			p = new S_Object();
			p.ParameterName = "IO_CURSOR";
			p.DbType = CustomDBType.Cursor;
			p.Direction = ParameterDirection.Output;
			p.Index = _SColl.Count;
			_SColl.Add(p);

			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETDESTINATARIPREVCONS";
			 
			DataSet _Ds =  _OraDl.GetRows(_SColl, s_StrSql);

			ArrayList li =new ArrayList();
			foreach(DataRow riga in  _Ds.Tables[0].Rows)
				li.Add(riga["mail"].ToString());
			
			return li;
		}
	
		public  DataSet GETDESTINATARIEMAIL(S_ControlsCollection CollezioneControlli)
		{

			DataSet _Ds;	

			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count;
			CollezioneControlli.Add(s_Cursor);


			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETDESTINATARIEMAIL";
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;	
		}
		
		public  int InsEMail(S_ControlsCollection CollezioneControlli)
		{
			
			S_Controls.Collections.S_Object s_IdOut = new S_Object();
			s_IdOut.ParameterName = "p_IdOut";
			s_IdOut.DbType = CustomDBType.Integer;
			s_IdOut.Direction = ParameterDirection.Output;
			s_IdOut.Index = CollezioneControlli.Count;
			CollezioneControlli.Add(s_IdOut);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);

			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_DETINATARIINVIO.SP_INSDESTINATARIEMAIL");
				
			return i_Result;
		}
		
		public  int InsEMailInv(S_ControlsCollection CollezioneControlli)
		{
			
			S_Controls.Collections.S_Object s_IdOut = new S_Object();
			s_IdOut.ParameterName = "p_IdOut";
			s_IdOut.DbType = CustomDBType.Integer;
			s_IdOut.Direction = ParameterDirection.Output;
			s_IdOut.Index = CollezioneControlli.Count;
			CollezioneControlli.Add(s_IdOut);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);

			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_DETINATARIINVIO.SP_INSDESTINATARIEMAILINV");
				
			return i_Result;
		}
		


		
		public  int DelEMail(S_ControlsCollection CollezioneControlli)
		{
			
			S_Controls.Collections.S_Object s_IdOut = new S_Object();
			s_IdOut.ParameterName = "p_IdOut";
			s_IdOut.DbType = CustomDBType.Integer;
			s_IdOut.Direction = ParameterDirection.Output;
			s_IdOut.Index = CollezioneControlli.Count;
			CollezioneControlli.Add(s_IdOut);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);

			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_DETINATARIINVIO.SP_DELDESTINATARIEMAIL");
				
			return i_Result;
		}
		
		
		public  DataSet  GetDestEmail_AGG(int idemail)
		{
			DataSet _Ds;
			
			S_ControlsCollection CollezioneControlli = new  S_ControlsCollection();
			
			S_Controls.Collections.S_Object s_id = new S_Object();
			s_id.ParameterName = "p_email_id";
			s_id.DbType = CustomDBType.Integer;
			s_id.Direction = ParameterDirection.Input;
			s_id.Index = 0;
			s_id.Value = idemail;						
			
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			CollezioneControlli.Add(s_id);
			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETDESTINATARIEMAIL_AGG";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}


		public  DataSet  GetEmailEdifici(int idemail)
		{
			DataSet _Ds;
			
			S_ControlsCollection CollezioneControlli = new  S_ControlsCollection();
			
			S_Controls.Collections.S_Object s_id = new S_Object();
			s_id.ParameterName = "p_email_id";
			s_id.DbType = CustomDBType.Integer;
			s_id.Direction = ParameterDirection.Input;
			s_id.Index = 0;
			s_id.Value = idemail;						
			
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			CollezioneControlli.Add(s_id);
			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETEMAILEDIFICI";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}

		public  DataSet  GetEmailEdifici(S_ControlsCollection CollezioneControlli,int itemId,string tipo)
		{
			DataSet _Ds=null;	

			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count + 1;
			CollezioneControlli.Add(s_Cursor);

			int i_MaxParametri = CollezioneControlli.Count + 1;			

			S_Controls.Collections.S_Object s_IdIn = new S_Object();
			s_IdIn.ParameterName = "p_email_id";
			s_IdIn.DbType = CustomDBType.Integer;
			s_IdIn.Direction = ParameterDirection.Input;
			s_IdIn.Index = i_MaxParametri;
			s_IdIn.Value = itemId;

			CollezioneControlli.Add(s_IdIn);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			
			string s_StrSql="";
			
			if (tipo=="Tutti")
			{
				s_StrSql = "PACK_DETINATARIINVIO.SP_GETEMAILEDIFICIFILTRER";
			}
			if (tipo=="Associati")
			{
				s_StrSql = "PACK_DETINATARIINVIO.SP_GETEMAILBLSERVIZIASSOCIATI";
			}
			if (tipo=="NonAssociati")
			{
				s_StrSql = "PACK_DETINATARIINVIO.SP_GETMAILBLSERVIZINASSOCIATI";
			}
			
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;	
		}
		
		public bool ControllaEmailBlServizi(int email_id,int bl_id,int servizio_id)
		{
			DataSet _Ds;
			
			S_Controls.Collections.S_ControlsCollection _SColl = new S_Controls.Collections.S_ControlsCollection();

			S_Controls.Collections.S_Object s_Email = new S_Controls.Collections.S_Object();
			s_Email.ParameterName = "p_email_Id";
			s_Email.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_Email.Direction = ParameterDirection.Input;
			s_Email.Index = 0;
			s_Email.Value = email_id;

			S_Controls.Collections.S_Object s_Edificio_Id = new S_Controls.Collections.S_Object();
			s_Edificio_Id.ParameterName = "p_Bl_Id";
			s_Edificio_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_Edificio_Id.Direction = ParameterDirection.Input;
			s_Edificio_Id.Index = 1;
			s_Edificio_Id.Value = bl_id;		
				
			S_Controls.Collections.S_Object s_Servizio_Id = new S_Controls.Collections.S_Object();
			s_Servizio_Id.ParameterName = "p_Servizio_Id";
			s_Servizio_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_Servizio_Id.Direction = ParameterDirection.Input;
			s_Servizio_Id.Index = 2;
			s_Servizio_Id.Value = servizio_id;		

			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 3;
			

			_SColl.Add(s_Email);
			_SColl.Add(s_Edificio_Id);
			_SColl.Add(s_Servizio_Id);			
			_SColl.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_DETINATARIINVIO.SP_CONTROLLAEMAILBLSERVIZIO";	
			_Ds = _OraDl.GetRows(_SColl, s_StrSql).Copy();			
			
			if (_Ds.Tables[0].Rows.Count>0)			
				return true;
			else
				return false;
		}
		
		
		public  DataSet GetEmailListaEdifici(S_ControlsCollection CollezioneControlli,int itemId)
		{

			DataSet _Ds;	

			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count + 1;
			CollezioneControlli.Add(s_Cursor);

			int i_MaxParametri = CollezioneControlli.Count + 1;			

			S_Controls.Collections.S_Object s_IdIn = new S_Object();
			s_IdIn.ParameterName = "p_email_id";
			s_IdIn.DbType = CustomDBType.Integer;
			s_IdIn.Direction = ParameterDirection.Input;
			s_IdIn.Index = i_MaxParametri;
			s_IdIn.Value = itemId;

			CollezioneControlli.Add(s_IdIn);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETLISTAEDIFICI";
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;	
		}
		public int UpdateEmailEdifici(S_ControlsCollection CollezioneControlli)
		{	
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);

			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_DETINATARIINVIO.SP_EXECUTEEMAILEDIFICI");

			return i_Result;		
		}
		public int UpdateEmailEdificiServizi(S_ControlsCollection CollezioneControlli)
		{	
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);

			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_DETINATARIINVIO.SP_EXECUTEEMAILEDIFICISERVIZI");

			return i_Result;		
		}
		
		public  DataSet GetDataEmail(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;

			S_Controls.Collections.S_Object S_Cursor=new S_Object();
			S_Cursor.ParameterName ="IO_CURSOR";
			S_Cursor.DbType=CustomDBType.Cursor;
			S_Cursor.Direction=ParameterDirection.Output;
			S_Cursor.Index = CollezioneControlli.Count ;
		
			CollezioneControlli.Add(S_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDL=new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_DETINATARIINVIO.SP_RICERCADESTINATARIEMAIL";
			_Ds=_OraDL.GetRows(CollezioneControlli,s_StrSql).Copy();
			return _Ds;
		}
		public DataSet GetEmailTranneMe(int itemId)
		{
			DataSet _Ds;

			S_ControlsCollection _SColl = new S_ControlsCollection();

			S_Controls.Collections.S_Object s_Id = new S_Object();
			s_Id.ParameterName = "p_email_Id";
			s_Id.DbType = CustomDBType.Integer;
			s_Id.Direction = ParameterDirection.Input;
			s_Id.Index = 0;
			s_Id.Value = itemId;
			
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			_SColl.Add(s_Id);
			_SColl.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_DETINATARIINVIO.SP_GETEMAILNOME";	
			_Ds = _OraDl.GetRows(_SColl, s_StrSql).Copy();			

			return _Ds;		
		}
		public int CopiaEmailBLSV(S_ControlsCollection CollezioneControlli)
		{
			S_Controls.Collections.S_Object s_IdOut = new S_Object();
			s_IdOut.ParameterName = "p_IdOut";
			s_IdOut.DbType = CustomDBType.Integer;
			s_IdOut.Direction = ParameterDirection.Output;
			s_IdOut.Index = CollezioneControlli.Count;

			CollezioneControlli.Add(s_IdOut);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			int i_Result = 0;
			i_Result=  _OraDl.GetRowsAffected (CollezioneControlli, "PACK_DETINATARIINVIO.SP_COPIAEMAILBLSV");
			return i_Result;
		}


	}
	

}






