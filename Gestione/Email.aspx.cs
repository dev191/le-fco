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
	/// Descrizione di riepilogo per Email.
	/// </summary>
	public class Email : System.Web.UI.Page
	{
		protected Csy.WebControls.DataPanel PanelRicerca;
		protected S_Controls.S_Button btnsRicerca;
		protected S_Controls.S_TextBox txtsDescrizione;
		protected S_Controls.S_TextBox txtsNote;
		protected System.Web.UI.WebControls.DataGrid DataGridRicerca;
		protected WebControls.GridTitle GridTitle1;
		protected WebControls.PageTitle PageTitle1;

		public static int FunId = 0;
		public static string HelpLink = string.Empty;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			Classi.SiteModule _SiteModule = (Classi.SiteModule) HttpContext.Current.Items["SiteModule"];
			this.GridTitle1.hplsNuovo.NavigateUrl = "../Gestione/EditEmail.aspx?ItemID=0&FunId=" + _SiteModule.ModuleId;
			this.GridTitle1.hplsNuovo.Visible = _SiteModule.IsEditable;	

			this.DataGridRicerca.Columns[1].Visible = _SiteModule.IsEditable;				
			this.DataGridRicerca.Columns[2].Visible = _SiteModule.IsEditable;				
						
			FunId = _SiteModule.ModuleId;
			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = _SiteModule.ModuleTitle;
			
				
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
			this.DataGridRicerca.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicerca_ItemCreated);
			this.DataGridRicerca.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridRicerca_ItemCommand);
			this.DataGridRicerca.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridRicerca_PageIndexChanged);
			this.DataGridRicerca.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicerca_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnsRicerca_Click(object sender, System.EventArgs e)
		{
			Ricerca();	
		}
		private void Ricerca()
		{
			Classi.MailSend _MailSend = new Classi.MailSend();
		//Classi.Ruolo _Ruolo = new TheSite.Classi.Ruolo();

		this.txtsDescrizione.DBDefaultValue = "%";
		this.txtsNote.DBDefaultValue = "%";			
                							
		S_ControlsCollection _SCollection = new S_ControlsCollection();

		_SCollection.AddItems(this.PanelRicerca.Controls);

		DataSet _MyDs = _MailSend.GETDESTINATARIEMAIL(_SCollection).Copy();

		this.DataGridRicerca.DataSource = _MyDs.Tables[0];
		this.DataGridRicerca.DataBind();
			
		this.GridTitle1.NumeroRecords = _MyDs.Tables[0].Rows.Count.ToString();	
		
		
		}

		private void DeleteItem(string id)
		{
			Console.WriteLine(id); 
			if (id=="") return;
			
			S_ControlsCollection _SColl = new S_ControlsCollection();

			S_Controls.Collections.S_Object s_email_id = new S_Object();
			s_email_id.ParameterName = "p_email_id";
			s_email_id.DbType = CustomDBType.Integer ;
			s_email_id.Direction = ParameterDirection.Input;
			s_email_id.Index =0;
			s_email_id.Value = int.Parse(id);
			_SColl.Add(s_email_id);
			try
			{
				TheSite.Classi.MailSend _MailSend= new TheSite.Classi.MailSend();
				_MailSend.DelEMail(_SColl);

				//			DataGridRicerca.CurrentPageIndex =0;
				DataGridRicerca.CurrentPageIndex =0;
				Ricerca();
			
			}
			catch(Exception ex)
			{
				Console.WriteLine(ex.Message);  
				this.Page.RegisterStartupScript("messaggio","<script language'javascript'>alert(\"Impossibile cancellare email perchè è utilizzata in altre tabelle\");</script>"); 
			}
		}


		private void DataGridRicerca_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if((e.Item.ItemType == ListItemType.Item) ||
				(e.Item.ItemType == ListItemType.AlternatingItem))
			{
//				HyperLink _lnk1 = (HyperLink) e.Item.Cells[1].FindControl("Hyperlink1");
//				_lnk1.Attributes.Add("title","Modifica Ruolo");		
//				
//				HyperLink _lnk2 = (HyperLink) e.Item.Cells[2].FindControl("Hyperlink2");
//				_lnk2.Attributes.Add("title","Associazione Ruolo Edifici");		
			}
		}

		private void DataGridRicerca_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if ((e.Item.ItemType == ListItemType.Pager) ||
				(e.Item.ItemType == ListItemType.Header)) return;

		

			ImageButton btn  = (ImageButton)e.CommandSource;

			if (btn.CommandName  == "Delete")
			{				
				DeleteItem(btn.CommandArgument);
				
			}


		}

		private void DataGridRicerca_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			System.Web.UI.WebControls.ImageButton  _img = (System.Web.UI.WebControls.ImageButton) (e.Item.FindControl("Imagebutton3"));								
			if(_img!=null)
			{
				_img.Attributes.Add("onclick", "return confirm('Eliminare email con tutte le associazioni edifici e servizi?');");	
				
			}
		}

		private void DataGridRicerca_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridRicerca.CurrentPageIndex = e.NewPageIndex;			
			Ricerca();
		}


	}
}
