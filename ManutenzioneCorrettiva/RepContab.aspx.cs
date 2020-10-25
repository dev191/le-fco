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
using MyCollection;

namespace TheSite.ManutenzioneCorrettiva
{
	/// <summary>

	/// </summary>
	public class RepContab: System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid DataGridRicerca;
		public static int FunId = 0;
		public static string HelpLink = string.Empty;
		MyCollection.clMyCollection _myColl = new clMyCollection();
		protected S_Controls.S_TextBox txtsDescrizione;
		protected S_Controls.S_Button btnsRicerca;
		protected Csy.WebControls.DataPanel PanelRicerca;
		protected WebControls.GridTitle GridTitle1;
		protected WebControls.PageTitle PageTitle1;
		protected S_Controls.S_Button BtnReset;
		protected S_Controls.S_ComboBox cmbsAnno;
		protected S_Controls.S_ComboBox cmbsServizio;
		double totconsuntivo=0;
		
		
	
		private void Page_Load(object sender, System.EventArgs e)
		{			
						
			Classi.SiteModule _SiteModule = (Classi.SiteModule) HttpContext.Current.Items["SiteModule"];
			FunId = _SiteModule.ModuleId;
			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = _SiteModule.ModuleTitle;			
			// Inserire qui il codice utente necessario per inizializzare la pagina.
			if (!Page.IsPostBack)
			{		
				GridTitle1.hplsNuovo.Visible = false;
				BindServizi();
				CaricaAnno();
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
			this.BtnReset.Click += new System.EventHandler(this.BtnReset_Click);
			this.DataGridRicerca.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridRicerca_PageIndexChanged);
			this.DataGridRicerca.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicerca_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

	
		private void btnsRicerca_Click(object sender, System.EventArgs e)
		{
			Ricerca();
		}
		private void BindServizi()
		{
			
			this.cmbsServizio.Items.Clear();
		
			Classi.ClassiDettaglio.Servizi _Servizi = new TheSite.Classi.ClassiDettaglio.Servizi();
				
			DataSet _MyDs = _Servizi.GetServizi().Copy();
			  
			if (_MyDs.Tables[0].Rows.Count > 0)
			{
				this.cmbsServizio.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "descrizione", "id", "- Selezionare un Servizio -", "0");
				this.cmbsServizio.DataTextField = "descrizione";
				this.cmbsServizio.DataValueField = "id";
				this.cmbsServizio.DataBind();
			}			
		}

		private void Ricerca()
		{
			Classi.ClassiAnagrafiche.Contab _Contab = new TheSite.Classi.ClassiAnagrafiche.Contab();

			
			this.txtsDescrizione.DBDefaultValue = "%";	
		
			
			this.txtsDescrizione.Text=this.txtsDescrizione.Text.Trim();			

			S_ControlsCollection _SCollection = new S_ControlsCollection();
			_SCollection.AddItems(this.PanelRicerca.Controls);
			DataSet _MyDs = _Contab.GetData_RepContab(_SCollection);
			this.DataGridRicerca.DataSource = _MyDs.Tables[0];
			if (_MyDs.Tables[0].Rows.Count == 0 )
			{
				DataGridRicerca.CurrentPageIndex=0;
			}
			else
			{
				int Pagina = 0;
				if ((_MyDs.Tables[0].Rows.Count % DataGridRicerca.PageSize) >0)
				{
					Pagina ++;
				}
				if (DataGridRicerca.PageCount != Convert.ToInt16((_MyDs.Tables[0].Rows.Count / DataGridRicerca.PageSize) + Pagina))
				{					
					DataGridRicerca.CurrentPageIndex=0;					
				}
				CalcolaTotali(_MyDs.Tables[0]);
			}

			this.DataGridRicerca.DataBind();					
			this.GridTitle1.NumeroRecords = _MyDs.Tables[0].Rows.Count.ToString();
		}

		private void DataGridRicerca_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridRicerca.CurrentPageIndex = e.NewPageIndex;			
			Ricerca();

		}


		
		private void CaricaAnno()
		{
			//Carico il Combo degli Anni
			string anno_corrente = DateTime.Now.Year.ToString();
			for (int i = 2010; i <= 2020; i++)
			{ 	
				ListItem _L1 = new ListItem();
				ListItem _L2 = new ListItem();
				_L1.Text=i.ToString();
				_L1.Value=i.ToString();
				_L2.Text=i.ToString();
				_L2.Value=i.ToString();				
				cmbsAnno.Items.Add(_L2);
			}
			cmbsAnno.SelectedValue = DateTime.Now.Year.ToString();
		}
		private void BtnReset_Click(object sender, System.EventArgs e)
		{
				Response.Redirect("RepContab.aspx?FunId=" + FunId);
		}


		private void CalcolaTotali(DataTable dt)
		{
			foreach(DataRow dr in dt.Rows)
			{			
				if (dr["somma"]!=DBNull.Value)
					totconsuntivo+=double.Parse(dr["somma"].ToString());
			}
		}
		
		public void LinkButton1_Click(object sender, CommandEventArgs e)
		{
			Response.Redirect("SfogliaRdlPaging8.aspx?CdC=" + e.CommandArgument+"&FunId="+FunId+"&Anno="+cmbsAnno.SelectedValue.ToString()); 
		}

		private void DataGridRicerca_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{

			
			if(e.Item.ItemType == ListItemType.Footer)
			{			
				e.Item.Cells[2].Text ="<b>"  + "TOTALE "+ totconsuntivo.ToString("C")+"</b>";
				e.Item.Cells[2].HorizontalAlign=HorizontalAlign.Right;				
			}
		}

		

		

		
	}
}
