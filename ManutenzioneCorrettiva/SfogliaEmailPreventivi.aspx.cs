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
using MyCollection;
using System.IO;
using ICSharpCode;
using ICSharpCode.SharpZipLib;
using ICSharpCode.SharpZipLib.Zip;

namespace TheSite.ManutenzioneCorrettiva
{
	/// <summary>
	/// Descrizione di riepilogo per SfogliDoc.
	/// </summary>
	public class SfogliaEmailPreventivi : System.Web.UI.Page
	{
		protected Csy.WebControls.DataPanel PanelRicerca;
		protected S_Controls.S_ComboBox cmbsTipoDoc;
		protected S_Controls.S_Button btnsRicerca;
		protected System.Web.UI.WebControls.Button cmdReset;
		protected S_Controls.S_TextBox TxtWr_id;
		protected S_Controls.S_TextBox TxtCodice;
		protected S_Controls.S_TextBox TxtNomeDoc;
		protected S_Controls.S_TextBox txtUtente;
		protected S_Controls.S_TextBox txtNomeFile;
		protected System.Web.UI.WebControls.DataGrid DataGridRicercaP;
		protected WebControls.RicercaModulo RicercaModulo1;
		protected WebControls.CalendarPicker CalendarPicker1;
		protected WebControls.GridTitle GridTitle1;
		
		Classi.ManCorrettiva.Traccia_doc Traccia_doc = new TheSite.Classi.ManCorrettiva.Traccia_doc();						
		public static string HelpLink = string.Empty;
		public Classi.SiteModule _SiteModule;
		public static int FunId = 0;
		protected WebControls.PageTitle PageTitle1;
		CompletaRdl1  _fp=null;
		MyCollection.clMyCollection _myColl = new MyCollection.clMyCollection();
		public MyCollection.clMyCollection _Contenitore
		{
			get {return _myColl;}
		}
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			string _mypage="./ManutenzioneCorrettiva/SfogliaEmailPreventivi.aspx";			
			_SiteModule = new TheSite.Classi.SiteModule(_mypage);
			FunId = _SiteModule.ModuleId;

			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = "Registro spedizioni Email Preventivi e Consuntivi";
			GridTitle1.hplsNuovo.Visible =false; 
		
			if(Context.Handler is TheSite.ManutenzioneCorrettiva.CompletaRdl1)
			{
				_fp = (TheSite.ManutenzioneCorrettiva.CompletaRdl1)Context.Handler;
				if (_fp!=null) 
				{						
					_myColl=_fp._Contenitore;
					_myColl.SetValues(this.Page.Controls);						
					Ricerca();
				}
			}
		}

		public DataSet Destinatari(int id_bl, int id_servizio, string tipo_doc)
		{
			return Traccia_doc.GetDestinatari(id_bl,id_servizio, tipo_doc);
			
		}

		#region Codice generato da Progettazione Web Form
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: questa chiamata è richiesta da Progettazione Web Form ASP.NET.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Metodo necessario per il supporto della finestra di progettazione. Non modificare
		/// il contenuto del metodo con l'editor di codice.
		/// </summary>
		private void InitializeComponent()
		{    
			this.btnsRicerca.Click += new System.EventHandler(this.btnsRicerca_Click);
			this.cmdReset.Click += new System.EventHandler(this.cmdReset_Click);
			this.DataGridRicercaP.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicercaP_ItemCreated);
			this.DataGridRicercaP.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridRicercaP_ItemCommand);
			this.DataGridRicercaP.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridRicercaP_PageIndexChanged);
			this.DataGridRicercaP.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicercaP_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnsRicerca_Click(object sender, System.EventArgs e)
		{
			DataGridRicercaP.CurrentPageIndex=0;
			Ricerca();
		}
		private void Ricerca()
		{	
			
			S_ControlsCollection _SCollection = new S_ControlsCollection();			
			int indice=_SCollection.Count;

			S_Controls.Collections.S_Object s_p_NOME_DOC = new S_Controls.Collections.S_Object();
			s_p_NOME_DOC.ParameterName = "p_NOME_DOC";
			s_p_NOME_DOC.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_NOME_DOC.Direction = ParameterDirection.Input;
			s_p_NOME_DOC.Index = 1;
			s_p_NOME_DOC.Size=50;
			s_p_NOME_DOC.Value =this.TxtNomeDoc.Text;		
			_SCollection.Add(s_p_NOME_DOC);

			S_Controls.Collections.S_Object s_p_DATA_INVIO = new S_Controls.Collections.S_Object();
			s_p_DATA_INVIO.ParameterName = "p_DATA_INVIO";
			s_p_DATA_INVIO.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DATA_INVIO.Direction = ParameterDirection.Input;
			s_p_DATA_INVIO.Index = 2;
			s_p_DATA_INVIO.Size= 10;
			s_p_DATA_INVIO.Value = (CalendarPicker1.Datazione.Text =="")? "":CalendarPicker1.Datazione.Text;  			
			_SCollection.Add(s_p_DATA_INVIO);

			S_Controls.Collections.S_Object s_p_USERS = new S_Controls.Collections.S_Object();
			s_p_USERS.ParameterName = "p_USERS";
			s_p_USERS.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_USERS.Direction = ParameterDirection.Input;
			s_p_USERS.Index =3;
			s_p_USERS.Size=50;
			s_p_USERS.Value =this.txtUtente.Text;		
			_SCollection.Add(s_p_USERS);

			S_Controls.Collections.S_Object s_p_nome_file = new S_Controls.Collections.S_Object();
			s_p_nome_file.ParameterName = "p_nome_file";
			s_p_nome_file.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_nome_file.Direction = ParameterDirection.Input;
			s_p_nome_file.Index =4;
			s_p_nome_file.Size=100;
			s_p_nome_file.Value =this.txtNomeFile.Text;		
			_SCollection.Add(s_p_nome_file);

			S_Controls.Collections.S_Object s_p_ID_WR = new S_Controls.Collections.S_Object();
			s_p_ID_WR.ParameterName = "p_ID_WR";
			s_p_ID_WR.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_ID_WR.Direction = ParameterDirection.Input;
			s_p_ID_WR.Index = 5;
			s_p_ID_WR.Size=50;
			int Rdl=0;
			try
			{
				Rdl=(this.TxtWr_id.Text=="")?0:Int32.Parse(this.TxtWr_id.Text);
			}
			catch
			{
				Rdl=0;
			}
			s_p_ID_WR.Value = Rdl;		
			_SCollection.Add(s_p_ID_WR);

			S_Controls.Collections.S_Object s_p_ID_BL = new S_Controls.Collections.S_Object();
			s_p_ID_BL.ParameterName = "p_ID_BL";
			s_p_ID_BL.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_ID_BL.Direction = ParameterDirection.Input;
			s_p_ID_BL.Size =50;
			s_p_ID_BL.Index = 6;
			s_p_ID_BL.Value = (this.RicercaModulo1._txthidbl.Value=="")?0:Int32.Parse(this.RicercaModulo1._txthidbl.Value);
			_SCollection.Add(s_p_ID_BL);
		    

 
			S_Controls.Collections.S_Object p_user = new S_Controls.Collections.S_Object();
			p_user.ParameterName = "p_username";
			p_user.DbType =CustomDBType.VarChar;
			p_user.Direction = ParameterDirection.Input;
			p_user.Index = 7;
			p_user.Size= 30;
			p_user.Value=HttpContext.Current.User.Identity.Name;
			_SCollection.Add(p_user);

			Double _totalPages = 1;		
	
			int _totalRecords = Traccia_doc.GetCountPrev(_SCollection);
			this.GridTitle1.NumeroRecords=_totalRecords.ToString();
			if ((_totalRecords % DataGridRicercaP.PageSize) == 0)
				_totalPages = _totalRecords / DataGridRicercaP.PageSize;
			else
				_totalPages = (_totalRecords / DataGridRicercaP.PageSize)+1;
			
			this.DataGridRicercaP.VirtualItemCount =int.Parse(this.GridTitle1.NumeroRecords);
			
		
			if (int.Parse(this.GridTitle1.NumeroRecords) ==0) 
			{
				DataGridRicercaP.CurrentPageIndex=0;
				GridTitle1.DescriptionTitle="Nessun dato trovato."; 
			}
			else
			{
				GridTitle1.DescriptionTitle=""; 
			}


			S_Controls.Collections.S_Object s_p_pageindex = new S_Object();
			s_p_pageindex.ParameterName = "pageindex";
			s_p_pageindex.DbType = CustomDBType.Integer;
			s_p_pageindex.Direction = ParameterDirection.Input;
			s_p_pageindex.Index = 8;
			s_p_pageindex.Value=DataGridRicercaP.CurrentPageIndex+1;			
			_SCollection.Add(s_p_pageindex);

			S_Controls.Collections.S_Object s_p_pagesize = new S_Object();
			s_p_pagesize.ParameterName = "pagesize";
			s_p_pagesize.DbType = CustomDBType.Integer;
			s_p_pagesize.Direction = ParameterDirection.Input;
			s_p_pagesize.Index = 9;
			s_p_pagesize.Value= DataGridRicercaP.PageSize;			
			_SCollection.Add(s_p_pagesize);

			DataSet _MyDs = Traccia_doc.GetSfogliaPrev(_SCollection).Copy();		

		
			this.DataGridRicercaP.DataSource = _MyDs.Tables[0];
			
			this.DataGridRicercaP.DataBind();	
			

		}

		private void cmdReset_Click(object sender, System.EventArgs e)
		{
			string varapp="";
			if(Request["VarApp"]!=null)
				varapp="&VarApp=" + Request["VarApp"];
			Response.Redirect("SfogliaDoc.aspx?Fun=" + ViewState["FunId"] + varapp);
		
		}

		private void DataGridRicercaP_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridRicercaP.CurrentPageIndex = e.NewPageIndex;			
			Ricerca();
		}

		private void DataGridRicercaP_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			#region download
			if (e.CommandName=="Download")
			{
				
				string file;
				string filename;
				string filedownload ="";
				if (e.Item.Cells[7].Text=="SGA" )
				{
							
					file= Server.MapPath("../Doc_DB/SGA")+"\\"+  e.Item.Cells[6].Text;
					filename=e.Item.Cells[6].Text;
					filedownload =Server.MapPath("../Doc_DB/SGA/DOWNLOAD")+"\\"+e.Item.Cells[6].Text.Trim();
					Response.Clear();
					Response.ContentType = "application/pdf";				
					if(File.Exists(filedownload)) 
						File.Delete(filedownload); 
					File.Copy(file,filedownload);
				}
				if (e.Item.Cells[7].Text=="DIE" )
				{
					//param=e.CommandArgument.ToString().Split(',');
					
					file= Server.MapPath("../Doc_DB/DIE")+"\\"+ e.Item.Cells[6].Text.Trim();
					filename= e.Item.Cells[6].Text;
					filedownload =Server.MapPath("../Doc_DB/DIE/DOWNLOAD")+"\\"+ e.Item.Cells[6].Text.Trim();
					Response.Clear();
					Response.ContentType = "application/pdf";
					
					if(File.Exists(filedownload)) 
						File.Delete(filedownload); 
					File.Copy(file,filedownload);
				}


				//				else
				//				{
				//					filedownload= Server.MapPath("../Doc_DB/SGA/")+"\\"+ e.Item.Cells[6].Text.Trim();
				//					filedownload=filedownload.Replace(".xls",".zip");
				//					Response.Clear();
				//					Response.ContentType = "application/zip";
				//				}

				
				Response.AddHeader("content-disposition", "attachment; filename=" + Path.GetFileName(filedownload));
				Response.WriteFile(filedownload);
				Response.End();
			}
			#endregion
			
			#region invio
			if (e.CommandName=="Invio")
			{			
				Classi.RptRtf.SGA_DIE _sd = new TheSite.Classi.RptRtf.SGA_DIE();
				
				string percorso="";

				if (e.Item.Cells[7].Text=="SGA")
				{
					percorso=_sd.GENERAPDFSGA( int.Parse(e.Item.Cells[12].Text.ToString()),e.Item.Cells[5].Text,Context.User.Identity.Name);

					
				}
				if (e.Item.Cells[7].Text=="DIE")
				{	
					percorso=_sd.GENERAPDFDIE(int.Parse(e.Item.Cells[12].Text.ToString()),e.Item.Cells[5].Text,Context.User.Identity.Name);	
			
					
				}
				Ricerca();
				#endregion
			}
		}
		private void DataGridRicercaP_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				ImageButton _myButton = (ImageButton)e.Item.FindControl("btSend");
				_myButton.Attributes.Add("onclick", "return confirm('Reinvio del documento selezionato?');");

				((ImageButton)e.Item.FindControl("btScarica")).ImageUrl ="../images/w.gif";				
			}
		}

		private void DataGridRicercaP_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				//				string[] filename;
				//				if (e.Item.Cells[7].Text=="SGA" || e.Item.Cells[7].Text=="DIE")
				//				{
				//					
				//					e.Item.Cells[6].Text=filename;
				//				}
				//				if(e.Item.Cells[7].Text =="XLS")
				//					((ImageButton)e.Item.FindControl("btScarica")).ImageUrl ="../images/Excel.gif";				
			}
		}

		

	
	
	}
}
