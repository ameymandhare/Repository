using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business;
using VoatingSystem.Business.Entities;
using VoatingSystem.Common;

namespace VoatingSystem.Voting
{
    public partial class SHouseNominees : System.Web.UI.Page
    {
        #region Data Structures & Member Variables
        List<Nominees> allNomineesList;

        VotetedStudents votetedStatus;

        public VotetedStudents VotetedStatus
        {
            get { return votetedStatus; }
            set { votetedStatus = value; }
        }

        List<Nominees> prefectList;

        public List<Nominees> PrefectList
        {
            get
            {
                if (allNomineesList != null && allNomineesList.Count > 0)
                {
                    return allNomineesList.Where(x => x.Nom_DesignationCode.ToUpper() == "PR").ToList();
                }
                else
                {
                    return null;
                }
            }
        }

        List<Nominees> vicePrefectList;

        public List<Nominees> VicePrefectList
        {
            get
            {
                if (allNomineesList != null && allNomineesList.Count > 0)
                {
                    return allNomineesList.Where(x => x.Nom_DesignationCode.ToUpper() == "VP").ToList();
                }
                else
                {
                    return null;
                }
            }
        }


        List<Nominees> juniorPrefectList;

        public List<Nominees> JuniorPrefectList
        {
            get
            {
                if (allNomineesList != null && allNomineesList.Count > 0)
                {
                    return allNomineesList.Where(x => x.Nom_DesignationCode.ToUpper() == "JP").ToList();
                }
                else
                {
                    return null;
                }
            }
        }

        DataTable dt;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            UICommon uICommon = new UICommon();
            Nomination nomination = new Nomination();
            if (Session["LoggedInUser"] != null)
            {
                int studHouseId = ((StudentEntity)Session["LoggedInUser"]).Stud_HouseId;
                allNomineesList = uICommon.FillNominationDetails(studHouseId, "h");
                string studId = ((StudentEntity)Session["LoggedInUser"]).Stud_Key;
                VotetedStatus = nomination.GetVotetedStudentsStatus(studId);
            }
            else
                Response.Redirect("~/Authenticate/Login.aspx");
        }
    }
}