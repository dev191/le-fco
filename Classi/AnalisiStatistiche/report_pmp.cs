using TheSite.SchemiXSD;
using System.Data;
using System.Data.OracleClient;

namespace TheSite.Classi.AnalisiStatistiche
{
	/// <summary>
	/// Descrizione di riepilogo per report_pmp.
	/// </summary>
	public class report_pmp
	{
		public report_pmp()
		{
			//
			// TODO: aggiungere qui la logica del costruttore
			//
		}

		public  ReportPmp GetDataRpt(string SOdl)
		{
			ReportPmp ds =  new ReportPmp();
			string SqlRptMain = " select * from view_REPORTPMP t";

			OracleConnection cn = new OracleConnection(System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"]);		
			OracleCommand cmd = new OracleCommand("pack_analisi_statistiche.get_reportpmp",cn);
			cmd.CommandType = CommandType.StoredProcedure;
			OracleParameter p_SQL = new OracleParameter("p_SQL",OracleType.VarChar);
			p_SQL.Direction = ParameterDirection.Input;
			p_SQL.Size = 2048;
			p_SQL.Value =  SqlRptMain;
			cmd.Parameters.Add(p_SQL);

			OracleParameter pCursor = new OracleParameter("IO_CURSOR",OracleType.Cursor);
			pCursor.Direction = ParameterDirection.Output;
			cmd.Parameters.Add(pCursor);
			OracleDataAdapter da = new OracleDataAdapter(cmd);
			da.Fill(ds,"VIEW_REPORTPMP");
			return ds;
		}
	
	

	}
}
