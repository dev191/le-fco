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

namespace TheSite.Gestione
{
	/// <summary>
	/// Descrizione di riepilogo per EditRuoli.
	/// </summary>
	public class EditMail : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Panel PanelEdit;
		protected S_Controls.S_Button btnsSalva;
		protected System.Web.UI.WebControls.Button btnAnnulla;
		protected S_Controls.S_TextBox txtsDescrizione;
		protected S_Controls.S_TextBox txtsNote;
		protected WebControls.PageTitle PageTitle1;

		int FunId = 0;
		protected System.Web.UI.WebControls.RequiredFieldValidator rfvDescrizione;
		protected Csy.WebControls.MessagePanel PanelMess;
		protected System.Web.UI.WebControls.RegularExpressionValidator rem;
		protected S_Controls.S_Button btnCopiaEmail;
		protected System.Web.UI.WebControls.Label lblMessage;
		protected System.Web.UI.WebControls.ValidationSummary vlsEdit;
		protected S_Controls.S_ComboBox cmbCopiaEmail;
		int itemId = 0;
		protected System.Web.UI.WebControls.Label lblEmailIns;
		protected System.Web.UI.WebControls.CheckBox CHKMRSGA;
		protected System.Web.UI.WebControls.CheckBox CHKMRDIE;
		protected System.Web.UI.WebControls.CheckBox CHKMSSGA;
		protected System.Web.UI.WebControls.CheckBox CHKMSDIE;
		protected System.Web.UI.WebControls.Label lbloperazione;
		public int i_RowsAffected=0;
		
		private void Page_Load(object sender, System.EventArgs e)
		{

			FunId = Int32.Parse(Request.Params["FunId"]);
		
			if (Request.Params["ItemID"] != null) 
			{
				itemId = Int32.Parse(Request.Params["ItemID"]);
				
			}
			PageTitle1.Title="Inserimento-modifica Email";
			cmbCopiaEmail.Visible=false;
			btnCopiaEmail.Visible=false;

			if (!Page.IsPostBack )
			{
				
				ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
				if (itemId != 0) 
				{
					Classi.MailSend _MailSend= new TheSite.Classi.MailSend();
					DataSet _MyDs = _MailSend.GetDestEmail_AGG(itemId).Copy();
					if (_MyDs.Tables[0].Rows.Count == 1)
					{					
						DataRow _Dr = _MyDs.Tables[0].Rows[0];
						//ente descrizione
						this.txtsDescrizione.Text=_Dr["Descrizione"].ToString();
						this.txtsNote.Text= _Dr["note"].ToString();
						if (Int32.Parse(_Dr["sgamr"].ToString())==1)
						{this.CHKMRSGA.Checked=true;}
						else{this.CHKMRSGA.Checked=false;}
						if (Int32.Parse(_Dr["diemr"].ToString())==1)
						{this.CHKMRDIE.Checked=true;}
						else{this.CHKMRDIE.Checked=false;}
						if (Int32.Parse(_Dr["sgams"].ToString())==1)
						{this.CHKMSSGA.Checked=true;}
						else{this.CHKMSSGA.Checked=false;}
						if (Int32.Parse(_Dr["diems"].ToString())==1)
						{this.CHKMSDIE.Checked=true;}
						else{this.CHKMSDIE.Checked=false;}
						this.lbloperazione.Text = "Modifica Email: " + this.txtsDescrizione.Text;
						
					}

				}
				else
				{
				this.lbloperazione.Text = "Inserimento Email";
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
		
		//		this.DataGridEsegui.CancelCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridEsegui_CancelCommand);
		//		this.DataGridEsegui.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridEsegui_EditCommand);
		//		this.DataGridEsegui.UpdateCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridEsegui_UpdateCommand);
		//		this.btnsSalva.Click += new System.EventHandler(this.btnsSalva_Click);
		//		this.btnsElimina.Click += new System.EventHandler(this.btnsElimina_Click);
		//		this.btnAnnulla.Click += new System.EventHandler(this.btnAnnulla_Click);
		//		this.Load += new System.EventHandler(this.Page_Load);
		/// <summary>
		/// Metodo necessario per il supporto della finestra di progettazione. Non modificare
		/// il contenuto del metodo con l'editor di codice.
		/// </summary>
		private void InitializeComponent()
		{    
			this.btnsSalva.Click += new System.EventHandler(this.btnsSalva_Click);
			this.btnAnnulla.Click += new System.EventHandler(this.btnAnnulla_Click);
			this.btnCopiaEmail.Click += new System.EventHandler(this.btnCopiaEmail_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		/// <summary>
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void btnAnnulla_Click(object sender, System.EventArgs e)
		{
			Response.Redirect((String) ViewState["UrlReferrer"]);
		}

	
		

		private void BindEmailEsistenti()
		{
			Classi.MailSend _MailSend= new TheSite.Classi.MailSend();
			
			this.cmbCopiaEmail.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
				_MailSend.GetEmailTranneMe(i_RowsAffected).Tables[0], "DESCRIZIONE", "ID", "--Email --", "0");
			this.cmbCopiaEmail.DataTextField = "DESCRIZIONE";
			this.cmbCopiaEmail.DataValueField = "ID";
			this.cmbCopiaEmail.DataBind();

		}

		private void btnsSalva_Click(object sender, System.EventArgs e)
		{
			int i_RowsAffected = 0;
			Classi.MailSend _MailSend= new TheSite.Classi.MailSend();
			S_Controls.Collections.S_ControlsCollection _SCollection = new S_Controls.Collections.S_ControlsCollection();
						
			S_Controls.Collections.S_Object s_p_Descrizione= new S_Object();
			s_p_Descrizione.ParameterName = "p_Descrizione";
			s_p_Descrizione.DbType = CustomDBType.VarChar;
			s_p_Descrizione.Direction = ParameterDirection.Input;
			s_p_Descrizione.Size = 255;
			s_p_Descrizione.Index = 0;
			s_p_Descrizione.Value =txtsDescrizione.Text;
			_SCollection.Add(s_p_Descrizione);
			
			S_Controls.Collections.S_Object s_p_Note= new S_Object();
			s_p_Note.ParameterName = "p_Note";
			s_p_Note.DbType = CustomDBType.VarChar;
			s_p_Note.Direction = ParameterDirection.Input;
			s_p_Note.Size = 255;
			s_p_Note.Index = _SCollection.Count;;
			s_p_Note.Value =txtsNote.Text;
			_SCollection.Add(s_p_Note);

				
			i_RowsAffected=_MailSend.InsEMail(_SCollection);			
			
		   S_Controls.Collections.S_ControlsCollection _SCollection_ = new S_Controls.Collections.S_ControlsCollection();
						
			S_Controls.Collections.S_Object s_p_email_id_= new S_Object();
			s_p_email_id_.ParameterName = "p_email_id";
			s_p_email_id_.DbType = CustomDBType.Integer;
			s_p_email_id_.Direction = ParameterDirection.Input;
			s_p_email_id_.Size = 8;
			s_p_email_id_.Index = 0;
			s_p_email_id_.Value =i_RowsAffected;
			_SCollection_.Add(s_p_email_id_);
			
			S_Controls.Collections.S_Object s_p_mrsga= new S_Object();
			s_p_mrsga.ParameterName = "p_mrsga";  
			s_p_mrsga.DbType = CustomDBType.Integer;
			s_p_mrsga.Direction = ParameterDirection.Input;
			s_p_mrsga.Size = 8;
			s_p_mrsga.Index = _SCollection_.Count;
			s_p_mrsga.Value =(CHKMRSGA.Checked==true)?1:0;
			
			_SCollection_.Add(s_p_mrsga);
			
			S_Controls.Collections.S_Object s_p_mrdie= new S_Object();
			s_p_mrdie.ParameterName = "p_mrdie";
			s_p_mrdie.DbType = CustomDBType.Integer;
			s_p_mrdie.Direction = ParameterDirection.Input;
			s_p_mrdie.Size = 8;
			s_p_mrdie.Index = _SCollection_.Count;
			s_p_mrdie.Value =(CHKMRDIE.Checked==true)?1:0;
			_SCollection_.Add(s_p_mrdie);
			
			S_Controls.Collections.S_Object s_p_mssga= new S_Object();
			s_p_mssga.ParameterName = "p_mssga";
			s_p_mssga.DbType = CustomDBType.Integer;
			s_p_mssga.Direction = ParameterDirection.Input;
			s_p_mssga.Size = 8;
			s_p_mssga.Index = _SCollection_.Count;
			s_p_mssga.Value =(CHKMSSGA.Checked==true)?1:0;
			_SCollection_.Add(s_p_mssga);

			S_Controls.Collections.S_Object s_p_msdie= new S_Object();
			s_p_msdie.ParameterName = "p_msdie";
			s_p_msdie.DbType = CustomDBType.Integer;
			s_p_msdie.Direction = ParameterDirection.Input;
			s_p_msdie.Size = 8;
			s_p_msdie.Index = _SCollection_.Count;
			s_p_msdie.Value =(CHKMSDIE.Checked==true)?1:0;
			_SCollection_.Add(s_p_msdie);
			
			int i_RowsAffected_=_MailSend.InsEMailInv(_SCollection_);	

			BindEmailEsistenti();
			cmbCopiaEmail.Visible=true;
			btnCopiaEmail.Visible=true;			
			if (lbloperazione.Text == "Inserimento Email")
			{lblMessage.Text="Inserita Email " + txtsDescrizione.Text;}
			else 
				{lblMessage.Text="Modifica Email " + txtsDescrizione.Text;}
			lblEmailIns.Text=i_RowsAffected.ToString();

		}

		private void btnCopiaEmail_Click(object sender, System.EventArgs e)
		{
		
			if (cmbCopiaEmail.SelectedValue!="0")
			{
				Classi.MailSend _MailSend= new TheSite.Classi.MailSend();
					
				S_Controls.Collections.S_ControlsCollection _SColl = new  S_Controls.Collections.S_ControlsCollection();
			

				S_Controls.Collections.S_Object s_p_email_id= new S_Object();
				s_p_email_id.ParameterName = "p_email_id";
				s_p_email_id.DbType = CustomDBType.Integer;
				s_p_email_id.Direction = ParameterDirection.Input;
				s_p_email_id.Size = 8;
				s_p_email_id.Index = _SColl.Count;
				s_p_email_id.Value =Int32.Parse(lblEmailIns.Text);
				_SColl.Add(s_p_email_id);

				S_Controls.Collections.S_Object s_p_email_id_da_copiare= new S_Object();
				s_p_email_id_da_copiare.ParameterName = "p_email_id_da_copiare";
				s_p_email_id_da_copiare.DbType = CustomDBType.Integer;
				s_p_email_id_da_copiare.Direction = ParameterDirection.Input;
				s_p_email_id_da_copiare.Size = 8;
				s_p_email_id_da_copiare.Index = _SColl.Count;
				s_p_email_id_da_copiare.Value =Convert.ToInt32(cmbCopiaEmail.SelectedValue);
				_SColl.Add(s_p_email_id_da_copiare);

				int rows = _MailSend.CopiaEmailBLSV(_SColl);
				cmbCopiaEmail.Visible=false;
				btnCopiaEmail.Visible=false;
				lblMessage.Text="Inserite per email " + txtsDescrizione.Text+ " associazioni edifici-servizi" ;
			}
			else
			{
				lblMessage.Text="Email da copiare non selezionata " ;
				cmbCopiaEmail.Visible=true;
				btnCopiaEmail.Visible=true;
			}

		}

		
	}
}
