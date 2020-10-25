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
	/// Descrizione di riepilogo per RdLAddetti.
	/// </summary>
	public class RdLAddetti: System.Web.UI.Page
	{	
		protected Csy.WebControls.DataPanel PanelRicerca;		
		protected S_Controls.S_Button btnsRicerca;		
		protected System.Web.UI.WebControls.DataGrid DataGridRicerca;
		protected WebControls.GridTitle GridTitle1;	
		protected WebControls.PageTitle PageTitle1;
		public static int FunId=0;
		protected S_Controls.S_TextBox txtscognome;
		protected S_Controls.S_TextBox txtsnome;
		protected S_Controls.S_ComboBox cmbsditta;
		protected S_Controls.S_ComboBox cmbsedificio;
		protected WebControls.CalendarPicker CalendarPicker1;
		protected WebControls.CalendarPicker Calendarpicker2;
		public static string HelpLink = string.Empty;
		//TheSite.Gestione.EditAddetti _fp;
		protected S_Controls.S_Button BtnReset;
		
		MyCollection.clMyCollection _myColl = new clMyCollection();
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			Classi.SiteModule _SiteModule = (Classi.SiteModule) HttpContext.Current.Items["SiteModule"];
			this.GridTitle1.hplsNuovo.NavigateUrl = "../Gestione/EditAddetti.aspx?ItemID=0&FunId=" + _SiteModule.ModuleId;
			this.GridTitle1.hplsNuovo.Visible = _SiteModule.IsEditable;
			this.DataGridRicerca.Columns[1].Visible = _SiteModule.IsEditable;				
			if (!Page.IsPostBack)
			{	
				
				BindDitte();
				BindEdificio();
				//				if(Context.Handler is TheSite.Gestione.EditAddetti) 
				//					{	
				//					_fp = (TheSite.Gestione.EditAddetti) Context.Handler;
				//								if (_fp!=null)
				//								{
				//									_myColl=_fp._Contenitore;
				//									_myColl.SetValues(this.Page.Controls);
				//									Ricerca();
				//								}
				//					}
				//			}
					
				FunId = _SiteModule.ModuleId;
				HelpLink = _SiteModule.HelpLink;
				this.PageTitle1.Title = _SiteModule.ModuleTitle;
			}
			}

		public MyCollection.clMyCollection _Contenitore
		{
			get 
			{
				return _myColl;
			}
		}
		private void BindDitte()
		{
			
			this.cmbsditta.Items.Clear();
		
			Classi.ClassiAnagrafiche.Ditte _Ditte = new TheSite.Classi.ClassiAnagrafiche.Ditte();
				
			DataSet _MyDs = _Ditte.GetData().Copy();
			  
			if (_MyDs.Tables[0].Rows.Count > 0)
			{				
				this.cmbsditta.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "descrizione","id", "- Selezionare una Ditta -", "0");
				this.cmbsditta.DataTextField = "descrizione";
				this.cmbsditta.DataValueField = "id";
				this.cmbsditta.DataBind();
			}			
		}

		private void BindEdificio()
		{
			
			this.cmbsedificio.Items.Clear();
		
			Classi.ClassiAnagrafiche.Buildings _bl = new TheSite.Classi.ClassiAnagrafiche.Buildings();
				
			DataSet _MyDs = _bl.GetData().Copy();
			  
			if (_MyDs.Tables[0].Rows.Count > 0)
			{				
				this.cmbsedificio.DataSource = Classi.GestoreDropDownList.ItemBlankDataSource(
					_MyDs.Tables[0], "descrizione","id", "- Selezionare un Edificio -", "0");
				this.cmbsedificio.DataTextField = "descrizione";
				this.cmbsedificio.DataValueField = "id";
				this.cmbsedificio.DataBind();
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
			this.DataGridRicerca.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridRicerca_ItemCommand);
			this.DataGridRicerca.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridRicerca_PageIndexChanged);
			this.DataGridRicerca.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridRicerca_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Ricerca()
		{
			Classi.ClassiAnagrafiche.Addetti _Addetti= new Classi.ClassiAnagrafiche.Addetti();
			this.txtscognome.DBDefaultValue = "%";
			this.txtsnome.DBDefaultValue="%";
			this.cmbsditta.DBDefaultValue="0";

			S_ControlsCollection _SCollection = new S_ControlsCollection();

			//_SCollection.AddItems(this.PanelRicerca.Controls);
			S_Controls.Collections.S_Object s_p_cognome = new S_Controls.Collections.S_Object();
			s_p_cognome.ParameterName = "p_cognome";
			s_p_cognome.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_cognome.Direction = ParameterDirection.Input;
			s_p_cognome.Size =50;
			s_p_cognome.Index = 0;
			s_p_cognome.Value = txtscognome.Text;
			_SCollection.Add(s_p_cognome);
			
			//_SCollection.AddItems(this.PanelRicerca.Controls);
			S_Controls.Collections.S_Object s_p_nome = new S_Controls.Collections.S_Object();
			s_p_nome.ParameterName = "p_nome";
			s_p_nome.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_nome.Direction = ParameterDirection.Input;
			s_p_nome.Size =50;
			s_p_nome.Index = _SCollection.Count;
			s_p_nome.Value = txtsnome.Text;
			_SCollection.Add(s_p_nome);
			
			S_Controls.Collections.S_Object s_p_DataDa = new S_Controls.Collections.S_Object();
			s_p_DataDa.ParameterName = "p_dataDA";
			s_p_DataDa.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_DataDa.Direction = ParameterDirection.Input;
			s_p_DataDa.Index = _SCollection.Count;
			s_p_DataDa.Size= 10;
			s_p_DataDa.Value = (CalendarPicker1.Datazione.Text =="")? "":CalendarPicker1.Datazione.Text;  			
			_SCollection.Add(s_p_DataDa);
			
			S_Controls.Collections.S_Object s_p_dataA = new S_Controls.Collections.S_Object();
			s_p_dataA.ParameterName = "p_dataA";
			s_p_dataA.DbType = ApplicationDataLayer.DBType.CustomDBType.VarChar;
			s_p_dataA.Direction = ParameterDirection.Input;
			s_p_dataA.Index = _SCollection.Count;
			s_p_dataA.Size= 10;
			s_p_dataA.Value = (Calendarpicker2.Datazione.Text =="")? "":Calendarpicker2.Datazione.Text;  			
			_SCollection.Add(s_p_dataA);


			S_Controls.Collections.S_Object s_p_ditta = new S_Controls.Collections.S_Object();
			s_p_ditta.ParameterName = "p_ditta";
			s_p_ditta.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_ditta.Direction = ParameterDirection.Input;
			s_p_ditta.Index = _SCollection.Count;
			s_p_ditta.Size= 10;
			s_p_ditta.Value =  Int32.Parse(cmbsditta.SelectedValue);  			
			_SCollection.Add(s_p_ditta);

			S_Controls.Collections.S_Object s_p_id_bl = new S_Controls.Collections.S_Object();
			s_p_id_bl.ParameterName = "p_id_bl";
			s_p_id_bl.DbType = ApplicationDataLayer.DBType.CustomDBType.Integer;
			s_p_id_bl.Direction = ParameterDirection.Input;
			s_p_id_bl.Index = _SCollection.Count;
			s_p_id_bl.Size= 10;
			s_p_id_bl.Value = Int32.Parse(cmbsedificio.SelectedValue);  			
			_SCollection.Add(s_p_id_bl);

			DataSet _MyDs = _Addetti.GetDataRdlAdd1(_SCollection).Copy();

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
			}


			this.DataGridRicerca.DataBind();		
			this.GridTitle1.NumeroRecords = _MyDs.Tables[0].Rows.Count.ToString();
		}
		
		private void btnsRicerca_Click(object sender, System.EventArgs e)
		{
				Ricerca();		
		}

		private void DataGridRicerca_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if (e.CommandName=="Dettaglio")
			{	
				_myColl.AddControl(this.Page.Controls, ParentType.Page);
				string s_url = e.CommandArgument.ToString();							
				//Server.Transfer(s_url);	
				//Response.Redirect("http://test.cofasir.it/PercorsoGIS.aspx?Utente=ADMIN&idaddetto=88&datapianificata=23042012");
				Response.Redirect(s_url);
			}
		}

		private void DataGridRicerca_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridRicerca.CurrentPageIndex=e.NewPageIndex;
			Ricerca();
		}

		private void DataGridRicerca_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if((e.Item.ItemType == ListItemType.Item) ||
				(e.Item.ItemType == ListItemType.AlternatingItem))
			{					
				ImageButton _img1 = (ImageButton) e.Item.Cells[1].FindControl("Imagebutton3");
				_img1.Attributes.Add("title","Visualizza");

				ImageButton _img2 = (ImageButton) e.Item.Cells[1].FindControl("Imagebutton1");
				_img2.Attributes.Add("title","Visualizza Percorso");
			}
		
//			string s_zona="";
//				
//			if (e.Item.Cells[7].Text.Trim().Length > 20) 
//			{
//				s_zona = e.Item.Cells[7].Text.Trim().Substring(0,20) + "..."; 
//				e.Item.Cells[7].ToolTip = e.Item.Cells[7].Text;
//				e.Item.Cells[7].Text=s_zona;
//			} 



		}

		private void BtnReset_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("RdLAddettiFunId=" + FunId);
		}

		
		
	}
}
