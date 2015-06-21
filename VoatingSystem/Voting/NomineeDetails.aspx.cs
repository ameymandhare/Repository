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

namespace VoatingSystem.Voting
{
    public partial class NomineeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        Nominees nominee;

        public Nominees Nominee
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    Nomination nominee = new Nomination();

                    return nominee.GetSenateNomineesById(Request.QueryString["id"].ToString().ToLower());
                }
                else
                {
                    return null;
                }
            }
        }
    }
}