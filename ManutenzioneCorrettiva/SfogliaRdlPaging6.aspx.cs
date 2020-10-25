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
	public class SfogliaRdlPaging6 :  System.Web.UI.Page
	{
		#region variabili
		public Classi.SiteModule _SiteModule;	
		
		
		public static string HelpLink = string.Empty;		
		object _fp1=null;
		EditSfoglia  _fp=null;
		CostiOperativi.CostiOperativi _fp2=null;
		public static int FunId = 0;
		protected System.Web.UI.HtmlControls.HtmlInputHidden HidSato;	
		MyCollection.clMyCollection _myColl = new MyCollection.clMyCollection();
		double totpreventivo=0;
		protected Csy.WebControls.DataPanel PanelRicerca;
		protected S_Controls.S_TextBox txtsRichiesta;
		protected System.Web.UI.WebControls.CompareValidator CompareValidator1;
		//protected System.Web.UI.WebControls.CompareValidator CompareValidator2;
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
		protected WebControls.Richiedenti Richiedenti1;
		protected WebControls.CodiceApparecchiature CodiceApparecchiature1;
		public int _totalRecords=0;
		protected WebControls.GridTitle Gridtitle2;			
		protected WebControls.PageTitle PageTitle1;
		protected System.Web.UI.WebControls.DataGrid DataGridRicerca2;
		protected S_Controls.S_ComboBox CmbStatoImpianto;
		protected S_Controls.S_ComboBox cmbsTipoAttivita;
		public double _totalPages=0;
		protected S_Controls.S_TextBox S_textbox1;
		protected S_Controls.S_TextBox S_NoteCompletamento;
		protected S_Controls.S_ComboBox cmbsApparecchiatura;
		protected TheSite.Classi.ManStraordinaria.ManCorrettivaPaging _Manc= new TheSite.Classi.ManStraordinaria.ManCorrettivaPaging();
		string id_servizio;
		protected string eq_id;
		protected int id_eq=0;
		protected int servizi_id=0;
		protected int id_std=0;
		protected string eq_std;
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

			string _mypage="./ManutenzioneCorrettiva/SfogliaRdlPaging6.aspx";			
			_SiteModule = new TheSite.Classi.SiteModule(_mypage);
			FunId = _SiteModule.ModuleId;

			//HelpLink = "../HelpApplication/Default.aspx?page=ManutenzioneCorrettiva/SfogliaRdlPaging6.aspx";
			this.PageTitle1.Title = _SiteModule.ModuleTitle;
			if (CodiceApparecchiature1.CodiceHidden.Value!=null && !CodiceApparecchiature1.CodiceHidden.Value.Equals(""))
			{
				dettaglioApparato();
			}
			else
			{
				if(cmbsServizio!=null && !cmbsServizio.SelectedValue.Equals("") && id_servizio!=null && !id_servizio.Equals(""))
					BindApparecchiatura1(cmbsServizio.SelectedValue);
				cmbsServizio.Enabled=true;
				cmbsApparecchiatura.Enabled=true;
			}

			
			this.RicercaModulo1.DelegatePresidio1 +=new  WebControls.DelegatePresidio(this.BindPriorita);			
			RicercaModulo1.DelegateCodiceEdificio1 +=new  WebControls.DelegateCodiceEdificio(this.BindServizio);
			CodiceApparecchiature1.NameComboServizio ="cmbsServizio";
			CodiceApparecchiature1.NameComboApparecchiature ="cmbsApparecchiatura";
			/// Imposto il nome dell'user control RicercaModulo
			CodiceApparecchiature1.NameUserControlRicercaModulo  ="RicercaModulo1";
			System.Text.StringBuilder sbValid = new System.Text.StringBuilder();
			sbValid.Append("document.getElementById('" + this.cmbsApparecchiatura.ClientID + "').disabled = true;");
			this.cmbsServizio.Attributes.Add("onchange", sbValid.ToString());
			

			if(!Page.IsPostBack)
			{	
				if(Request.QueryString["FunId"]!=null)
					ViewState["FunId"]=Request.QueryString["FunId"];
			
				CompareValidator1.ControlToValidate = CalendarPicker2.ID + ":" + CalendarPicker2.Datazione.ID;
				CompareValidator1.ControlToCompare =  CalendarPicker1.ID + ":" + CalendarPicker1.Datazione.ID;
				//CompareValidator2.ControlToValidate = CalendarPicker4.ID + ":" + CalendarPicker4.Datazione.ID;
				//CompareValidator2.ControlToCompare =  CalendarPicker3.ID + ":" + CalendarPicker3.Datazione.ID;


				//CalendarPicker1.Datazione.Text=DateTime.Now.ToShortDateString();
				CalendarPicker2.Datazione.Text=DateTime.Now.ToShortDateString();
				//CalendarPicker4.Datazione.Text=DateTime.Now.ToShortDateString();
				BindServizio("");
				BindApparecchiatura();
				BindGruppo();
				BindPriorita("");
				BindStatus();
				LoadStatoImpianto();
				BindTipoAttivita();
				//BindTipoInterventoAter();
				BindTipoManutenzione();
				//BindStatoAutorizz();
				
				// Imposto visibile il DataGrid di Manutenzione su Richiesta
				
				
				DataGridRicerca2.Visible=true;
				Gridtitle2.Visible=true;

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

					RicercaManRichiesta(true);
										
				}
				
				
				if(Context.Handler is TheSite.ManutenzioneCorrettiva.EditSfoglia)
				{
					_fp = (TheSite.ManutenzioneCorrettiva.EditSfoglia)Context.Handler;
					if (_fp!=null) 
					{						
						_myColl=_fp._Contenitore;
						_myColl.SetValues(this.Page.Controls);	
						RicercaManRichiesta(true);


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
						RicercaManRichiesta(true);
						

					}
				}	

						
			}
		
			Gridtitle2.hplsNuovo.Visible = false;

			
		}

		private void BindTipoManutenzione()
		{
		
			
			//Classi.ManCorrettiva.ClManCorrettiva _ClManCorrettiva = new TheSite.Classi.ManCorrettiva.ClManCorrettiva();
			
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL _ClManCorrettiva= new TheSite.Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();
			DataSet _MyDs =  _ClManCorrettiva.GetTipoManutenzione_();

			if (_MyDs.Tables[0].Rows.Count>0)
			{
				//cmbsTipoManutenzione.DataSource = _MyDs;
				this.cmbsTipoManutenzione.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "descrizione", "id", "- Selezionare un Tipo Manutenzione -", "0");


				this.cmbsTipoManutenzione.DataTextField = "descrizione";
				this.cmbsTipoManutenzione.DataValueField = "id";
				this.cmbsTipoManutenzione.DataBind();				
				this.cmbsTipoManutenzione.Attributes.Add("OnChange","Visualizza(this.value);"); 				
			}	
		}
		
		private void BindServizio(string CodEdificio)
		{
			
			Addetti1.Set_BL_ID(CodEdificio);

			
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
				//this.cmbsServizio.Items.Add(Classi.GestoreDropDownList.ItemMessaggio("Non Definito", "-1"));
			}
			else
			{
				string s_Messaggio = "Non Definito";
				this.cmbsServizio.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messaggio, "-1"));
			}


			if(servizi_id!=0)
			{
				int se = cmbsServizio.SelectedIndex;
				for (int i=0;i<this.cmbsServizio.Items.Count;i++)
				{
					if(this.cmbsServizio.Items[i].Value.Equals(""+servizi_id))
					{
						this.cmbsServizio.Items[i].Selected=true;	
						this.cmbsServizio.Items[se].Selected=false;
				
						i=this.cmbsServizio.Items.Count+1;
					}
				}
				this.cmbsServizio.Enabled=false;
				
			}
		
		}

		
		private void BindApparecchiatura()
		{
			string paramSelected="";
			paramSelected = cmbsApparecchiatura.SelectedValue;
			this.cmbsApparecchiatura.Items.Clear();
			this.cmbsApparecchiatura.Enabled=true;
			Classi.AnagrafeImpianti.Apparecchiature  _Apparecchiature = new TheSite.Classi.AnagrafeImpianti.Apparecchiature(Context.User.Identity.Name);
			
			DataSet _MyDs;

			if (cmbsServizio.SelectedValue!="" || RicercaModulo1.TxtCodice.Text!="")
			{
							
				S_ControlsCollection _SColl = new S_ControlsCollection();

				S_Controls.Collections.S_Object s_BlId = new S_Object();
				s_BlId.ParameterName = "p_Bl_Id";
				s_BlId.DbType = CustomDBType.VarChar;
				s_BlId.Direction = ParameterDirection.Input;
				s_BlId.Size =50;
				s_BlId.Index = 0;
				s_BlId.Value = RicercaModulo1.TxtCodice.Text;
				_SColl.Add(s_BlId);
			
				S_Controls.Collections.S_Object s_Servizio = new S_Object();
				s_Servizio.ParameterName = "p_Servizio";
				s_Servizio.DbType = CustomDBType.Integer;
				s_Servizio.Direction = ParameterDirection.Input;
				s_Servizio.Index = 1;
				s_Servizio.Value = (cmbsServizio.SelectedValue=="")? 0:Int32.Parse(cmbsServizio.SelectedValue);
				_SColl.Add(s_Servizio);

				_MyDs = _Apparecchiature.GetData(_SColl).Copy();
                 
				
			}
			else
			{
			_MyDs = _Apparecchiature.GetData().Copy();
			
			}
			
			
			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsApparecchiatura.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "DESCRIZIONE", "ID", "- Selezionare uno Standard -", "");
				this.cmbsApparecchiatura.DataTextField = "DESCRIZIONE";
				this.cmbsApparecchiatura.DataValueField = "ID";
				this.cmbsApparecchiatura.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessun Standard -";
				this.cmbsApparecchiatura.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio,  String.Empty));
			}

//			else
//			{
//				string s_Messagggio = "- Nessun Standard -";
//				this.cmbsApparecchiatura.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
//			}

			// freeze apparato 5 //
			if(id_std!=0 || (!paramSelected.Equals("") && !paramSelected.Equals("0") && !paramSelected.Equals("-1")))
			{
				int se = cmbsApparecchiatura.SelectedIndex;
				if(id_std!=0)
				{
					paramSelected = ""+id_std;
				}

				for (int i=0;i<this.cmbsApparecchiatura.Items.Count;i++)
				{
					if(this.cmbsApparecchiatura.Items[i].Value.Equals(paramSelected))
					{
						this.cmbsApparecchiatura.Items[i].Selected=true;	
						this.cmbsApparecchiatura.Items[se].Selected=false;
				
						i=this.cmbsApparecchiatura.Items.Count+1;
						this.cmbsApparecchiatura.Enabled=false;
					}
				}
				
			}
		}

		private void dettaglioApparato()
		{
			S_ControlsCollection CollezioneControlli = new  S_ControlsCollection();
			S_Controls.Collections.S_Object s_p_id_eq = new S_Controls.Collections.S_Object();
			s_p_id_eq.ParameterName = "p_id_eq";
			s_p_id_eq.DbType = CustomDBType.Integer;
			s_p_id_eq.Direction = ParameterDirection.Input;
			s_p_id_eq.Index = 0;
			s_p_id_eq.Value = CodiceApparecchiature1.CodiceHidden.Value;			
			CollezioneControlli.Add(s_p_id_eq);

			TheSite.Classi.AnagrafeImpianti.Apparecchiature  _Apparecchiatura = new TheSite.Classi.AnagrafeImpianti.Apparecchiature(Context.User.Identity.Name);

			DataSet	_Dr = _Apparecchiatura.GetApparatoDetail(CollezioneControlli);
			foreach (DataRow Dr in _Dr.Tables[0].Rows)
			{
				eq_id	   = Dr["eq_id"].ToString();
				id_eq	   = int.Parse(Dr["id_eq"].ToString());
				servizi_id = int.Parse(Dr["servizi_id"].ToString());
				id_std	   = int.Parse(Dr["id_std"].ToString());
				eq_std	   = Dr["eq_std"].ToString();
			}

			BindServizio(RicercaModulo1.TxtCodice.Text);//this.IDBL);
			BindApparecchiatura1(""+servizi_id);
		}

		
		private void BindApparecchiatura1(string id_servizio) 
		{
			string paramSelected="";
			paramSelected = cmbsApparecchiatura.SelectedValue;

			this.cmbsApparecchiatura.Items.Clear();
		
			Classi.AnagrafeImpianti.Apparecchiature  _Apparecchiature = new TheSite.Classi.AnagrafeImpianti.Apparecchiature(Context.User.Identity.Name);
			
			DataSet _MyDs;
			
			S_ControlsCollection _SColl = new S_ControlsCollection();

			S_Controls.Collections.S_Object s_BlId = new S_Object();
			s_BlId.ParameterName = "p_Bl_Id";
			s_BlId.DbType = CustomDBType.VarChar;
			s_BlId.Direction = ParameterDirection.Input;
			s_BlId.Size =50;
			s_BlId.Index = 0;
			s_BlId.Value = RicercaModulo1.TxtCodice.Text;
			_SColl.Add(s_BlId);
			
			S_Controls.Collections.S_Object s_Servizio = new S_Object();
			s_Servizio.ParameterName = "p_Servizio";
			s_Servizio.DbType = CustomDBType.Integer;
			s_Servizio.Direction = ParameterDirection.Input;
			s_Servizio.Index = 1;
			s_Servizio.Value =Int32.Parse(id_servizio);
			_SColl.Add(s_Servizio);

			_MyDs = _Apparecchiature.GetData(_SColl).Copy();
                 
		
  
			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsApparecchiatura.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "DESCRIZIONE", "ID", "- Selezionare uno Standard -", "");
				this.cmbsApparecchiatura.DataTextField = "DESCRIZIONE";
				this.cmbsApparecchiatura.DataValueField = "ID";
				this.cmbsApparecchiatura.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessun Standard -";
				this.cmbsApparecchiatura.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio,  String.Empty));
			}

			// freeze apparato 5 //
			if(id_std!=0 || (!paramSelected.Equals("") && !paramSelected.Equals("0") && !paramSelected.Equals("-1")))
			{
				int se = cmbsApparecchiatura.SelectedIndex;
				if(id_std!=0)
				{
					paramSelected = ""+id_std;
				}

				for (int i=0;i<this.cmbsApparecchiatura.Items.Count;i++)
				{
					if(this.cmbsApparecchiatura.Items[i].Value.Equals(paramSelected))
					{
						this.cmbsApparecchiatura.Items[i].Selected=true;	
						this.cmbsApparecchiatura.Items[se].Selected=false;
				
						i=this.cmbsApparecchiatura.Items.Count+1;
					}
				}
				this.cmbsApparecchiatura.Enabled=false;
			}
			// freeze apparato 5 //

		}
		private void LoadStatoImpianto()
		{
			Classi.ManCorrettiva.ClManCorrettiva _ClManCorrettiva=new TheSite.Classi.ManCorrettiva.ClManCorrettiva(Context.User.Identity.Name);
			DataSet _MyDs =  _ClManCorrettiva.GetStatoImpianto();

			if (_MyDs.Tables[0].Rows.Count>0)
			{
				//CmbStatoImpianto.DataSource = _MyDs.Tables[0];
				
				this.CmbStatoImpianto.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "descrizione", "id", "- Selezionare uno Stato Impianto -", "0");
				
				this.CmbStatoImpianto.DataTextField = "descrizione";
				this.CmbStatoImpianto.DataValueField = "id";
				this.CmbStatoImpianto.DataBind();
				
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

		private void BindPriorita(string Codice)
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
					ds.Tables[0], "DESCRIPTION", "id", "- Selezionare una Priorit� -", "0");

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
					ds.Tables[0], "DESCRIPTION", "id", "- Selezionare una Priorit� -", "0");
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
		private void BindTipoAttivita()
		{
			this.cmbsTipoAttivita.Items.Clear();
		
			Classi.ManCorrettiva.ClManCorrettiva _ClManCorrettiva=new TheSite.Classi.ManCorrettiva.ClManCorrettiva(Context.User.Identity.Name);

			DataSet _MyDs =  _ClManCorrettiva.GetTipoAttivita();

			if (_MyDs.Tables[0].Rows.Count>0)
			{
				//cmbsTipoAttivita.DataSource = _MyDs.Tables[0];
				this.cmbsTipoAttivita.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "DESCRIZIONE", "id", "- Selezionare un Tipo Attivit� -", "0");
				this.cmbsTipoAttivita.DataTextField = "descrizione";
				this.cmbsTipoAttivita.DataValueField = "id";
				this.cmbsTipoAttivita.DataBind();}

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
			// CODEGEN: questa chiamata � richiesta da Progettazione Web Form ASP.NET.
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
			this.cmbsServizio.SelectedIndexChanged += new System.EventHandler(this.cmbsServizio_SelectedIndexChanged);
			this.btnsRicerca.Click += new System.EventHandler(this.btnsRicerca_Click);
			this.cmdReset.Click += new System.EventHandler(this.cmdReset_Click);
			this.DataGridRicerca2.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridRicerca2_ItemCommand);
			this.DataGridRicerca2.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridRicerca2_PageIndexChanged);
			this.DataGridRicerca2.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicerca2_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnsRicerca_Click(object sender, System.EventArgs e)
		{
			
			DataGridRicerca2.CurrentPageIndex =0;
			RicercaManRichiesta(true);
			//			if (cmbsTipoManutenzione.SelectedValue=="3")
			//			{
			//				// Manutenzione Straordinaria				
			//				Ricerca(true);		
			//			}
			//			else			
			//			{	// Manutenzione Richiesta				
			//				RicercaManRichiesta(true);
			//			}
		}

		protected Int32 _currentPageNumber = 1;
		
		public string GetPagina(string tipomanutenzioneid, 	string wr_id, string wo_id, string id_stato)
		{

			string pag="";
			//pag="CompletaRdl1.aspx?wr_id=" +wr_id;
			//string pagchiamante="ManutenzioneCorrettiva/SfogliaRdlPaging6";
			
			
			string varapp="";
			if(Request["VarApp"]!=null)
				varapp="&VarApp=" + Request["VarApp"];
			
			//string OK_MODIF_=_Manc.Ruolo_Pagina_modifica(Context.User.Identity.Name,"."+Request.FilePath);
			pag="CompletaRdl1.aspx?wr_id=" +wr_id+varapp;
//			if (OK_MODIF_=="NO")
//			{pag="CompletaRdl2.aspx?wr_id=" +wr_id+varapp;
//			}
//			else{	}
			//			if (tipomanutenzioneid=="1" && tipomanutenzioneid=="3")
			//			pag="CompletaRdl1.aspx?wr_id=" +wr_id+varapp;
//			if (tipomanutenzioneid=="2")
//			{
//								
//				if (id_stato=="4")
//					pag="../ManutenzioneProgrammata/SfogliaRdlOdl_MP1.aspx?id_wo=" +wo_id+"&pagchiamante="+pagchiamante ;	
//				else					
//					pag="../ManutenzioneProgrammata/CompletamentoMP1.aspx?id_wo=" +wo_id;
//			}
			//Context.Items.Add("wo_id",this.wo_id);   
			//Server.Transfer("SfogliaRdlOdl_MP1.aspx?FunId="+FunId); 

			return pag;
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

		private S_ControlsCollection GetData() //chiamata da esporta excel
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
			p_idcontabilizzazione.Value=int.Parse(cmbsTipoAttivita.SelectedValue);
			_SCollection.Add(p_idcontabilizzazione);


			S_Controls.Collections.S_Object p_idApprovazione = new S_Controls.Collections.S_Object();
			p_idApprovazione.ParameterName = "p_idApprovazione";
			p_idApprovazione.DbType =CustomDBType.Integer;
			p_idApprovazione.Direction = ParameterDirection.Input;
			p_idApprovazione.Index = 15;
			p_idApprovazione.Size= 10;
			p_idApprovazione.Value=int.Parse(CmbStatoImpianto.SelectedValue);
			_SCollection.Add(p_idApprovazione);

//			S_Controls.Collections.S_Object p_idmap = new S_Controls.Collections.S_Object();
//			p_idmap.ParameterName = "p_idmap";
//			p_idmap.DbType =CustomDBType.Integer;
//			p_idmap.Direction = ParameterDirection.Input;
//			p_idmap.Index = 16;
//			p_idmap.Size= 10;
//			p_idmap.Value=int.Parse(cmbMAP.SelectedValue);
//			_SCollection.Add(p_idmap);





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

	
		private void DataGridRicerca_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			string descrizione="";
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
				//				ImageButton _imgLuc = (ImageButton) e.Item.Cells[2].FindControl("ImagebutLuc"); // luchetto
				System.Web.UI.WebControls.Image _imgLuc=(System.Web.UI.WebControls.Image)
					e.Item.FindControl("ImagebutLuc");
				ImageButton _imgVerde = (ImageButton) e.Item.Cells[1].FindControl("Imagebutton4");// verde
				ImageButton _imgRossa = (ImageButton) e.Item.Cells[1].FindControl("ImagebutRosso");// verde  
				//System.Web.UI.HtmlControls.HtmlImage _imgOK = (System.Web.UI.HtmlControls.HtmlImage) e.Item.Cells[1].FindControl("ImagebutOK");// verde  ImagebutOK
				System.Web.UI.WebControls.Image _imgOK=(System.Web.UI.WebControls.Image)
					e.Item.FindControl("ImagebutOK");  /// ImagebutKO
				System.Web.UI.WebControls.Image _imgKO=(System.Web.UI.WebControls.Image)
					e.Item.FindControl("ImagebutKO");  /// ImagebutKO

				string tooltip_imgLuc="Permessi non Sufficienti per Approvare\n";// ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim();
		
				
				if (e.Item.Cells[16].Text.Trim().Length >20) 
				{
					descrizione=e.Item.Cells[16].Text.Trim().Substring(0,18) + "..."; 
					e.Item.Cells[16].ToolTip=e.Item.Cells[16].Text;
					e.Item.Cells[16].Text=descrizione;
				} 
				
				
				
				if(e.Item.Cells[20].Text.Trim()=="4" || e.Item.Cells[20].Text.Trim()=="2")//  se � stato approvato
				{
					_imgOK.Visible=true;
					_imgOK.Attributes.Add("title","Richiesta Approvata\n");// ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim());
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
					_imgKO.Attributes.Add("title","Richiesta Rifiutata\n");// ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim());
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
							_imgVerde.ToolTip = "Amministratore \n cliccare per Approvare\n";// + "\n ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim();
							_imgRossa.Visible=true;
							_imgRossa.ToolTip = "Amministratore \n cliccare per Rifiutare\n"; //+ "\n ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim();
							_imgLuc.Visible=false;
							//							_imgLuc.ToolTip = "Privilegi di Approvazione Autorizzata";
							break;                  
						case "1":    // livello   cte il primo che Autorizza  LIVA    
							if(e.Item.Cells[20].Text.Trim()==e.Item.Cells[22].Text.Trim())
							{
								_imgVerde.Visible=true;
								_imgVerde.ToolTip = "Privilegi di Approvazione LIVA \n cliccare per Approvare\n";// +  "\n ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim();
								_imgRossa.Visible=true;
								_imgRossa.ToolTip = "Privilegi di Approvazione LIVA \n cliccare per Rifiutare\n";// +  "\n ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim();
								_imgLuc.Visible=false;
								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							}
							else
							{
								_imgVerde.Visible=false;
								_imgVerde.ToolTip = "Privilegi di Approvazione LIVA \n cliccare per Approvare \n" ;//+"\n ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim();
								_imgRossa.Visible=false;
								_imgRossa.ToolTip = "Privilegi di Approvazione LIVA \n cliccare per Rifiutare\n" ;//+"\n ---- Descrizione ----\n" + e.Item.Cells[16].Text.Trim();
								_imgLuc.Visible=true;
								_imgLuc.Attributes.Add("title",tooltip_imgLuc);

							}
							break;   
							//						case "2":    // livello   SCA il secondo che Autorizza         LIVB 
							//							if(e.Item.Cells[20].Text.Trim()==e.Item.Cells[22].Text.Trim())
							//							{
							//								_imgVerde.Visible=true;
							//								_imgVerde.ToolTip = "Privilegi di Approvazione LIVB \n cliccare per Approvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgRossa.Visible=true;
							//								_imgRossa.ToolTip = "Privilegi di Approvazione LIVB \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgLuc.Visible=false;
							//								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							//							}
							//							else
							//							{
							//								_imgVerde.Visible=false;
							//								_imgVerde.ToolTip = "Privilegi di Approvazione LIVB \n cliccare per Approvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgRossa.Visible=false;
							//								_imgRossa.ToolTip = "Privilegi di Approvazione LIVB \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgLuc.Visible=true;
							//								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							//							}
							//							break;
							//						case "3":  // livello   cte il terzo che Autorizza            
							//							if(e.Item.Cells[20].Text.Trim()==e.Item.Cells[22].Text.Trim())
							//							{
							//								_imgVerde.Visible=true;
							//								_imgVerde.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Approvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgRossa.Visible=true;
							//								_imgRossa.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgLuc.Visible=false;
							//								//								_imgLuc.ToolTip = "Privilegi di Approvazione non Concessi";
							//							}
							//							else
							//							{
							//								_imgVerde.Visible=false;
							//								_imgVerde.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Approvare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgRossa.Visible=false;
							//								_imgRossa.ToolTip = "Privilegi di Approvazione SCA \n cliccare per Rifiutare\n ---- Descrizione ----\n" + e.Item.Cells[23].Text.Trim();
							//								_imgLuc.Visible=true;
							//								_imgLuc.Attributes.Add("title",tooltip_imgLuc);
							//							}
							//							break;
						case "2":      // livello   ULTIMO � STATO TUTTO AUTORIZZATO il terzo che Autorizza        							 
							_imgVerde.Visible=false;
							_imgVerde.ToolTip = "La RDL � stata Approvata Definitivamente";
							_imgRossa.Visible=false;
							_imgRossa.ToolTip =  "La RDL � stata Rifiutata Definitivamente";
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
			_dt = GetWordExcel().Tables[0].Copy();

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
		
		
		private void cmdReset_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("SfogliaRdlPaging6.aspx?FunID=" + ViewState["FunId"]);
		}

		#region ManRichiesta
		private void RicercaManRichiesta(bool reset)
		{
			
			// Manutenzione Richiesta
						
			DataGridRicerca2.Visible=true;
			Gridtitle2.Visible=true;
	
			//Classi.ManOrdinaria.RichiestaPaging   _Richiesta = new TheSite.Classi.ManOrdinaria.RichiestaPaging();
						
			Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL _Richiesta = new TheSite.Classi.ManCorrettiva.MANCORRETTIVASFOGLIARDL();
			S_ControlsCollection _SCollection = new S_ControlsCollection();			
		
			S_Controls.Collections.S_Object s_p_Bl_Id = new S_Controls.Collections.S_Object();
			s_p_Bl_Id.ParameterName = "p_Bl_Id";
			s_p_Bl_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Bl_Id.Direction = ParameterDirection.Input;
			s_p_Bl_Id.Size =50;
			s_p_Bl_Id.Index = _SCollection.Count;
			s_p_Bl_Id.Value = RicercaModulo1.TxtCodice.Text;
			_SCollection.Add(s_p_Bl_Id);

			S_Controls.Collections.S_Object s_p_campus = new S_Controls.Collections.S_Object();
			s_p_campus.ParameterName = "p_campus";
			s_p_campus.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_campus.Direction = ParameterDirection.Input;
			s_p_campus.Index = _SCollection.Count;
			s_p_campus.Size=50;
			s_p_campus.Value = RicercaModulo1.TxtRicerca.Text;			
			_SCollection.Add(s_p_campus);

			S_Controls.Collections.S_Object s_p_Wr_Id = new S_Controls.Collections.S_Object();
			s_p_Wr_Id.ParameterName = "p_Wr_Id";
			s_p_Wr_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wr_Id.Direction = ParameterDirection.Input;
			s_p_Wr_Id.Index = _SCollection.Count;
			s_p_Wr_Id.Size=50;
			s_p_Wr_Id.Value = (this.txtsRichiesta.Text=="")?0:Int32.Parse(this.txtsRichiesta.Text);		
			_SCollection.Add(s_p_Wr_Id);

			S_Controls.Collections.S_Object s_p_Addetto = new S_Controls.Collections.S_Object();
			s_p_Addetto.ParameterName = "p_Addetto";
			s_p_Addetto.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Addetto.Direction = ParameterDirection.Input;
			s_p_Addetto.Index = _SCollection.Count;
			s_p_Addetto.Size=50;
			s_p_Addetto.Value = (this.Addetti1.NomeCompleto.ToString() =="")? "":this.Addetti1.NomeCompleto;			
			_SCollection.Add(s_p_Addetto);

			S_Controls.Collections.S_Object s_p_DataDa = new S_Controls.Collections.S_Object();
			s_p_DataDa.ParameterName = "p_DataDa";
			s_p_DataDa.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataDa.Direction = ParameterDirection.Input;
			s_p_DataDa.Index = _SCollection.Count;
			s_p_DataDa.Size= 10;
			s_p_DataDa.Value = (CalendarPicker1.Datazione.Text =="")? "":CalendarPicker1.Datazione.Text;  			
			_SCollection.Add(s_p_DataDa);

			S_Controls.Collections.S_Object s_p_DataA = new S_Controls.Collections.S_Object();
			s_p_DataA.ParameterName = "p_DataA";
			s_p_DataA.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataA.Direction = ParameterDirection.Input;
			s_p_DataA.Index = _SCollection.Count;
			s_p_DataA.Size= 10;
			s_p_DataA.Value = (CalendarPicker2.Datazione.Text =="")? "":CalendarPicker2.Datazione.Text;  			
			_SCollection.Add(s_p_DataA);

			S_Controls.Collections.S_Object s_p_DataDaP = new S_Controls.Collections.S_Object();
			s_p_DataDaP.ParameterName = "p_DataDaP";
			s_p_DataDaP.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataDaP.Direction = ParameterDirection.Input;
			s_p_DataDaP.Index = _SCollection.Count;
			s_p_DataDaP.Size= 10;
			s_p_DataDaP.Value = (CalendarPicker3.Datazione.Text =="")? "":CalendarPicker3.Datazione.Text;  			
			_SCollection.Add(s_p_DataDaP);

			
			S_Controls.Collections.S_Object s_p_DataAP = new S_Controls.Collections.S_Object();
			s_p_DataAP.ParameterName = "p_DataAP";
			s_p_DataAP.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataAP.Direction = ParameterDirection.Input;
			s_p_DataAP.Index = _SCollection.Count;
			s_p_DataAP.Size= 10;
			s_p_DataAP.Value = (CalendarPicker4.Datazione.Text =="")? "":CalendarPicker4.Datazione.Text;  			
			_SCollection.Add(s_p_DataAP);

			S_Controls.Collections.S_Object s_p_Wo_Id = new S_Controls.Collections.S_Object();
			s_p_Wo_Id.ParameterName = "p_Wo_Id";
			s_p_Wo_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wo_Id.Direction = ParameterDirection.Input;
			s_p_Wo_Id.Index = _SCollection.Count;
			s_p_Wo_Id.Size=50;
			s_p_Wo_Id.Value = (this.txtsOrdine.Text=="")?0:Int32.Parse(this.txtsOrdine.Text);		
			_SCollection.Add(s_p_Wo_Id);
			
			S_Controls.Collections.S_Object s_p_Servizio = new S_Controls.Collections.S_Object();
			s_p_Servizio.ParameterName = "p_ID_Servizio";
			s_p_Servizio.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Servizio.Direction = ParameterDirection.Input;
			s_p_Servizio.Index = _SCollection.Count;
			s_p_Servizio.Value = (cmbsServizio.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsServizio.SelectedValue);			
			_SCollection.Add(s_p_Servizio);

			S_Controls.Collections.S_Object s_p_idstandard = new S_Controls.Collections.S_Object();
			s_p_idstandard.ParameterName = "p_idstandard";
			s_p_idstandard.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idstandard.Direction = ParameterDirection.Input;
			s_p_idstandard.Index = _SCollection.Count;
			s_p_idstandard.Value = (cmbsApparecchiatura.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsApparecchiatura.SelectedValue);			
			_SCollection.Add(s_p_idstandard);

			
			S_Controls.Collections.S_Object s_p_Status = new S_Controls.Collections.S_Object();
			s_p_Status.ParameterName = "p_Status";
			s_p_Status.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Status.Direction = ParameterDirection.Input;
			s_p_Status.Index = _SCollection.Count;
			s_p_Status.Value = (cmbsStatus.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsStatus.SelectedValue);			
			_SCollection.Add(s_p_Status);



			S_Controls.Collections.S_Object s_p_Priority = new S_Controls.Collections.S_Object();
			s_p_Priority.ParameterName = "p_Priority";
			s_p_Priority.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Priority.Direction = ParameterDirection.Input;
			s_p_Priority.Index = _SCollection.Count;
			s_p_Priority.Value = (cmbsUrgenza.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsUrgenza.SelectedValue);			
			_SCollection.Add(s_p_Priority);

			S_Controls.Collections.S_Object s_p_Descrizione = new S_Controls.Collections.S_Object();
			s_p_Descrizione.ParameterName = "p_Descrizione";
			s_p_Descrizione.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Descrizione.Direction = ParameterDirection.Input;
			s_p_Descrizione.Index = _SCollection.Count;
			s_p_Descrizione.Size= 255;
			s_p_Descrizione.Value = (this.txtDescrizione.Text=="")? "":txtDescrizione.Text;			
			_SCollection.Add(s_p_Descrizione);

			S_Controls.Collections.S_Object s_p_idtipomanutenzione = new S_Controls.Collections.S_Object();
			s_p_idtipomanutenzione.ParameterName = "p_idtipomanutenzione";
			s_p_idtipomanutenzione.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idtipomanutenzione.Direction = ParameterDirection.Input;
			s_p_idtipomanutenzione.Index = _SCollection.Count;
			s_p_idtipomanutenzione.Value = Int32.Parse(cmbsTipoManutenzione.SelectedValue);			
			_SCollection.Add(s_p_idtipomanutenzione);
			
			//p_idtipoattivita in number,
            //p_idstatoimpianto in number, 

			S_Controls.Collections.S_Object s_p_idtipoattivita = new S_Controls.Collections.S_Object();
			s_p_idtipoattivita.ParameterName = "p_idtipoattivita";
			s_p_idtipoattivita.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idtipoattivita.Direction = ParameterDirection.Input;
			s_p_idtipoattivita.Index = _SCollection.Count;
			s_p_idtipoattivita.Value = Int32.Parse(cmbsTipoAttivita.SelectedValue);	
			_SCollection.Add(s_p_idtipoattivita);

			S_Controls.Collections.S_Object s_p_idstatoimpianto = new S_Controls.Collections.S_Object();
			s_p_idstatoimpianto.ParameterName = "p_idstatoimpianto";
			s_p_idstatoimpianto.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idstatoimpianto.Direction = ParameterDirection.Input;
			s_p_idstatoimpianto.Index = _SCollection.Count;
			s_p_idstatoimpianto.Value = Int32.Parse(CmbStatoImpianto.SelectedValue);			
			_SCollection.Add(s_p_idstatoimpianto);


			S_Controls.Collections.S_Object s_p_eq_id = new S_Controls.Collections.S_Object();
			s_p_eq_id.ParameterName = "p_eq_id";
			s_p_eq_id.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_eq_id.Direction = ParameterDirection.Input;			
			s_p_eq_id.Index = _SCollection.Count;
			s_p_eq_id.Size =50;
			s_p_eq_id.Value = CodiceApparecchiature1.TextboxAppLabel.Text;
			
			_SCollection.Add(s_p_eq_id);

			S_Controls.Collections.S_Object s_p_notecompletamento = new S_Controls.Collections.S_Object();
			s_p_notecompletamento.ParameterName = "p_notecompletamento";
			s_p_notecompletamento.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_notecompletamento.Direction = ParameterDirection.Input;		
			s_p_notecompletamento.Index =  _SCollection.Count;
			s_p_notecompletamento.Size =255;
			s_p_notecompletamento.Value = S_NoteCompletamento.Text;			
			_SCollection.Add(s_p_notecompletamento);



			Double _totalPages = 1;

			int _totalRecords = _Richiesta.GetCount1_rev_(_SCollection);				
			this.Gridtitle2.NumeroRecords=_totalRecords.ToString();

			
			if (reset==true)
			{
	
				//int _totalRecords = _Richiesta.GetCount1_rev_(_SCollection);				
				//this.Gridtitle2.NumeroRecords=_totalRecords.ToString();

				if ((_totalRecords % DataGridRicerca2.PageSize) == 0)
					_totalPages = _totalRecords / DataGridRicerca2.PageSize;
				else
					_totalPages = (_totalRecords / DataGridRicerca2.PageSize)+1;
				//DataGridRicerca.VirtualItemCount =_totalRecords;
				//				TotalPages2.Text = ( System.Math.Ceiling ( _totalPages ) ).ToString();
			}
			else
			{
				//				_totalPages = Double.Parse (this.Gridtitle2.NumeroRecords);
				//int _totalRecords = _Richiesta.GetCount1_rev_(_SCollection);				
				//this.Gridtitle2.NumeroRecords=_totalRecords.ToString();


				if ((_totalRecords % DataGridRicerca2.PageSize) == 0)
					_totalPages = _totalRecords / DataGridRicerca2.PageSize;
				else
					_totalPages = (_totalRecords / DataGridRicerca2.PageSize)+1;

			}

			_SCollection.RemoveAt(_SCollection.Count-1);
			_SCollection.RemoveAt(_SCollection.Count-1);
			
			S_Controls.Collections.S_Object s_p_pageindex = new S_Object();
			s_p_pageindex.ParameterName = "pageindex";
			s_p_pageindex.DbType = CustomDBType.Integer;
			s_p_pageindex.Direction = ParameterDirection.Input;
			s_p_pageindex.Index = _SCollection.Count;
			s_p_pageindex.Value=DataGridRicerca2.CurrentPageIndex+1;			
			_SCollection.Add(s_p_pageindex);

			S_Controls.Collections.S_Object s_p_pagesize = new S_Object();
			s_p_pagesize.ParameterName = "pagesize";
			s_p_pagesize.DbType = CustomDBType.Integer;
			s_p_pagesize.Direction = ParameterDirection.Input;
			s_p_pagesize.Index = _SCollection.Count;
			s_p_pagesize.Value= DataGridRicerca2.PageSize;			
			_SCollection.Add(s_p_pagesize);

			DataSet _MyDs = _Richiesta.GetSfogliaRDL1_rev_(_SCollection).Copy();		

		

			this.DataGridRicerca2.VirtualItemCount =int.Parse(this.Gridtitle2.NumeroRecords);
			this.DataGridRicerca2.DataSource = _MyDs.Tables[0];

			DataGridRicerca2.Visible = true;
			//Gridtitle2.NumeroRecords=_MyDs.Tables[0].Rows.Count.ToString();
			Gridtitle2.Visible =true;
			Gridtitle2.hplsNuovo.Visible=false;

			if (int.Parse(this.Gridtitle2.NumeroRecords) ==0) 
			{
				DataGridRicerca2.CurrentPageIndex=0;
				Gridtitle2.DescriptionTitle="Nessun dato trovato."; 
			}
			else
			{
				Gridtitle2.DescriptionTitle=""; 
			}
			
			this.DataGridRicerca2.DataBind();
			
			

		}

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
			s_p_Bl_Id.Index = _SCollection.Count;
			s_p_Bl_Id.Value = RicercaModulo1.TxtCodice.Text;
			_SCollection.Add(s_p_Bl_Id);

			S_Controls.Collections.S_Object s_p_campus = new S_Controls.Collections.S_Object();
			s_p_campus.ParameterName = "p_campus";
			s_p_campus.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_campus.Direction = ParameterDirection.Input;
			s_p_campus.Index =_SCollection.Count;
			s_p_campus.Size=50;
			s_p_campus.Value = RicercaModulo1.TxtRicerca.Text;			
			_SCollection.Add(s_p_campus);

			S_Controls.Collections.S_Object s_p_Wr_Id = new S_Controls.Collections.S_Object();
			s_p_Wr_Id.ParameterName = "p_Wr_Id";
			s_p_Wr_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wr_Id.Direction = ParameterDirection.Input;
			s_p_Wr_Id.Index = _SCollection.Count;
			s_p_Wr_Id.Size=50;
			s_p_Wr_Id.Value = (this.txtsRichiesta.Text=="")?0:Int32.Parse(this.txtsRichiesta.Text);		
			_SCollection.Add(s_p_Wr_Id);

			S_Controls.Collections.S_Object s_p_Addetto = new S_Controls.Collections.S_Object();
			s_p_Addetto.ParameterName = "p_Addetto";
			s_p_Addetto.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Addetto.Direction = ParameterDirection.Input;
			s_p_Addetto.Index = _SCollection.Count;
			s_p_Addetto.Size=50;
			s_p_Addetto.Value = (this.Addetti1.NomeCompleto=="")?"":this.Addetti1.NomeCompleto;			
			_SCollection.Add(s_p_Addetto);

			S_Controls.Collections.S_Object s_p_DataDa = new S_Controls.Collections.S_Object();
			s_p_DataDa.ParameterName = "p_DataDa";
			s_p_DataDa.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataDa.Direction = ParameterDirection.Input;
			s_p_DataDa.Index = _SCollection.Count;
			s_p_DataDa.Size= 10;
			s_p_DataDa.Value = (CalendarPicker1.Datazione.Text =="")? "":CalendarPicker1.Datazione.Text;  			
			_SCollection.Add(s_p_DataDa);

			S_Controls.Collections.S_Object s_p_DataA = new S_Controls.Collections.S_Object();
			s_p_DataA.ParameterName = "p_DataA";
			s_p_DataA.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataA.Direction = ParameterDirection.Input;
			s_p_DataA.Index = _SCollection.Count;
			s_p_DataA.Size= 10;
			s_p_DataA.Value = (CalendarPicker2.Datazione.Text =="")? "":CalendarPicker2.Datazione.Text;  			
			_SCollection.Add(s_p_DataA);

			S_Controls.Collections.S_Object s_p_Wo_Id = new S_Controls.Collections.S_Object();
			s_p_Wo_Id.ParameterName = "p_Wo_Id";
			s_p_Wo_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Wo_Id.Direction = ParameterDirection.Input;
			s_p_Wo_Id.Index = _SCollection.Count;
			s_p_Wo_Id.Size=50;
			s_p_Wo_Id.Value = (this.txtsOrdine.Text=="")?0:Int32.Parse(this.txtsOrdine.Text);		
			_SCollection.Add(s_p_Wo_Id);
			
			S_Controls.Collections.S_Object s_p_Servizio = new S_Controls.Collections.S_Object();
			s_p_Servizio.ParameterName = "p_ID_Servizio";
			s_p_Servizio.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Servizio.Direction = ParameterDirection.Input;
			s_p_Servizio.Index = _SCollection.Count;
			s_p_Servizio.Value = (cmbsServizio.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsServizio.SelectedValue);			
			_SCollection.Add(s_p_Servizio);

			S_Controls.Collections.S_Object s_p_Status = new S_Controls.Collections.S_Object();
			s_p_Status.ParameterName = "p_Status";
			s_p_Status.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Status.Direction = ParameterDirection.Input;
			s_p_Status.Index = _SCollection.Count;
			s_p_Status.Value = (cmbsStatus.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsStatus.SelectedValue);			
			_SCollection.Add(s_p_Status);

			S_Controls.Collections.S_Object s_p_Richiedente = new S_Controls.Collections.S_Object();
			s_p_Richiedente.ParameterName = "p_Richiedente";
			s_p_Richiedente.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Richiedente.Direction = ParameterDirection.Input;
			s_p_Richiedente.Index = _SCollection.Count;
			s_p_Richiedente.Size=50;
			s_p_Richiedente.Value = this.Richiedenti1.NomeCompleto;			
			_SCollection.Add(s_p_Richiedente);

			S_Controls.Collections.S_Object s_p_Priority = new S_Controls.Collections.S_Object();
			s_p_Priority.ParameterName = "p_Priority";
			s_p_Priority.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Priority.Direction = ParameterDirection.Input;
			s_p_Priority.Index = _SCollection.Count;
			s_p_Priority.Value = (cmbsUrgenza.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsUrgenza.SelectedValue);			
			_SCollection.Add(s_p_Priority);

			S_Controls.Collections.S_Object s_p_Descrizione = new S_Controls.Collections.S_Object();
			s_p_Descrizione.ParameterName = "p_Descrizione";
			s_p_Descrizione.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Descrizione.Direction = ParameterDirection.Input;
			s_p_Descrizione.Index = _SCollection.Count;
			s_p_Descrizione.Size= 255;
			s_p_Descrizione.Value = txtDescrizione.Text;			
			_SCollection.Add(s_p_Descrizione);

			S_Controls.Collections.S_Object s_p_Gruppo = new S_Controls.Collections.S_Object();
			s_p_Gruppo.ParameterName = "p_Gruppo";
			s_p_Gruppo.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Gruppo.Direction = ParameterDirection.Input;
			s_p_Gruppo.Index = _SCollection.Count;
			s_p_Gruppo.Value = (cmbsGruppo.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsGruppo.SelectedValue);			
			_SCollection.Add(s_p_Gruppo);
			
			S_Controls.Collections.S_Object s_p_idcontabilizzazione = new S_Controls.Collections.S_Object();
			s_p_idcontabilizzazione.ParameterName = "p_idcontabilizzazione";
			s_p_idcontabilizzazione.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idcontabilizzazione.Direction = ParameterDirection.Input;
			s_p_idcontabilizzazione.Index = _SCollection.Count;
			s_p_idcontabilizzazione.Value = Int32.Parse(cmbsTipoAttivita.SelectedValue);			
			_SCollection.Add(s_p_idcontabilizzazione);

			S_Controls.Collections.S_Object s_p_idtipomanutenzione = new S_Controls.Collections.S_Object();
			s_p_idtipomanutenzione.ParameterName = "p_idtipomanutenzione";
			s_p_idtipomanutenzione.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idtipomanutenzione.Direction = ParameterDirection.Input;
			s_p_idtipomanutenzione.Index = _SCollection.Count;
			s_p_idtipomanutenzione.Value = Int32.Parse(cmbsTipoManutenzione.SelectedValue);			
			_SCollection.Add(s_p_idtipomanutenzione);

			//CICCIO
			
			S_Controls.Collections.S_Object s_p_eq_id = new S_Controls.Collections.S_Object();
			s_p_eq_id.ParameterName = "p_eq_id";
			s_p_eq_id.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_eq_id.Direction = ParameterDirection.Input;
			//			s_p_eq_id.Size =8;
			s_p_eq_id.Index = _SCollection.Count;
			s_p_eq_id.Size =50;
			s_p_eq_id.Value = CodiceApparecchiature1.TextboxAppLabel.Text;
			///Aggiungo i parametri alla collection
			_SCollection.Add(s_p_eq_id);

			S_Controls.Collections.S_Object s_p_notecompletamento = new S_Controls.Collections.S_Object();
			s_p_notecompletamento.ParameterName = "p_notecompletamento";
			s_p_notecompletamento.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_notecompletamento.Direction = ParameterDirection.Input;
			//			s_p_eq_id.Size =8;
			s_p_notecompletamento.Index =  _SCollection.Count;
			s_p_notecompletamento.Size =255;
			s_p_notecompletamento.Value = S_NoteCompletamento.Text;
			///Aggiungo i parametri alla collection
			_SCollection.Add(s_p_notecompletamento);


			
			//			S_Controls.Collections.S_Object s_p_idmap = new S_Controls.Collections.S_Object();
			//			s_p_idmap.ParameterName = "p_idmap";
			//			s_p_idmap.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			//			s_p_idmap.Direction = ParameterDirection.Input;
			//			s_p_idmap.Index = 14;
			//			s_p_idmap.Value = Int32.Parse(cmbMAP.SelectedValue);			
			//			_SCollection.Add(s_p_idmap);


			return  _Richiesta.GetSfogliaRDLExcel3_rev_(_SCollection).Copy();		
		}

		
		#endregion

		private void DataGridRicerca2_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridRicerca2.CurrentPageIndex = e.NewPageIndex;			
			RicercaManRichiesta(false);
		
		}

		private void DataGridRicerca2_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			string varapp="";
			if(Request["VarApp"]!=null)
				varapp="&VarApp=" + Request["VarApp"];

			if((e.Item.ItemType == ListItemType.Item) ||
				(e.Item.ItemType == ListItemType.AlternatingItem))
			{ 
				ImageButton _img1 = (ImageButton) e.Item.Cells[1].FindControl("Imagebutton1");
				ImageButton _img3 = (ImageButton) e.Item.Cells[2].FindControl("Imagebutton3");
				ImageButton _imgCOR = (ImageButton) e.Item.Cells[14].FindControl("imgCostiRich");

				string appo2 ="CompletaRdl1.aspx?wr_id=' + DataBinder.Eval(Container.DataItem,'WR_ID')" + varapp;
				string appo="CompletaRdl1.aspx?wr_id=' + DataBinder.Eval(Container.DataItem,'WR_ID')" + varapp;
				

				string s_id_stato="1";
				if(e.Item.Cells[16].Text!= s_id_stato)
				{
					_img3.Visible = false;
					//_imgCOR.Visible = true;
			
				}
				if(e.Item.Cells[16].Text == "4")
				{
					_imgCOR.Visible = true;			
				}
				
				string descrizione="";
				//				string indirizzo="";
				//				string ditta="";
				
			
				_img1.Attributes.Add("title","Emetti o Completa Richiesta di Lavoro");	
				_img3.Attributes.Add("title", "Visualizza/Modifica Richiesta di Lavoro");
				_imgCOR.Attributes.Add("title", "Costi Operativi");


				//				if (e.Item.Cells[2].Text.Trim().Length > 20) 
				//				{
				//					indirizzo=e.Item.Cells[2].Text.Trim().Substring(0,18) + "..."; 
				//					e.Item.Cells[2].ToolTip=e.Item.Cells[2].Text;
				//					e.Item.Cells[2].Text=indirizzo;
				//				} 
				
				if (e.Item.Cells[14].Text.Trim().Length >20) 
				{
					descrizione=e.Item.Cells[14].Text.Trim().Substring(0,18) + "..."; 
					e.Item.Cells[14].ToolTip=e.Item.Cells[14].Text;
					e.Item.Cells[14].Text=descrizione;
				} 

				//				if (e.Item.Cells[5].Text.Trim().Length >12) 
				//				{
				//					ditta=e.Item.Cells[5].Text.Trim().Substring(0,10) + "..."; 
				//					e.Item.Cells[5].ToolTip=e.Item.Cells[5].Text;
				//					e.Item.Cells[5].Text=ditta;
				//				} 
							
			}
		
		}

		private void DataGridRicerca2_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			string varapp="";
			if(Request["VarApp"]!=null)
				varapp="&VarApp=" + Request["VarApp"];

			if (e.CommandName=="Modifica")
			{
				string s_url;
			
				_myColl.AddControl(this.Page.Controls,ParentType.WebControl );
					s_url = e.CommandArgument.ToString() + varapp;
				
				
				Server.Transfer(s_url);

			}
			
			if (e.CommandName=="Dettaglio")
			{		
				
				_myColl.AddControl(this.Page.Controls,ParentType.WebControl );

				string[] a_appoggio =e.CommandArgument.ToString().Split(Convert.ToChar(","));
				string s_tipomanutenzioneid=a_appoggio[0];
				string s_wr_id=a_appoggio[1];
				string s_wo_id=a_appoggio[2];
				string s_id_stato=a_appoggio[3];
				string s_url =GetPagina(s_tipomanutenzioneid,s_wr_id,s_wo_id,s_id_stato);
				Server.Transfer(s_url);
				
								
									
			}
		}

		private void cmbsServizio_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			BindApparecchiatura();
		}

			


	}
}