using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using System.Data.OracleClient;
using S_Controls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;
using System.Web;
using System.Web.UI.HtmlControls;

namespace TheSite.Classi.ManProgrammata
{
	/// <summary>
	/// Descrizione di riepilogo per CompletaOrdine.
	/// </summary>
	public class CompletaOrdine:AbstractBase
	{
		public System.Data.OracleClient.OracleConnection conn = new 
			OracleConnection(System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"]);
			
		System.Data.OracleClient.OracleConnection _cn =new OracleConnection();
		
		string username=null;
		private ApplicationDataLayer.OracleDataLayer _OraDl;
		public CompletaOrdine()
		{
				_OraDl = new OracleDataLayer(s_ConnStr);
		}
		public CompletaOrdine(string UserName):this()
		{
		  this.username =UserName; 
		}
		public void beginTransaction()
		{
			_OraDl.BeginTransaction();
		}

		public void commitTransaction()
		{
			_OraDl.CommitTransaction();			
		}

		public void rollbackTransaction()
		{
			_OraDl.RollbackTransaction();
		}

		public override DataSet GetData()
		{
			return null;
		}
		public override DataSet GetData(S_ControlsCollection CollezioneControlli)
		{
			return null;
		}
		public override DataSet GetSingleData(int itemId)
		{
			return null;
		}
		public DataSet CompletaWO(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count+1;
			CollezioneControlli.Add(s_Cursor);
			
			string s_StrSql = "PACK_MAN_PROG.CompletaWO";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}
		
		
		public DataSet GETWO11(int itemId)
		{
			DataSet _Ds;

			S_ControlsCollection _SColl = new S_ControlsCollection();

			S_Controls.Collections.S_Object s_Id = new S_Object();
			s_Id.ParameterName = "p_wo_id";
			s_Id.DbType = CustomDBType.Integer;
			s_Id.Direction = ParameterDirection.Input;
			s_Id.Index = 0;
			s_Id.Value = itemId;
			
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			_SColl.Add(s_Id);
			_SColl.Add(s_Cursor);
			
			string s_StrSql = "PACK_MAN_PROG.GETDATIWO1";	
			_Ds = _OraDl.GetRows(_SColl, s_StrSql).Copy();			

			return _Ds;		
		}
		public DataSet CompletaWO1(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count+1;
			CollezioneControlli.Add(s_Cursor);
			
			string s_StrSql = "PACK_MAN_PROG.CompletaWO1";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}

		
		public DataSet AggiornaWO(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count+1;
			CollezioneControlli.Add(s_Cursor);
			
			string s_StrSql = "PACK_MAN_PROG.AggiornaWO";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}
		public DataSet AggiornaWr(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;		

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count +1;
			CollezioneControlli.Add(s_Cursor);

			

			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_MAN_PROG.AggiornaWR";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}
		
		public  int AggiornaWr1(S_ControlsCollection CollezioneControlli)
		{
			
				

			S_Controls.Collections.S_Object  s_Cursor= new S_Object();			
			s_Cursor.ParameterName = "p_IdOut";
			s_Cursor.DbType = CustomDBType.Integer;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count +1;
			CollezioneControlli.Add(s_Cursor);
//
//			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
//			s_Cursor.ParameterName = "p_IdOut";
//			s_Cursor.DbType = CustomDBType.Integer;
//			s_Cursor.Direction = ParameterDirection.Output;
//			s_Cursor.Index = control.Count;
//			control.Add(s_Cursor);
			
//			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
//			string s_StrSql = "PACK_MAN_PROG.AggiornaWR1";	
//			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();	
		

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_MAN_PROG.AggiornaWR1";		
			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli,s_StrSql);

			

			return i_Result;	

			
		}
		public DataSet AggiornaWO1(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count+1;
			CollezioneControlli.Add(s_Cursor);
			
			string s_StrSql = "PACK_MAN_PROG.AggiornaWO1";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}

		public string  AggiornaMPWrUSER_N(int wr_id, string p_data, string p_data1, 
			int p_stato, string p_motivo, int p_addetto_id//, string p_materiali 
			)
		{
			
			//-----inserire nome del file nuovo
			string numrdl ="";
			
			string STORENAME = "PACK_MAN_PROG.AggiornaWRMPUSER_NOTE_N";
			conn.Open();
			System.Data.OracleClient.OracleCommand cmd =new OracleCommand();
			cmd.Connection=conn;
			cmd.CommandType = CommandType.StoredProcedure;	
			cmd.CommandText=STORENAME;
			
			OracleParameter par1 = new OracleParameter(); 
			par1.ParameterName="p_wr_id";			
			par1.OracleType =System.Data.OracleClient.OracleType.Number;
			par1.Direction = ParameterDirection.Input;
			par1.Value=wr_id;
			par1.Size=10;
			cmd.Parameters.Add(par1);

			OracleParameter par2 = new OracleParameter(); 
			par2.ParameterName="p_data";			
			par2.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par2.Direction = ParameterDirection.Input;
			par2.Size=50;
			par2.Value=p_data;
			cmd.Parameters.Add(par2);
			
			OracleParameter par3 = new OracleParameter(); 
			par3.ParameterName="p_data1";			
			par3.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par3.Direction = ParameterDirection.Input;
			par3.Size=50;
			par3.Value=p_data1;
			cmd.Parameters.Add(par3);

			
			OracleParameter par4 = new OracleParameter(); 
			par4.ParameterName="p_stato";			
			par4.OracleType =System.Data.OracleClient.OracleType.Number;
			par4.Direction = ParameterDirection.Input;
			par4.Value=p_stato;
			par4.Size=10;
			cmd.Parameters.Add(par4);

			OracleParameter par5 = new OracleParameter(); 
			par5.ParameterName="p_motivo";			
			par5.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par5.Direction = ParameterDirection.Input;
			par5.Size=255;
			par5.Value=p_motivo;
			cmd.Parameters.Add(par5);
			
			OracleParameter par6 = new OracleParameter(); 
			par6.ParameterName="p_addetto_id";			
			par6.OracleType = System.Data.OracleClient.OracleType.Number;
			par6.Direction = ParameterDirection.Input;
			par6.Size=10;
			par6.Value=p_addetto_id;
			cmd.Parameters.Add(par6);

			
//			OracleParameter par7 = new OracleParameter(); 
//			par7.ParameterName="p_materiali";			
//			par7.OracleType = System.Data.OracleClient.OracleType.VarChar;
//			par7.Direction = ParameterDirection.Input;
//			par7.Size=255;
//			par7.Value=p_materiali;
//			cmd.Parameters.Add(par7);


			
			OracleParameter par8 = new OracleParameter(); 
			par8.ParameterName="p_username";			
			par8.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par8.Direction = ParameterDirection.Input;
			par8.Size=255;
			par8.Value=System.Web.HttpContext.Current.User.Identity.Name;
			cmd.Parameters.Add(par8);

			
			OracleParameter par9 = new OracleParameter(); 
			par9.ParameterName="p_IdOut";			
			par9.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par9.Direction = ParameterDirection.Output;
			par9.Size=255;
			par9.Value="";			
			cmd.Parameters.Add(par9);

			cmd.ExecuteNonQuery();
			numrdl=par9.Value.ToString();
			//numrdl = Int32.Parse(cmd.Parameters["p_IdOut"].Value.ToString());

			conn.Close();
			cmd.Dispose();
			return 	numrdl;
		}
		
		

		public string  AggiornaMPWrUSER_AUT(int wo_id,string p_data, string p_data1, 
			 string p_motivo, int p_addetto_id )//, string p_materiali 
		{
			
//  p_wo_id IN number,
//  p_data in varchar2,
//  p_data1 in varchar2,
//  p_stato in number,  
//  p_motivo in varchar2,
//  p_addetto_id in number, 
//			
			
			//-----inserire nome del file nuovo
			string numodl ="";
			
			string STORENAME = "PACK_MAN_PROG.AggiornaWRMPUSERAUT";
			conn.Open();
			System.Data.OracleClient.OracleCommand cmd =new OracleCommand();
			cmd.Connection=conn;
			cmd.CommandType = CommandType.StoredProcedure;	
			cmd.CommandText=STORENAME;
			
			OracleParameter par1 = new OracleParameter(); 
			par1.ParameterName="p_wo_id";			
			par1.OracleType =System.Data.OracleClient.OracleType.Number;
			par1.Direction = ParameterDirection.Input;
			par1.Value=wo_id;
			par1.Size=10;
			cmd.Parameters.Add(par1);		

			OracleParameter par2 = new OracleParameter(); 
			par2.ParameterName="p_data";			
			par2.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par2.Direction = ParameterDirection.Input;
			par2.Size=50;
			par2.Value=p_data;
			cmd.Parameters.Add(par2);
			
			OracleParameter par3 = new OracleParameter(); 
			par3.ParameterName="p_data1";			
			par3.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par3.Direction = ParameterDirection.Input;
			par3.Size=50;
			par3.Value=p_data1;
			cmd.Parameters.Add(par3);

			OracleParameter par5 = new OracleParameter(); 
			par5.ParameterName="p_motivo";			
			par5.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par5.Direction = ParameterDirection.Input;
			par5.Size=255;
			par5.Value=p_motivo;
			cmd.Parameters.Add(par5);
			
			OracleParameter par6 = new OracleParameter(); 
			par6.ParameterName="p_addetto_id";			
			par6.OracleType = System.Data.OracleClient.OracleType.Number;
			par6.Direction = ParameterDirection.Input;
			par6.Size=10;
			par6.Value=p_addetto_id;
			cmd.Parameters.Add(par6);

			
			OracleParameter par8 = new OracleParameter(); 
			par8.ParameterName="p_username";			
			par8.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par8.Direction = ParameterDirection.Input;
			par8.Size=255;
			par8.Value=System.Web.HttpContext.Current.User.Identity.Name;
			cmd.Parameters.Add(par8);

			
			OracleParameter par9 = new OracleParameter(); 
			par9.ParameterName="p_IdOut";			
			par9.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par9.Direction = ParameterDirection.Output;
			par9.Size=255;
			par9.Value="";			
			cmd.Parameters.Add(par9);

			cmd.ExecuteNonQuery();
			numodl=par9.Value.ToString();
			//numrdl = Int32.Parse(cmd.Parameters["p_IdOut"].Value.ToString());

			conn.Close();
			cmd.Dispose();
			return 	numodl;
		}
		


		public string  AggiornaMPWrUSER(int wr_id, string p_data, string p_data1, int p_stato, string p_motivo )
		{
			//	p_wr_id IN number, 
			//  p_data in varchar2,
			//  p_data1 in varchar2,
			//  p_stato in number,
			//  p_motivo in varchar2,
			//  p_IdOut out number

			//-----inserire nome del file nuovo
			string numrdl ="";
			
			string STORENAME = "PACK_MAN_PROG.AggiornaWRMPUSER_NOTE";
			conn.Open();
			System.Data.OracleClient.OracleCommand cmd =new OracleCommand();
			cmd.Connection=conn;
			cmd.CommandType = CommandType.StoredProcedure;	
			cmd.CommandText=STORENAME;
			
			OracleParameter par1 = new OracleParameter(); 
			par1.ParameterName="p_wr_id";			
			par1.OracleType =System.Data.OracleClient.OracleType.Number;
			par1.Direction = ParameterDirection.Input;
			par1.Value=wr_id;
			par1.Size=10;
			cmd.Parameters.Add(par1);

			OracleParameter par2 = new OracleParameter(); 
			par2.ParameterName="p_data";			
			par2.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par2.Direction = ParameterDirection.Input;
			par2.Size=50;
			par2.Value=p_data;
			cmd.Parameters.Add(par2);
			
			OracleParameter par3 = new OracleParameter(); 
			par3.ParameterName="p_data1";			
			par3.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par3.Direction = ParameterDirection.Input;
			par3.Size=50;
			par3.Value=p_data1;
			cmd.Parameters.Add(par3);

			
			OracleParameter par4 = new OracleParameter(); 
			par4.ParameterName="p_stato";			
			par4.OracleType =System.Data.OracleClient.OracleType.Number;
			par4.Direction = ParameterDirection.Input;
			par4.Value=p_stato;
			par4.Size=10;
			cmd.Parameters.Add(par4);

			OracleParameter par5 = new OracleParameter(); 
			par5.ParameterName="p_motivo";			
			par5.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par5.Direction = ParameterDirection.Input;
			par5.Size=255;
			par5.Value=p_motivo;
			cmd.Parameters.Add(par5);

			
			OracleParameter par6 = new OracleParameter(); 
			par6.ParameterName="p_username";			
			par6.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par6.Direction = ParameterDirection.Input;
			par6.Size=255;
			par6.Value=System.Web.HttpContext.Current.User.Identity.Name;
			cmd.Parameters.Add(par6);

			
			OracleParameter par7 = new OracleParameter(); 
			par7.ParameterName="p_IdOut";			
			par7.OracleType = System.Data.OracleClient.OracleType.VarChar;
			par7.Direction = ParameterDirection.Output;
			par7.Size=255;
			par7.Value="";			
			cmd.Parameters.Add(par7);

			cmd.ExecuteNonQuery();
			numrdl=par7.Value.ToString();
			//numrdl = Int32.Parse(cmd.Parameters["p_IdOut"].Value.ToString());

			conn.Close();
			cmd.Dispose();
			return 	numrdl;
		}
		
		
		#region Metodi Private

		protected override int ExecuteUpdate(S_ControlsCollection CollezioneControlli, ExecuteType Operazione, int itemId)
		{
			int i_Result = 0;				
			return i_Result;
		}

		#endregion

	}
}
