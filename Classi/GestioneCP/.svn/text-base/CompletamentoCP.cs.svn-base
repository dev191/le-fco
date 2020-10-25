using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using S_Controls;
using S_Controls.Collections;
using ApplicationDataLayer;
using ApplicationDataLayer.DBType;

namespace TheSite.Classi.GestioneCP
{
	/// <summary>
	/// Descrizione di riepilogo per CompletamentoCP.
	/// </summary>
	////////////////	public class CompletamentoCP
	////////////////	{
	////////////////		public CompletamentoCP()
	////////////////		{
	////////////////			//
	////////////////			// TODO: aggiungere qui la logica del costruttore
	////////////////			//
	////////////////		}
	////////////////	}
	/// <summary>
	/// Descrizione di riepilogo per ProcAndSteps.
	/// </summary>
	public class CompletamentoCP : AbstractBase
	{
		public string UserName;

		public CompletamentoCP(string UserName)
		{
			this.UserName= UserName;
		}

		public CompletamentoCP(){}
		

		#region Metodi Pubblici

		public int INS_CP(S_ControlsCollection CollezioneControlli)
		{
			int i_Result=0;
			S_Controls.Collections.S_Object p_id_wr_cp = new S_Object();
			p_id_wr_cp.ParameterName = "p_id_wr_cp";
			p_id_wr_cp.DbType = CustomDBType.Integer;
			p_id_wr_cp.Direction = ParameterDirection.Output;
			p_id_wr_cp.Index = CollezioneControlli.Count;
			p_id_wr_cp.Value = 0;
			CollezioneControlli.Add(p_id_wr_cp);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			i_Result = _OraDl.GetRowsAffected(CollezioneControlli,  "PACK_CPERIODICI_SFOGLIA.INS_CP");
				
			return i_Result;
		
		}

		public int UPD_CP(S_ControlsCollection CollezioneControlli)
		{
			int i_Result=0;
			S_Controls.Collections.S_Object p_id_wr_cp_out = new S_Object();
			p_id_wr_cp_out.ParameterName = "p_id_wr_cp_out";
			p_id_wr_cp_out.DbType = CustomDBType.Integer;
			p_id_wr_cp_out.Direction = ParameterDirection.Output;
			p_id_wr_cp_out.Index = CollezioneControlli.Count;
			p_id_wr_cp_out.Value = 0;
			CollezioneControlli.Add(p_id_wr_cp_out);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			i_Result = _OraDl.GetRowsAffected(CollezioneControlli,  "PACK_CPERIODICI_SFOGLIA.UPD_CP");
				
			return i_Result;
		
		}
		public int DEL_CP(S_ControlsCollection CollezioneControlli)
		{
			int i_Result=0;
			S_Controls.Collections.S_Object p_id_wr_cp_out = new S_Object();
			p_id_wr_cp_out.ParameterName = "p_id_wr_cp_out";
			p_id_wr_cp_out.DbType = CustomDBType.Integer;
			p_id_wr_cp_out.Direction = ParameterDirection.Output;
			p_id_wr_cp_out.Index = CollezioneControlli.Count;
			p_id_wr_cp_out.Value = 0;
			CollezioneControlli.Add(p_id_wr_cp_out);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			i_Result = _OraDl.GetRowsAffected(CollezioneControlli,  "PACK_CPERIODICI_SFOGLIA.DEL_CP");
				
			return i_Result;
		
		}
		
		/// <summary>
		/// DataSet con tutti i record
		/// </summary>
		/// <returns></returns>
		

		/// <summary>
		/// 
		/// </summary>		

		public override DataSet GetData()
		{
			return null;
		}
		public override DataSet GetSingleData(int itemId)
		{
			DataSet _Ds;

			S_Controls.Collections.S_ControlsCollection CollezioneControlli = new S_Controls.Collections.S_ControlsCollection();

			S_Controls.Collections.S_Object s_WO_ID = new S_Object();

			s_WO_ID.ParameterName = "p_Wo_Id";
			s_WO_ID.DbType = CustomDBType.Integer;
			s_WO_ID.Direction = ParameterDirection.Input;
			s_WO_ID.Index = 0;
			s_WO_ID.Size=4;
			s_WO_ID.Value=itemId;
			CollezioneControlli.Add(s_WO_ID);	
		
			// Tipo Manutenzione
			S_Controls.Collections.S_Object s_TipoManutenzione = new S_Object();

			s_TipoManutenzione.ParameterName = "p_TipoManutenzione";
			s_TipoManutenzione.DbType = CustomDBType.Integer;
			s_TipoManutenzione.Direction = ParameterDirection.Input;
			s_TipoManutenzione.Index = 1;
			s_TipoManutenzione.Size=4;
			s_TipoManutenzione.Value=Classi.TipoManutenzioneType.ManutenzioneProgrammata;						
			CollezioneControlli.Add(s_TipoManutenzione);

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 2;
			CollezioneControlli.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_MAN_PROG.GetSingleWO";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;
		}
		public DataSet GetApparati(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;

			//S_Controls.Collections.S_ControlsCollection CollezioneControlli = new S_Controls.Collections.S_ControlsCollection();

		

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 2;
			CollezioneControlli.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_CPERIODICI_SFOGLIA.SP_GET_LISTA_EQ";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;
		}

		
		public DataSet GetEdifici(string username)
		{
			DataSet _Ds;
			S_Controls.Collections.S_ControlsCollection control = new S_Controls.Collections.S_ControlsCollection();

			S_Controls.Collections.S_Object p = new S_Object();
			p.ParameterName = "p_username";
			p.DbType = CustomDBType.VarChar;
			p.Direction = ParameterDirection.Input;
			p.Index = control.Count;
			p.Size=20;
			p.Value=username;						
			control.Add(p);

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = control.Count;
			control.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_CPERIODICI_SFOGLIA.sp_getedifici";	
			_Ds = _OraDl.GetRows(control, s_StrSql).Copy();			

			return _Ds;
		}
		public  DataSet GetDataFReq()
		{
			DataSet _Ds;
			S_ControlsCollection CollezioneControlli = new S_ControlsCollection(); 

			S_Controls.Collections.S_Object S_Cursor=new S_Object();
			S_Cursor.ParameterName ="IO_CURSOR";
			S_Cursor.DbType=CustomDBType.Cursor;
			S_Cursor.Direction=ParameterDirection.Output;
			S_Cursor.Index = 0;
		
			CollezioneControlli.Add(S_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDL=new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_CPERIODICI_SFOGLIA.SP_GETALLPMPFREQUENZA";
			_Ds=_OraDL.GetRows(CollezioneControlli,s_StrSql).Copy();
			return _Ds;
		}
		
		public  DataSet GetDataTipoCP()
		{
			DataSet _Ds;
			S_ControlsCollection CollezioneControlli = new S_ControlsCollection(); 

			S_Controls.Collections.S_Object S_Cursor=new S_Object();
			S_Cursor.ParameterName ="IO_CURSOR";
			S_Cursor.DbType=CustomDBType.Cursor;
			S_Cursor.Direction=ParameterDirection.Output;
			S_Cursor.Index = 0;
		
			CollezioneControlli.Add(S_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDL=new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_CPERIODICI_SFOGLIA.SP_GETALLTIPOCP";
			_Ds=_OraDL.GetRows(CollezioneControlli,s_StrSql).Copy();
			return _Ds;
		}
		

		/// <summary>
		/// 
		/// </summary>
		/// <param name="CollezioneControlli"></param>
		/// <returns></returns>
		public override DataSet GetData(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;

			S_Controls.Collections.S_Object s_UserName = new S_Object();
			s_UserName.ParameterName = "p_UserName";
			s_UserName.DbType = CustomDBType.VarChar;
			s_UserName.Direction = ParameterDirection.Input;
			s_UserName.Index = 8;
			s_UserName.Size=50;
			s_UserName.Value=System.Web.HttpContext.Current.User.Identity.Name;
			CollezioneControlli.Add(s_UserName);

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 9;
			CollezioneControlli.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_MAN_PROG.GetCompletamento";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}



		public DataSet GetDatiWO(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;		

			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;
			CollezioneControlli.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_MAN_PROG.GetDatiWO";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}
		public DataSet GetDatiWR(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;		
			//
			//			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			//			s_Cursor.ParameterName = "IO_CURSOR";
			//			s_Cursor.DbType = CustomDBType.Cursor;
			//			s_Cursor.Direction = ParameterDirection.Output;
			//			s_Cursor.Index = 1;
			//			CollezioneControlli.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_MAN_PROG.GetDatiWR";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}
		public DataSet GetDatiWR1(S_ControlsCollection CollezioneControlli)
		{
			DataSet _Ds;		
			//
			//			S_Controls.Collections.S_Object s_Cursor = new S_Object();			
			//			s_Cursor.ParameterName = "IO_CURSOR";
			//			s_Cursor.DbType = CustomDBType.Cursor;
			//			s_Cursor.Direction = ParameterDirection.Output;
			//			s_Cursor.Index = 1;
			//			CollezioneControlli.Add(s_Cursor);
			
			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_MAN_PROG.GetDatiWR1";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}
		

		#endregion

		#region Metodi Private

		protected override int ExecuteUpdate(S_ControlsCollection CollezioneControlli, ExecuteType Operazione, int itemId)
		{
			return 0;
		}

		#endregion
	}


}

