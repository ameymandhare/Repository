using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business.Entities;
using VoatingSystem.Common;

namespace VoatingSystem.Admin
{
    public partial class SenateElectionReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UICommon uICommon = new UICommon();
            allSenateList = new List<Nominees>();
            allSenateList = uICommon.FillNominationDetails(0, "s");
        }


        #region Data Structures & Member Variables
        List<Nominees> allSenateList;

        List<Nominees> headBoyList;

        public List<Nominees> HeadBoyList
        {
            get
            {
                if (allSenateList != null && allSenateList.Count > 0)
                {
                    return allSenateList.Where(x => x.Nom_DesignationCode.ToUpper() == "HB").ToList();
                }
                else
                {
                    return null;
                }
            }
        }

        List<Nominees> headGirlList;

        public List<Nominees> HeadGirlList
        {
            get
            {
                if (allSenateList != null && allSenateList.Count > 0)
                {
                    return allSenateList.Where(x => x.Nom_DesignationCode.ToUpper() == "HG").ToList();
                }
                else
                {
                    return null;
                }
            }
        }


        List<Nominees> gamesCaptainList;

        public List<Nominees> GamesCaptainList
        {
            get
            {
                if (allSenateList != null && allSenateList.Count > 0)
                {
                    return allSenateList.Where(x => x.Nom_DesignationCode.ToUpper() == "GC").ToList();
                }
                else
                {
                    return null;
                }
            }
        }

        List<Nominees> viceGamesCaptainList;

        public List<Nominees> ViceGamesCaptainList
        {
            get
            {
                if (allSenateList != null && allSenateList.Count > 0)
                {
                    return allSenateList.Where(x => x.Nom_DesignationCode.ToUpper() == "VGC").ToList();
                }
                else
                {
                    return null;
                }
            }
        }
        DataTable dt;
        #endregion
    }
}
