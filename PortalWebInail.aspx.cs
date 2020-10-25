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
	/// Descrizione di riepilogo per PortalWebInail.
	/// </summary>
	public class PortalWebInail : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button btn2;
		protected System.Web.UI.WebControls.Button btn3;
		protected System.Web.UI.WebControls.Button btn6;
		protected System.Web.UI.WebControls.Button btn4;
		protected System.Web.UI.WebControls.Button btn5;
		protected System.Web.UI.WebControls.Button btn7;
		protected System.Web.UI.WebControls.Button btn8;
		protected System.Web.UI.WebControls.Button btn9;
		protected System.Web.UI.WebControls.Label lbl1;
		protected System.Web.UI.WebControls.Label lbl2;
		protected System.Web.UI.WebControls.Button btn1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Inserire qui il codice utente necessario per inizializzare la pagina.

			lbl1.Text="Data: "+DateTime.Now.ToShortDateString();
			lbl2.Text="Ora: "+DateTime.Now.ToShortTimeString();

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
			this.btn1.Click += new System.EventHandler(this.btn1_Click);
			this.btn3.Click += new System.EventHandler(this.btn3_Click);
			this.btn2.Click += new System.EventHandler(this.btn2_Click);
			this.btn7.Click += new System.EventHandler(this.btn7_Click);
			this.btn5.Click += new System.EventHandler(this.btn5_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btn1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("http://www.inail.it/Portale/appmanager/portale/desktop");
		}

		private void btn2_Click(object sender, System.EventArgs e)
		{
		Response.Redirect("http://www.cofely-gdfsuez.it/");
		}

		private void btn3_Click(object sender, System.EventArgs e)
		{
		Response.Redirect("http://inail.cofasir.it/");
		}


		private void btn5_Click(object sender, System.EventArgs e)
		{
		Response.Redirect("http://www.globalserviceinail.it/acquista");
		}

		private void btn7_Click(object sender, System.EventArgs e)
		{
		Response.Redirect("esempio.htm");
		}

	
	}
}
