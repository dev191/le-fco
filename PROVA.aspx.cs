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

namespace TheSite
{
	/// <summary>
	/// Descrizione di riepilogo per PROVA.
	/// </summary>
	public class PROVA : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.TextBox TextBox1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Inserire qui il codice utente necessario per inizializzare la pagina.
		}

		#region Codice generato da Progettazione Web Form
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: questa chiamata � richiesta da Progettazione Web Form ASP.NET.
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
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{	
			//string FunId="1130";
			//string VarApp="";
			string VarBL=TextBox1.Text;//"SN_TO_3";
			string Varcodstato=TextBox2.Text;//"4";
			//Response.Redirect("ManutenzioneCorrettiva/SfogliaRdl_NO_BL.aspx?FunId=" + FunId + "&bl_id=" + VarBL +"&codstato=" + Varcodstato);
		Response.Redirect("http://test.cofasir.it/PercorsoGIS.aspx?Utente=ADMIN&idaddetto=88&datapianificata=23042012");
		}
	}
}
