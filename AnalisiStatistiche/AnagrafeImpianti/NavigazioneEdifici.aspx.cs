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
using TheSite.Classi.ClassiDettaglio;
using MyCollection; 
   
namespace TheSite.AnagrafeImpianti
{
	/// <summary>
	/// Descrizione di riepilogo per NavigazioneApparechiature.
	/// </summary>
	public class NavigazioneEdifici : System.Web.UI.Page
	{
		protected  System.Web.UI.WebControls.DataGrid MyDataGrid1;
		protected WebControls.GridTitle GridTitle1;
		protected WebControls.RicercaModulo RicercaModulo1;
		protected Csy.WebControls.DataPanel PanelRicerca;
		protected WebControls.PageTitle PageTitle1;
		protected System.Web.UI.HtmlControls.HtmlInputHidden hiddenblid;
		public static int FunId = 0;				
		public static string HelpLink = string.Empty;
		
		MyCollection.clMyCollection _myColl = new MyCollection.clMyCollection();
		protected Microsoft.Web.UI.WebControls.TabStrip TabStrip1;
		protected S_Controls.S_ComboBox cmbsPiano;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvEdificio;
		protected System.Web.UI.WebControls.ValidationSummary vlsEdit;
		protected S_Controls.S_Button S_btMostra;
		protected S_Controls.S_Button btReset;
		protected S_Controls.S_Button S_Button1;
		protected System.Web.UI.WebControls.Button BtExport;
		protected System.Web.UI.WebControls.DropDownList DrTipoRep;
		protected System.Web.UI.WebControls.TextBox TxtUso;

		
		RichiesteApparecchiatura  _fp=null;

		public MyCollection.clMyCollection _Contenitore
		{
			get {return _myColl;}
		}

		private void Page_Load(object sender, System.EventArgs e)
		{
			Classi.SiteModule _SiteModule = (Classi.SiteModule) HttpContext.Current.Items["SiteModule"];

			FunId = _SiteModule.ModuleId;
			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = _SiteModule.ModuleTitle;				
			
			// Inserire qui il codice utente necessario per inizializzare la pagina.
			//			RicercaModulo1.DelegateIDBLEdificio1  +=new  WebControls.DelegateIDBLEdificio(this.BindBl);
			RicercaModulo1.DelegateIDBLEdificio1  +=new  WebControls.DelegateIDBLEdificio(this.BindPiano);	
			// Inserire qui il codice utente necessario per inizializzare la pagina.
			// Le seguenti due istruzioni compiono la stessa funzione, ossia recuperare del controllo il codice
			//dell'edificio la seconda fa uso del delegante che è Piu Performante
			//Console.WriteLine( ((S_Controls.S_TextBox)RicercaModulo1.FindControl("txtsCodEdificio")).Text);
			
			

			

			System.Text.StringBuilder sbValid = new System.Text.StringBuilder();
			

			if (!IsPostBack) 
			{
				rfvEdificio.ControlToValidate= RicercaModulo1.ID + ":" + RicercaModulo1.TxtCodice.ID;

				if(Request.QueryString["FunId"]!=null)
					ViewState["FunId"]=Request.QueryString["FunId"];

				
				BindTuttiPiani();
				//		BindStanza();
				setvisiblecontrol(false);
				GridTitle1.Visible = false;
				
				//Valorizzo i Parametri Immessi
				if(Context.Handler is TheSite.AnagrafeImpianti.RichiesteApparecchiatura)
				{
					_fp = (TheSite.AnagrafeImpianti.RichiesteApparecchiatura)Context.Handler;
					
					
					BindTuttiPiani();
					//			BindStanza();
					
					if (_fp!=null) 
					{						
						_myColl=_fp._Contenitore;
						_myColl.SetValues(this.Page.Controls);		
						Execute(true);
					}
				}

			}
			else
			{
				//				if(RicercaModulo1.BlId=="" && RicercaModulo1.Campus!="") BindServizio("");
				//				BindApparecchiatura();
			}
			GridTitle1.hplsNuovo.Visible=false;
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
			this.MyDataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MyDataGrid1_PageIndexChanged);
			this.MyDataGrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MyDataGrid1_ItemDataBound);
			this.S_btMostra.Click += new System.EventHandler(this.S_btMostra_Click);
			this.S_Button1.Click += new System.EventHandler(this.S_Button1_Click);
			this.BtExport.Click += new System.EventHandler(this.BtExport_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		
		/// <summary>
		/// Ottiene imposta la visibilità della griglia e dell'ogetto title
		/// </summary>
		/// <param name="Visibile"> indica true di renderli visibili</param>
		private void setvisiblecontrol(bool Visibile)
		{
			GridTitle1.VisibleRecord=Visibile;
			GridTitle1.hplsNuovo.Visible =false;
			MyDataGrid1.Visible = Visibile;
		}

		private void S_btMostra_Click(object sender, System.EventArgs e)
		{
			MyDataGrid1.CurrentPageIndex = 0;
			Execute(true);
		}



	

		private S_Controls.Collections.S_ControlsCollection GetDatistanza()
		{
			///Istanzio un nuovo oggetto Collection per aggiungere i parametri
			S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();
			///creo i parametri
		
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
			///Aggiungo i parametri alla collection
			_SCollection.Add(s_p_campus);

			
			
			S_Controls.Collections.S_Object s_p_idpiano = new S_Controls.Collections.S_Object();
			s_p_idpiano.ParameterName = "p_idpiano";
			s_p_idpiano.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_idpiano.Direction = ParameterDirection.Input;
			s_p_idpiano.Size =10;
			s_p_idpiano.Index = 2;
			s_p_idpiano.Value = (cmbsPiano.SelectedValue==string.Empty)? 0:Int32.Parse(cmbsPiano.SelectedValue);
			_SCollection.Add(s_p_idpiano);

			S_Controls.Collections.S_Object s_p_uso = new S_Controls.Collections.S_Object();
			s_p_uso.ParameterName = "p_uso";
			s_p_uso.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_uso.Direction = ParameterDirection.Input;
			s_p_uso.Index = 3;
			s_p_uso.Size=100;
			s_p_uso.Value = TxtUso.Text;
			///Aggiungo i parametri alla collection
			_SCollection.Add(s_p_uso);
			


			return _SCollection;
		}

		private void Execute(bool reset)
		{
			///Istanzio la Classe per eseguire la Strore Procedure
			Classi.ClassiAnagrafiche.Buildings  _Buildings =new Classi.ClassiAnagrafiche.Buildings();
			S_Controls.Collections.S_ControlsCollection _SCollection =GetDatistanza();

			
			S_Controls.Collections.S_Object s_p_pageindex = new S_Object();
			s_p_pageindex.ParameterName = "pageindex";
			s_p_pageindex.DbType = CustomDBType.Integer;
			s_p_pageindex.Direction = ParameterDirection.Input;
			s_p_pageindex.Index = _SCollection.Count ;
			s_p_pageindex.Value=MyDataGrid1.CurrentPageIndex+1;			
			_SCollection.Add(s_p_pageindex);

			S_Controls.Collections.S_Object s_p_pagesize = new S_Object();
			s_p_pagesize.ParameterName = "pagesize";
			s_p_pagesize.DbType = CustomDBType.Integer;
			s_p_pagesize.Direction = ParameterDirection.Input;
			s_p_pagesize.Index = _SCollection.Count;
			s_p_pagesize.Value= MyDataGrid1.PageSize;			
			_SCollection.Add(s_p_pagesize);

			DataSet Ds = _Buildings.GetDataStanze(_SCollection).Copy();

		
			GridTitle1.Visible = true;

			if (reset==true)
			{
				_SCollection =GetDatistanza();
				int _totalRecords = _Buildings.GetDataStanzeCount(_SCollection);
				this.GridTitle1.NumeroRecords=_totalRecords.ToString();
			}
			MyDataGrid1.DataSource =Ds.Tables[0];
			this.MyDataGrid1.VirtualItemCount =int.Parse(this.GridTitle1.NumeroRecords);
			this.MyDataGrid1.DataBind();

			if (int.Parse(this.GridTitle1.NumeroRecords) > 0) 
			{
				setvisiblecontrol(true);
				GridTitle1.DescriptionTitle="";
			}
			else
			{
				GridTitle1.DescriptionTitle="Nessun dato trovato.";
				setvisiblecontrol(false);
			}
		}

		private void MyDataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			///Imposto la Nuova Pagina
			MyDataGrid1.CurrentPageIndex=e.NewPageIndex;
			Execute(false);
		}

		private void btReset_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("NavigazioneEdifici.aspx?FunId=" + ViewState["FunId"]); 
		}

		private void MyDataGrid1_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if((e.Item.ItemType == ListItemType.Item) ||
				(e.Item.ItemType == ListItemType.AlternatingItem))
			{
								
			}
		}
		private void BindPiano(string CodEdificio)
		{	
			//this.cmbsStanza.Enabled=false;

			this.cmbsPiano.Items.Clear();
		
			if (CodEdificio=="")
			{
				CodEdificio="0";
			}
			Classi.ClassiAnagrafiche.Buildings _Buildings = new TheSite.Classi.ClassiAnagrafiche.Buildings();
			
			DataSet	_MyDs = _Buildings.GetPianiBuilding(int.Parse(CodEdificio));

			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsPiano.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "DESCRIZIONE", "ID", "- Selezionare il Piano -", "");
				this.cmbsPiano.DataTextField = "DESCRIZIONE";
				this.cmbsPiano.DataValueField = "ID";
				this.cmbsPiano.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessun Piano -";
				this.cmbsPiano.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
			}
			this.cmbsPiano.Enabled=true;
			
			//		this.cmbsStanza.Enabled=true;
			
		}

		private void BindTuttiPiani()
		{
			this.cmbsPiano.Items.Clear();
		
			TheSite.Classi.ClassiAnagrafiche.Buildings  _Buildings = new TheSite.Classi.ClassiAnagrafiche.Buildings();
			
			DataSet	_MyDs = _Buildings.GetAllPiani();

			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsPiano.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "DESCRIZIONE", "ID", "- Selezionare il Piano -", "");
				this.cmbsPiano.DataTextField = "DESCRIZIONE";
				this.cmbsPiano.DataValueField = "ID";
				this.cmbsPiano.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessun Piano -";
				this.cmbsPiano.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
			}
		}

		private void S_Button1_Click(object sender, System.EventArgs e)
		{
			//esporta in excel
			Csy.WebControls.Export 	_objExport = new Csy.WebControls.Export();
			DataTable _dt = new DataTable();	
		
			Classi.ClassiAnagrafiche.Buildings  _Buildings =new Classi.ClassiAnagrafiche.Buildings();
			S_Controls.Collections.S_ControlsCollection _SCollection =GetDatistanza();


			DataSet Ds = _Buildings.GetDataStanzeExcel(_SCollection).Copy();
			
			_dt =Ds.Tables[0].Copy();
				
			if (_dt.Rows.Count > 65536)
			{
				String scriptString = "<script language=JavaScript>alert('I record trovati sono in numero maggiore di 65536 e non possono entrare in un solo foglio excel. Impostare filtri più restrittivi');";
				scriptString += "<";
				scriptString += "/";
				scriptString += "script>";

				if(!this.IsClientScriptBlockRegistered("clientScriptexp"))
					this.RegisterStartupScript ("clientScriptexp", scriptString);
			} 
			else 
			{
			
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
		}

		private void BtExport_Click(object sender, System.EventArgs e)
		{
			Csy.WebControls.Export 	_objExport = new Csy.WebControls.Export();
			DataTable _dt = new DataTable();	
			Classi.ClassiAnagrafiche.Buildings  _Buildings =new Classi.ClassiAnagrafiche.Buildings();
			

			int bl_id=0;
			if (RicercaModulo1._txthidbl.Value !="")
				bl_id=int.Parse(RicercaModulo1._txthidbl.Value);

			DataSet Ds = _Buildings.GetReport(int.Parse(DrTipoRep.SelectedValue),bl_id);
			
			_dt =Ds.Tables[0].Copy();
				
			if (_dt.Rows.Count > 65536)
			{
				String scriptString = "<script language=JavaScript>alert('I record trovati sono in numero maggiore di 65536 e non possono entrare in un solo foglio excel. Impostare filtri più restrittivi');";
				scriptString += "<";
				scriptString += "/";
				scriptString += "script>";

				if(!this.IsClientScriptBlockRegistered("clientScriptexp"))
					this.RegisterStartupScript ("clientScriptexp", scriptString);
			} 
			else 
			{
			
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
		}

		private string IDBL
		{
			get{return hiddenblid.Value;}
			set{hiddenblid.Value =value;}
		}

	}
}
