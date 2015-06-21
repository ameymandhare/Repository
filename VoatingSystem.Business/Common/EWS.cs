using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VoatingSystem.Business.Constants;
using VoatingSystem.Core.DataAccess;

namespace VoatingSystem.Business.Common
{
    public class EWS
    {
        private EWS() { }

        public static void LogError(Exception ex)
        {
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPLoggError, (int)ENums.EWSSeverity.Error, ex.ToString());
        }

        public static void LogWarning(string warning)
        {
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPLoggError, (int)ENums.EWSSeverity.Warning, warning);
        }

        public static void LogInformation(string iInformation)
        {
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPLoggError, (int)ENums.EWSSeverity.Information, iInformation);
        }

        public static void LogMiscellaneous(string miscellaneous)
        {
            SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, ProcedureConstant.SPLoggError, (int)ENums.EWSSeverity.Other, miscellaneous);
        }
    }
}
