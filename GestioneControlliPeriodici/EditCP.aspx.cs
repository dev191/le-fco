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

namespace TheSite.GestioneControlliPeriodici
{
	/// <summary>
	/// Descrizione di riepilogo per EditDitte.
	/// </summary>
	public class EditCP : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Panel PanelEdit;
		protected System.Web.UI.WebControls.Button btnAnnulla;
		protected System.Web.UI.WebControls.Label lblFirstAndLast;
		protected System.Web.UI.WebControls.ValidationSummary vlsEdit;
		protected WebControls.PageTitle PageTitle1;
		public static string HelpLink = string.Empty;
		int itemId = 0;
		int FunId = 0;		
		
		protected Csy.WebControls.MessagePanel PanelMess;
		protected WebControls.CalendarPicker CalendarPicker1;
		protected WebControls.CalendarPicker CalendarPicker2;
		protected WebControls.CalendarPicker CalendarPicker3;
		protected WebControls.CalendarPicker CalendarPicker4;
		protected S_Controls.S_TextBox txtsCP;
		protected S_Controls.S_TextBox txtsNoteCompletamento;
		protected System.Web.UI.WebControls.Label LblRdl;
		protected System.Web.UI.WebControls.Label lblOdl;
		protected System.Web.UI.WebControls.Label lblFreq;
		protected S_Controls.S_Button btnSalva;
		protected S_Controls.S_ComboBox cmbsstatolavoro;
		protected S_Controls.S_ComboBox cmbsAddetto;
		public Classi.ManCorrettiva.ClManCorrettiva _ClManCorrettiva;
		sfogliaCP _fp;
			
	
		private void Page_Load(object sender, System.EventArgs e)
		{			
			
			PageTitle1.Title="Completamento Controlli Periodici";
			_ClManCorrettiva=new TheSite.Classi.ManCorrettiva.ClManCorrettiva();
			FunId = Int32.Parse(Request["FunId"]);			
			cmbsstatolavoro.Enabled=true;
			if (Request["ItemID"] != null) 
			{
				itemId = Int32.Parse(Request["ItemID"]);				
			}

			if (!Page.IsPostBack )
			{	
							
								
				//Classi.ClassiAnagrafiche.Ditte _Ditte = new TheSite.Classi.ClassiAnagrafiche.Ditte();

				
				Classi.GestioneCP.SfogliaRdlOdl _GCP = new TheSite.Classi.GestioneCP.SfogliaRdlOdl(HttpContext.Current.User.ToString());
		
				DataSet _MyDs = _GCP.GETWRCP(itemId).Copy();	
					
				if (_MyDs.Tables[0].Rows.Count == 1)
				{					
					DataRow _Dr = _MyDs.Tables[0].Rows[0];
						
					this.lblOdl.Text= _Dr["id_wo_cp"].ToString();
					this.LblRdl.Text=_Dr["id_wr_cp"].ToString();
					//descrizione CP
					this.txtsCP.Text= _Dr["cp"].ToString();
					this.lblFreq.Text=_Dr["frequenza"].ToString();
					
					//Data Prevista Inizio Lavori
					if(_Dr["data_inizio_prevista"] != DBNull.Value)
						CalendarPicker1.Datazione.Text =  _Dr["data_inizio_prevista"].ToString();
					//Data Prevista Fine Lavori
					if(_Dr["data_fine_prevista"] != DBNull.Value)
						CalendarPicker2.Datazione.Text =  _Dr["data_fine_prevista"].ToString();
					LoadAddettiDitta(_Dr["bl_id"].ToString(),Int32.Parse(_Dr["ditta_id"].ToString()),Int32.Parse(_Dr["id_servizio"].ToString()));
					if (_Dr["addetto_id"] != DBNull.Value)
						this.cmbsAddetto.SelectedValue=_Dr["addetto_id"].ToString();
					//Data  Inizio Lavori
					if(_Dr["data_completamento_inizio"] != DBNull.Value)
						CalendarPicker3.Datazione.Text =  _Dr["data_completamento_inizio"].ToString();
					//Data  Fine Lavori
					if(_Dr["data_completamento_fine"] != DBNull.Value)
						CalendarPicker4.Datazione.Text =  _Dr["data_completamento_fine"].ToString();
					if (_Dr["note_completamento"]!= DBNull.Value)
						this.txtsNoteCompletamento.Text=(string) _Dr["note_completamento"];
					LoadStatoLavoro();
					cmbsstatolavoro.SelectedValue=_Dr["id_stato_richiesta"].ToString();
					if (cmbsstatolavoro.SelectedValue=="4")
						cmbsstatolavoro.Enabled=false;
				}

						
			
			ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
			if(Context.Handler is TheSite.GestioneControlliPeriodici.sfogliaCP) 
			{
				_fp = (TheSite.GestioneControlliPeriodici.sfogliaCP) Context.Handler;
				this.ViewState.Add("mioContenitore",_fp._Contenitore); 
			}	

		}
		}

		public MyCollection.clMyCollection _Contenitore
		{ 
			get 
			{
				if(this.ViewState["mioContenitore"]!=null)
					return (MyCollection.clMyCollection)this.ViewState["mioContenitore"];
				else
					return new MyCollection.clMyCollection();
			}
		}

		#region FunzioniInterne
		private void LoadAddettiDitta(string bl_id,int ditta_id, int servizi_id)
		{	
			this.cmbsAddetto.Items.Clear();				
			
			
			DataSet _MyDs;

			_MyDs = _ClManCorrettiva.GetAddetti("",bl_id,ditta_id,servizi_id);
			

			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsAddetto.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "NOMINATIVO", "ID", "- Selezionare un Addetto -", "0");
				this.cmbsAddetto.DataTextField = "NOMINATIVO";
				this.cmbsAddetto.DataValueField = "ID";
				this.cmbsAddetto.DataBind();
			}
			else
			{
				string s_Messagggio = "- Nessun Addetto  -";
				this.cmbsAddetto.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, "0"));
			}
		
		}
		
		private void LoadStatoLavoro()
		{
			this.cmbsstatolavoro.Items.Clear();		
		    

			DataSet _MyDs = _ClManCorrettiva.GetStatoLavoro();

			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsstatolavoro.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "descrizione", "id", "- Selezionare lo Stato di Lavoro  -", "");
				this.cmbsstatolavoro.DataTextField = "descrizione";
				this.cmbsstatolavoro.DataValueField = "id";
				this.cmbsstatolavoro.DataBind();          

			//this.cmbsstatolavoro.Attributes.Add("onchange","SetStato(this.value);");

			}
			else
			{
				string s_Messagggio = "- Nessuno Stato di Lavoro  -";
				this.cmbsstatolavoro.Items.Add(Classi.GestoreDropDownList.ItemMessaggio(s_Messagggio, String.Empty));
			}
		}
	
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
			this.btnSalva.Click += new System.EventHandler(this.btnSalva_Click);
			this.btnAnnulla.Click += new System.EventHandler(this.btnAnnulla_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

	
//		private void btnsSalva_Click(object sender, System.EventArgs e)
//		{			
//			
//			Classi.GestioneCP.CompletamentoCP _CCP = new TheSite.Classi.GestioneCP.CompletamentoCP();
//			int i_RowsAffected = 0;
//			S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();
//			//_SCollection.AddItems(this.PanelEdit.Controls);
//		
//			
//			S_Object p_id_wr_cp = new S_Object();
//			p_id_wr_cp.ParameterName = "p_id_wr_cp";
//			p_id_wr_cp.DbType = CustomDBType.Integer;
//			p_id_wr_cp.Direction = ParameterDirection.Input;
//			p_id_wr_cp.Index = i_RowsAffected;
//			p_id_wr_cp.Size = 100;
//			p_id_wr_cp.Value = Int32.Parse(LblRdl.Text);
//			_SCollection.Add(p_id_wr_cp);
//			
//			S_Object p_data_inizio_prevista = new S_Object();
//			p_data_inizio_prevista.ParameterName = "p_data_inizio_prevista";
//			p_data_inizio_prevista.DbType = CustomDBType.VarChar;
//			p_data_inizio_prevista.Direction = ParameterDirection.Input;
//			p_data_inizio_prevista.Index = i_RowsAffected++;
//			p_data_inizio_prevista.Size=255;
//			p_data_inizio_prevista.Value = CalendarPicker1.Datazione.Text;
//			_SCollection.Add(p_data_inizio_prevista);
//
//
//			S_Object p_data_fine_prevista = new S_Object();
//			p_data_fine_prevista.ParameterName = "p_data_fine_prevista";
//			p_data_fine_prevista.DbType = CustomDBType.VarChar;
//			p_data_fine_prevista.Direction = ParameterDirection.Input;
//			p_data_fine_prevista.Index = i_RowsAffected++;
//			p_data_fine_prevista.Size=255;
//			p_data_fine_prevista.Value = CalendarPicker2.Datazione.Text;
//			_SCollection.Add(p_data_fine_prevista);
//
//			S_Object p_data_completamento_inizio = new S_Object();
//			p_data_completamento_inizio.ParameterName = "p_data_completamento_inizio";
//			p_data_completamento_inizio.DbType = CustomDBType.VarChar;
//			p_data_completamento_inizio.Direction = ParameterDirection.Input;
//			p_data_completamento_inizio.Index = i_RowsAffected++;
//			p_data_completamento_inizio.Size=255;
//			p_data_completamento_inizio.Value = CalendarPicker3.Datazione.Text;
//			_SCollection.Add(p_data_completamento_inizio);
//
//			S_Object p_data_completamento_fine = new S_Object();
//			p_data_completamento_fine.ParameterName = "p_data_completamento_fine";
//			p_data_completamento_fine.DbType = CustomDBType.VarChar;
//			p_data_completamento_fine.Direction = ParameterDirection.Input;
//			p_data_completamento_fine.Index = i_RowsAffected++;
//			p_data_completamento_fine.Size=255;
//			p_data_completamento_fine.Value = CalendarPicker4.Datazione.Text;
//			_SCollection.Add(p_data_completamento_fine);
//			
//			S_Object p_addetto_id = new S_Object();
//			p_addetto_id.ParameterName = "p_addetto_id";
//			p_addetto_id.DbType = CustomDBType.Integer;
//			p_addetto_id.Direction = ParameterDirection.Input;
//			p_addetto_id.Index = i_RowsAffected++;
//			p_addetto_id.Size = 100;
//			p_addetto_id.Value = Convert.ToInt32(cmbsAddetto.SelectedValue);
//			_SCollection.Add(p_addetto_id);
//
//			
//			S_Object p_id_stato_richiesta = new S_Object();
//			p_id_stato_richiesta.ParameterName = "p_id_stato_richiesta";
//			p_id_stato_richiesta.DbType = CustomDBType.Integer;
//			p_id_stato_richiesta.Direction = ParameterDirection.Input;
//			p_id_stato_richiesta.Index = i_RowsAffected++;
//			p_id_stato_richiesta.Size = 100;
//			p_id_stato_richiesta.Value = Convert.ToInt32(cmbsstatolavoro.SelectedValue);
//			_SCollection.Add(p_id_stato_richiesta);
//
//
//			S_Object p_note_completamento = new S_Object();
//			p_note_completamento.ParameterName = "p_note_completamento";
//			p_note_completamento.DbType = CustomDBType.VarChar;
//			p_note_completamento.Direction = ParameterDirection.Input;
//			p_note_completamento.Index = i_RowsAffected++;
//			p_note_completamento.Size = 500;
//			p_note_completamento.Value = txtsNoteCompletamento.Text;
//			_SCollection.Add(p_note_completamento);
//
//			try {
//				i_RowsAffected=_CCP.UPDATWEWRCP(_SCollection);
//			
//				}
//			catch (Exception ex)
//			{				
//				string s_Err =  ex.Message.ToString().ToUpper();
//				PanelMess.ShowError(s_Err, true);
//			}	
//
//
//		}

		private void btnAnnulla_Click(object sender, System.EventArgs e)
		{

			Server.Transfer("sfogliaCP.aspx");
		}

		private void btnSalva_Click(object sender, System.EventArgs e)
		{
			Classi.GestioneCP.CompletamentoCP _CCP = new TheSite.Classi.GestioneCP.CompletamentoCP();
			int i_RowsAffected = 0;
			S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();
			//_SCollection.AddItems(this.PanelEdit.Controls);
		
			
			S_Object p_id_wr_cp = new S_Object();
			p_id_wr_cp.ParameterName = "p_id_wr_cp";
			p_id_wr_cp.DbType = CustomDBType.Integer;
			p_id_wr_cp.Direction = ParameterDirection.Input;
			p_id_wr_cp.Index = i_RowsAffected;
			p_id_wr_cp.Size = 100;
			p_id_wr_cp.Value = Int32.Parse(LblRdl.Text);
			_SCollection.Add(p_id_wr_cp);
			
			S_Object p_data_inizio_prevista = new S_Object();
			p_data_inizio_prevista.ParameterName = "p_data_inizio_prevista";
			p_data_inizio_prevista.DbType = CustomDBType.VarChar;
			p_data_inizio_prevista.Direction = ParameterDirection.Input;
			p_data_inizio_prevista.Index = i_RowsAffected++;
			p_data_inizio_prevista.Size=255;
			p_data_inizio_prevista.Value = CalendarPicker1.Datazione.Text;
			_SCollection.Add(p_data_inizio_prevista);


			S_Object p_data_fine_prevista = new S_Object();
			p_data_fine_prevista.ParameterName = "p_data_fine_prevista";
			p_data_fine_prevista.DbType = CustomDBType.VarChar;
			p_data_fine_prevista.Direction = ParameterDirection.Input;
			p_data_fine_prevista.Index = i_RowsAffected++;
			p_data_fine_prevista.Size=255;
			p_data_fine_prevista.Value = CalendarPicker2.Datazione.Text;
			_SCollection.Add(p_data_fine_prevista);

			S_Object p_data_completamento_inizio = new S_Object();
			p_data_completamento_inizio.ParameterName = "p_data_completamento_inizio";
			p_data_completamento_inizio.DbType = CustomDBType.VarChar;
			p_data_completamento_inizio.Direction = ParameterDirection.Input;
			p_data_completamento_inizio.Index = i_RowsAffected++;
			p_data_completamento_inizio.Size=255;
			p_data_completamento_inizio.Value = CalendarPicker3.Datazione.Text;
			_SCollection.Add(p_data_completamento_inizio);

			S_Object p_data_completamento_fine = new S_Object();
			p_data_completamento_fine.ParameterName = "p_data_completamento_fine";
			p_data_completamento_fine.DbType = CustomDBType.VarChar;
			p_data_completamento_fine.Direction = ParameterDirection.Input;
			p_data_completamento_fine.Index = i_RowsAffected++;
			p_data_completamento_fine.Size=255;
			p_data_completamento_fine.Value = CalendarPicker4.Datazione.Text;
			_SCollection.Add(p_data_completamento_fine);
			
			S_Object p_addetto_id = new S_Object();
			p_addetto_id.ParameterName = "p_addetto_id";
			p_addetto_id.DbType = CustomDBType.Integer;
			p_addetto_id.Direction = ParameterDirection.Input;
			p_addetto_id.Index = i_RowsAffected++;
			p_addetto_id.Size = 100;
			p_addetto_id.Value = Convert.ToInt32(cmbsAddetto.SelectedValue);
			_SCollection.Add(p_addetto_id);

			
			S_Object p_id_stato_richiesta = new S_Object();
			p_id_stato_richiesta.ParameterName = "p_id_stato_richiesta";
			p_id_stato_richiesta.DbType = CustomDBType.Integer;
			p_id_stato_richiesta.Direction = ParameterDirection.Input;
			p_id_stato_richiesta.Index = i_RowsAffected++;
			p_id_stato_richiesta.Size = 100;
			p_id_stato_richiesta.Value = Convert.ToInt32(cmbsstatolavoro.SelectedValue);
			_SCollection.Add(p_id_stato_richiesta);
			
			

			S_Object p_note_completamento = new S_Object();
			p_note_completamento.ParameterName = "p_note_completamento";
			p_note_completamento.DbType = CustomDBType.VarChar;
			p_note_completamento.Direction = ParameterDirection.Input;
			p_note_completamento.Index = i_RowsAffected++;
			p_note_completamento.Size = 500;
			p_note_completamento.Value = txtsNoteCompletamento.Text;
			_SCollection.Add(p_note_completamento);

			try 
			{
				string result="";
				int DATAINIZIONUM=0;
				int DATAFINENUM=0;
				if (CalendarPicker1.Datazione.Text!= "")
				{
					string[] DATAINIZIO =  CalendarPicker1.Datazione.Text.Split(Convert.ToChar("/"));
				
					DATAINIZIONUM= Int32.Parse(DATAINIZIO[2]+DATAINIZIO[1]+DATAINIZIO[0]);}
								
				if (CalendarPicker3.Datazione.Text!= "")
				{
					string[] DATAFINE = CalendarPicker3.Datazione.Text.Split(Convert.ToChar("/"));
					DATAFINENUM= Int32.Parse(DATAFINE[2]+DATAFINE[1]+DATAFINE[0]);}
			
				if (DATAFINENUM<DATAINIZIONUM  && cmbsstatolavoro.SelectedValue =="4")
				{
					result="La Data Completamento Lavori è inferiore alla Data Inizio Previsto la Odl non può essere completata"; 
					String scriptString = "<script language=\"JavaScript\">alert(\"" + result + "\");<";
					scriptString += "/";
					scriptString += "script>";
					this.RegisterStartupScript("Startup1", scriptString);
					return;
				}
				
				i_RowsAffected=_CCP.UPDATWEWRCP(_SCollection);
				if(cmbsstatolavoro.SelectedValue =="4")
				{
						cmbsstatolavoro.Enabled=false;
				}
							
			}	
			
			catch (Exception ex)
			{				
				string s_Err =  ex.Message.ToString().ToUpper();
				PanelMess.ShowError(s_Err, true);
			}	


		}

		


	}


	
}

