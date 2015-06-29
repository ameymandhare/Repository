using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business;
using VoatingSystem.Business.Entities;

namespace VoatingSystem.Admin
{
    public partial class PHouseReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            Nomination nomination = new Nomination();
            // 3 for Prithvi records
            dt = nomination.GetHouseNominations(3);
            Nominees nominees;
            allCandidateList = new List<Nominees>();
            foreach (DataRow dr in dt.Rows)
            {
                nominees = new Nominees();
                nominees.Nom_PhotoURL = dr["PhotoURL"].ToString();
                nominees.Nom_Key = dr["StudentID"].ToString();
                nominees.Nom_Name = dr["StudentName"].ToString();
                nominees.Nom_ClassSection = dr["ClassSection"].ToString();
                nominees.Nom_VoteCount = Convert.ToInt32(dr["TotalVote"]);
                nominees.Nom_DesignationCode = dr["DesignationCode"].ToString();

                //repeat for all neaded colums
                allCandidateList.Add(nominees);
            }
        }

        #region Data Structures & Member Variables
        List<Nominees> allCandidateList;

        List<Nominees> prefeList;

        public List<Nominees> PreferList
        {
            get
            {
                if (allCandidateList != null && allCandidateList.Count > 0)
                {
                    return allCandidateList.Where(x => x.Nom_DesignationCode.ToUpper() == "PR").ToList();
                }
                else
                {
                    return null;
                }
            }
        }

        List<Nominees> vicePreferList;

        public List<Nominees> VicePreferList
        {
            get
            {
                if (allCandidateList != null && allCandidateList.Count > 0)
                {
                    return allCandidateList.Where(x => x.Nom_DesignationCode.ToUpper() == "VP").ToList();
                }
                else
                {
                    return null;
                }
            }
        }


        List<Nominees> juniorPreferList;

        public List<Nominees> JuniorPreferList
        {
            get
            {
                if (allCandidateList != null && allCandidateList.Count > 0)
                {
                    return allCandidateList.Where(x => x.Nom_DesignationCode.ToUpper() == "JP").ToList();
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