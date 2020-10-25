using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;
using MyCollection;

namespace TheSite.ManutenzioneCorrettiva
{
	/// <summary>
	/// Descrizione di riepilogo per Avvisi.
	/// </summary>
	public class Avvisi : System.Web.UI.Page
	{
		protected WebControls.GridTitle GridTitle1;	
		protected WebControls.PageTitle PageTitle1;
		protected System.Web.UI.WebControls.DataGrid DataGridRicerca;		

		public static int FunId = 0;
		protected S_Controls.S_TextBox txtDescrizione;		
		public static string HelpLink = string.Empty;

		protected S_Controls.S_TextBox txtsOrdSAV;
		protected S_Controls.S_ComboBox cmbsSpecializ;

		protected S_Controls.S_CheckBox chks_Attive;
		protected System.Web.UI.ControlCollection Controlli;
			
		MyCollection.clMyCollection _myColl = new MyCollection.clMyCollection();
		MyCollection.clMyCollection _myColl1 = new MyCollection.clMyCollection();

		ArrayList _myArray = new ArrayList();
		protected System.Web.UI.HtmlControls.HtmlInputHidden hiddenpinga;
		private string SortColum=String.Empty;
		protected System.Web.UI.HtmlControls.HtmlInputHidden hiddensort;
		protected string s_data;
		protected string s_ora;
		protected string s_minuti;
		protected int wr_id=0;
		protected int idlog=0;
		protected Csy.WebControls.DataPanel PanelRicerca;
		protected S_Controls.S_ComboBox cmbsArea;
		protected S_Controls.S_ComboBox cmbsStazione;
		protected S_Controls.S_TextBox txtsRdl;
		protected S_Controls.S_ComboBox cmbsAddetto;
		protected S_Controls.S_ComboBox cmbsIndice;
		protected S_Controls.S_TextBox txtsDaTel;
		protected S_Controls.S_TextBox txtsOrarioDA;
		protected S_Controls.S_TextBox txtsminDA;
		protected S_Controls.S_TextBox txtsOrarioA;
		protected S_Controls.S_TextBox txtsminA;
		protected System.Web.UI.WebControls.CompareValidator CompareValidator2;
		protected WebControls.CalendarPicker CalendarPicker3;
		protected WebControls.CalendarPicker CalendarPicker4;
		protected S_Controls.S_Button btnsRicerca;
		protected System.Web.UI.WebControls.Button cmdRep;		
		protected System.Web.UI.WebControls.Label lblTipoChiusura;
		protected System.Web.UI.WebControls.Label lblMinChiusura;
		protected S_Controls.S_TextBox txtsRichiesta;
		protected System.Web.UI.WebControls.TextBox txtSGA;
		protected S_Controls.S_ComboBox cmbsUrgenza;
		protected S_Controls.S_TextBox txtsSede;
		protected S_Controls.S_ComboBox cmbsPerc;
		protected System.Web.UI.HtmlControls.HtmlAnchor linkRefresh;
		protected System.Web.UI.WebControls.DropDownList CmbStato;
		protected WebControls.RicercaModulo RicercaModulo1;	
		protected System.Web.UI.WebControls.Image imgPerc;
		protected S_Controls.S_Button btnsReset;

		protected int id_progetto;
		

		private void Page_Load(object sender, System.EventArgs e)
		{								
		
			Page.GetPostBackEventReference(btnsRicerca); 
			
			Classi.SiteModule _SiteModule = (Classi.SiteModule) HttpContext.Current.Items["SiteModule"];
			FunId = _SiteModule.ModuleId;
			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = "Gestione RdL Aperte"; // _SiteModule.ModuleTitle;
			cmdRep.Attributes.Add("onclick","visualizzaReperibili('0','0')");
			cmbsPerc.Attributes.Add("onclick","cambiaImg(this.value)");
			ImpostaImgPerc();
			//Imposto la visibilità del progetto o il progetto selezionato			
			if(RicercaModulo1.cmbProgetto.SelectedValue!="")
				id_progetto=Int16.Parse(RicercaModulo1.cmbProgetto.SelectedValue);
			else
				id_progetto=0;

			if(!Page.IsPostBack)			
			{	
				linkRefresh.Visible=false;
				if(Request.QueryString["FunId"]!=null)
					ViewState["FunId"]=Request.QueryString["FunId"];				
				DataGridRicerca.Visible = false;				
				GridTitle1.hplsNuovo.Visible = false;
				GridTitle1.Visible =false;
				txtSGA.Text="";
				txtsRichiesta.Text="";
				txtsSede.Text="";								
				BindPerSla();
				BindStatus();		
				BindUrgenza(id_progetto);		
			}			
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
			this.btnsReset.Click += new System.EventHandler(this.btnsReset_Click);
		
			this.DataGridRicerca.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridRicerca_ItemCommand);
			this.DataGridRicerca.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridRicerca_PageIndexChanged);
			this.DataGridRicerca.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.DataGridRicerca_SortCommand);
			this.DataGridRicerca.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicerca_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnsRicerca_Click(object sender, System.EventArgs e)
		{			    
			Ricerca();		
		}

		private void BindStatus()
		{
			this.CmbStato.Items.Clear();
		
			Classi.ManCorrettiva.Avvisi  _Avvisi = new Classi.ManCorrettiva.Avvisi();
						
			DataSet Ds = _Avvisi.GetStatusAperte();
		
			if (Ds.Tables[0].Rows.Count > 0)
			{
				this.CmbStato.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					Ds.Tables[0], "DESCRIZIONE", "ID", "- Selezionare uno Stato -", "");
				this.CmbStato.DataTextField = "DESCRIZIONE";
				this.CmbStato.DataValueField = "ID";
				this.CmbStato.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessun Stato -";
				this.CmbStato.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
			}
		}
		private void BindUrgenza(int id_progetto)
		{
			Classi.ManCorrettiva.Avvisi  _Avvisi = new Classi.ManCorrettiva.Avvisi();
			DataSet ds =  _Avvisi.GetPrioritaUrgenti(id_progetto);
			this.cmbsUrgenza.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
				ds.Tables[0], "DESCRIPTION", "id", "- Selezionare una Urgenza -", "0");
			this.cmbsUrgenza.DataTextField = "DESCRIPTION";
			this.cmbsUrgenza.DataValueField = "ID";
			this.cmbsUrgenza.DataBind();			
		}

	
		private void BindPerSla()
		{	
			cmbsPerc.Items.Add(new ListItem("-- Tutti --","0"));			
			cmbsPerc.Items.Add(new ListItem("da 0 a 33%","1"));
			cmbsPerc.Items.Add(new ListItem("da 34 a 66%","2"));
			cmbsPerc.Items.Add(new ListItem("da 67 a 100%","3"));
			cmbsPerc.Items.Add(new ListItem("oltre 100%","4"));			
		}

		private void Ricerca()
		{			
			Classi.ManCorrettiva.Avvisi  _Avvisi = new Classi.ManCorrettiva.Avvisi();
			S_ControlsCollection _SCollection = new S_ControlsCollection();			
		
			S_Controls.Collections.S_Object p_progetto = new S_Controls.Collections.S_Object();
			p_progetto.ParameterName = "p_progetto";
			p_progetto.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			p_progetto.Direction = ParameterDirection.Input;
			p_progetto.Index = _SCollection.Count;
			p_progetto.Size=10;
			p_progetto.Value = id_progetto;			
//			if(RicercaModulo1.cmbProgetto.SelectedValue!="")				
//				p_progetto.Value = Int16.Parse(RicercaModulo1.cmbProgetto.SelectedValue);	
//			else
//				p_progetto.Value =0;
			_SCollection.Add(p_progetto);			

			S_Controls.Collections.S_Object p_Wr_Id= new S_Controls.Collections.S_Object();
			p_Wr_Id.ParameterName = "p_Wr_Id";
			p_Wr_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			p_Wr_Id.Direction = ParameterDirection.Input;
			p_Wr_Id.Index =  _SCollection.Count;
			p_Wr_Id.Size=10;
			p_Wr_Id.Value = txtsRichiesta.Text.Trim();
			_SCollection.Add(p_Wr_Id);
			
			S_Controls.Collections.S_Object p_Codice_SGA= new S_Controls.Collections.S_Object();
			p_Codice_SGA.ParameterName = "p_Codice_SGA";
			p_Codice_SGA.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			p_Codice_SGA.Direction = ParameterDirection.Input;
			p_Codice_SGA.Index =  _SCollection.Count;
			p_Codice_SGA.Size=10;
			p_Codice_SGA.Value = txtSGA.Text.Trim();
			_SCollection.Add(p_Codice_SGA);

			S_Controls.Collections.S_Object s_p_Priority = new S_Controls.Collections.S_Object();
			s_p_Priority.ParameterName = "p_Priority";
			s_p_Priority.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_Priority.Direction = ParameterDirection.Input;
			s_p_Priority.Index =  _SCollection.Count;
			s_p_Priority.Value = (cmbsUrgenza.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsUrgenza.SelectedValue);			
			_SCollection.Add(s_p_Priority);

			S_Controls.Collections.S_Object p_Sede= new S_Controls.Collections.S_Object();
			p_Sede.ParameterName = "p_Sede";
			p_Sede.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			p_Sede.Direction = ParameterDirection.Input;
			p_Sede.Index =  _SCollection.Count;
			p_Sede.Size=10;
			p_Sede.Value = txtsSede.Text.Trim();
			_SCollection.Add(p_Sede);

			S_Controls.Collections.S_Object p_percSla = new S_Controls.Collections.S_Object();
			p_percSla.ParameterName = "p_percSla";
			p_percSla.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			p_percSla.Direction = ParameterDirection.Input;
			p_Sede.Index =  _SCollection.Count;
			p_percSla.Value = (cmbsPerc.SelectedValue ==string.Empty)? 0:Int32.Parse(cmbsPerc.SelectedValue);			
			_SCollection.Add(p_percSla);

			S_Controls.Collections.S_Object s_p_Bl_Id = new S_Controls.Collections.S_Object();
			s_p_Bl_Id.ParameterName = "P_bl_id";
			s_p_Bl_Id.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_Bl_Id.Direction = ParameterDirection.Input;
			s_p_Bl_Id.Size =50;
			p_Sede.Index =  _SCollection.Count;
			s_p_Bl_Id.Value = RicercaModulo1.TxtCodice.Text;
			_SCollection.Add(s_p_Bl_Id);

			S_Controls.Collections.S_Object p_id_stato = new S_Controls.Collections.S_Object();
			p_id_stato.ParameterName = "p_id_stato";
			p_id_stato.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			p_id_stato.Direction = ParameterDirection.Input;
			p_id_stato.Index =  _SCollection.Count;
			p_id_stato.Value = (CmbStato.SelectedValue ==string.Empty)? 0:Int32.Parse(CmbStato.SelectedValue);			
			_SCollection.Add(p_id_stato);
			
			DataSet _MyDs = _Avvisi.GetData(_SCollection).Copy();		
			//DataSet _MyDs = _Avvisi.GetData().Copy();		
			if(SortColum!=string.Empty)
			{
				DataView dv=_MyDs.Tables[0].DefaultView;
				dv.Sort=SortColum;
				this.DataGridRicerca.DataSource=dv;
			}
			else
				this.DataGridRicerca.DataSource = _MyDs.Tables[0];

			DataGridRicerca.Visible = true;
			GridTitle1.Visible =true;
			if (_MyDs.Tables[0].Rows.Count == 0 )
			{					
				DataGridRicerca.CurrentPageIndex=0;
				GridTitle1.DescriptionTitle="Nessun dato trovato.";
				hiddenpinga.Value="0";
				linkRefresh.Visible=false;
			}
			else
			{
				linkRefresh.Visible=true;
				hiddenpinga.Value="1";
				GridTitle1.DescriptionTitle=""; 
				int Pagina = 0;
				if ((_MyDs.Tables[0].Rows.Count % DataGridRicerca.PageSize) >0)
				{
					Pagina ++;
				}
				if (DataGridRicerca.PageCount != Convert.ToInt16((_MyDs.Tables[0].Rows.Count / DataGridRicerca.PageSize) + Pagina))
				{					
					DataGridRicerca.CurrentPageIndex=0;					
				}
			}
			
			this.DataGridRicerca.DataBind();
			
			this.GridTitle1.NumeroRecords = _MyDs.Tables[0].Rows.Count.ToString();	
		}
		
		private void DataGridRicerca_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridRicerca.CurrentPageIndex = e.NewPageIndex;			
			Ricerca();
		}

		private void DataGridRicerca_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{			
			if((e.Item.ItemType == ListItemType.Item) ||
				(e.Item.ItemType == ListItemType.AlternatingItem))
			{ 
							
				//Imposto la chiamata alla pagina dell reperibilità addetti
				string wr_id=e.Item.Cells[21].Text;
				string bl_id=e.Item.Cells[7].Text;
				System.Web.UI.WebControls.Image _imgAddetto=(System.Web.UI.WebControls.Image)e.Item.FindControl("imageCall");
				_imgAddetto.Attributes.Add("title","Visualizza gli addetti reperibili per l'edificio:" + bl_id);
				_imgAddetto.Attributes.Add("onclick","visualizzaReperibili('" + bl_id + "')");
				
				e.Item.Cells[5].ToolTip="Visualizza Rdl";
				
				//nascondo le immagini della scadenza degli avvisi
				
				
				System.Web.UI.WebControls.Image _img5=(System.Web.UI.WebControls.Image)e.Item.FindControl("Img5min");
				System.Web.UI.WebControls.Image _img10=(System.Web.UI.WebControls.Image)e.Item.FindControl("Img10min");
				System.Web.UI.WebControls.Image _img15=(System.Web.UI.WebControls.Image)e.Item.FindControl("Img15min");
				System.Web.UI.WebControls.Image _imgp15=(System.Web.UI.WebControls.Image)e.Item.FindControl("Img15pmin");
				System.Web.UI.WebControls.Image _imgchiudi=(System.Web.UI.WebControls.Image)e.Item.FindControl("ImgChiudi");

				_img5.Visible=false;
				_img10.Visible=false;
				_img15.Visible=false;
				_imgp15.Visible=false;
				_imgchiudi.Visible=false;
				
				string tooltip=" * " + e.Item.Cells[18].Text + " * " + "\n" + e.Item.Cells[19].Text;
				tooltip=System.Web.HttpUtility.HtmlDecode(tooltip);
				// Imposto il tooltip all'immagine della e-mail
				System.Web.UI.WebControls.Image _imgEmail=(System.Web.UI.WebControls.Image)e.Item.FindControl("ImageB1");
				_imgEmail.ToolTip=tooltip;
				switch(e.Item.Cells[15].Text.Trim())
				{         
					case "1":   
						_img5.Visible=true;
						_img5.ToolTip=tooltip;
						e.Item.Cells[16].ToolTip="0-33%";
						break;                  
					case "2":            
						_img10.Visible=true;
						_img10.ToolTip=tooltip;
						e.Item.Cells[16].ToolTip="34-66%";
						break;   
					case "3":            
						_img15.Visible=true;
						_img15.ToolTip=tooltip;
						e.Item.Cells[16].ToolTip="67-100%";
						break;
					case "4":            
						_imgchiudi.Visible=true;
						_imgchiudi.ToolTip=tooltip;
						e.Item.Cells[16].ToolTip="oltre 100%";
						break;
					default: 
						_img5.Visible=false;
						_img10.Visible=false;
						_img15.Visible=false;
						_imgp15.Visible=false;
						_imgchiudi.Visible=false;
						break;
				}
			 }
		}

		private void cmdReset_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("Avvisi.aspx?FunID=" + ViewState["FunId"] + "&Reset=true");
		}
		
		private void DataGridRicerca_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName=="Dettaglio")
			{				
				//_myColl.AddControl(this.Page.Controls, ParentType.Page);
				string s_url = e.CommandArgument.ToString();
				Server.Transfer(s_url);	
			}
			//Ricerca();		
		}

		private void DataGridRicerca_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
		{
			if(hiddensort.Value==e.SortExpression +" asc")
				hiddensort.Value= e.SortExpression +" desc";
			else
				hiddensort.Value= e.SortExpression +" asc";

			SortColum=hiddensort.Value;
			Ricerca();
		}
		private void ImpostaImgPerc()
		{			
			switch (cmbsPerc.SelectedValue)
			{			
				case "1": //da 0 a 33%			    
					imgPerc.ImageUrl="../Images/semaforo_verde.png";						
					break;
				case "2": //da 34 a 66%			    
					imgPerc.ImageUrl="../Images/semaforo_azzurro.png";						
					break;
				case "3": //da 67 a 100%			    
					imgPerc.ImageUrl="../Images/semaforo_giallo.png";						
					break;
				case "4": //oltre 100%
					imgPerc.ImageUrl="../Images/semaforo_rosso.png";						
					break;
				default: //tutti
					imgPerc.ImageUrl="../Images/collapse.gif";						
					break;				
			}		
		}

		private void btnsReset_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("Avvisi.aspx?FunID=" + ViewState["FunId"]);
		}

		
	}
}
