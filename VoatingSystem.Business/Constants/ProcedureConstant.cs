using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VoatingSystem.Business.Constants
{
    public static class ProcedureConstant
    {
        #region Variable

        public const string HB="Vst_IVFHeadBoy";
        public const string HG = "Vst_IVFHeadGirl";
        public const string GC = "Vst_IVFGamesCap";
        public const string VGC = "Vst_IVFViceGamesCap";
        public const string PR = "Vst_IVFPrfect";
        public const string VP = "Vst_IVFVicePrefect";
        public const string JP = "Vst_IVFJuniorPrefet";

        #endregion

        #region Store Procedure

        public const string SPGetUserSession = "SP_GetUserSession";
        public const string SPUpdateUserPassword = "SP_UpdateUserPassword";
        public const string SPVerifyUser = "SP_VerifyUser";
        public const string SPLoggError = "SP_LoggError";
        public const string SPGetAllStudents = "SP_GetAllStudents";
        public const string SPGetAllSenateNominees = "SP_GetAllSenateNominee";
        public const string SPGetHouseNominationsNameByHouseId = "SP_GetHouseNominationsNameByHouseId";
        public const string SPUpdateCandidateVote = "SP_UpdateCandidateVote";
        public const string SPGetVoteStatus = "SP_GetVoteStatus";

        #endregion
    }
}