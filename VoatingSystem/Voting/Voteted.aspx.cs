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
                && !string.IsNullOrEmpty(Request.QueryString["designationcode"]))
            {
                VotetedStudents votetedStudents = new VotetedStudents();
                votetedStudents.Nomiees = new Nominees();
                Nomination nominee = new Nomination();

            }
        }
    }
}