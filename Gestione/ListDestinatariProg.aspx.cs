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
using S_Controls;
using S_Controls.Collections;

namespace TheSite.Gestione
{
	/// <summary>
	/// Descrizione di riepilogo per ListDestinatari.
	/// </summary>
	public class ListDestinatariProg : System.Web.UI.Page
	{
		protected S_Controls.S_Button btRicerca;
		protected S_Controls.S_Button btReset;
		protected Csy.WebControls.DataPanel DataPanel1;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected S_Controls.S_Label lblError;
		protected System.Web.UI.WebControls.DropDownList CmbsAbilitati;
		protected System.Web.UI.HtmlControls.HtmlInputHidden hiddenblid;
		protected WebControls.GridTitle GridTitle1;	
		protected WebControls.RicercaModulo RicercaModulo1;
		protected WebControls.PageTitle PageTitle1;
		public static int FunId=0;
		protected System.Web.UI.WebControls.TextBox txtEmail;
		public static string HelpLink = string.Empty;
		Classi.ClassiAnagrafiche.DestinatariProg _Dest = new TheSite.Classi.ClassiAnagrafiche.DestinatariProg();
		protected System.Web.UI.WebControls.DropDownList CmbsProgrammazione;
		protected System.Web.UI.WebControls.TextBox txtUtente;
		public Classi.SiteModule _SiteModule;
		private void Page_Load(object sender, System.EventArgs e)
		{
			_SiteModule = (Classi.SiteModule) HttpContext.Current.Items["SiteModule"];
			this.GridTitle1.hplsNuovo.NavigateUrl = "../Gestione/EditDestinatarioProg.aspx?ItemID=0&FunId=" + _SiteModule.ModuleId;
			hiddenblid.Value = _SiteModule.ModuleId.ToString();

			this.GridTitle1.hplsNuovo.Visible = _SiteModule.IsEditable;
	
			if(Request.QueryString["FunId"]!=null)
				FunId=Convert.ToInt32(Request.QueryString["FunId"]);
			else
				FunId = _SiteModule.ModuleId;
			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = _SiteModule.ModuleTitle;
						
			FunId = _SiteModule.ModuleId;
			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = _SiteModule.ModuleTitle;
	

			if(!IsPostBack)
			{
				DataGrid1.CurrentPageIndex =0;
				Ricerca();
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
			this.btRicerca.Click += new System.EventHandler(this.btRicerca_Click);
			this.btReset.Click += new System.EventHandler(this.btReset_Click);
			this.DataGrid1.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_ItemCommand);
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			this.DataGrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btRicerca_Click(object sender, System.EventArgs e)
		{
			DataGrid1.CurrentPageIndex =0;
			Ricerca();
		}
		private void Ricerca()
		{
			S_ControlsCollection _SCollection = new S_ControlsCollection();

			S_Controls.Collections.S_Object p = new S_Object();
			p.ParameterName = "p_bl_id";
			p.DbType = CustomDBType.VarChar;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Size =10;
			p.Value = RicercaModulo1.BlId;
			_SCollection.Add(p);

			p = new S_Object();
			p.ParameterName = "p_email";
			p.DbType = CustomDBType.VarChar;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Value = txtEmail.Text;
			p.Size =50;
			_SCollection.Add(p);

			p = new S_Object();
			p.ParameterName = "p_si";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Value = CmbsAbilitati.SelectedValue;
			_SCollection.Add(p);

			p = new S_Object();
			p.ParameterName = "p_tipo_prog";
			p.DbType = CustomDBType.Integer;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Value = CmbsProgrammazione.SelectedValue;
			_SCollection.Add(p);

			p = new S_Object();
			p.ParameterName = "p_user";
			p.DbType = CustomDBType.VarChar;
			p.Direction = ParameterDirection.Input;
			p.Index = _SCollection.Count;
			p.Value = txtUtente.Text;
			p.Size =20;
			_SCollection.Add(p);

			
			DataSet ds = _Dest.GetData(_SCollection);

			
			this.DataGrid1.DataSource = ds.Tables[0];
			UpdateCurrentPage(DataGrid1);

			this.DataGrid1.DataBind();

			this.GridTitle1.Visible=true; 
			this.GridTitle1.NumeroRecords=ds.Tables[0].Rows.Count.ToString();  
		}
		public static void UpdateCurrentPage(DataGrid objDataGrid)
		{
			try
			{
				int iPageSize= objDataGrid.PageSize;
				int iNumRecord = 0;
				int iPagine = 0;
				int iResto ;

				switch(objDataGrid.DataSource.GetType().Name)
				{
					case "DataSet":
						iNumRecord = ((DataSet)(objDataGrid.DataSource)).Tables[0].DefaultView.Count;
						break;
					case "DataView":
						iNumRecord = ((DataView)(objDataGrid.DataSource)).Count;
						break;
					case "DataTable":
						iNumRecord = ((DataTable)(objDataGrid.DataSource)).Rows.Count;
						break;
				}


				iResto = iNumRecord % iPageSize;
				iPagine = (iNumRecord / iPageSize);
				if (iResto > 0) iPagine += 1;

				if (iNumRecord > iPageSize) 
				{
					if (objDataGrid.CurrentPageIndex >= iPagine) objDataGrid.CurrentPageIndex = iPagine - 1;
				}
				else
				{
					objDataGrid.CurrentPageIndex = 0;
				}
			}
			catch(Exception ex)
			{
				throw ex;
			}

		}

		private void btReset_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("ListDestinatariProg.aspx?FunId=" + _SiteModule.ModuleId);
		}

		private void DataGrid1_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{

			if (e.CommandName=="Delete")
			{	
				string id = e.CommandArgument.ToString();							
				DeleteItem(id);
			}
		}
		private void DeleteItem(string id)
		{
		
			if (id=="") return;
			
			S_ControlsCollection _SColl = new S_ControlsCollection();

			S_Controls.Collections.S_Object s_p_id = new S_Object();
			s_p_id.ParameterName = "v_id_destinatari_doc";
			s_p_id.DbType = CustomDBType.Integer ;
			s_p_id.Direction = ParameterDirection.Input;
			s_p_id.Index =0;
			s_p_id.Value = int.Parse(id);
			_SColl.Add(s_p_id);

			S_Controls.Collections.S_Object s_p_tipo_prog = new S_Object();
			s_p_tipo_prog.ParameterName = "p_tipo_prog";
			s_p_tipo_prog.DbType = CustomDBType.Integer ;
			s_p_tipo_prog.Direction = ParameterDirection.Input;
			s_p_tipo_prog.Index =1;
			s_p_tipo_prog.Value = int.Parse(CmbsProgrammazione.SelectedValue);
			_SColl.Add(s_p_tipo_prog);

			_Dest.DeleteEmail(_SColl, 0);
			DataGrid1.CurrentPageIndex=0;
			Ricerca();

		}
		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGrid1.CurrentPageIndex = e.NewPageIndex;			
			Ricerca();
		}

		private void DataGrid1_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if(e.Item.ItemType==ListItemType.Item || e.Item.ItemType==ListItemType.AlternatingItem)
			{
				ImageButton bt2=e.Item.FindControl("bt2") as ImageButton ;
				bt2.Attributes.Add("onclick","return confirm(\"Vuoi eliminare l'indirizzo email selezionato?\");");
			}
		}
	}
}
