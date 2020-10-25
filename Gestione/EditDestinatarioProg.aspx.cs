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
using S_Controls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;


namespace TheSite.Gestione
{
	/// <summary>
	/// Descrizione di riepilogo per EditDestinatario.
	/// </summary>
	public class EditDestinatarioProg : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblOperazione;
		protected Csy.WebControls.MessagePanel PanelMess;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvDescrizione;
		protected System.Web.UI.WebControls.Panel PanelEdit;
		protected S_Controls.S_Button btnsSalva;
		protected System.Web.UI.WebControls.Button btnAnnulla;
		protected System.Web.UI.WebControls.Label lblFirstAndLast;
		protected System.Web.UI.WebControls.TextBox TxtMail;
		protected System.Web.UI.WebControls.CheckBox CkAb;
		protected System.Web.UI.WebControls.DropDownList DrEdifici;
		protected System.Web.UI.WebControls.ValidationSummary vlsEdit;
		Classi.ClassiAnagrafiche.DestinatariProg _Dest = new TheSite.Classi.ClassiAnagrafiche.DestinatariProg();
		protected System.Web.UI.WebControls.RegularExpressionValidator rem;
		protected System.Web.UI.WebControls.DropDownList CmbUtente;
		int itemId=0;
		protected System.Web.UI.WebControls.DropDownList CmbTipoProg;
		string tipoProg;
		private void Page_Load(object sender, System.EventArgs e)
		{
			if (Request["itemID"] != null) 
			{
				itemId = Int32.Parse(Request["itemID"]);				
			}
			if (Request.QueryString["FunId"]!=null)
			{
				ViewState.Add("FunId",Request.QueryString["FunId"]);
			}
			if (Request.QueryString["TipoProg"]!=null)
			{
				tipoProg=Request.QueryString["TipoProg"];
			}

			// Inserire qui il codice utente necessario per inizializzare la pagina.
			if(!IsPostBack)
			{
				LoadCombo();
				if (itemId != 0) 					
					LoadSingleData();
			
			}
		}
		/// <summary>
		/// Carica la singola mail
		/// </summary>
		private void LoadSingleData()
		{
			if(itemId==0) return;
			DataSet ds= _Dest.GetSingleDataDest(itemId,tipoProg);
			if (ds.Tables[0].Rows.Count ==0) return;
			DataRow _Dr = ds.Tables[0].Rows[0];
			this.DrEdifici.SelectedValue=  _Dr["ID_BL"].ToString();
			this.TxtMail.Text = (string) _Dr["email"];	
			LoadUtenti();
			if ( _Dr["ID_UTENTE"]!=DBNull.Value)	
				this.CmbUtente.SelectedValue=  _Dr["ID_UTENTE"].ToString();
			CkAb.Checked= (_Dr["FLAG_INVIO"].ToString()=="1")?true:false;
			this.lblOperazione.Text = "Modifica Destinatario: " + this.TxtMail.Text;
		}

		private void LoadCombo()
		{
			//Se sono in modifica imposto il valore e disabilito il combo Tipo Prog
			if (itemId!=0)
			{
				CmbTipoProg.SelectedValue=tipoProg;
				CmbTipoProg.Enabled=false;
			}
			else
			{				
				CmbTipoProg.Enabled=true;
			}

			TheSite.Classi.ManProgrammata.InvioDocPmP  _inviodoc = new TheSite.Classi.ManProgrammata.InvioDocPmP();
			DataSet Ds=_inviodoc.GetEdifici(Context.User.Identity.Name);
			DrEdifici.DataSource=Ds.Tables[0];
			DrEdifici.DataTextField ="Denominazione";
			DrEdifici.DataValueField="id"; 
			DrEdifici.DataBind();
			LoadUtenti();
		}
		private void LoadUtenti()
		{
			DataSet Ds=_Dest.GetUtenti(Int16.Parse(DrEdifici.SelectedValue));			
			this.CmbUtente.DataSource =Classi.GestoreDropDownList.ItemBlankDataSource(
				Ds.Tables[0],"descrizione","id","-Selezionare un valore-","0");			
			CmbUtente.DataTextField ="Descrizione";
			CmbUtente.DataValueField="id"; 
			CmbUtente.DataBind();

			CmbUtente.DataTextField ="Descrizione";
			CmbUtente.DataValueField="id"; 
			CmbUtente.DataBind();	
			


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
			this.DrEdifici.SelectedIndexChanged += new System.EventHandler(this.DrEdifici_SelectedIndexChanged);
			this.btnsSalva.Click += new System.EventHandler(this.btnsSalva_Click);
			this.btnAnnulla.Click += new System.EventHandler(this.btnAnnulla_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void DrEdifici_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			LoadUtenti();
		}

		private void btnAnnulla_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("ListDestinatariProg.aspx?FunId=" + Request.QueryString["FunId"]);
		}

		private void btnsSalva_Click(object sender, System.EventArgs e)
		{
			Salva();
		}
		private void Salva()
		{
			S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();	
	
			S_Controls.Collections.S_Object p = new S_Object();
			p.ParameterName = "v_id_bl";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Value = DrEdifici.SelectedValue;
			_SCollection.Add(p);	

			p = new S_Object();
			p.ParameterName = "v_email";
			p.DbType = CustomDBType.VarChar;
			p.Direction = ParameterDirection.Input;
			p.Size =100;
			p.Index = _SCollection.Count;
			p.Value = TxtMail.Text.Trim().ToLower();
			_SCollection.Add(p);
						             
			p = new S_Object();
			p.ParameterName = "v_id_utente";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			if(CmbUtente.SelectedValue=="0")
				p.Value = DBNull.Value;
			else
				p.Value = CmbUtente.SelectedValue;	
			_SCollection.Add(p);

			p = new S_Object();
			p.ParameterName = "v_si";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Value =(CkAb.Checked==true)?1:0;
			_SCollection.Add(p);

			p = new S_Object();
			p.ParameterName = "v_tipo_programmazione";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Value = CmbTipoProg.SelectedValue;
			_SCollection.Add(p);

			if(itemId==0)
				itemId	=_Dest.Add(_SCollection);
			else
				itemId=_Dest.Update(_SCollection,itemId);

			Response.Redirect("EditDestinatarioProg.aspx?ItemId=" + itemId + "&FunId=" + Request.QueryString["FunId"]+ "&TipoProg=" + CmbTipoProg.SelectedValue);
		}
	}
}
