using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VoatingSystem.Business.Constants
{
    public static class ProcedureConstant
    {
        public const string SPGetUserSession = "SP_GetUserSession";
        public const string SPUpdateUserPassword = "SP_UpdateUserPassword";
        public const string SPVerifyUser = "SP_VerifyUser";
        public const string SPLoggError = "SP_LoggError";
        public const string SPGetAllStudents = "SP_GetAllStudents";
        public const string SPGetAllSenateNominees = "SP_GetAllSenateNominee";
        public const string SPGetHouseNominationsNameByHouseId = "SP_GetHouseNominationsNameByHouseId";
    }
}