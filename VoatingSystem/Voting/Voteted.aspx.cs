using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VoatingSystem.Business;
using VoatingSystem.Business.Entities;

namespace VoatingSystem.Voting
{
    public partial class Voteted : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]) && !string.IsNullOrEmpty(Request.QueryString["electtype"])
                && !string.IsNullOrEmpty(Request.QueryString["columnname"]))
            {
                bool isVotedSuccess = false;
                VotetedStudents votetedStudents = new VotetedStudents();
                votetedStudents.Nomiees = new Nominees();
                votetedStudents.Vst_StudentKey = ((StudentEntity)Session["LoggedInUser"]).Stud_Key;
                votetedStudents.Nomiees.Nom_Key = Request.QueryString["id"];
                votetedStudents.Nomiees.Nom_ElectYype = Request.QueryString["electtype"];
                string columnName = Request.QueryString["columnname"];

                Nomination nominee = new Nomination();
                isVotedSuccess = nominee.UpdateCandidateVote(votetedStudents, columnName);

                if (isVotedSuccess)
                    lbl_IsVotedSuccess.Text = "\n\nThanks for Voating !!!";
                else
                    lbl_IsVotedSuccess.Text = "\n\nInvalid Vote. Please Try Again";
            }
        }
    }
}