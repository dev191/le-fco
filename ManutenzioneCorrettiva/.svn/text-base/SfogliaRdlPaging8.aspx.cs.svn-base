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



namespace TheSite.ManutenzioneCorrettiva
{
	/// <summary>
	/// Descrizione di riepilogo per SfogliaRdlPaging.
	/// </summary>
	public class SfogliaRdlPaging8 :  System.Web.UI.Page
	{
		#region variabili
		public Classi.SiteModule _SiteModule;
		protected System.Web.UI.WebControls.DataGrid DataGridRicerca;
		protected WebControls.GridTitle GridTitle1;			
		protected WebControls.PageTitle PageTitle1;		
		public static string HelpLink = string.Empty;		
		object _fp1=null;
		EditSfoglia  _fp=null;
		CostiOperativi.CostiOperativi _fp2=null;
		public static int FunId = 0;	
		MyCollection.clMyCollection _myColl = new MyCollection.clMyCollection();
		double totpreventivo=0;
		protected Csy.WebControls.DataPanel PanelRicerca;
		protected S_Controls.S_TextBox txtsRichiesta;
		protected System.Web.UI.WebControls.CompareValidator CompareValidator1;
		protected S_Controls.S_TextBox txtsOrdine;
		protected S_Controls.S_ComboBox cmbsStatus;
		protected S_Controls.S_ComboBox cmbsServizio;
		protected S_Controls.S_ComboBox cmbsGruppo;
		protected S_Controls.S_ComboBox cmbsUrgenza;
		protected S_Controls.S_TextBox txtDescrizione;
		protected S_Controls.S_ComboBox cmbsTipoManutenzione;
		protected S_Controls.S_Button btnsRicerca;
		protected System.Web.UI.WebControls.Button cmdReset;
		protected S_Controls.S_Button cmdExcel;
		protected System.Web.UI.WebControls.ValidationSummary ValidationSummary1;
		double totconsuntivo=0;
		protected WebControls.RicercaModulo RicercaModulo1;
		protected WebControls.CalendarPicker CalendarPicker1;
		protected WebControls.CalendarPicker CalendarPicker2;
		protected WebControls.CalendarPicker CalendarPicker3;
		protected WebControls.CalendarPicker CalendarPicker4;
		protected WebControls.Addetti Addetti1;
		protected S_Controls.S_ComboBox cmbsCdC;
		protected S_Controls.S_ComboBox S_combAutorizzazione;
		protected System.Web.UI.WebControls.Literal LabAutorizzazione;
		protected System.Web.UI.HtmlControls.HtmlInputHidden HidSato;
		protected WebControls.Richiedenti Richiedenti1;	
		#endregion


		public MyCollection.clMyCollection _Contenitore
		{
			get {return _myColl;}
		}
	

		private void Page_Load(object sender, System.EventArgs e)
		{
			
			txtsRichiesta.Attributes.Add("onkeypress","if (valutanumeri(event) == false) { return false; }");
			txtsRichiesta.Attributes.Add("onpaste","return nonpaste();");
			txtsOrdine.Attributes.Add("onkeypress","if (valutanumeri(event) == false) { return false; }");
			txtsOrdine.Attributes.Add("onpaste","return nonpaste();");

			string _mypage="./ManutenzioneCorrettiva/SfogliaRdlPaging8.aspx";			
			_SiteModule = new TheSite.Classi.SiteModule(_mypage);
			FunId = _SiteModule.ModuleId;
			//HelpLink = _SiteModule.HelpLink;
			HelpLink = "../HelpApplication/Default.aspx?page=ManutenzioneCorrettiva/SfogliaRdlPaging6.aspx";
			this.PageTitle1.Title = "Sfoglia RdL Manutenzione Straordinaria";
			
			this.RicercaModulo1.DelegatePresidio1 +=new  WebControls.DelegatePresidio(this.BindUrgenza);			
			RicercaModulo1.DelegateCodiceEdificio1 +=new  WebControls.DelegateCodiceEdificio(this.BindServizio);

			if(!Page.IsPostBack)
			{	
				if(Request.QueryString["FunId"]!=null)
					ViewState["FunId"]=Request.QueryString["FunId"];
				if(Request.QueryString["CdC"].ToString()!=null)
				Request.QueryString["CdC"].ToString();
				if(Request.QueryString["Anno"].ToString()!=null)
				Request.QueryString["Anno"].ToString();
				string datainiziale="";
				string datafinale="";
				datainiziale="01/01/"+Request.QueryString["Anno"].ToString();
				datafinale="31/12/"+Request.QueryString["Anno"].ToString();
				CompareValidator1.ControlToValidate = CalendarPicker2.ID + ":" + CalendarPicker2.Datazione.ID;
				CompareValidator1.ControlToCompare =  CalendarPicker1.ID + ":" + CalendarPicker1.Datazione.ID;
				CalendarPicker1.Datazione.Text=DateTime.Now.ToShortDateString();
				CalendarPicker2.Datazione.Text=DateTime.Now.ToShortDateString();
				CalendarPicker1.Datazione.Text=datainiziale;
				CalendarPicker2.Datazione.Text=datafinale;

				DataGridRicerca.Visible = false;				
				GridTitle1.hplsNuovo.Visible = false;
				GridTitle1.Visible =false;

				BindServizio("");
				BindGruppo();
				BindUrgenza("");
				BindStatus();	
				BindCdC(0);
				cmbsCdC.SelectedValue=Request.QueryString["CdC"].ToString();
				//BindTipoInterventoAter();
				BindTipoManutenzione();
				//cmbsTipoManutenzione.SelectedValue="3";
				//BindStatoAutorizz();
				
				// Imposto visibile il DataGrid di Manutenzione su Richiesta
				DataGridRicerca.Visible=false;
				GridTitle1.Visible=false;
				
				//Valorizzo i Parametri Immessi
				
				if(Context.Handler is TheSite.ManutenzioneCorrettiva.CompletaRdl1 || Context.Handler is TheSite.ManutenzioneCorrettiva.EditApprovaEmetti)
				{
					_fp1= Context.Handler as ManutenzioneCorrettiva.CompletaRdl1;
					if (_fp1!=null)
					{
						_myColl= ((ManutenzioneCorrettiva.CompletaRdl1)_fp1)._Contenitore;
						_myColl.SetValues(this.Page.Controls);
					}	
					_fp1= Context.Handler as ManutenzioneCorrettiva.EditApprovaEmetti;
					if (_fp1!=null)
					{
						_myColl= ((ManutenzioneCorrettiva.EditApprovaEmetti)_fp1)._Contenitore;
						_myColl.SetValues(this.Page.Controls);
					}	
					Ricerca(true);					
						
				}
				
				
				if(Context.Handler is TheSite.ManutenzioneCorrettiva.EditSfoglia)
				{
					_fp = (TheSite.ManutenzioneCorrettiva.EditSfoglia)Context.Handler;
					if (_fp!=null) 
					{						
						_myColl=_fp._Contenitore;
						_myColl.SetValues(this.Page.Controls);
						Ricerca(true);	
					}
				}
				//*****************
				if(Context.Handler is TheSite.CostiOperativi.CostiOperativi)
				{
					_fp2 = (TheSite.CostiOperativi.CostiOperativi)Context.Handler;
					if (_fp2!=null) 
					{						
						_myColl=_fp2._Contenitore;
						_myColl.SetValues(this.Page.Controls);	
						Ricerca(true);	
					}
				}	

				//**********
			
			}
			GridTitle1.hplsNuovo.Visible = false;
			

			
		}

		private void BindTipoManutenzione()
		{
		
			this.cmbsTipoManutenzione.Items.Add(Classi.GestoreDropDownList.ItemMessaggio("Manutenzione Straodinaria", "3"));
//			//Classi.ManCorrettiva.ClManCorrettiva _ClManCorrettiva = new TheSite.Classi.ManCorrettiva.ClManCorrettiva();
//			
//			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL _ClManCorrettiva= new TheSite.Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();
//			DataSet _MyDs =  _ClManCorrettiva.GetTipoManutenzione();
//
//			if (_MyDs.Tables[0].Rows.Count>0)
//			{
//				cmbsTipoManutenzione.DataSource = _MyDs;
//				this.cmbsTipoManutenzione.DataTextField = "descrizione";
//				this.cmbsTipoManutenzione.DataValueField = "id";
//				this.cmbsTipoManutenzione.DataBind();				
//				this.cmbsTipoManutenzione.Attributes.Add("OnChange","Visualizza(this.value);"); 				
//			}	
		}
		
		private void BindServizio(string CodEdificio)
		{
			GridTitle1.DescriptionTitle="";
			Addetti1.Set_BL_ID(CodEdificio);

			DataGridRicerca.Visible = false;
			this.cmbsServizio.Items.Clear();		
			S_ControlsCollection CollezioneControlli = new  S_ControlsCollection();

			Classi.ClassiDettaglio.Servizi  _Servizio = new TheSite.Classi.ClassiDettaglio.Servizi(Context.User.Identity.Name);

			DataSet _MyDs;

			if (CodEdificio!="")
			{
				S_Controls.Collections.S_Object s_Bl_Id = new S_Object();
				s_Bl_Id.ParameterName = "p_Bl_Id";
				s_Bl_Id.DbType = CustomDBType.VarChar;
				s_Bl_Id.Direction = ParameterDirection.Input;
				s_Bl_Id.Index = 0;
				s_Bl_Id.Value =	CodEdificio;
				s_Bl_Id.Size = 8;

				
				S_Controls.Collections.S_Object s_ID_Servizio = new S_Object();
				s_ID_Servizio.ParameterName = "p_ID_Servizio";
				s_ID_Servizio.DbType = CustomDBType.Integer;
				s_ID_Servizio.Direction = ParameterDirection.Input;
				s_ID_Servizio.Index = 1;
				s_ID_Servizio.Value = 0;

				CollezioneControlli.Add(s_Bl_Id);				
				CollezioneControlli.Add(s_ID_Servizio);

				_MyDs = _Servizio.GetData(CollezioneControlli);
			}
			else
			{
				_MyDs = _Servizio.GetData();
			}

			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsServizio.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "DESCRIZIONE", "IDSERVIZIO", "- Selezionare un Servizio -", "0");
				this.cmbsServizio.DataTextField = "DESCRIZIONE";
				this.cmbsServizio.DataValueField = "IDSERVIZIO";
				this.cmbsServizio.DataBind();
				this.cmbsServizio.Items.Add(Classi.GestoreDropDownList.ItemMessaggio("Non Definito", "-1"));
			}
			else
			{
				string s_Messaggio = "Non Definito";
				this.cmbsServizio.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messaggio, "-1"));
			}
		
		}

		private void BindGruppo()
		{
			this.cmbsGruppo.Items.Clear();
			string Progetto="";
			if(Request.QueryString["VarApp"]!=null)
				Progetto=Request.QueryString["VarApp"];
			Classi.ClassiAnagrafiche.Richiedenti_tipo _Richiedenti = new TheSite.Classi.ClassiAnagrafiche.Richiedenti_tipo();	
			DataSet Ds = _Richiedenti.GetAllAddProg(Progetto).Copy();

			//			Classi.ManStraordinaria.GestioneRdl _GestioneRdl= new Classi.ManStraordinaria.GestioneRdl(Context.User.Identity.Name);	
			//			DataSet Ds = _GestioneRdl.GetGuppo();
		
			if (Ds.Tables[0].Rows.Count > 0)
			{
				this.cmbsGruppo.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					Ds.Tables[0], "descrizione", "id", "- Selezionare un Gruppo -", "");
				this.cmbsGruppo.DataTextField = "descrizione";
				this.cmbsGruppo.DataValueField = "id";
				//				this.cmbsGruppo.DataValueField = "richiedenti_tipo_id";
				this.cmbsGruppo.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessuna Gruppo -";
				this.cmbsGruppo.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
			}
		}

		private void BindUrgenza(string Codice)
		{
			string Progetto="";
			if(Request.QueryString["VarApp"]!=null)
				Progetto=Request.QueryString["VarApp"];


			if(Codice!="")
			{
				int cod= Convert.ToInt32(Codice);
				Classi.ClassiDettaglio.Urgenza _Urgenza = new TheSite.Classi.ClassiDettaglio.Urgenza();
				DataSet ds = _Urgenza.GetPriorita(cod,Progetto);
				this.cmbsUrgenza.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					ds.Tables[0], "DESCRIPTION", "id", "- Selezionare un Urgenza -", "0");

				this.cmbsUrgenza.DataTextField = "DESCRIPTION";
				this.cmbsUrgenza.DataValueField = "ID";
				this.cmbsUrgenza.DataBind();
				//this.cmbsUrgenza.SelectedValue = "7";
			}
			else
			{
				Classi.ClassiDettaglio.Urgenza _Urgenza = new TheSite.Classi.ClassiDettaglio.Urgenza();
				DataSet ds =  _Urgenza.GetPriorita(0,Progetto);
				this.cmbsUrgenza.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					ds.Tables[0], "DESCRIPTION", "id", "- Selezionare un Urgenza -", "0");
				this.cmbsUrgenza.DataTextField = "DESCRIPTION";
				this.cmbsUrgenza.DataValueField = "ID";
				this.cmbsUrgenza.DataBind();
			}
		}

		private void BindStatus()
		{
			this.cmbsStatus.Items.Clear();
		
			//Classi.ManStraordinaria.ManCorrettivaPaging  _Richiesta= new Classi.ManStraordinaria.ManCorrettivaPaging();
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL _Richiesta = new TheSite.Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();					
			DataSet Ds = _Richiesta.GetStatus();
		
			if (Ds.Tables[0].Rows.Count > 0)
			{
				this.cmbsStatus.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					Ds.Tables[0], "DESCRIZIONE", "ID", "- Selezionare uno Stato -", "");
				this.cmbsStatus.DataTextField = "DESCRIZIONE";
				this.cmbsStatus.DataValueField = "ID";
				this.cmbsStatus.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessun Stato -";
				this.cmbsStatus.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
			}
		}
		private void BindCdC( int id_servizio )
		{
			this.cmbsCdC.Items.Clear();
		
			Classi.ClassiAnagrafiche.Contab _Contab=new TheSite.Classi.ClassiAnagrafiche.Contab();
			DataSet _MyDs;
			_MyDs=_Contab.GetSingleDataSV_Rev(id_servizio);
			if (_MyDs.Tables[0].Rows.Count > 0)
			{
					
				this.cmbsCdC.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "DESCRIZIONE", "ID", "Selezionare Centro di Costo", "0");
				this.cmbsCdC.DataTextField = "DESCRIZIONE";
				this.cmbsCdC.DataValueField = "ID";
				this.cmbsCdC.DataBind();
			}
			else
			{
				string s_Messagggio = "Non Definito";
				this.cmbsCdC.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, "0"));
			}
				

		}

		#region commento
		//		private void BindTipoInterventoAter()
		//		{
		//			//Caricol il combo Del Tipo Intervento
		//			cmbsTipoIntervento.Items.Clear();		
		//			S_ControlsCollection CollezioneControlli = new  S_ControlsCollection();
		//
		//			Classi.ClassiAnagrafiche.TipoIntervento  _TipoIntervento = new TheSite.Classi.ClassiAnagrafiche.TipoIntervento();
		//
		//			DataSet _MyDs;
		//			_MyDs = _TipoIntervento.GetData();
		//			
		//
		//			if (_MyDs.Tables[0].Rows.Count > 0)
		//			{
		//				this.cmbsTipoIntervento.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
		//					_MyDs.Tables[0], "descrizione_breve", "ID", "- Selezionare il Tipo Intervento -", "");
		//				this.cmbsTipoIntervento.DataTextField = "descrizione_breve";
		//				this.cmbsTipoIntervento.DataValueField = "id";
		//				this.cmbsTipoIntervento.DataBind();
		//			}
		//			else
		//			{
		//				string s_Messagggio = "- Nessun Tipo Intervento -";
		//				this.cmbsTipoIntervento.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
		//			}
		//		}

		//		private void BindStatoAutorizz()
		//		{
		//			
		//			Classi.ManCorrettiva.ClManCorrettiva _ClManCorrettiva = new TheSite.Classi.ManCorrettiva.ClManCorrettiva();
		//			DataSet _MyDs =  _ClManCorrettiva.GetStAutorizz();
		//
		//			if (_MyDs.Tables[0].Rows.Count>0)
		//			{
		//				this.cmbsStAutorizzaz.DataSource = _MyDs;
		//				this.cmbsStAutorizzaz.DataTextField = "descrizione";
		//				this.cmbsStAutorizzaz.DataValueField = "id";
		//				this.cmbsStAutorizzaz.DataBind();				
		//				//this.cmbsStAutorizzaz.Attributes.Add("OnChange","Visualizza(this.value);"); 				
		//			}	
		//		}
		#endregion

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
			this.cmdExcel.Click += new System.EventHandler(this.cmdExcel_Click);
			this.DataGridRicerca.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridRicerca_ItemCommand);
			this.DataGridRicerca.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridRicerca_PageIndexChanged);
			this.DataGridRicerca.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicerca_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnsRicerca_Click(object sender, System.EventArgs e)
		{
			DataGridRicerca.CurrentPageIndex =0;
			Ricerca(true);	
			
		}

		protected Int32 _currentPageNumber = 1;
		private void Ricerca(bool reset)
		{	// Manutenzione Straordinaria
			DataGridRicerca.Visible=true;
			GridTitle1.Visible=true;
			
			//cmbsStAutorizzaz.Visible=true;

			//			Classi.ManStraordinaria.ManCorrettivaPaging  _Richiesta = new TheSite.Classi.ManStraordinaria.ManCorrettivaPaging();
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL _Richiesta= new TheSite.Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL(); 
			
			S_ControlsCollection _SCollection=GetData();			

			S_Controls.Collections.S_Object s_p_pageindex = new S_Object();
			s_p_pageindex.ParameterName = "pageindex";
			s_p_pageindex.DbType = CustomDBType.Integer;
			s_p_pageindex.Direction = ParameterDirection.Input;
			s_p_pageindex.Index = 14;
			s_p_pageindex.Value=DataGridRicerca.CurrentPageIndex +1;			
			_SCollection.Add(s_p_pageindex);

			S_Controls.Collections.S_Object s_p_pagesize = new S_Object();
			s_p_pagesize.ParameterName = "pagesize";
			s_p_pagesize.DbType = CustomDBType.Integer;
			s_p_pagesize.Direction = ParameterDirection.Input;
			s_p_pagesize.Index = 15;
			s_p_pagesize.Value= DataGridRicerca.PageSize;			
			_SCollection.Add(s_p_pagesize);
             
			DataSet _MyDs = _Richiesta.GetSfogliaRDLPaging4_rev(_SCollection).Copy();	

			this.DataGridRicerca.DataSource = _MyDs.Tables[0];
				
			//			this.DataGridRicerca.Items[0].Enabled=false;
			//			this.DataGridRicerca.Items[0].Cells[18].Enabled=false;


			if (reset==true)
			{
				_SCollection.Clear();
				_SCollection=GetData();
				int _totalRecords = _Richiesta.GetCount4_rev(_SCollection);
				this.GridTitle1.NumeroRecords=_totalRecords.ToString();
			}

		

			DataGridRicerca.Visible = true;
			GridTitle1.Visible =true;
			GridTitle1.hplsNuovo.Visible=false;

			if (int.Parse(this.GridTitle1.NumeroRecords) ==0) 
			{
				DataGridRicerca.CurrentPageIndex=0;
				GridTitle1.DescriptionTitle="Nessun dato trovato."; 
			}
			else
			{
				CalcolaTotali(_MyDs.Tables[0]);
				GridTitle1.DescriptionTitle=""; 
			}
			this.DataGridRicerca.VirtualItemCount =int.Parse(this.GridTitle1.NumeroRecords);
			this.DataGridRicerca.DataBind();
			
		
		}


		private void CalcolaTotali(DataTable dt)
		{
			foreach(DataRow dr in dt.Rows)
			{
				if (dr["importostimato"]!=DBNull.Value)
					totpreventivo+=double.Parse(dr["importostimato"].ToString());
				if (dr["importoconsuntivo"]!=DBNull.Value)
					totconsuntivo+=double.Parse(dr["importoconsuntivo"].ToString());
			}
		}

		private S_ControlsCollection GetData()
		{
			S_ControlsCollection _SCollection = new S_ControlsCollection();			
		
			S_Controls.Collections.S_Object s_p_Bl_Id = new S_Controls.Collections.S_Object();
			s_p_Bl_Id.ParameterName = "p_Bl_Id";
			s_p_Bl_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Bl_Id.Direction = ParameterDirection.Input;
			s_p_Bl_Id.Size =50;
			s_p_Bl_Id.Index = 0;
			s_p_Bl_Id.Value = RicercaModulo1.TxtCodice.Text;
			_SCollection.Add(s_p_Bl_Id);

			S_Controls.Collections.S_Object s_p_campus = new S_Controls.Collections.S_Object();
			s_p_campus.ParameterName = "p_campus";
			s_p_campus.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_campus.Direction = ParameterDirection.Input;
			s_p_campus.Index = 1;
			s_p_campus.Size=50;
			s_p_campus.Value = RicercaModulo1.TxtRicerca.Text;			
			_SCollection.Add(s_p_campus);

			S_Controls.Collections.S_Object s_p_Wr_Id = new S_Controls.Collections.S_Object();
			s_p_Wr_Id.ParameterName = "p_Wr_Id";
			s_p_Wr_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wr_Id.Direction = ParameterDirection.Input;
			s_p_Wr_Id.Index = 2;
			s_p_Wr_Id.Size=50;
			s_p_Wr_Id.Value = (this.txtsRichiesta.Text=="")?0:Int32.Parse(this.txtsRichiesta.Text);		
			_SCollection.Add(s_p_Wr_Id);

			S_Controls.Collections.S_Object s_p_Addetto = new S_Controls.Collections.S_Object();
			s_p_Addetto.ParameterName = "p_Addetto";
			s_p_Addetto.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Addetto.Direction = ParameterDirection.Input;
			s_p_Addetto.Index = 3;
			s_p_Addetto.Size=50;
			s_p_Addetto.Value = this.Addetti1.NomeCompleto;			
			_SCollection.Add(s_p_Addetto);

			S_Controls.Collections.S_Object s_p_DataDa = new S_Controls.Collections.S_Object();
			s_p_DataDa.ParameterName = "p_DataDa";
			s_p_DataDa.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataDa.Direction = ParameterDirection.Input;
			s_p_DataDa.Index = 4;
			s_p_DataDa.Size= 10;
			s_p_DataDa.Value = (CalendarPicker1.Datazione.Text =="")? "":CalendarPicker1.Datazione.Text;  			
			_SCollection.Add(s_p_DataDa);

			S_Controls.Collections.S_Object s_p_DataA = new S_Controls.Collections.S_Object();
			s_p_DataA.ParameterName = "p_DataA";
			s_p_DataA.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataA.Direction = ParameterDirection.Input;
			s_p_DataA.Index = 5;
			s_p_DataA.Size= 10;
			s_p_DataA.Value = (CalendarPicker2.Datazione.Text =="")? "":CalendarPicker2.Datazione.Text;  			
			_SCollection.Add(s_p_DataA);

			S_Controls.Collections.S_Object s_p_Wo_Id = new S_Controls.Collections.S_Object();
			s_p_Wo_Id.ParameterName = "p_Wo_Id";
			s_p_Wo_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wo_Id.Direction = ParameterDirection.Input;
			s_p_Wo_Id.Index = 6;
			s_p_Wo_Id.Size=50;
			s_p_Wo_Id.Value = (this.txtsOrdine.Text=="")?0:Int32.Parse(this.txtsOrdine.Text);		
			_SCollection.Add(s_p_Wo_Id);
			
			S_Controls.Collections.S_Object s_p_Servizio = new S_Controls.Collections.S_Object();
			s_p_Servizio.ParameterName = "p_ID_Servizio";
			s_p_Servizio.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Servizio.Direction = ParameterDirection.Input;
			s_p_Servizio.Index = 7;
			s_p_Servizio.Value = (cmbsServizio.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsServizio.SelectedValue);			
			_SCollection.Add(s_p_Servizio);

			S_Controls.Collections.S_Object s_p_Status = new S_Controls.Collections.S_Object();
			s_p_Status.ParameterName = "p_Status";
			s_p_Status.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Status.Direction = ParameterDirection.Input;
			s_p_Status.Index = 8;
			s_p_Status.Value = (cmbsStatus.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsStatus.SelectedValue);			
			_SCollection.Add(s_p_Status);

			S_Controls.Collections.S_Object s_p_Richiedente = new S_Controls.Collections.S_Object();
			s_p_Richiedente.ParameterName = "p_Richiedente";
			s_p_Richiedente.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Richiedente.Direction = ParameterDirection.Input;
			s_p_Richiedente.Index = 9;
			s_p_Richiedente.Size=50;
			s_p_Richiedente.Value = this.Richiedenti1.NomeCompleto;			
			_SCollection.Add(s_p_Richiedente);

			S_Controls.Collections.S_Object s_p_Priority = new S_Controls.Collections.S_Object();
			s_p_Priority.ParameterName = "p_Priority";
			s_p_Priority.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Priority.Direction = ParameterDirection.Input;
			s_p_Priority.Index = 10;
			s_p_Priority.Value = (cmbsUrgenza.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsUrgenza.SelectedValue);			
			_SCollection.Add(s_p_Priority);

			S_Controls.Collections.S_Object s_p_Descrizione = new S_Controls.Collections.S_Object();
			s_p_Descrizione.ParameterName = "p_Descrizione";
			s_p_Descrizione.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Descrizione.Direction = ParameterDirection.Input;
			s_p_Descrizione.Index = 11;
			s_p_Descrizione.Size= 255;
			s_p_Descrizione.Value = txtDescrizione.Text;			
			_SCollection.Add(s_p_Descrizione);

			S_Controls.Collections.S_Object s_p_Gruppo = new S_Controls.Collections.S_Object();
			s_p_Gruppo.ParameterName = "p_Gruppo";
			s_p_Gruppo.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Gruppo.Direction = ParameterDirection.Input;
			s_p_Gruppo.Index = 12;
			s_p_Gruppo.Value = (cmbsGruppo.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsGruppo.SelectedValue);			
			_SCollection.Add(s_p_Gruppo);
		
			S_Controls.Collections.S_Object p_prog = new S_Controls.Collections.S_Object();
			p_prog.ParameterName = "p_progetto";
			p_prog.DbType =CustomDBType.VarChar;
			p_prog.Direction = ParameterDirection.Input;
			p_prog.Index = 13;
			p_prog.Size= 10;
			p_prog.Value="1";
			_SCollection.Add(p_prog);


			S_Controls.Collections.S_Object p_idcontabilizzazione = new S_Controls.Collections.S_Object();
			p_idcontabilizzazione.ParameterName = "p_idcontabilizzazione";
			p_idcontabilizzazione.DbType =CustomDBType.Integer;
			p_idcontabilizzazione.Direction = ParameterDirection.Input;
			p_idcontabilizzazione.Index = 14;
			p_idcontabilizzazione.Size= 10;
			p_idcontabilizzazione.Value=int.Parse(cmbsCdC.SelectedValue);
			_SCollection.Add(p_idcontabilizzazione);


			S_Controls.Collections.S_Object p_idApprovazione = new S_Controls.Collections.S_Object();
			p_idApprovazione.ParameterName = "p_idApprovazione";
			p_idApprovazione.DbType =CustomDBType.Integer;
			p_idApprovazione.Direction = ParameterDirection.Input;
			p_idApprovazione.Index = 15;
			p_idApprovazione.Size= 10;
			p_idApprovazione.Value=int.Parse(S_combAutorizzazione.SelectedValue);
			_SCollection.Add(p_idApprovazione);







			#region commento
			//			S_Controls.Collections.S_Object p_status_aut = new S_Controls.Collections.S_Object();
			//			p_status_aut.ParameterName = "p_status_aut";
			//			p_status_aut.DbType =CustomDBType.VarChar;
			//			p_status_aut.Direction = ParameterDirection.Input;
			//			p_status_aut.Index = 17;
			//			p_status_aut.Size= 10;
			//			p_status_aut.Value = cmbsStAutorizzaz.SelectedValue;  			
			//			_SCollection.Add(p_status_aut);
			#endregion
			return _SCollection;
		}

		private void DataGridRicerca_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridRicerca.CurrentPageIndex = e.NewPageIndex;			
			Ricerca(false);
		}
		
		private void DataGridRicerca_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			string varapp="";
			if(Request["VarApp"]!=null)
				varapp="&VarApp=" + Request["VarApp"];
			if((e.Item.ItemType == ListItemType.Item) ||
				(e.Item.ItemType == ListItemType.AlternatingItem))
			{ 
				
				ImageButton _img2 = (ImageButton) e.Item.Cells[2].FindControl("Imagebutton2");
				ImageButton _img1 = (ImageButton) e.Item.Cells[1].FindControl("lnkDett");

				string appo2 ="CompletaRdl1.aspx?wr_id=' + DataBinder.Eval(Container.DataItem,'WR_ID')" + varapp;
				string appo="CompletaRdl1.ascx?wr_id=' + DataBinder.Eval(Container.DataItem,'WR_ID')" + varapp;
	
				_img1.Attributes.Add("title","Emetti o Completa Richiesta di Lavoro");	
				_img2.Attributes.Add("title", "Visualizza/Modifica Richiesta di Lavoro");

               
				System.Web.UI.HtmlControls.HtmlImage _imagepre=new System.Web.UI.HtmlControls.HtmlImage();
				System.Web.UI.HtmlControls.HtmlImage _imagecon=new System.Web.UI.HtmlControls.HtmlImage();
				System.Web.UI.HtmlControls.HtmlAnchor  _linkPre = (System.Web.UI.HtmlControls.HtmlAnchor) e.Item.Cells[3].Controls[1];
				System.Web.UI.HtmlControls.HtmlAnchor  _linkCon = (System.Web.UI.HtmlControls.HtmlAnchor) e.Item.Cells[4].Controls[1];

				DataRowView dr=(DataRowView)(e.Item.DataItem);

				#region percorsi allegati
				if(dr["pdfpreventivo"]==DBNull.Value || dr["pdfpreventivo"].ToString()=="")
				{
					_linkPre.HRef="#"; 
					_imagepre.Src="../Images/no pdf_logo.gif";
					_imagepre.Attributes.Add("title","Nessun Pdf Preventivo");
				}
				else
				{
					_linkPre.HRef="javascript:openpdf('" + dr["WR_ID"].ToString() + "','PREV','" + dr["pdfpreventivo"].ToString().Replace("'","`")  + "');"; 
					_imagepre.Src="../Images/pdf_logo.gif";
					_imagepre.Attributes.Add("title","Pdf Preventivo");
				}
				_imagepre.Style.Add("Width","22px");
				_imagepre.Style.Add("Height","26px");
				_imagepre.Style.Add("Border","0");
				_linkPre.Controls.Add( _imagepre);

				if(dr["pdfconsuntivo"]==DBNull.Value || dr["pdfconsuntivo"].ToString()=="")
				{
					_linkCon.HRef="#"; 
					_imagecon.Src="../Images/no pdf_logo.gif";
					_imagecon.Attributes.Add("title","Nessun Pdf Consuntivo");
				}
				else
				{
					_linkCon.HRef="javascript:openpdf('" + dr["WR_ID"].ToString() + "','CONS','" + dr["pdfconsuntivo"].ToString().Replace("'","`")  + "');"; 
					_imagecon.Src="../Images/pdf_logo.gif";
					_imagecon.Attributes.Add("title","Pdf Consuntivo");
				}
				_imagecon.Style.Add("Width","22px");
				_imagecon.Style.Add("Height","26px");
				_imagecon.Style.Add("Border","0"); 
				_linkCon.Controls.Add( _imagecon);
				//////////////////////////////////////////////////////////
//				ImageButton _imgLuc = (ImageButton) e.Item.Cells[2].FindControl("ImagebutLuc"); // lucetto
				System.Web.UI.WebControls.Image _imgLuc=(System.Web.UI.WebControls.Image)
					                                      e.Item.FindControl("ImagebutLuc");
				ImageButton _imgVerde = (ImageButton) e.Item.Cells[1].FindControl("Imagebutton4");// verde
				ImageButton _imgRossa = (ImageButton) e.Item.Cells[1].FindControl("ImagebutRosso");// verde  
                //System.Web.UI.HtmlControls.HtmlImage _imgOK = (System.Web.UI.HtmlControls.HtmlImage) e.Item.Cells[1].FindControl("ImagebutOK");// verde  ImagebutOK
				System.Web.UI.WebControls.Image _imgOK=(System.Web.UI.WebControls.Image)
					                                     e.Item.FindControl("ImagebutOK");  /// ImagebutKO
				System.Web.UI.WebControls.Image _imgKO=(System.Web.UI.WebControls.Image)
														e.Item.FindControl("ImagebutKO");  /// ImagebutKO

				string tooltip_imgLuc="Permessi non Sifficienti per Approvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
		
				if(e.Item.Cells[20].Text.Trim()=="4" || e.Item.Cells[20].Text.Trim()=="3")//  se è stato approvato
				{
					_imgOK.Visible=true;
					_imgOK.Attributes.Add("title","Richiesta Approvata\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim());
					_imgVerde.Visible=false;
					_imgRossa.Visible=false;
					_imgLuc.Visible=false;
					_imgKO.Visible=false;
				}
				else if (e.Item.Cells[20].Text.Trim()=="-1")
				{
					_imgOK.Visible=false;
					_imgVerde.Visible=false;
					_imgRossa.Visible=false;
					_imgLuc.Visible=false;
					_imgKO.Visible=true;
                    _imgKO.Attributes.Add("title","Richiesta Rifiutata\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim());
				}
				else
				{
					_imgOK.Visible=false;
					//					_imgOK.ToolTip = "da Approvare";
				_imgKO.Visible=false;
					switch(e.Item.Cells[22].Text.Trim())
					{         
						case "0": //amministratore puo tutto

							_imgVerde.Visible=true;
							_imgVerde.ToolTip = "Privilegi di Approvazione Autorizzata \n cliccare per Apporvare\n" +
								                "\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							_imgRossa.Visible=true;
							_imgRossa.ToolTip = "Privilegi di Approvazione Autorizzata \n cliccare per Rifiutare\n" + 
								                 "\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							_imgLuc.Visible=false;
							//							_imgLuc.ToolTip = "Privilegi di Approvazione Autorizzata";
							break;                  
						case "1":    // livello   cte il primo che Autorizza  LIVA    
							if(e.Item.Cells[20].Text.Trim()==e.Item.Cells[22].Text.Trim())
							{
								_imgVerde.Visible=true;
								_imgVerde.ToolTip = "Privilegi di Approvazione CTE \n cliccare per Apporvare\n" +
									                 "\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgRossa.Visible=true;
								_imgRossa.ToolTip = "Privilegi di Approvazione CTE \n cliccare per Rifiutare\n" + 
									                "\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgLuc.Visible=false;
								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							}
							else
							{
								_imgVerde.Visible=false;
								_imgVerde.ToolTip = "Privilegi di Approvazione CTE \n cliccare per Apporvare \n" +"\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgRossa.Visible=false;
								_imgRossa.ToolTip = "Privilegi di Approvazione CTE \n cliccare per Rifiutare\n" +"\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgLuc.Visible=true;
								_imgLuc.Attributes.Add("title",tooltip_imgLuc);

							}
							break;   
						case "2":    // livello   SCA il secondo che Autorizza         LIVB 
							if(e.Item.Cells[20].Text.Trim()==e.Item.Cells[22].Text.Trim())
							{
								_imgVerde.Visible=true;
								_imgVerde.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Apporvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgRossa.Visible=true;
								_imgRossa.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgLuc.Visible=false;
								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							}
							else
							{
								_imgVerde.Visible=false;
								_imgVerde.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Apporvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgRossa.Visible=false;
								_imgRossa.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgLuc.Visible=true;
								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							}
							break;
						case "3":  // livello   cte il terzo che Autorizza            
							if(e.Item.Cells[20].Text.Trim()==e.Item.Cells[22].Text.Trim())
							{
								_imgVerde.Visible=true;
								_imgVerde.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Apporvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgRossa.Visible=true;
								_imgRossa.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgLuc.Visible=false;
								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							}
							else
							{
								_imgVerde.Visible=false;
								_imgVerde.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Apporvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgRossa.Visible=false;
								_imgRossa.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
								_imgLuc.Visible=true;
								_imgLuc.Attributes.Add("title",tooltip_imgLuc);
							}
							break;
						case "4":      // livello   ULTIMO è STATO TUTTO AUTORIZZATO il terzo che Autorizza        							 
							_imgVerde.Visible=false;
							_imgVerde.ToolTip = "La RDL è stata Approvata Definitivamente";
							_imgRossa.Visible=false;
							_imgRossa.ToolTip =  "La RDL è stata Approvata Definitivamente";
							_imgLuc.Visible=true;
							_imgLuc.Attributes.Add("title",tooltip_imgLuc);
							break;
						default: 
							_imgVerde.Visible=false;
							_imgLuc.Visible=false;
							_imgRossa.Visible=false;
							_imgLuc.Visible=false;
							break;
					}
				}
//				if( e.Item.Cells[20].Text.Trim()=="1")
//				{
//					_imgVerde.Visible=false;
//					_imgVerde.ToolTip = "";
//					_imgLuc.Visible=true;
//					_imgLuc.ToolTip = "";
////					_imgLuc.HRef="#"; 
////					_imgLuc.Src="../Images/no pdf_logo.gif";
////					_imgLuc.Attributes.Add("title","Nessun Pdf Preventivo");
//				}
//				else
//				{
//					_imgVerde.Visible=true;
//					_imgLuc.Visible=false;
//
////					_imgVerde.HRef="javascript:openpdf('" + dr["WR_ID"].ToString() + "','PREV','" + dr["pdfpreventivo"].ToString().Replace("'","`")  + "');"; 
////					_imgVerde.Src="../Images/pdf_logo.gif";
////					_imgVerde.Attributes.Add("title","Pdf Preventivo");
//				}
			
			}
			#endregion
			if(e.Item.ItemType == ListItemType.Footer)
			{
				e.Item.Cells[13].Text ="<b>" + "TOTALE "+ totpreventivo.ToString("C") +"</b>";
				e.Item.Cells[13].HorizontalAlign=HorizontalAlign.Right;
				e.Item.Cells[14].Text ="<b>"  + "TOTALE "+ totconsuntivo.ToString("C")+"</b>";
				e.Item.Cells[14].HorizontalAlign=HorizontalAlign.Right;				
			}
//			#region gestione_immagini


//			try
//			{
//				System.Web.UI.WebControls.Image _imgLuc=(System.Web.UI.WebControls.Image)e.Item.FindControl("ImgLuc");
//				System.Web.UI.WebControls.Image _imgVerde=(System.Web.UI.WebControls.Image)e.Item.FindControl("ImgVerde");
//				//			System.Web.UI.WebControls.Image _img15=(System.Web.UI.WebControls.Image)e.Item.FindControl("Img15min");
//				//			System.Web.UI.WebControls.Image _imgp15=(System.Web.UI.WebControls.Image)e.Item.FindControl("Img15pmin");
//				//			System.Web.UI.WebControls.Image _imgchiudi=(System.Web.UI.WebControls.Image)e.Item.FindControl("ImgChiudi");
//
//				_imgLuc.Visible=false;
//				_imgVerde.Visible=false;
//				//			_img15.Visible=false;
//				//			_imgp15.Visible=false;
//				//			_imgchiudi.Visible=false;
//				
//				string tooltipim=" * " ;///+ e.Item.Cells[18].Text + " * " + "\n" + e.Item.Cells[19].Text;
//				tooltipim=System.Web.HttpUtility.HtmlDecode(tooltipim);
//				// Imposto il tooltip all'immagine della e-mail
//				//			System.Web.UI.WebControls.Image _imgEmail=(System.Web.UI.WebControls.Image)e.Item.FindControl("ImageB1");
//				//			_imgEmail.ToolTip=tooltip;
//				switch(e.Item.Cells[20].Text.Trim())
//				{         
//					case "1":   
//						_imgVerde.Visible=true;
//						_imgVerde.ToolTip=tooltipim;
//						e.Item.Cells[21].ToolTip="in attesa di Approvazione CTE";
//						break;                  
//					case "2":            
//						_imgVerde.Visible=true;
//						_imgVerde.ToolTip=tooltipim;
//						e.Item.Cells[21].ToolTip="in attesa di Approvazione SCA";
//						break;   
//					case "3":            
//						_imgLuc.Visible=true;
//						_imgLuc.ToolTip=tooltipim;
//						e.Item.Cells[21].ToolTip="Approvata";
//						break;
//					case "4":            
//						_imgLuc.Visible=true;
//						_imgLuc.ToolTip=tooltipim;
//						e.Item.Cells[21].ToolTip="Approvata";
//						break;
//					default: 
//						_imgVerde.Visible=false;
//						_imgLuc.Visible=false;
//						//					_img15.Visible=false;
//						//					_imgp15.Visible=false;
//						//					_imgchiudi.Visible=false;
//						break;
//				}
//				//			#endregion
//			}
//			catch (Exception exd)
//			{
//				 
//			}


			#region codice commentato
			//			ImageButton _img2 = (ImageButton) e.Item.Cells[2].FindControl("Imagebutton2");
			//			_img2.ToolTip="Visualizza RdL";
			//				
			//			string codsavvion=e.Item.Cells[6].Text.Trim();
			//
			//			int vion=e.Item.Cells[6].Text.Trim().Length;
			//				
			//			if (codsavvion.ToString()=="&nbsp;")
			//			{					
			//				_img2.Visible=false;
			//			}

			#endregion
		}

		private void cmdExcel_Click(object sender, System.EventArgs e)
		{
			Csy.WebControls.Export 	_objExport = new Csy.WebControls.Export();
			DataTable _dt = new DataTable();			
			//				Classi.ManStraordinaria.ManCorrettivaPaging  _Richiesta = new TheSite.Classi.ManStraordinaria.ManCorrettivaPaging();
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL _Richiesta = new TheSite.Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();	
			S_ControlsCollection _SCollection=GetData();			

			DataSet _MyDs = _Richiesta.GetSfogliaRDLExcel2_rev(_SCollection).Copy();	

			_dt = _MyDs.Tables[0].Copy();
			
//			if (cmbsTipoManutenzione.SelectedValue=="3")
//			{
//		// MS
//			}
//			else
//				_dt = GetWordExcel().Tables[0].Copy();	// MOR	

			if (_dt.Rows.Count != 0)
			{
				_objExport.ExportDetails(_dt, Csy.WebControls.Export.ExportFormat.Excel, "exp.xls" ); 		
			}
			else
			{
				String scriptString = "<script language=JavaScript>alert('Nessun elemento da esportare');";
				scriptString += "<";
				scriptString += "/";
				scriptString += "script>";

				if(!this.IsClientScriptBlockRegistered("clientScriptexp"))
					this.RegisterStartupScript ("clientScriptexp", scriptString);
			}
			
		}
		

		private void DataGridRicerca_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			string varapp="";
			if(Request["VarApp"]!=null)
				varapp="&VarApp=" + Request["VarApp"];

			if (e.CommandName=="Dettaglio")
			{	
				string appo2 ="CompletaRdl1.aspx?wr_id=" +(e.Item.Cells[0].Text) +varapp ;
				string appo="CompletaRdl1.aspx?wr_id=" +(e.Item.Cells[0].Text) + varapp ;
				ImageButton _img1 = (ImageButton) e.Item.Cells[1].FindControl("lnkDett");

				

				_myColl.AddControl(this.Page.Controls,ParentType.Page );
				string s_url = e.CommandArgument.ToString();
						
				string IdStato = e.Item.Cells[15].Text.Trim();					
				switch (IdStato)
				{
					case "1":
					case "7":
					case "15":	
					switch(e.Item.Cells[15].Text)
					{
						case"1":
						
							_myColl.AddControl(this.Page.Controls, ParentType.Page);
							Server.Transfer(appo);	
							break;
						case"2":
							_myColl.AddControl(this.Page.Controls, ParentType.Page);
							Server.Transfer(appo2);
							break;
					}				
						//						_myColl.AddControl(this.Page.Controls, ParentType.Page);
						//						Server.Transfer(s_url);	
						break;
					default:
					switch(e.Item.Cells[15].Text)
					{
						case"6":
						
							_myColl.AddControl(this.Page.Controls, ParentType.Page);
							appo += "&c=true";
							Server.Transfer(appo);	
							break;
						case"4":
							//_myColl.AddControl(this.Page.Controls, ParentType.Page);
							appo2 += "&c=true";
							Server.Transfer(appo2);
							break;
					}			
						//						s_url += "&c=true";
						//						_myColl.AddControl(this.Page.Controls, ParentType.Page);
						//						Server.Transfer(s_url);	
						break;
				}							
									
			}
			if (e.CommandName=="Modifica")
			{
				_myColl.AddControl(this.Page.Controls,ParentType.Page );
				string s_url = e.CommandArgument.ToString() + varapp;
	
				Server.Transfer(s_url);
			
			}
//			if (e.CommandName=="vistata")
//			{
//				int Twr_id=int.Parse(e.CommandArgument.ToString());
//				Classi.ManStraordinaria.ManCorrettivaPaging  _Richiesta = new TheSite.Classi.ManStraordinaria.					ManCorrettivaPaging();	
//				string result=_Richiesta.UpdateStatusAut(2,Twr_id);	
//				String scriptString = "<script language=\"JavaScript\">alert(\"" + result + "\");<";
//				scriptString += "/";
//				scriptString += "script>";
//				this.RegisterStartupScript("Startup1", scriptString);
//				Ricerca(false);  
//			
//			}

			if (e.CommandName=="NONautorizzata") /// RIFIUTO L'APPROVAZIONE PULSANTE ROSSO
			{
				int Twr_id=int.Parse(e.CommandArgument.ToString());
				Classi.Utente _Utente = new TheSite.Classi.Utente();
				string [] Role =_Utente.GetRuoli(System.Web.HttpContext.Current.User.Identity.Name);
				Classi.ManStraordinaria.ManCorrettivaPaging  _Richiesta = new TheSite.Classi.ManStraordinaria.ManCorrettivaPaging();	
				int id_stat_aut=-1;
				string result=_Richiesta.UpdateStatusAut(id_stat_aut,Twr_id);
				String scriptString = "<script language=\"JavaScript\">alert(\"" + result + "\");<";
				scriptString += "/";
				scriptString += "script>";
				this.RegisterStartupScript("Startup2", scriptString);
				Ricerca(false);						
			}

			if (e.CommandName=="autorizzata")
			{
//				int Twr_id=int.Parse(e.CommandArgument.ToString());
				string rusultatidahtml=e.CommandArgument.ToString();
                string[] vResulthtml = rusultatidahtml.Split(new Char[] { '-' });
				int Twr_id=int.Parse(vResulthtml[0]);
				int TidStatoApprovazione=int.Parse(vResulthtml[1]);
				Classi.Utente _Utente = new TheSite.Classi.Utente();
				string [] Role =_Utente.GetRuoli(System.Web.HttpContext.Current.User.Identity.Name);
				Classi.ManStraordinaria.ManCorrettivaPaging  _Richiesta = new TheSite.Classi.ManStraordinaria.ManCorrettivaPaging();	
				int id_stat_aut=TidStatoApprovazione+1;
				System.Diagnostics.Debug.WriteLine(rusultatidahtml);
//				switch (Role[0].ToString())
//							{
//								case "AMMINISTRATORI":
//								id_stat_aut=4;
//								break;
//								case "INAIL_AUT_A":
//								id_stat_aut=2;
//								break;
//								case "INAIL_AUT_B":
//								id_stat_aut=3;
//								break;
//								case "INAIL_AUT_C":
//								id_stat_aut=3;
//								break;
//							}
				string result=_Richiesta.UpdateStatusAut(id_stat_aut,Twr_id);
				String scriptString = "<script language=\"JavaScript\">alert(\"" + result + "\");<";
				scriptString += "/";
				scriptString += "script>";
				this.RegisterStartupScript("Startup2", scriptString);
				Ricerca(false);
			}
		}

		private void cmdReset_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("SfogliaRdlPaging8.aspx?FunID=" + ViewState["FunId"]);
		}

		#region ManRichiesta
	
		public DataSet GetWordExcel()
		{
			//Classi.ManOrdinaria.Richiesta  _Richiesta = new TheSite.Classi.ManOrdinaria.Richiesta();
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL 	 _Richiesta =	new TheSite.Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();	
			S_ControlsCollection _SCollection = new S_ControlsCollection();			
		
			S_Controls.Collections.S_Object s_p_Bl_Id = new S_Controls.Collections.S_Object();
			s_p_Bl_Id.ParameterName = "p_Bl_Id";
			s_p_Bl_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Bl_Id.Direction = ParameterDirection.Input;
			s_p_Bl_Id.Size =50;
			s_p_Bl_Id.Index = 0;
			s_p_Bl_Id.Value = RicercaModulo1.TxtCodice.Text;
			_SCollection.Add(s_p_Bl_Id);

			S_Controls.Collections.S_Object s_p_campus = new S_Controls.Collections.S_Object();
			s_p_campus.ParameterName = "p_campus";
			s_p_campus.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_campus.Direction = ParameterDirection.Input;
			s_p_campus.Index = 1;
			s_p_campus.Size=50;
			s_p_campus.Value = RicercaModulo1.TxtRicerca.Text;			
			_SCollection.Add(s_p_campus);

			S_Controls.Collections.S_Object s_p_Wr_Id = new S_Controls.Collections.S_Object();
			s_p_Wr_Id.ParameterName = "p_Wr_Id";
			s_p_Wr_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wr_Id.Direction = ParameterDirection.Input;
			s_p_Wr_Id.Index = 2;
			s_p_Wr_Id.Size=50;
			s_p_Wr_Id.Value = (this.txtsRichiesta.Text=="")?0:Int32.Parse(this.txtsRichiesta.Text);		
			_SCollection.Add(s_p_Wr_Id);

			S_Controls.Collections.S_Object s_p_Addetto = new S_Controls.Collections.S_Object();
			s_p_Addetto.ParameterName = "p_Addetto";
			s_p_Addetto.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Addetto.Direction = ParameterDirection.Input;
			s_p_Addetto.Index = 3;
			s_p_Addetto.Size=50;
			s_p_Addetto.Value = this.Addetti1.NomeCompleto;			
			_SCollection.Add(s_p_Addetto);

			S_Controls.Collections.S_Object s_p_DataDa = new S_Controls.Collections.S_Object();
			s_p_DataDa.ParameterName = "p_DataDa";
			s_p_DataDa.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataDa.Direction = ParameterDirection.Input;
			s_p_DataDa.Index = 4;
			s_p_DataDa.Size= 10;
			s_p_DataDa.Value = (CalendarPicker1.Datazione.Text =="")? "":CalendarPicker1.Datazione.Text;  			
			_SCollection.Add(s_p_DataDa);

			S_Controls.Collections.S_Object s_p_DataA = new S_Controls.Collections.S_Object();
			s_p_DataA.ParameterName = "p_DataA";
			s_p_DataA.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataA.Direction = ParameterDirection.Input;
			s_p_DataA.Index = 5;
			s_p_DataA.Size= 10;
			s_p_DataA.Value = (CalendarPicker2.Datazione.Text =="")? "":CalendarPicker2.Datazione.Text;  			
			_SCollection.Add(s_p_DataA);

			S_Controls.Collections.S_Object s_p_Wo_Id = new S_Controls.Collections.S_Object();
			s_p_Wo_Id.ParameterName = "p_Wo_Id";
			s_p_Wo_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wo_Id.Direction = ParameterDirection.Input;
			s_p_Wo_Id.Index = 6;
			s_p_Wo_Id.Size=50;
			s_p_Wo_Id.Value = (this.txtsOrdine.Text=="")?0:Int32.Parse(this.txtsOrdine.Text);		
			_SCollection.Add(s_p_Wo_Id);
			
			S_Controls.Collections.S_Object s_p_Servizio = new S_Controls.Collections.S_Object();
			s_p_Servizio.ParameterName = "p_ID_Servizio";
			s_p_Servizio.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Servizio.Direction = ParameterDirection.Input;
			s_p_Servizio.Index = 7;
			s_p_Servizio.Value = (cmbsServizio.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsServizio.SelectedValue);			
			_SCollection.Add(s_p_Servizio);

			S_Controls.Collections.S_Object s_p_Status = new S_Controls.Collections.S_Object();
			s_p_Status.ParameterName = "p_Status";
			s_p_Status.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Status.Direction = ParameterDirection.Input;
			s_p_Status.Index = 8;
			s_p_Status.Value = (cmbsStatus.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsStatus.SelectedValue);			
			_SCollection.Add(s_p_Status);

			S_Controls.Collections.S_Object s_p_Richiedente = new S_Controls.Collections.S_Object();
			s_p_Richiedente.ParameterName = "p_Richiedente";
			s_p_Richiedente.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Richiedente.Direction = ParameterDirection.Input;
			s_p_Richiedente.Index = 9;
			s_p_Richiedente.Size=50;
			s_p_Richiedente.Value = this.Richiedenti1.NomeCompleto;			
			_SCollection.Add(s_p_Richiedente);

			S_Controls.Collections.S_Object s_p_Priority = new S_Controls.Collections.S_Object();
			s_p_Priority.ParameterName = "p_Priority";
			s_p_Priority.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Priority.Direction = ParameterDirection.Input;
			s_p_Priority.Index = 10;
			s_p_Priority.Value = (cmbsUrgenza.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsUrgenza.SelectedValue);			
			_SCollection.Add(s_p_Priority);

			S_Controls.Collections.S_Object s_p_Descrizione = new S_Controls.Collections.S_Object();
			s_p_Descrizione.ParameterName = "p_Descrizione";
			s_p_Descrizione.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Descrizione.Direction = ParameterDirection.Input;
			s_p_Descrizione.Index = 11;
			s_p_Descrizione.Size= 255;
			s_p_Descrizione.Value = txtDescrizione.Text;			
			_SCollection.Add(s_p_Descrizione);

			S_Controls.Collections.S_Object s_p_Gruppo = new S_Controls.Collections.S_Object();
			s_p_Gruppo.ParameterName = "p_Gruppo";
			s_p_Gruppo.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Gruppo.Direction = ParameterDirection.Input;
			s_p_Gruppo.Index = 12;
			s_p_Gruppo.Value = (cmbsGruppo.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsGruppo.SelectedValue);			
			_SCollection.Add(s_p_Gruppo);
			
			S_Controls.Collections.S_Object s_p_idcontabilizzazione = new S_Controls.Collections.S_Object();
			s_p_idcontabilizzazione.ParameterName = "p_idcontabilizzazione";
			s_p_idcontabilizzazione.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idcontabilizzazione.Direction = ParameterDirection.Input;
			s_p_idcontabilizzazione.Index = 13;
			s_p_idcontabilizzazione.Value = Int32.Parse(cmbsCdC.SelectedValue);			
			_SCollection.Add(s_p_idcontabilizzazione);

			return  _Richiesta.GetSfogliaRDLExcel3_rev(_SCollection).Copy();		
		}

		#endregion

	
	

	

		
	

		

	



	








		


	}
}
