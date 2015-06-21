using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business;
using VoatingSystem.Business.Entities;

namespace VoatingSystem.Voting
{
    public partial class VHouseNominees : System.Web.UI.Page
    {
        #region Data Structures & Member Variables
        List<Nominees> allNomineesList;

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
            Nomination nm = new Nomination();
            dt = new DataTable();
            Authentication auth = new Authentication();
            if (Session["LoggedInUser"] != null)
            {
                int studHouseId = ((StudentEntity)Session["LoggedInUser"]).Stud_HouseId;
                dt = nm.GetHouseNominations(studHouseId);
                Nominees studNom;
                allNomineesList = new List<Nominees>();
                foreach (DataRow dr in dt.Rows)
                {
                    studNom = new Nominees();
                    studNom.Nom_Id = Convert.ToInt32(dr["NomineeId"]);
                    studNom.Nom_Key = dr["StudentID"].ToString();
                    studNom.Nom_Name = dr["StudentName"].ToString();
                    studNom.Nom_DesignationId = Convert.ToInt32(dr["DesignationID"]);
                    studNom.Nom_DesignationKey = dr["DesignationText"].ToString();
                    studNom.Nom_DesignationCode = dr["DesignationCode"].ToString();
                    studNom.Nom_ClassSection = dr["ClassSection"].ToString();
                    studNom.Nom_PhotoURL = dr["PhotoURL"].ToString();
                    studNom.Nom_AboutNominee = dr["AboutMe"].ToString();

                    //repeat for all needed colums
                    allNomineesList.Add(studNom);
                }
            }
        }
    }
}