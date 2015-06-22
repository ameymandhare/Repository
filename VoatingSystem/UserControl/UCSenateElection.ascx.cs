using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business;
using VoatingSystem.Business.Common;
using VoatingSystem.Business.Entities;

namespace VoatingSystem.UserControl
{
    public partial class UCSenateElection : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Nomination nm = new Nomination();

            dt = new DataTable();
            Authentication auth = new Authentication();
            dt = nm.GetAllSenateNominees();
            Nominees studNom;
            allSenateList = new List<Nominees>();
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
                allSenateList.Add(studNom);
            }
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