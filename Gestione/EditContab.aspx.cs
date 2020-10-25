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


namespace TheSite.Gestione
{
	/// <summary>
	
	/// </summary>
	public class EditContab : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblOperazione;
		protected Csy.WebControls.MessagePanel PanelMess;		
		protected System.Web.UI.WebControls.Panel PanelEdit;
		protected S_Controls.S_Button btnsSalva;
		protected S_Controls.S_Button btnsElimina;
		protected System.Web.UI.WebControls.Button btnAnnulla;
		protected System.Web.UI.WebControls.Label lblFirstAndLast;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvEqstd;
		protected S_Controls.S_TextBox txtsdescrizione;
		protected System.Web.UI.WebControls.ValidationSummary vlsEdit;
		int itemId = 0;
		int FunId = 0;
		protected S_Controls.S_ComboBox cmbsServizio;
		
		Contab _fp;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			FunId = Int32.Parse(Request["FunId"]);			

			if (Request["itemId"] != null) 
			{
				itemId = Int32.Parse(Request["itemId"]);				
			}

			if (!Page.IsPostBack )
			{					
				BindServizi();
				if (itemId != 0) 
				{					
					Classi.ClassiAnagrafiche.Contab _Contab = new TheSite.Classi.ClassiAnagrafiche.Contab();
				
					DataSet _MyDs = _Contab.GetSingleData_rev(itemId).Copy();									
					
					if (_MyDs.Tables[0].Rows.Count == 1)
					{					
						DataRow _Dr = _MyDs.Tables[0].Rows[0];						
						if (_Dr["Descrizione"] != DBNull.Value)
							this.txtsdescrizione.Text = (string) _Dr["descrizione"];
						if (_Dr["id_servizio"] != DBNull.Value)
							this.cmbsServizio.SelectedValue= _Dr["id_servizio"].ToString();
						
						lblFirstAndLast.Text=_Contab.GetFirstAndLastUser(_Dr);

						this.lblOperazione.Text = "Modifica Centro di Costo : " + this.txtsdescrizione.Text;
						this.lblFirstAndLast.Visible = true;												
						this.btnsElimina.Visible = true;
						this.btnsElimina.Attributes.Add("onclick", "return confirm('Si vuole effettuare la cancellazione?')");
					
					}		
				}
				else
				{
					this.lblOperazione.Text = "Inserimento Centro di Costo";
					this.lblFirstAndLast.Visible = false;
					this.btnsElimina.Visible = false;
					
				}
				
				ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
				if(Context.Handler is TheSite.Gestione.Contab) 
				{
					_fp = (TheSite.Gestione.Contab) Context.Handler;
					this.ViewState.Add("mioContenitore",_fp._Contenitore); 
				}	
				
				if (Request["TipoOper"] == "read")
				{
					txtsdescrizione.Enabled=false;
					btnsElimina.Enabled=false;
					btnsSalva.Enabled=false;
				}
				else
				{
					txtsdescrizione.Enabled=true;					
					btnsElimina.Enabled=true;
					btnsSalva.Enabled=true;
				}

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
			this.btnsSalva.Click += new System.EventHandler(this.btnsSalva_Click);
			this.btnsElimina.Click += new System.EventHandler(this.btnsElimina_Click);
			this.btnAnnulla.Click += new System.EventHandler(this.btnAnnulla_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnsSalva_Click(object sender, System.EventArgs e)
		{
			
			string mes="Attenzione il Centro di Costo: " + txtsdescrizione.Text.Trim(); 
			mes+=" è già presente nel sistema" ;
			if(itemId==0)
				if(ControllaDup())
					Aggiorna();
				else
					Classi.SiteJavaScript.msgBox(this.Page,mes); 
			else
				Aggiorna();				
			
		}

		private void btnAnnulla_Click(object sender, System.EventArgs e)
		{
			Server.Transfer("Contab.aspx");
		}

		private void btnsElimina_Click(object sender, System.EventArgs e)
		{
			Classi.ClassiAnagrafiche.Contab _Contab = new TheSite.Classi.ClassiAnagrafiche.Contab();				
						
			this.txtsdescrizione.DBDefaultValue = DBNull.Value;
			this.txtsdescrizione.Text=this.txtsdescrizione.Text.Trim();
			int i_RowsAffected = 0;

			S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();

			_SCollection.AddItems(this.PanelEdit.Controls);

			try
			{
				
				i_RowsAffected = _Contab.Execute_rev(_SCollection, itemId,"Delete");												
				Server.Transfer("Contab.aspx");				
			}

			catch (Exception ex)
			{				
				string s_Err =  ex.Message.ToString().ToUpper();
				PanelMess.ShowError(s_Err, true);
			}			
		}

		private bool ControllaDup()
		{
			
			Classi.Function _Function = new TheSite.Classi.Function();
			// Nome della tabella 
			string tabella = "Contabilizzazione";
			// Nome del campo sui cui effettuare la ricerca (WHERE)
			string campo_input = "Contabilizzazione";
			// Il campo valore è relativo alla stringa
			string valore = "'" + txtsdescrizione.Text.Trim().Replace("'","''") + "'";			
			// Nome del Campo restituito in Output
			string campo_output = "IdContabilizzazione";

			DataSet _MyDs =_Function.ControllaDuplicato(tabella,campo_input,valore,campo_output);											
			
			if (_MyDs.Tables[0].Rows.Count==0)
				return true;
			else
				return false;
		}

		private void BindServizi()
		{
			
			this.cmbsServizio.Items.Clear();
		
			Classi.ClassiDettaglio.Servizi _Servizi = new TheSite.Classi.ClassiDettaglio.Servizi();
				
			DataSet _MyDs = _Servizi.GetServizi().Copy();
			  
			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsServizio.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "descrizione", "id", "- Selezionare un Servizio -", "");
				this.cmbsServizio.DataTextField = "descrizione";
				this.cmbsServizio.DataValueField = "id";
				this.cmbsServizio.DataBind();
			}			
		}

		private void Aggiorna()
		{
			Classi.ClassiAnagrafiche.Contab _Contab = new TheSite.Classi.ClassiAnagrafiche.Contab();				
						
			this.txtsdescrizione.DBDefaultValue = DBNull.Value;
			this.txtsdescrizione.Text=this.txtsdescrizione.Text.Trim();
			int i_RowsAffected = 0;

			S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();

			_SCollection.AddItems(this.PanelEdit.Controls);

			try
			{
				if (itemId == 0)
					i_RowsAffected = _Contab.Execute_rev(_SCollection,0,"Insert");
				else
					i_RowsAffected = _Contab.Execute_rev(_SCollection,itemId,"Update");					
					
				Server.Transfer("Contab.aspx");				
			}

			catch (Exception ex)
			{				
				string s_Err =  ex.Message.ToString().ToUpper();
				PanelMess.ShowError(s_Err, true);
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
	}
}

