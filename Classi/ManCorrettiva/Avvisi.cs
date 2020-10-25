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

namespace TheSite.Classi.ManCorrettiva
{
	/// <summary>
	/// Descrizione di riepilogo per Avvisi.
	/// </summary>
	public class Avvisi: AbstractBase
	{
		#region Dichiarazioni

		private ApplicationDataLayer.OracleDataLayer _OraDl;
			
		#endregion
		public Avvisi()
		{
			_OraDl = new OracleDataLayer(s_ConnStr);
		}
		#region Metodi Pubblici

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
			S_ControlsCollection CollezioneControlli = new S_ControlsCollection();	
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 1;

			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_AVVISI.SP_GETALLAVVISI";	
			DataSet _Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;			
		}

		public  override DataSet GetData(S_ControlsCollection CollezioneControlli)
		{						
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count + 1;

			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);			
			DataSet _Ds = _OraDl.GetRows(CollezioneControlli,"PACK_AVVISI.SP_GETALLAVVISI").Copy();			

			return _Ds;	
		}

		public DataSet GetPrioritaUrgenti(int progetto)
		{
			DataSet _Ds;
			
			S_ControlsCollection CollezioneControlli = new S_ControlsCollection();
		
			S_Controls.Collections.S_Object s_prj = new S_Object();
			s_prj.ParameterName = "p_progetto";
			s_prj.DbType = CustomDBType.Integer;
			s_prj.Direction = ParameterDirection.Input;
			s_prj.Index = CollezioneControlli.Count;
			s_prj.Value = progetto;
			CollezioneControlli.Add(s_prj);

			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = CollezioneControlli.Count;

			CollezioneControlli.Add(s_Cursor);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_AVVISI.SP_GETPRIORITY_URGENTI";	
			_Ds = _OraDl.GetRows(CollezioneControlli, s_StrSql).Copy();			

			return _Ds;		
		}

		public DataSet GetStatusAperte()
		{
			S_ControlsCollection _SCollection = new S_ControlsCollection();
			S_Controls.Collections.S_Object s_Cursor = new S_Object();
			s_Cursor.ParameterName = "IO_CURSOR";
			s_Cursor.DbType = CustomDBType.Cursor;
			s_Cursor.Direction = ParameterDirection.Output;
			s_Cursor.Index = 0;
			_SCollection.Add(s_Cursor);			
			DataSet _Ds;											

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);
			string s_StrSql = "PACK_AVVISI.SP_Stato_Avvisi";	
			_Ds = _OraDl.GetRows(_SCollection, s_StrSql).Copy();			

			return _Ds;		
		}

		public int Update(S_ControlsCollection CollezioneControlli)
		{
			int i_MaxParametri = CollezioneControlli.Count + 1;		

			S_Controls.Collections.S_Object s_IdOut = new S_Object();
			s_IdOut.ParameterName = "p_IdOut";
			s_IdOut.DbType = CustomDBType.Integer;
			s_IdOut.Direction = ParameterDirection.Output;
			s_IdOut.Index = i_MaxParametri;

			CollezioneControlli.Add(s_IdOut);

			ApplicationDataLayer.OracleDataLayer _OraDl = new OracleDataLayer(s_ConnStr);

			int i_Result = _OraDl.GetRowsAffected(CollezioneControlli, "PACK_IMPOSTAZIONI_AUTOMATICHE.SP_EXECUTEIMPAUTO");
			
			return i_Result;
		}

		#endregion


		#region Metodi privati

		//TODO *******************
		protected override int ExecuteUpdate(S_ControlsCollection CollezioneControlli, ExecuteType Operazione, int itemId)
		{
			int i_Result =0 ;
				
			return i_Result;
		
		
		}

		public override DataSet GetSingleData(int itemId)
		{
			DataSet _Ds = new DataSet();
			
			return _Ds;
		}
		#endregion

	}
}

