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
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;
using S_Controls.Collections;
using S_Controls;

namespace TheSite.Gestione
{
	/// <summary>
	/// Descrizione di riepilogo per EditServizi.
	/// </summary>
	public class EditServizi : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblOperazione;
		protected Csy.WebControls.MessagePanel PanelMess;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvSettore;
		protected S_Controls.S_ComboBox cmbsSettore;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvCodice;
		protected S_Controls.S_TextBox txtsCodice;
		protected S_Controls.S_TextBox txtsDescrizione;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvPercentuale;
		protected System.Web.UI.WebControls.Panel PanelEdit;
		protected S_Controls.S_Button btnsSalva;
		protected S_Controls.S_Button btnsElimina;
		protected System.Web.UI.WebControls.Button btnAnnulla;
		protected System.Web.UI.WebControls.Label lblFirstAndLast;
		protected System.Web.UI.WebControls.ValidationSummary vlsEdit;
		protected S_Controls.S_TextBox txtsNote;

		int itemId = 0;
		int FunId = 0;
		TheSite.Gestione.Servizi _fp;
		DataSet _MyDs = new DataSet();
		S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();
		protected S_Controls.S_TextBox txtsSogliaImpD;
		protected S_Controls.S_TextBox txtsSogliaImpI;
		Classi.ClassiDettaglio.Servizi _Servizi = new Classi.ClassiDettaglio.Servizi();
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			FunId = Int32.Parse(Request["FunId"]);			
			
			if (Request["ItemId"] != null) 
				itemId = Int32.Parse(Request["ItemId"]);


			//Imposto i controlli lato client
			

			txtsSogliaImpD.Attributes.Add("onblur","imposta_dec(this.id);");
			txtsSogliaImpD.Attributes.Add("onkeypress","if (valutanumeri(event) == false) { return false; }");
			txtsSogliaImpD.Attributes.Add("onpaste","return false;");

			

			txtsSogliaImpI.Attributes.Add("onblur","imposta_int(this.id);");
			txtsSogliaImpI.Attributes.Add("onkeypress","if (valutanumeri(event) == false) { return false; }");
			txtsSogliaImpI.Attributes.Add("onpaste","return false;");
			
			if (!Page.IsPostBack )
			{	
				BindSettore();
				if (itemId != 0) 
				{
					_MyDs = _Servizi.GetSingleData(itemId); 
					
					if (_MyDs.Tables[0].Rows.Count == 1)
					{					
						DataRow _Dr = _MyDs.Tables[0].Rows[0];
						
						if (_Dr["descrizione"] != DBNull.Value)
							this.txtsDescrizione.Text= (string) _Dr["descrizione"];					
												
						if (_Dr["note"] != DBNull.Value)
							this.txtsNote.Text= _Dr["note"].ToString();

						if (_Dr["codice"] != DBNull.Value)
							this.txtsCodice.Text= _Dr["codice"].ToString();
											
						if (_Dr["settore_id"] != DBNull.Value)
							this.cmbsSettore.SelectedValue= _Dr["settore_id"].ToString();

						if (_Dr["soglia_aut"] != DBNull.Value)
						{							
							txtsSogliaImpI.Text =  Classi.Function.GetTypeNumber(_Dr["soglia_aut"],Classi.NumberType.Intero).ToString();				
							txtsSogliaImpD.Text =  Classi.Function.GetTypeNumber(_Dr["soglia_aut"],Classi.NumberType.Decimale).ToString();
						}
						
						this.lblOperazione.Text = "Modifica Servizio: " + this.txtsCodice.Text;
						this.lblFirstAndLast.Visible = true;			
						this.btnsElimina.Attributes.Add("onclick", "return confirm('Si vuole effettuare la cancellazione?')");	
						lblFirstAndLast.Text = _Servizi.GetFirstAndLastUser(_Dr);
					}
				}
				else
				{
					this.lblOperazione.Text = "Inserimento Servizi";
					this.lblFirstAndLast.Visible = false;
					this.btnsElimina.Visible = false;
				}				
				if (Request["TipoOper"] == "read")	
				{
					AbilitaControlli(false);
					this.lblOperazione.Text = "Visualizzazione Servizio: " + this.txtsCodice.Text;
				}
				ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
				if(Context.Handler is TheSite.Gestione.Servizi) 
				{
					_fp = (TheSite.Gestione.Servizi) Context.Handler;
					this.ViewState.Add("mioContenitore",_fp._Contenitore); 
				}	
			}
		}
		private void BindSettore()
		{
			Classi.ClassiAnagrafiche.Settori _Settori =  new TheSite.Classi.ClassiAnagrafiche.Settori();
			this.cmbsSettore .Items.Clear();
			DataSet  _MyDs =_Settori.GetData().Copy();
			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsSettore.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "settore", "idsettore", "- Selezionare un Settore -","-1");
				this.cmbsSettore.DataTextField = "settore";
				this.cmbsSettore.DataValueField = "idsettore";
				this.cmbsSettore.DataBind();
			}
		}

		private void AbilitaControlli(bool enabled)
		{
			this.txtsCodice.Enabled = enabled;
			this.txtsDescrizione.Enabled = enabled;
			this.txtsNote.Enabled = enabled;
			this.cmbsSettore.Enabled=enabled;
			this.btnsSalva.Enabled=enabled;
			this.btnsElimina.Enabled=enabled;
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
			int i_MaxParametri=0;
			
			S_Controls.Collections.S_Object s_p_DESCRIZIONE = new S_Object();
			s_p_DESCRIZIONE.ParameterName = "p_DESCRIZIONE";
			s_p_DESCRIZIONE.DbType = CustomDBType.VarChar;
			s_p_DESCRIZIONE.Direction = ParameterDirection.Input;
			s_p_DESCRIZIONE.Size=255;
			s_p_DESCRIZIONE.Index = i_MaxParametri;
			s_p_DESCRIZIONE.Value = txtsDescrizione.Text;
			_SCollection.Add(s_p_DESCRIZIONE);
			i_MaxParametri++;
			S_Controls.Collections.S_Object s_p_NOTE = new S_Object();
			s_p_NOTE.ParameterName = "p_NOTE";
			s_p_NOTE.DbType = CustomDBType.VarChar;
			s_p_NOTE.Direction = ParameterDirection.Input;
			s_p_NOTE.Size=255;
			s_p_NOTE.Index = i_MaxParametri;
			s_p_NOTE.Value = txtsNote.Text;
			_SCollection.Add(s_p_NOTE);
			i_MaxParametri++;
			S_Controls.Collections.S_Object s_p_CODICE = new S_Object();
			s_p_CODICE.ParameterName = "p_CODICE";
			s_p_CODICE.DbType = CustomDBType.VarChar;
			s_p_CODICE.Direction = ParameterDirection.Input;
			s_p_CODICE.Size=255;
			s_p_CODICE.Index = i_MaxParametri;
			s_p_CODICE.Value = txtsCodice.Text;
			_SCollection.Add(s_p_CODICE);

			i_MaxParametri++;
			S_Controls.Collections.S_Object s_p_SETTORE = new S_Object();
			s_p_SETTORE.ParameterName = "p_SETTORE";
			s_p_SETTORE.DbType = CustomDBType.Integer;
			s_p_SETTORE.Direction = ParameterDirection.Input;
			s_p_SETTORE.Size=100;
			s_p_SETTORE.Index = i_MaxParametri;
			s_p_SETTORE.Value = Int32.Parse(cmbsSettore.SelectedValue);
			_SCollection.Add(s_p_SETTORE);

			i_MaxParametri++;
			S_Controls.Collections.S_Object s_p_SOGLIA_AUT = new S_Object();
			s_p_SOGLIA_AUT.ParameterName = "p_SOGLIA_AUT";
			s_p_SOGLIA_AUT.DbType = CustomDBType.Double;
			s_p_SOGLIA_AUT.Direction = ParameterDirection.Input;
			s_p_SOGLIA_AUT.Size=100;
			s_p_SOGLIA_AUT.Index = i_MaxParametri;
			s_p_SOGLIA_AUT.Value = double.Parse(txtsSogliaImpI.Text + "," + txtsSogliaImpD.Text);
			_SCollection.Add(s_p_SOGLIA_AUT);


			//_SCollection.AddItems(this.PanelEdit.Controls);	
							
			int i_RowsAffected = 0;
			try
			{
				if (itemId == 0)
					i_RowsAffected = _Servizi.Add(_SCollection);  
				else
					i_RowsAffected =  _Servizi.Update(_SCollection,itemId);
				
				if ( i_RowsAffected > 0 && i_RowsAffected!=-11)
					Server.Transfer("Servizi.aspx");					
				else
					Classi.SiteJavaScript.msgBox(this.Page,"Il servizio  é stato già inserito");
			}
			catch (Exception ex)
			{				
				string s_Err =  ex.Message.ToString().ToUpper();
				PanelMess.ShowError(s_Err, true);
			}	

		}

		private void btnsElimina_Click(object sender, System.EventArgs e)
		{
			try
			{				
				this.txtsCodice.DBDefaultValue = DBNull.Value;
				this.txtsDescrizione.DBDefaultValue = DBNull.Value;
				this.txtsNote.DBDefaultValue = DBNull.Value;
				this.cmbsSettore.DBDefaultValue=-1;
				int i_RowsAffected = 0;

						   
				_SCollection.AddItems(this.PanelEdit.Controls);	
			
				i_RowsAffected = _Servizi.Delete(_SCollection, itemId);

				if ( i_RowsAffected == -1 )					
					Server.Transfer("Servizi.aspx");
			}
			catch (Exception ex)
			{				
				string s_Err =  ex.Message.ToString().ToUpper();
				PanelMess.ShowError(s_Err, true);
			}	
		}

		private void btnAnnulla_Click(object sender, System.EventArgs e)
		{
			Server.Transfer("Servizi.aspx");
		}

		
	}
}
