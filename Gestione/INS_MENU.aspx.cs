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
using System.IO;
using System.Net; 




namespace TheSite.Gestione
{
	/// <summary>
	/// Descrizione di riepilogo per Settori.
	/// </summary>
	public class INS_MENU: System.Web.UI.Page
	{
		protected Csy.WebControls.DataPanel PanelRicerca;

		public string destDir=@System.Configuration.ConfigurationSettings.AppSettings["DIRMENU"].ToString();
		public string destDir1=@System.Configuration.ConfigurationSettings.AppSettings["DIRMENUOLD"].ToString();
		public System.Exception e;
		public static int FunId = 0;
		public static string HelpLink = string.Empty;
		MyCollection.clMyCollection _myColl = new clMyCollection();
		protected System.Web.UI.WebControls.Button BtInviaPreventivo;
		protected System.Web.UI.HtmlControls.HtmlInputFile FilePreventivo;
		protected System.Web.UI.WebControls.LinkButton LKfile;
		protected WebControls.PageTitle PageTitle1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			Classi.SiteModule _SiteModule = (Classi.SiteModule) HttpContext.Current.Items["SiteModule"];
			FunId = _SiteModule.ModuleId;
			HelpLink = _SiteModule.HelpLink;
			this.PageTitle1.Title = _SiteModule.ModuleTitle;
		
			if(!IsPostBack)
			{
				loaddoc();
				
			}
		}

		public MyCollection.clMyCollection _Contenitore
		{
			get 
			{
				return _myColl;
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
			this.BtInviaPreventivo.Click += new System.EventHandler(this.BtInviaPreventivo_Click);
			this.LKfile.Click += new System.EventHandler(this.LKfile_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

	
		private void loaddoc()
		{
			LKfile.Text="";
			//string destDir =Server.MapPath("../MENU");
			string filename="menu.pdf";
			string destPath="";		
			destPath  = destDir+"menu.pdf";
			if (File.Exists(destPath))
			{LKfile.Text=filename.ToUpper();}
			
		}
		private void SaveDocumentPreventivo()
		{
			string exte="";
			string destPath="";
			string destPathstomove="";
			//string pathmove=@"c:\Inetpub\wwwroot\INAIL\menu_R"+".pdf";
			//int MAX=0;
			string fileName=string.Empty;
			//string destDir =Server.MapPath("../MENU");
			
			//string destDir1 =Server.MapPath("../MENU/OLD");
			try
			{
				if (FilePreventivo.PostedFile!=null && FilePreventivo.PostedFile.FileName!="" ) 
				{
					fileName= System.IO.Path.GetFileName(FilePreventivo.PostedFile.FileName);
					fileName="menu.pdf";
					exte=System.IO.Path.GetExtension(FilePreventivo.PostedFile.FileName);
					if (exte==".pdf") 
					{
						destPath  = System.IO.Path.Combine(destDir, fileName);
						if (File.Exists(destPath))
						{
							string Data= DateTime.Now.ToShortDateString();
							//Data=File.GetCreationTime(destPath).ToShortDateString().ToString();
							Data=Data.Replace("/","_");
							//DateTime.Now.ToLongDateString
							destPathstomove= System.IO.Path.Combine(destDir1,"menu_"+Data.ToString()+".pdf");
							if (File.Exists(destPathstomove))
								File.Delete(destPathstomove);
							// rinomino il file utilizzo un contatore
							;
							File.Move(destPath,destPathstomove);
							File.Delete(destPath);
					
						}
						//destPath  = System.IO.Path.Combine(destDir, fileName);

						FilePreventivo.PostedFile.SaveAs(destPath);
	
					}
					else
					{
						string result="Si può solo inserire un file pdf.Selezionare altro file"; 
						String scriptString = "<script language=\"JavaScript\">alert(\"" + result + "\");<";
						scriptString += "/";
						scriptString += "script>";
						this.RegisterStartupScript("Startup1", scriptString);
						return;					
					}	

				}
			}
			catch (Exception ex)
			{
				string result =  ex.Message.ToString().ToUpper();
				//string result="Processo non andato a buon fine"; 
				String scriptString = "<script language=\"JavaScript\">alert(\"" + result + "\");<";
				scriptString += "/";
				scriptString += "script>";
				this.RegisterStartupScript("Startup1", scriptString);
			
			}
			}
		
		
		private void BtInviaPreventivo_Click(object sender, System.EventArgs e)
		{
		SaveDocumentPreventivo();
		string result="Inserimento menù pdf a buon fine."; 
			String scriptString = "<script language=\"JavaScript\">alert(\"" + result + "\");<";
			scriptString += "/";
			scriptString += "script>";
			this.RegisterStartupScript("Startup1", scriptString);
		}
	

	

		private void LKfile_Click(object sender, System.EventArgs e)
		{
			string pdfPath = destDir.ToString()+"\\menu.pdf"; 
			WebClient client = new WebClient(); 
			Byte[] buffer = client.DownloadData(pdfPath); 
			Response.ContentType = "application/pdf"; 
			Response.AddHeader("content-length", buffer.Length.ToString()); 
			Response.BinaryWrite(buffer);
		}

		
	}
}
